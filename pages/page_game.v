module page_game(input vga_clk,
                 input [4:0] keys,
                 input vga_rst,
                 input [9:0] x_pos,
                 input [9:0] y_pos,
                 input [15:0] btns,
                 output reg [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红
    // x_pos in (0, 639), y_pos in (0, 479)
    wire [3:0] bcd_num = disp_num [3:0];
    wire [18:0] addra_menu = x_pos + y_pos * 640;
    wire [14:0] addra_number = bcd_num * 32 + (351 - x_pos) / 2 + (y_pos - 176) / 2 * 320;
    wire binary_pixel;
    blk_mem_num_font font_data(
        .clka(~vga_clk),
        .addra(addra_number),
        .wea(1'b0),
        .dina(32'b0),
        .douta(binary_pixel)
    );


    reg [39:0] game_status = 40'h11111111;
    reg [1:0] add_zero = 2'b00;



    always @(posedge vga_clk or posedge vga_rst) begin
        if (vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            if (320 - 32 <= x_pos && 320 + 32 > x_pos && 240 - 64 <= y_pos && 240 + 64 > y_pos) begin
                if (binary_pixel) begin
                    pixel_data = 12'h000;
                end else begin
                    pixel_data = pixel;
                end
            end else  begin
                pixel_data = pixel; 
            end
        end 
    end
endmodule
