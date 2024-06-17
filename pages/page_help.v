module page_help(input vga_clk,
                  input vga_rst,
                  input [9:0] x_pos,
                  input [9:0] y_pos,
                  output reg [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红

    // reg [4:0] num_font [15:0][6:0];
    wire [18:0] addra = ({9'd0,x_pos} + {9'd0, y_pos} * 18'd640);

    wire [11:0] pixel;
    blk_mem_help_menu help_menu_data(
        .clka(~vga_clk),
        .addra(addra),
        .wea(1'b0),
        .dina(96'b0),
        .douta(pixel)
    );

    always @(posedge vga_clk or posedge vga_rst) begin
        if (vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            pixel_data <= pixel;
        end 
    end
endmodule
