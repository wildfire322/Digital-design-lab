module vga_test(input vga_clk,
                input vga_rst,
                input x_pos,
                input y_pos,
                output [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红
    always @(posedge vga_clk or negedge vga_rst) begin
        if (~vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            pixel_data <= {x_pos [3:0], y_pos [3:0], 4'b0};
        end
    end
endmodule
