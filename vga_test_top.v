

module vga_test_top(
    input sys_clk,
    input sys_rst, // 低电平有效
    output h_sync,
    output v_sync,
    output [11:0] pixel_data
);
wire vga_clk;
wire lock;
wire rst;
wire [9:0] x_pos;
wire [9:0] y_pos;
wire [11:0] tmp_pixel_data;

vga_test test_pic_inst(
    .vga_clk(vga_clk),
    .vga_rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .pixel_data(tmp_pixel_data)
);

assign rst = (lock & sys_rst);
clkdiv clkdiv_inst(
    .clk(sys_clk),
    .rst(~sys_rst),
    .div_res({29'b0, vga_clk, 2'b0}),
);

VGA vga_inst(
    .clk(vga_clk),
    .rst(rst),
    .data_in(tmp_pixel_data),
    .row(y_pos),
    .col(x_pos),
    .pixel_data(pixel_data),
    .h_sync(h_sync),
    .v_sync(v_sync)
);

endmodule


/*
set_property PACKAGE_PIN T20 [get_ports {pixel_data[0]}]
set_property PACKAGE_PIN R20 [get_ports {pixel_data[1]}]
set_property PACKAGE_PIN T22 [get_ports {pixel_data[2]}]
set_property PACKAGE_PIN T23 [get_ports {pixel_data[3]}]
set_property PACKAGE_PIN R22 [get_ports {pixel_data[4]}]
set_property PACKAGE_PIN R23 [get_ports {pixel_data[5]}]
set_property PACKAGE_PIN T24 [get_ports {pixel_data[6]}]
set_property PACKAGE_PIN T25 [get_ports {pixel_data[7]}]
set_property PACKAGE_PIN N21 [get_ports {pixel_data[8]}]
set_property PACKAGE_PIN N22 [get_ports {pixel_data[9]}]
set_property PACKAGE_PIN R21 [get_ports {pixel_data[10]}]
set_property PACKAGE_PIN P21 [get_ports {pixel_data[11]}]
set_property PACKAGE_PIN M22 [get_ports {h_sync}]
set_property PACKAGE_PIN M21 [get_ports {v_sync}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pixel_data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {h_sync}]
set_property IOSTANDARD LVCMOS33 [get_ports {v_sync}]
set_property SLEW FAST [get_ports {blue[0]}]
set_property SLEW FAST [get_ports {blue[1]}]
set_property SLEW FAST [get_ports {blue[2]}]
set_property SLEW FAST [get_ports {blue[3]}]
set_property SLEW FAST [get_ports {green[0]}]
set_property SLEW FAST [get_ports {green[1]}]
set_property SLEW FAST [get_ports {green[2]}]
set_property SLEW FAST [get_ports {green[3]}]
set_property SLEW FAST [get_ports {red[0]}]
set_property SLEW FAST [get_ports {red[1]}]
set_property SLEW FAST [get_ports {red[2]}]
set_property SLEW FAST [get_ports {red[3]}]
set_property SLEW FAST [get_ports {h_sync}]
set_property SLEW FAST [get_ports {v_sync}]
*/
