module top(
    input clk,
    input S1,
    input S2,
    input S3,
    input [9:0] btn,//最多操控十个对象
    input  btn2,//控制个数的开关
    output [2:0]btnx,//我设想这是矩形键盘的信号
    output wire buzzer_pin//蜂鸣器
)
assign btnx=0;//矩形键盘的信号
wire [31:0] clkdiv;
clkdiv clkdiv_inst(
    .clk(clk),
    .clkdiv(clkdiv)
);
wire btn2x;
wire [3:0] number;
wire [3:0] status [9:0];//我想用这个来储存对象的值，因为VGA显示的原理还不清楚，所以显示模块我没有写
wire [9:0] mybuzzer;
pbdebounce pbdebounce_inst(
    .clk(clk),
    .button(btn2),
    .pbreg(btn2x)
);//防抖动
numberchoose numberchoose_inst(
    .S2(S2),
    .btn(btn),
    .numberchoose(number)
);//如果正确的话，应该能设置要操控的对象的个数
generate//根据number的值，选择不同的加法器，这可能是唯一的办法，因为verilog不支持动态实例化
    if(number==3'b001)begin:gen1
        chooseadder #(.N(2)) test(
            .clk(clk),
            .clkdiv(clkdiv[17]),
            .buttons(btn[1:0]),
            .values(status[1:0]),
            .enable(S1)
        )
    end
    if(number==3'b010)begin:gen2
        chooseadder #(.N(4))test(
            .clk(clk),
            .clkdiv(clkdiv[17]),
            .buttons(btn[3:0]),
            .values(status[3:0]),
            .enable(S1)
        )
    end
    if(number==3'b011)begin:gen3
        chooseadder #(.N(6)) test(
            .clk(clk),
            .clkdiv(clkdiv[17]),
            .buttons(btn[5:0]),
            .values(status[5:0]),
            .enable(S1)
        )
    end
    if(number==3'b100)begin:gen4
        chooseadder #(.N(8)) test(
            .clk(clk),
            .clkdiv(clkdiv[17]),
            .buttons(btn[7:0]),
            .values(status[7:0]),
            .enable(S1)
        )
    end
    if(number==3'b101)begin:gen5
        chooseadder #(.N(10)) test(
            .clk(clk),
            .clkdiv(clkdiv[17]),
            .buttons(btn),
            .values(status),
            .enable(S1)
        )
    end
endgenerate
genvar l;
generate
    for(l=0;l<10;l=l+1)begin:gen6
        buzzer buzzer_inst(
            .clk(clk),
            .rstn(S3),
            .counter(status[l]),
            .buzzer(mybuzzer[l])
        )
    end
endgenerate
assign buzzer_pin=|mybuzzer;//只要有对象的值达到0（也就是到达10，然后归零），蜂鸣器就会响
endmodule