module VGA(
    input clk,
    input rst,
    input [11:0] data_in, // 蓝蓝蓝蓝绿绿绿绿红红红红
    output reg [8:0] row, // 480 < 512
    output reg [9:0] col, // 640 < 1024
    output reg read_pixel, // 低电平有效
    output reg [11:0] pixel_data,
    output reg h_sync, v_sync 
);
// 行扫描
reg [9:0] h_count;
always @(posedge clk) begin
    if (rst) h_count <= 0;
    else if (h_count == 799) h_count <= 0;
    else h_count <= h_count + 1;
end
reg [9:0] v_count;
always @(posedge clk or posedge rst) begin
    if (rst) v_count <= 0;
    else if (h_count == 799) begin
        if (v_count == 524) v_count <= 0;
        else v_count <= v_count + 1;
    end
end
wire [9:0] row_addr = v_count - 35;
wire [9:0] col_addr = h_count - 143;
wire h_s = (h_count > 95);
wire v_s = (v_count > 1);
wire rd = (h_count > 142) 
            && (h_count < 783) 
            && (v_count > 34) 
            && (v_count < 515); 
initial begin
    h_count = 0;
    v_count = 0;
    row = 0;
    col = 0;
    read_pixel = 1;
    pixel_data [11:0] = 12'b0;
    h_sync = 0;
    v_sync = 0;
end
always @(posedge clk) begin
    row <= row_addr[8:0];
    col <= col_addr;
    read_pixel <= ~rd;
    h_sync <= h_s;
    v_sync <= v_s;
    pixel_data <= read_pixel ? 12'b0 : data_in;
end
endmodule
