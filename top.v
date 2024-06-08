module top(
    input clk,
    input S1,
    input S2,
    input S3,
    input S4,
    input [9:0] btn,//最多操控十个对象
    input  btn2,//控制个数的开关
    output [2:0]btnx,//我设想这是矩形键盘的信号
    output wire buzzer_pin,//蜂鸣器
    output reg [39:0] status,
    output [39:0] values_wire
);
assign btnx=0;//矩形键盘的信号
wire [31:0] clkdiv;
clkdiv clkdiv_inst(
    .clk(clk),
    .rst(1'b0),
    .div_res(clkdiv)
);
wire btn2x;
wire [2:0] number;
integer i;
always @(posedge clk) begin
    if (S4) begin
        for (i = 0; i < 10; i = i + 1) begin
            status[i*4 +: 4] <= 4'b0001;
        end
    end
    else begin
        status <= values_wire;
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
    .btn(btn2),//等会改成btn2x
    .numberchoose(number)
);//如果正确的话，应该能设置要操控的对象的个数

chooseadder #(.N(2)) chooseadder_inst_001 (
    .clk(clk),
    .clkdiv(clkdiv[17]),
    .buttons(btn[1:0]),
    .values(values_wire[7:0]),
    .status(status[7:0]),
    .enable(S1&&number==1)
);

chooseadder #(.N(4)) chooseadder_inst_010 (
    .clk(clk),
    .clkdiv(clkdiv[17]),
    .buttons(btn[3:0]),
    .values(values_wire[15:0]),
    .status(status[15:0]),
    .enable(S1&&number==2)
);

chooseadder #(.N(6)) chooseadder_inst_011 (
    .clk(clk),
    .clkdiv(clkdiv[17]),
    .buttons(btn[5:0]),
    .values(values_wire[23:0]),
    .status(status[23:0]),
    .enable(S1&&number==3)
);

chooseadder #(.N(8)) chooseadder_inst_100 (
    .clk(clk),
    .clkdiv(clkdiv[17]),
    .buttons(btn[7:0]),
    .values(values_wire[31:0]),
    .status(status[31:0]),
    .enable(S1&&number==4)
);

chooseadder #(.N(10)) chooseadder_inst_101 (
    .clk(clk),
    .clkdiv(clkdiv[17]),
    .buttons(btn),
    .values(values_wire),
    .status(status),
    .enable(S1&&number==5)
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