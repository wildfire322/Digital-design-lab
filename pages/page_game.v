module page_game(input vga_clk,
                 input vga_rst,
                 input [9:0] x_pos,
                 input [9:0] y_pos,
                 // 显示相关
                 input wire [31:0] total_number, // 每行显示几个数字
                 input cur_player,
                 input [39:0] status, // 10个对象的状态（需要截断）
                 input [3:0] predict, // 操作合法时显示预测结果
                 input selecting, // （是否已经选则了一个数字）
                 input wire [31:0] cur_select,
                 input wire [31:0] selected,
                 input wire [1:0] game_end,

                 output reg [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红
    // x_pos in (0, 639), y_pos in (0, 479)
    reg [14:0] addra;
    wire [11:0] pixel;
    wire binary_pixel;
    blk_mem_num_font font_data(
        .clka(~vga_clk),
        .addra(addra),
        .wea(1'b0),
        .dina(32'b0),
        .douta(binary_pixel)
    );
    integer i, dx;
    wire integer left_boundry = 320 - 40 * total_number;
    wire integer right_boundry = 320 + 40 * total_number;
    always @(posedge vga_clk or posedge vga_rst) begin
        if (vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            if (left_boundry <= x_pos && right_boundry > x_pos && 150 - 64 <= y_pos && 150 + 64 > y_pos) begin
                i = (x_pos - left_boundry) / 80;
                dx = x_pos - left_boundry - 80 * i;
                addra = status[i * 4 + 3 -: 4] * 32 + (70 - dx) / 2 + (y_pos - 86) / 2 * 320;
                if (8 <= dx && dx <=72) begin
                    if (binary_pixel) begin
                        if (selected / 4 == i && selecting && game_end == 2'h0) begin
                            pixel_data <= 12'h0f0;
                        end else begin
                            pixel_data <= 12'h000;
                        end
                    end else begin
                        if (game_end != 2'h0) begin
                            if (game_end == 2'h1) begin
                                pixel_data <= 12'hff0;
                            end else begin
                                pixel_data <= 12'hfff;
                            end
                        end else if (~cur_player) begin
                            pixel_data <= 12'haaa;
                        end else begin
                            pixel_data <= 12'hfff;
                        end
                    end
                end else begin
                    if (game_end != 2'h0) begin
                        if (game_end == 2'h1) begin
                            pixel_data <= 12'hff0;
                        end else begin
                            pixel_data <= 12'hfff;
                        end
                    end else if (~cur_player) begin
                        pixel_data <= 12'haaa;
                    end else begin
                        pixel_data <= 12'hfff;
                    end
                end
                if (((dx < 4 || dx >= 76) || (y_pos < 90 || y_pos >= 210)) && cur_select / 4 == i && game_end == 2'h0)begin
                    pixel_data <= 12'h00f;
                end
            end else if (left_boundry <= x_pos && right_boundry > x_pos && 330 - 64 <= y_pos && 330 + 64 > y_pos) begin
                i = (x_pos - left_boundry) / 80;
                dx = x_pos - left_boundry - 80 * i;
                addra = status[20 + i * 4 + 3 -: 4] * 32 + (70 - dx) / 2 + (y_pos - 266) / 2 * 320;
                if (8 <= dx && dx <=72) begin
                    if (binary_pixel) begin
                        if (selected / 4 == i + 5 && selecting && game_end == 2'h0) begin
                            pixel_data <= 12'h0f0;
                        end else begin
                            pixel_data <= 12'h000;
                        end
                    end else begin
                        if (game_end != 2'h0) begin
                            if (game_end == 2'h2) begin
                                pixel_data <= 12'hff0;
                            end else begin
                                pixel_data <= 12'hfff;
                            end
                        end else if (cur_player) begin
                            pixel_data <= 12'haaa;
                        end else begin
                            pixel_data <= 12'hfff;
                        end
                    end
                end else begin
                    if (game_end != 2'h0) begin
                        if (game_end == 2'h2) begin
                            pixel_data <= 12'hff0;
                        end else begin
                            pixel_data <= 12'hfff;
                        end
                    end else if (cur_player) begin
                        pixel_data <= 12'haaa;
                    end else begin
                        pixel_data <= 12'hfff;
                    end
                end
                if (((dx < 4 || dx >= 76) || (y_pos < 270 || y_pos >= 390)) && cur_select / 4 == i + 5 && game_end == 2'h0)begin
                    pixel_data <= 12'h00f;
                end
            end else begin
                pixel_data <= 12'hfff;
            end
        end 
    end
endmodule
