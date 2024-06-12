module vga_test(input vga_clk,
                input vga_rst,
                input [9:0] x_pos,
                input [9:0] y_pos,
                output reg [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红
    always @(posedge vga_clk or negedge vga_rst) begin
        if (~vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            pixel_data <= {x_pos[7:0], 4'h0};
        end
    end
endmodule
