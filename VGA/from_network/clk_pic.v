module clk_pic (
    input  wire vga_clk,
    input  wire rst_n,
    input  wire [9:0]   pic_x,
    input  wire [9:0]   pic_y,
    output reg [15:0]  pic_data
);
//parameter define
parameter   H_VALID =   10'd640 ,   //行有效数据
            V_VALID =   10'd480 ;   //场有效数据

parameter   RED     =   16'hF800,   //红色
            ORANGE  =   16'hFC00,   //橙色
            YELLOW  =   16'hFFE0,   //黄色
            GREEN   =   16'h07E0,   //绿色
            CYAN    =   16'h07FF,   //青色
            BLUE    =   16'h001F,   //蓝色
            PURPPLE =   16'hF81F,   //紫色
            BLACK   =   16'h0000,   //黑色
            WHITE   =   16'hFFFF,   //白色
            GRAY    =   16'hD69A;   //灰色

always@(posedge vga_clk or negedge rst_n)
    if(!rst_n)
        pic_data    <= 16'd0;
    else    if((pic_x >= 0) && (pic_x < (H_VALID/10)*1))
        pic_data    <=  RED;
    else    if((pic_x >= (H_VALID/10)*1) && (pic_x < (H_VALID/10)*2))
        pic_data    <=  ORANGE;
    else    if((pic_x >= (H_VALID/10)*2) && (pic_x < (H_VALID/10)*3))
        pic_data    <=  YELLOW;
    else    if((pic_x >= (H_VALID/10)*3) && (pic_x < (H_VALID/10)*4))
        pic_data    <=  GREEN;
    else    if((pic_x >= (H_VALID/10)*4) && (pic_x < (H_VALID/10)*5))
        pic_data    <=  CYAN;
    else    if((pic_x >= (H_VALID/10)*5) && (pic_x < (H_VALID/10)*6))
        pic_data    <=  BLUE;
    else    if((pic_x >= (H_VALID/10)*6) && (pic_x < (H_VALID/10)*7))
        pic_data    <=  PURPPLE;
    else    if((pic_x >= (H_VALID/10)*7) && (pic_x < (H_VALID/10)*8))
        pic_data    <=  BLACK;
    else    if((pic_x >= (H_VALID/10)*8) && (pic_x < (H_VALID/10)*9))
        pic_data    <=  WHITE;
    else    if((pic_x >= (H_VALID/10)*9) && (pic_x < H_VALID))
        pic_data    <=  GRAY;
    else
        pic_data    <=  BLACK;

endmodule //clk_pic
