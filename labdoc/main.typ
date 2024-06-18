#import "template.typ": *
#show: doc => title(
  name: "期末大型程序",
  date: datetime(year: 2024, month: 6, day: 18), // 随便写的，记得改
  doc,
)

#show heading: it => [#it #par()[#text(size:0.5em)[#h(0.0em)]]]
#show figure: it => [#it #par()[#text(size:0.5em)[#h(0.0em)]]]
#show heading.where(level: 1): set align(center)
#set par(first-line-indent: 2em)
#let show-file-raw(filename, lang: "verilog") = {
    let text = read(filename)
    raw(text, lang: lang, block: true)
}
#pagebreak()
= 设计说明
我们小组基于 Vivado 工程与 SWORD 开发板设计了一款双人对战游戏。游戏允许玩家根据自身的策略和偏好选择操控对象的数量。例如，在选择操控三个对象的情况下，每个玩家将拥有三个初始值为 1 的对象。玩家通过使用键盘上的 WASD 键进行对象的移动，并通过确认键完成对象的选择和操作。

游戏的核心目标是通过策略性地将对方对象的数值累加至己方对象上，使己方所有对象的数值最终达到 0（即 10）。如果某个对象的值超过了 10. 那么这个值将做模 10 操作，即取余数。游戏的胜利条件是当己方所有对象的数值都达到 0 时，游戏结束，玩家获胜。

在设计过程中，涉及了多个关键模块。首先是对象处理逻辑模块，该模块负责管理和更新游戏中各个对象的状态和数值变化。其次是 PS2 接口模块，它用于处理键盘输入信号，确保玩家的操作能够准确无误地传递到游戏中。最后是 VGA 显示模块，该模块负责将游戏的图形界面输出到显示器上，提供图形化的界面。
= 设计思路与原理
我们组的大作业共涉及到如下方面，下面将一一介绍。
== PS2 键盘
PS2 键盘是一种常见的输入设备，它通过 PS2 接口与计算机或其他设备连接，用于输入字符和控制指令。在我们的设计中，PS2 键盘模块负责接收键盘输入信号，并将其转换为逻辑信号，以便其他模块进行处理。具体来说，在 PS2 键盘中，每一个按键在按下和松开时都会产生一个 8 位的扫描码，用于表示按键的唯一标识。通过扫描码，我们可以确定用户按下的是哪一个键，从而实现对键盘输入的识别和处理，如图 1，2所示。
#figure(caption: "键盘各按键扫描码示意图", image("t_1.png", width: 90%))
#figure(caption: "键盘各按键按下与断开的编码示意图", image("t_2.png", width: 90%))
== VGA 显示
画面质量主要受分辨率、刷新率和色彩的影响。分辨率表示的是屏幕上显示的像素点数量，通常用 aaa × bbb 表示，前面的数字指的是每行的像素点数量，后面的数字指的是每列的像素点数量。刷新率表示屏幕内容更新的速度，通常以 Hz 为单位，表示每秒钟刷新多少次。色彩主要涉及色彩空间格式和“精度”，例如 VGA 需要使用 RGB 色彩空间（即红、绿、蓝三色混合）且为 12 位，即每个色彩通道用 4 位表示。

在我们的实验中，采用 640×480@60Hz 的显示模式，所需的时钟频率为 25.175MHz。（实际使用 25MHZ）。我们采用逐行扫描的方式显示图像，即每次刷新图像时，从左上角开始，先从左到右扫描一行，然后转到下一行的最左边继续扫描，直到扫描完最后一行。我们需要处理行时序和场时序，时序图如图 3所示。

#figure(caption: "VGA时序图", image("t_3.png"))

对于 640×480@60Hz 的显示模式，上图中行扫描的参数 a, b, c, d, e 分别为 96, 48, 640,16, 800，场扫描的参数 o, p, q, r, s 分别为 2, 33, 480, 10, 525。下面以行时序为例进行说明：在行同步阶段（96 个时钟周期），行同步信号被拉低以实现同步；接着是显示后沿阶段（48 个时钟周期），此时行同步信号被重新拉高但不显示图像（RGB 三色通道都设为 0）；然后是有效数据阶段（640 个时钟周期），每行的 640 个像素点在此期间被显示，对应的 RGB 色彩值被输出；显示前沿阶段（16 个时钟周期）不显示图像；最后进入下一行的扫描周期，总共 800个时钟周期，其中实际显示的有效数据为 640 个像素点。
对于我们来说，只需掌握同步信号何时拉低和拉高以及何时打印有效数据即可（行坐标在\[a+b, a+b+c\) 且列坐标在 \[o+p, o+p+q\) 时打印有效数据）。

== 页面切换
在不同页面的显示与切换中，我们使用了状态机的思想，如下图。
#image("state_machine.png")

== 选择对象与加法逻辑
为了实现预期的加法功能，我们需要设计一个加法逻辑模块，用于处理对象之间的数值变化。在游戏中，每个对象的数值都是一个 4 位的二进制数，取值范围为 0-9。当两个对象相遇时，我们需要将它们的数值相加，并将结果存储在较大的对象中。如果相加后的结果超过了 9，
我们需要对结果进行模 10 操作，即取余数。在代码中，我们设置了一个 selected 变量，如果这个变量为 0，说明是第一次选择，不然，说明是第二次选择。我们还设置了一个变量，用于存储第一次选择的对象的编号。当第二次选择的时候，我们将两个对象的数值相加，如果相加后的结果超过了 9，我们将结果减去 10，然后将结果赋值给第一个对象。最后，我们将 selected 置为 0，重置。
== 蜂鸣器
蜂鸣器是一种常见的输出设备，它通过发出不同频率的声音来实现声音的播放。不同频率的声音是通过定义不同频率翻转的方波输出到蜂鸣器引脚上实现的。

对于特定的音高赋予特定的频率，就可以通过组合得到完整的音乐。
= 核心代码

在这一部分，我们将展示我们的核心代码，以及一些调试过程。

== Top 模块

#show-file-raw("../pages/final_top.v")

== PS2 键盘

#show-file-raw("../keybroad/PS2.v")

== 主界面

#show-file-raw("../pages/page_main.v")

== 帮助界面

#show-file-raw("../pages/page_help.v")

== 选个数界面

#show-file-raw("../pages/page_config.v")

== 游戏界面
#show-file-raw("../pages/page_game.v")

== VGA

#show-file-raw("../vga/vga.v")

== 蜂鸣器

#show-file-raw("../buzzer.v")

= 核心模块仿真

== 加法模块仿真
```v
module chooseadder_tv;
reg [2:0] num;
// Parameters
reg btn;
// Inputs
wire [4:0] index;
wire [3:0] values;
reg clk;
reg [39:0] status;
reg [3:0] buttons;
// Instantiate the Unit Under st UUT)
chooseadder uut (
  .clk(clk),
  .player(0),
  .btn(btn),
  .num(num),
  .status(status),
  .buttons(buttons),
  .selected_index(index),
  .values(values)
  );
// Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

// Test sequence
  initial begin
    num=4;
    // Initialize Inputs
    status = 40'b0001000100010001000100010001000100010001;
    buttons = 0;
    #100;
    // Simulate button presses
    #8 buttons[0] = 1; // Press button 0
    #8 buttons[0] = 0; // Release button 0
    btn=1;
    #10;
    btn=0;
    #8 buttons[2] = 1; // Press button 1
    #8 buttons[2] = 0; // Release button 1
    btn=1;
    #10;
    btn=0;
    // Wait for some time
    #100;
  end
endmodule
```

#figure(caption: "加法模块仿真波形图
",image("t_4.png"))

== 主逻辑及对象赋值模块
```verilog
module mysim();
  reg clk;
  reg S2;
  reg [15:0] btn;
  // Outputs
  wire [39:0] status;
  // Instantiate the Unit Under Test (UUT)
  top uut (
    .clk(clk),
    .S2(S2),
    .btn(btn),
    .status(status)
  );
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end
  task setnum;
    integer i;
    begin
      for (i = 0; i < 4; i = i + 1) begin
          #5; // 每5个时间单位取反一次
          btn[11] = ~btn[11];
        end
      end
  endtask
  initial begin
    // Initialize Inputs
    S2 = 1;
    btn = 0;
    #5;
    setnum;
    btn[5]=1;
    #8;
    btn[5]=0;
    #8;
    btn[10]=1;
    #10;
    btn[10]=0;
    #10;
    btn[7]=1;
    #8;
    btn[7]=0;
    #8;
    btn[10]=1;
    #10;
    btn[10]=0;
    #10;
    btn[3]=1;
    #8;
    btn[3]=0;
    #8;
    btn[2]=1;
    #8;
    btn[2]=0;
    #8;
    btn[10]=1;
    #10;
    btn[10]=0;
    #10;
    btn[6]=1;
    #8;
    btn[6]=0;
    #8;
    btn[10]=1;
    #10;
    btn[10]=0;
    #10;
    btn[3]=1;
    #8;
    btn[3]=0;
    #8;
  end
endmodule
```
#figure(caption: "主逻辑及对象赋值模块仿真波形图", image("t_5.png"))
== 总结
从仿真波形图中可以看出，我们编写的加法及选择对象赋值模块的功能是正确的，实现了选择两个元素相加，并将得到的结果赋值给一个对象的功能。
= 操作说明及演示过程
- 处于游戏主界面
#figure(image("t_6.png", width: 80%))
- 按 S 键可进入游戏说明界面，再按 S 键返回游戏主界面
#figure(image("t_7.png", width: 80%))
- 按 W 键进入选择个数界面，按 A/D 可增加/减少选择的个数，按 W 键确认并进入游戏界面
#figure(image("t_8.png", width: 80%))
- 游戏界面，按 WASD 移动光标，按空格键选择数字，当某一行为灰色时，意味着加法的结果会加到这一行中。注意，对己方已经变为 0 的对象作操作及两个元素都选择同一行是不允许的，但将对方的 0 加到己方非 0 对象上是允许的。当有一方全部对象都为 0（获胜）或两方都选择把对方的 0 加到己方时（平局）游戏结束。
#figure(image("t_9.png", width: 80%))

= 组内成员分工及贡献度
- 庞星磊：负责加法运算逻辑，部分游戏操作逻辑，蜂鸣器模块及实验报告的编写。
- 程宇轩：负责与显示相关的所有模块的编写，IP 核设计，矩形键盘驱动的编写和模块整合与调试。
- 戴绍琦：负责提供 PS2 键盘以及编写平局逻辑
- 王利威：负责提供 PS2 键盘