module chooseadder (
    input clk,
    input btn,//确认按键
    input [2:0] num,
    input [39:0] status, // 10个对象的状态
    input [3:0] buttons, //  0-3,上下左右
    output reg [4:0] selected_index, // 新增变量，用于保存第一次按下按钮时的i值,以此确定status[i]的位置
    output reg [3:0] values
);
    reg [3:0] selected;
    reg [3:0] to_add;
    initial begin
            values <= 4'b0;
            selected <= 4'b0000;
            to_add <= 4'b0000;
            selected_index<=5'b11111;
    end      
    integer i;
    initial i=0;
     always @(posedge clk) begin
        if(buttons[0] == 1) begin//上移
            if(i<=4*(num-1))begin//在第一行，溢出
                i=i+20;//移到第二行
            end
            else begin
                i=i-20;
            end
        end
        if(buttons[1] == 1) begin//下移
            if(i>=20+4*(num-1))begin//在第二行，溢出
                i=i-20;//移到第一行
            end
            else begin
                i=i+20;
            end
        end
        if(buttons[2] == 1) begin//左移
            if(i==0)begin//在第一个，溢出
                i=20+4*(num-1);//移到最后一个
            end
            else begin
                i=i-4;
            end
        end
        if(buttons[3] == 1) begin//右移
            if(i==20+4*(num-1))begin//在最后一个，溢出
                i=0;//移到第一个
            end
            else begin
                i=i+4;
            end
        end
        if(btn == 1) begin
            if(selected==4'b0000)begin
                selected_index<=i;
                selected<=status[i+:4];
            end
            else begin
                to_add=status[i+:4];
                values=4'b0000 + (($signed(selected) + $signed(to_add)) % 10);
                selected<=4'b0000;
            end
        end
    end
endmodule
/*0 4 8 12 16 
20 24 28 32 36每一个对象下标初值*/