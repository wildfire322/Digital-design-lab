module vga_colourbar (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output wire hsync,
    output wire vsync,
    output wire [15:0]  rgb_data
);

wire vga_clk;
wire locked;
wire rst_n;
wire [9:0]   pic_x;//显示像素的坐标
wire [9:0]   pic_y;//显示像素的坐标
wire [15:0]  pic_data;//像素点信息

assign rst_n = (locked & sys_rst_n);

clk_gen u_clk_gen(
    .areset (~sys_rst_n ),
    .inclk0 (sys_clk ),
    .c0     (vga_clk   ),
    .locked (locked )
);

clk_ctrl u_clk_ctrl(
    .vga_clk  (vga_clk  ),
    .rst_n    (rst_n    ),
    .pic_data (pic_data ),
    .pic_x    (pic_x    ),
    .pic_y    (pic_y    ),
    .hsync    (hsync    ),
    .vsync    (vsync    ),
    .rgb_data (rgb_data )
);


clk_pic u_clk_pic(
    .vga_clk  (vga_clk  ),
    .rst_n    (rst_n    ),
    .pic_x    (pic_x    ),
    .pic_y    (pic_y    ),
    .pic_data (pic_data )
);

endmodule //vga_colourbar
