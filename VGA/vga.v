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
always @(posedge clk ) begin
    row <= row_addr[8:0];
    col <= col_addr;
    read_pixel <= ~rd;
    h_sync <= h_s;
    v_sync <= v_s;
    pixel_data <= read_pixel ? 12'b0 : data_in;
end
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
