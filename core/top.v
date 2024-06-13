module top(
    input clk,
    input S1,
    input S2,
    input S3,
    input [3:0] col,
    output [3:0] row,
    output wire buzzer_pin,//蜂鸣器
    output reg [39:0] status,
    output SEGDT,
    output SEGCLK,
    output SEGCLR,
    output SEGEN//剩下的输入输出，包括LED，VGA待添加
);
initial status=40'b0001000100010001000100010001000100010001;//初始状态
parameter A =2'00;//开始界面
parameter B =2'01;//游戏说明
parameter C =2'10;//选择个数
parameter D =2'11;//游戏界面
wire [1:0] state;
wire [63:0] segnum;
wire [15:0] btn;//btn[2]上移，btn[6]下移，btn[7]左移，btn[5]右移,btn[10]确认，btn[12]退出游戏，btn[11]选择个数
reg [31:0] cnt = 0;
    reg scan_clk = 0;
    always@(posedge clk) begin
        if(cnt == 2499) begin
            cnt <= 0;
            scan_clk <= ~scan_clk;
        end
        else
            cnt <= cnt + 1;
    end
    wire sync_clk;
    mat_key mat_key1(.BTNY(col),.scan_clk(scan_clk),.BTNX(row),.btn(btn),.sync_clk(sync_clk));
always@(posedge clk)begin
    case(state)
        A:begin
            if(btn[15])begin
                status<=B;
            end
            if(btn[14])begin
                status<=C;
            end
        end
        B:begin
            if(btn[13])begin
                state<=A;
            end
            if(btn[14])begin
                state<=C;
            end
        end
        C:begin
            if(btn[14])begin
                state<=D;
            end
            if(btn[12])begin
                state<=A;
            end
        end
        D:begin
            if(btn[12])begin
                state<=A;
            end
        end
    endcase
end
wire [2:0] num;
numberchoose numberchoose1(.S2(S2),
    .btn(btn[10]),
    .numberchoose(num)
); 
wire[31:0]clkdiv;
clkdiv clkdiv_inst(
    .clk(clk),
    .rst(1'b0),
    .div_res(clkdiv)
);
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
chooseadder chooseadder_inst(
    .clk(clk),
    .btn(btn[10]),
    .num(num),
    .buttons({btn[5],btn[7],btn[6],btn[2]}),
    .status(status)
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
