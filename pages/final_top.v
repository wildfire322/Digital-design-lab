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
    integer total_number = 2;
    reg status [39:0] = 40'h1111111111;
    reg selecting = 0;
    reg cur_player = 2'b0;
    reg [1:0] add_zero = 2'b0;
    reg [1:0]game_end = 2'h0;
    integer selected = 0;
    integer cur_select = 0;
    wire [3:0] predict_value = ($signed(status[cur_select +3-:4]) + $signed(status[selected +3-:4])) % 10;
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
    // vga_test test_pic_inst(
    // .vga_clk(vga_clk),
    // .vga_rst(rst),
    // .x_pos(x_pos),
    // .y_pos(y_pos),
    // .pixel_data(pixel_data_pending[2])
    // );
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
    page_config page_config_inst(
    .vga_clk(vga_clk),
    .vga_rst(vga_rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .disp_num(total_number),
    .pixel_data(pixel_data_pending[2])
    );
    page_game page_game_inst(
    .vga_clk(vga_clk),
    .vga_rst(vga_rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .total_number(total_number),
    .status(status),
    .predict(predict_value),
    .selecting(selecting),
    .cur_select(cur_select),
    .selected(selected),
    .pixel_data(pixel_data_pending[3])
    );
    // always @(posedge btns[0]) begin  
    //     page_status = page_status + 2'b1;
    // end
    always @(posedge counter[6]) begin
        if (~prev_keys[0] & keys[0]) begin // up
            case (page_status)
                2'h0: page_status <= 2'h2;
                2'h2: begin 
                    page_status <= 2'h3;
                    status = 40'h1111111111;
                    selecting = 1'h0;
                    cur_player = 1'h0;
                    add_zero = 2'h0;
                    game_end = 2'h0;
                end
                2'h3: begin
                    if(cur_select<=4*(total_number-1))begin //在第一行，溢出
                        cur_select=cur_select+20; //移到第二行
                    end
                    else begin
                        cur_select=cur_select-20;
                    end
                end
            endcase
        end else if (~prev_keys[1] & keys[1]) begin // left
            case (page_status)
                2'h2: begin
                    total_number = total_number - 1;
                    if (total_number <= 2) begin
                        total_number = 2;
                    end
                end
                2'h3: begin
                    if(cur_select == 0)begin 
                        cur_select=(total_number - 1) * 4; 
                    end
                    else if (cur_select == 20) begin
                        cur_select=20 + (total_number - 1) * 4;
                    end else begin
                        cur_select = cur_select - 4;
                    end
                end
            endcase
        end else if (~prev_keys[2] & keys[2]) begin //right
            case (page_status)
                2'h2: begin
                    total_number = total_number + 1;
                    if (total_number >= 5) begin
                        total_number = 5;
                    end
                end
                2'h3: begin
                    if(cur_select==20 + 4 * (total_number - 1))begin //溢出
                        cur_select=20; //移动到第一个
                    end
                    else if(cur_select == 4 * (total_number - 1)) begin
                        cur_select=0;
                    end else begin
                        cur_select=cur_select+4;
                    end
                end
            endcase
        end else if (~prev_keys[3] & keys[3]) begin // down
            case (page_status)
                2'h0: page_status <= 2'h1;
                2'h2: page_status <= 2'h0;
                2'h1: page_status <= 2'h0;
                2'h3: begin
                    if(cur_select>=20)begin //在第二行，溢出
                        cur_select=cur_select-20; //移到第一行
                    end
                    else begin
                        cur_select=cur_select+20;
                    end
                end
            endcase
        end else if (~prev_keys[4] & keys[4]) begin // space
            case (page_status)
                2'h3: begin
                    if (game_end) begin
                        
                    end else if (~selecting) begin
                        selected = cur_select;
                    end else begin
                        if ((selected <= 16 && cur_select <= 16) || (selected >= 20 && cur_select >= 20)) begin
                            
                        end else begin
                            if (cur_select <= 16 && cur_player == 1 || cur_select >= 20 && cur_player == 0) begin
                                cur_select = selected ^ cur_select;
                                selected = selected ^ cur_select;
                                cur_select = selected ^ cur_select;
                                // 异或交换大法，cur_select为操纵玩家的当前的值，selected为计划增加的值
                            end
                            if (status[cur_select+3-:4] == 4'h0) begin
                                
                            end else begin
                                status [cur_select + 3-:4] = predict_value;
                                if (status[selected + 3-:4] == 4'h0) begin
                                    add_zero = {add_zero[0], 1'b1};
                                end else begin
                                    add_zero = {add_zero[0], 1'b0};
                                end
                                cur_player = ~cur_player;
                            end
                        end
                        if (&status[0+:total_number * 4] == 1'b0) begin
                            game_end = 2'h1; // 玩家1获胜
                        end else if (&status[20+:total_number * 4] == 1'b0)begin
                            game_end = 2'h2; // 玩家2获胜
                        end else if (&add_zero == 1'b1) begin
                            game_end = 2'h3; // 平局
                        end
                    end
                    selecting = ~selecting;
                end 
            endcase
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
