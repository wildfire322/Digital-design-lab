module top(
    input clk,
    input S1,
    input S2,
    input S3,
    input S4,
    input S5,
    input [9:0] btn,//最多操控十个对象
    input  btn2,//控制个数的开关
    output [2:0]btnx,//我设想这是矩形键盘的信号
    output wire buzzer_pin,//蜂鸣器
    output reg [39:0] status,
    output SEGDT,
    output SEGCLK,
    output SEGCLR,
    output SEGEN//剩下的输入输出，包括LED，VGA待添加
);
wire [63:0] segnum;
assign btnx=0;//矩形键盘的信号
wire [31:0] clkdiv;
clkdiv clkdiv_inst(
    .clk(clk),
    .rst(1'b0),
    .div_res(clkdiv)
);
wire [3:0] values_wire;
wire [3:0] index;//用index存储status中改变了哪一位的值（即哪一个对象）
wire btn2x;
wire [2:0] number;
integer i;
always @(posedge clk) begin
    if (S4) begin
        for (i = 0; i < 10; i = i + 1) begin
            status[i*4 +: 4] <= 4'b0001;
        end
    end
    else if(!S1)begin
        status[4*index +: 4] <= values_wire;
    end
end//我想用这个来储存对象的值，因为VGA显示的原理还不清楚，所以显示模块我没有写
wire [9:0] mybuzzer;
pbdebounce pbdebounce_inst(
    .clk(clk),
    .button(btn2),
    .pbreg(btn2x)
);//防抖动
numberchoose numberchoose_inst(
    .S2(S2),
    .btn(btn2x),
    .numberchoose(number)
);//如果正确的话，应该能设置要操控的对象的个数
//我有一个设想，可以把这个number显示到七段数码管或者LED上，这样就可以知道要操控的对象的个数
wire finish;
assign segnum={number,61'b0};
SEGDRV SEGDRV_inst(
        .load(clkdiv[7]),
        .clk(clk),
        .in(segnum),
        .dout(SEGDT),
        .finish(finish)
        );
assign SEGCLK=clk|finish;
assign SEGCLR=1'b1;
assign SEGEN=1'b1;
chooseadder #(.N(2)) chooseadder_inst_001 (
    .clk(clk),
    .rst(S5),
    .clkdiv(clkdiv[17]),
    .buttons(btn[1:0]),
    .values(values_wire),
    .status(status[7:0]),
    .enable(S1&&number==1),
    .selected_index(index)
);

chooseadder #(.N(4)) chooseadder_inst_010 (
    .clk(clk),
    .rst(S5),
    .clkdiv(clkdiv[17]),
    .buttons(btn[3:0]),
    .values(values_wire[15:0]),
    .status(status[15:0]),
    .enable(S1&&number==2),
    .selected_index(index)
);

chooseadder #(.N(6)) chooseadder_inst_011 (
    .clk(clk),
    .rst(S5),
    .clkdiv(clkdiv[17]),
    .buttons(btn[5:0]),
    .values(values_wire[23:0]),
    .status(status[23:0]),
    .enable(S1&&number==3),
    .selected_index(index)
);

chooseadder #(.N(8)) chooseadder_inst_100 (
    .clk(clk),
    .rst(S5),
    .clkdiv(clkdiv[17]),
    .buttons(btn[7:0]),
    .values(values_wire[31:0]),
    .status(status[31:0]),
    .enable(S1&&number==4),
    .selected_index(index)
);

chooseadder #(.N(10)) chooseadder_inst_101 (
    .clk(clk),
    .rst(S5),
    .clkdiv(clkdiv[17]),
    .buttons(btn),
    .values(values_wire),
    .status(status),
    .enable(S1&&number==5),
    .selected_index(index)
);

genvar l;
generate
    for(l=0;l<10;l=l+1)begin:gen6
        buzzer buzzer_inst(
            .clk(clk),
            .rst(S3),
            .counter(status[l*4 +: 4]),
            .buzzer_pin(mybuzzer[l])
        );
    end
endgenerate
assign buzzer_pin=|mybuzzer;//只要有对象的值达到0（也就是到达10，然后归零），蜂鸣器就会响
endmodule
