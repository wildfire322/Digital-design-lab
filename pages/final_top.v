module final_top(input sys_clk,
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
    reg [4:0] prev_keys;
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
    
    // ctrl_transfer #(.WIDTH(16)) ctrl_transfer_inst1(.enable(page_status == 2'b0), .data_in(btns), .data_out(btns_pending[0]));
    // ctrl_transfer #(.WIDTH(16)) ctrl_transfer_inst2(.enable(page_status == 2'h2), .data_in(btns), .data_out(btns_pending[2]));
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
    // page_PS2_debug page_debug_inst1(
    // .vga_clk(vga_clk),
    // .vga_rst(rst),
    // .x_pos(x_pos),
    // .y_pos(y_pos),
    // .keys(keys),
    // .btns(btns_pending[0]),
    // .pixel_data(pixel_data_pending[0])
    // );
    vga_test test_pic_inst(
    .vga_clk(vga_clk),
    .vga_rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .pixel_data(pixel_data_pending[2])
    );
    page_main page_main_inst(
    .vga_clk(vga_clk),
    .vga_rst(vga_rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .pixel_data(pixel_data_pending[0])
    );
    
    page_help page_help_inst(
    .vga_clk(vga_clk),
    .vga_rst(vga_rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .pixel_data(pixel_data_pending[1])
    );
    // always @(posedge btns[0]) begin  
    //     page_status = page_status + 2'b1;
    // end
    always @(posedge counter[6]) begin
        if (~prev_keys[0] & keys[0]) begin
            case (page_status)
                2'h0: page_status <= 2'h2;
            endcase
        end else if (~prev_keys[1] & keys[1]) begin
        end else if (~prev_keys[2] & keys[2]) begin
        end else if (~prev_keys[3] & keys[3]) begin
            case (page_status)
                2'h0: page_status <= 2'h1;
                2'h2: page_status <= 2'h0;
                2'h1: page_status <= 2'h0;
            endcase
        end else if (~prev_keys[4] & keys[4]) begin
        end
        prev_keys = keys;
    end
    
    mat_key mat_key_inst(
    .scan_clk(counter[10]),
    .BTNY(BTNY),
    .BTNX(BTNX),
    .btn(btns)
    );
    
    assign rst            = sys_rst;
    assign tmp_pixel_data = pixel_data_pending[page_status];
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
