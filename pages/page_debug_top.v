module page_debug_top(input sys_clk,
                      input PS2_clk,
                      input PS2_data,
                      input sys_rst,             // 现在是高电平有效
                      input [3:0] BTNY,
                      output [3:0] BTNX,
                      output h_sync,
                      output v_sync,
                      output [11:0] pixel_data);
    wire vga_clk;
    wire rst;
    wire [4:0]keys;
    wire [9:0] x_pos;
    wire [9:0] y_pos;
    wire [11:0] tmp_pixel_data;
    wire [11:0] pixel_data_pending [0:3];
    wire [15:0] btns_pending [0:3];
    wire [31:0] counter;
    wire [15:0] btns;
    reg [1:0] page_status = 2'h0;
    assign vga_clk        = counter[1];
    
    ctrl_transfer #(.WIDTH(16)) ctrl_transfer_inst1(.enable(page_status == 2'b0), .data_in(btns), .data_out(btns_pending[0]));
    ctrl_transfer #(.WIDTH(16)) ctrl_transfer_inst2(.enable(page_status == 2'h2), .data_in(btns), .data_out(btns_pending[2]));
    PS2 PS2_inst(
        .clk(sys_clk),
        .rst(1'b0),
        .ps2_clk(PS2_clk),
        .ps2_data(PS2_data),
        .up(keys[0]),
        .left(keys[1]),
        .right(keys[2]),
        .down(keys[3]),
        .space(keys[4])
    );
    page_PS2_debug page_debug_inst1(
    .vga_clk(vga_clk),
    .vga_rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .keys(keys),
    .btns(btns_pending[0]),
    .pixel_data(pixel_data_pending[0])
    );
    vga_test test_pic_inst(
    .vga_clk(vga_clk),
    .vga_rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .pixel_data(pixel_data_pending[1])
    );
    page_debug page_debug_inst2(
    .vga_clk(vga_clk),
    .vga_rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .btns(btns_pending[2]),
    .pixel_data(pixel_data_pending[2])
    );
    assign tmp_pixel_data = pixel_data_pending[page_status];
    
   always @(posedge btns[0]) begin
       page_status = page_status + 2'b1;
       if (page_status == 2'h3) begin
           page_status = 2'h0;
       end
   end
    
    mat_key mat_key_inst(
    .scan_clk(counter[10]),
    .BTNY(BTNY),
    .BTNX(BTNX),
    .btn(btns)
    );
    
    assign rst = sys_rst;
    clkdiv clkdiv_inst(
    .clk(sys_clk),
    .rst(sys_rst),
    .div_res(counter)
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
