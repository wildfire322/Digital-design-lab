module clk_ctrl (
    input  wire         vga_clk,    //VGA时钟
    input  wire         rst_n,//复位
    input  wire [15:0]  pic_data,//输入的像素点信息
    output wire [9:0]   pic_x,//输出显示像素的坐标
    output wire [9:0]   pic_y,//输出显示像素的坐标
    output wire         hsync,//行同步信号
    output wire         vsync,//场同步信号
    output wire [15:0]  rgb_data//输出的VGA像素点信号
);
//分辨率为640*480
//parameter define
parameter H_SYNC    =   10'd96  ,   //行同步
          H_BACK    =   10'd40  ,   //行时序后沿
          H_LEFT    =   10'd8   ,   //行时序左边框
          H_VALID   =   10'd640 ,   //行有效数据
          H_RIGHT   =   10'd8   ,   //行时序右边框
          H_FRONT   =   10'd8   ,   //行时序前沿
          H_TOTAL   =   10'd800 ;   //行扫描周期
parameter V_SYNC    =   10'd2   ,   //场同步
          V_BACK    =   10'd25  ,   //场时序后沿
          V_TOP     =   10'd8   ,   //场时序上边框
          V_VALID   =   10'd480 ,   //场有效数据
          V_BOTTOM  =   10'd8   ,   //场时序下边框
          V_FRONT   =   10'd2   ,   //场时序前沿
          V_TOTAL   =   10'd525 ;   //场扫描周期

wire rgb_en;//VGA有效显示范围时，为高电平
wire pic_data_request;//高电平时申请像素点色彩
reg [9:0] count_h;//行同步信号计数
reg [9:0] count_v;//场同步信号计数


//行同步信号计数
always @(posedge vga_clk or negedge rst_n) begin
    if (!rst_n) begin
        count_h <= 10'b0;
    end
    else   if (count_h == H_TOTAL -1'b1) begin
        count_h <= 10'b0;
    end
    else
        count_h <= count_h +1'b1;
end
//行同步信号输出
assign hsync = (count_h <= H_SYNC -1'b1) ? 1'b1 : 1'b0;

//场同步信号计数
always @(posedge vga_clk or negedge rst_n) begin
    if (!rst_n) begin
        count_v <= 10'b0;
    end
    else   if ((count_v == V_TOTAL - 1'b1) && (count_h == H_TOTAL - 1'b1)) begin
        count_v <= 10'b0;
    end
    else    if (count_h == H_TOTAL - 1'b1) begin
        count_v <= count_v + 1'b1;
    end
    else
         count_v <= count_v;
end
//场同步信号输出
assign vsync = (count_v <= V_SYNC - 1'b1) ? 1'b1 : 1'b0;

//rgb_en,VGA有效显示区域高电平
assign     rgb_en = (((count_h >= H_SYNC + H_BACK + H_LEFT)
                    && (count_h < H_SYNC + H_BACK + H_LEFT + H_VALID))
                    &&((count_v >= V_SYNC + V_BACK + V_TOP)
                    && (count_v < V_SYNC + V_BACK + V_TOP + V_VALID)))
                    ? 1'b1 : 1'b0;
//pic_data_request像素点信号请求
assign     pic_data_request = (((count_h >= H_SYNC + H_BACK + H_LEFT - 1'b1)
                    && (count_h < H_SYNC + H_BACK + H_LEFT + H_VALID - 1'b1))
                    &&((count_v >= V_SYNC + V_BACK + V_TOP)
                    && (count_v < V_SYNC + V_BACK + V_TOP + V_VALID)))
                    ? 1'b1 : 1'b0;


//显示像素坐标
assign pic_x = (pic_data_request == 1'b1) ? 
                (count_h - (H_SYNC + H_BACK + H_LEFT - 1'b1)) : 10'h3ff;
assign pic_y = (pic_data_request == 1'b1)
                ? (count_v - (V_SYNC + V_BACK + V_TOP)) : 10'h3ff;
//输出RGB信号
assign rgb_data = (rgb_en == 1'b1) ? pic_data : 16'b0;


endmodule //clk_ctrl
