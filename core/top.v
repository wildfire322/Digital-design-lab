module top(
    input clk,
    input S2,
    input S3,
    input [3:0] col,
    output [3:0] row,
    // input [15:0] btn,这句是我仿真的时候添加的，不用管
    output wire buzzer_pin,//蜂鸣器
    output reg [39:0] status
);

parameter A =2'b00;/*开始界面*/
parameter B =2'b01;//游戏说明
parameter C =2'b10;//选择个数
parameter D =2'b11;//游戏界面
wire [9:0] mybuzzer;
initial status=40'h1111111111; //初始状态

reg [1:0] state=A;
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
always @(posedge clk) begin
    case(state)
        A: begin
            if (btn[15]) begin
                status <= B;
            end
            if (btn[14]) begin
                status <= C;
            end
        end
        B: begin
            if (btn[13]) begin
                state <= A;
            end
            if (btn[14]) begin
                state <= C;
            end
        end
        C: begin
            if (btn[14]) begin
                state <= D;
            end
            if (btn[12]) begin
                state <= A;
            end
        end
        D: begin
            if (btn[12]) begin
                state <= A;
            end
        end
    endcase
end
wire [2:0] num;
numberchoose numberchoose1(.S2(S2),
    .btn(btn[11]),
    .numberchoose(num)
); 
// initial begin
//     $monitor("At time %t, num = %d", $time, num);
// end
wire [4:0] index;
wire [3:0] values;
chooseadder chooseadder_inst(
    .clk(clk),
    .btn(btn[10]),
    .num(num), 
    .buttons({btn[5],btn[7],btn[6],btn[2]}),
    .status(status),
    .selected_index(index),
    .values(values)
);
always@(posedge clk)begin
    if(btn[3])begin
        status[index+:4]<=values;
    end
end
// initial begin
//     $monitor("At time %t, index = %d", $time, index);
// end
// initial begin
//     $monitor("At time %t, values = %d", $time, values);
// end
endmodule