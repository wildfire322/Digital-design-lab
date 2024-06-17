module page_PS2_debug(input vga_clk,
                  input [4:0] keys,
                  input vga_rst,
                  input [9:0] x_pos,
                  input [9:0] y_pos,
                  input [15:0] btns,
                  output reg [11:0] pixel_data); // 蓝蓝蓝蓝绿绿绿绿红红红红
    // x_pos in (0, 639), y_pos in (0, 479)
    reg [63:0] var = 63'h1145141919810893;
    reg [4:0] num_font [15:0][6:0];
    integer i;
    genvar j;
    initial begin // �?易字�?

        num_font[4'h0][0] = 4'b1111;
        num_font[4'h0][1] = 4'b1001;
        num_font[4'h0][2] = 4'b1001;
        num_font[4'h0][3] = 4'b1001;
        num_font[4'h0][4] = 4'b1001;
        num_font[4'h0][5] = 4'b1001;
        num_font[4'h0][6] = 4'b1111;
        
        num_font[4'h1][0] = 4'b0001;
        num_font[4'h1][1] = 4'b0011;
        num_font[4'h1][2] = 4'b0001;
        num_font[4'h1][3] = 4'b0001;
        num_font[4'h1][4] = 4'b0001;
        num_font[4'h1][5] = 4'b0001;
        num_font[4'h1][6] = 4'b0001;
        
        num_font[4'h2][0] = 4'b1111;
        num_font[4'h2][1] = 4'b0001;
        num_font[4'h2][2] = 4'b0001;
        num_font[4'h2][3] = 4'b1111;
        num_font[4'h2][4] = 4'b1000;
        num_font[4'h2][5] = 4'b1000;
        num_font[4'h2][6] = 4'b1111;
        
        num_font[4'h3][0] = 4'b1111;
        num_font[4'h3][1] = 4'b0001;
        num_font[4'h3][2] = 4'b0001;
        num_font[4'h3][3] = 4'b1111;
        num_font[4'h3][4] = 4'b0001;
        num_font[4'h3][5] = 4'b0001;
        num_font[4'h3][6] = 4'b1111;
        
        num_font[4'h4][0] = 4'b1001;
        num_font[4'h4][1] = 4'b1001;
        num_font[4'h4][2] = 4'b1001;
        num_font[4'h4][3] = 4'b1111;
        num_font[4'h4][4] = 4'b0001;
        num_font[4'h4][5] = 4'b0001;
        num_font[4'h4][6] = 4'b0001;
        
        num_font[4'h5][0] = 4'b1111;
        num_font[4'h5][1] = 4'b1000;
        num_font[4'h5][2] = 4'b1000;
        num_font[4'h5][3] = 4'b1111;
        num_font[4'h5][4] = 4'b0001;
        num_font[4'h5][5] = 4'b0001;
        num_font[4'h5][6] = 4'b1111;
        
        num_font[4'h6][0] = 4'b1111;
        num_font[4'h6][1] = 4'b1000;
        num_font[4'h6][2] = 4'b1000;
        num_font[4'h6][3] = 4'b1111;
        num_font[4'h6][4] = 4'b1001;
        num_font[4'h6][5] = 4'b1001;
        num_font[4'h6][6] = 4'b1111;
        
        num_font[4'h7][0] = 4'b1111;
        num_font[4'h7][1] = 4'b0001;
        num_font[4'h7][2] = 4'b0001;
        num_font[4'h7][3] = 4'b0001;
        num_font[4'h7][4] = 4'b0001;
        num_font[4'h7][5] = 4'b0001;
        num_font[4'h7][6] = 4'b0001;
        
        num_font[4'h8][0] = 4'b1111;
        num_font[4'h8][1] = 4'b1001;
        num_font[4'h8][2] = 4'b1001;
        num_font[4'h8][3] = 4'b1111;
        num_font[4'h8][4] = 4'b1001;
        num_font[4'h8][5] = 4'b1001;
        num_font[4'h8][6] = 4'b1111;
        
        num_font[4'h9][0] = 4'b1111;
        num_font[4'h9][1] = 4'b1001;
        num_font[4'h9][2] = 4'b1001;
        num_font[4'h9][3] = 4'b1111;
        num_font[4'h9][4] = 4'b0001;
        num_font[4'h9][5] = 4'b0001;
        num_font[4'h9][6] = 4'b1111;
        
        num_font[4'ha][0] = 4'b0000;
        num_font[4'ha][1] = 4'b0000;
        num_font[4'ha][2] = 4'b0110;
        num_font[4'ha][3] = 4'b1001;
        num_font[4'ha][4] = 4'b1001;
        num_font[4'ha][5] = 4'b1011;
        num_font[4'ha][6] = 4'b0101;
        
        num_font[4'hb][0] = 4'b1000;
        num_font[4'hb][1] = 4'b1000;
        num_font[4'hb][2] = 4'b1110;
        num_font[4'hb][3] = 4'b1001;
        num_font[4'hb][4] = 4'b1001;
        num_font[4'hb][5] = 4'b1001;
        num_font[4'hb][6] = 4'b1110;
        
        num_font[4'hc][0] = 4'b0000;
        num_font[4'hc][1] = 4'b0000;
        num_font[4'hc][2] = 4'b0110;
        num_font[4'hc][3] = 4'b1001;
        num_font[4'hc][4] = 4'b1000;
        num_font[4'hc][5] = 4'b1000;
        num_font[4'hc][6] = 4'b0111;
        
        num_font[4'hd][0] = 4'b0001;
        num_font[4'hd][1] = 4'b0001;
        num_font[4'hd][2] = 4'b0111;
        num_font[4'hd][3] = 4'b1001;
        num_font[4'hd][4] = 4'b1001;
        num_font[4'hd][5] = 4'b1001;
        num_font[4'hd][6] = 4'b0111;
        
        num_font[4'he][0] = 4'b0000;
        num_font[4'he][1] = 4'b0000;
        num_font[4'he][2] = 4'b1110;
        num_font[4'he][3] = 4'b1001;
        num_font[4'he][4] = 4'b1110;
        num_font[4'he][5] = 4'b1000;
        num_font[4'he][6] = 4'b0111;
        
        num_font[4'hf][0] = 4'b0011;
        num_font[4'hf][1] = 4'b0100;
        num_font[4'hf][2] = 4'b1111;
        num_font[4'hf][3] = 4'b0100;
        num_font[4'hf][4] = 4'b0100;
        num_font[4'hf][5] = 4'b0100;
        num_font[4'hf][6] = 4'b0100;
    end
    generate
    for(j = 0; j < 14; j = j + 1) begin
        always @(negedge btns[j]) begin
            var[j * 4 + 3 -: 4] = var[j * 4 + 3-: 4] + 4'b1;
        end
    end
    endgenerate
    // always @(btns) begin
    //     prev_btns = cur_btns; // 必须使用阻塞赋�??
    //     cur_btns = btns;
    //     for (i = 0; i < 16; i = i + 1) begin
    //         if (prev_btns[i] && ~cur_btns[i]) begin // 必须使用两个&�?&&
    //             var[i * 4 + 3 -: 4] = var[i * 4 + 3 -: 4] + 4'b1;
    //         end
    //     end
    // end
    always @(keys) begin
        var[63-:5]=keys;
        end
    always @(posedge vga_clk or posedge vga_rst) begin
        if (vga_rst) begin
            pixel_data <= 0;
        end
        else begin
            if (10 <= y_pos && y_pos < 90) begin
                if (10 <= x_pos && x_pos <= 90) begin
                    pixel_data <= 12'hf00;
                    end else if (100 <= x_pos && x_pos <= 180) begin
                    pixel_data <= 12'h0f0;
                    end else if (190 <= x_pos && x_pos <= 270) begin
                    pixel_data <= 12'h00f;
                    end else if (280 <= x_pos && x_pos <= 360) begin
                    pixel_data <= 12'hff0;
                    end else if (370 <= x_pos && x_pos <= 450) begin
                    pixel_data <= 12'hf0f;
                    end else if (460 <= x_pos && x_pos <= 520) begin
                    pixel_data <= 12'h0ff;
                    end else if (530 <= x_pos && x_pos <= 610) begin
                    pixel_data <= 12'h000;
                    end else begin
                    pixel_data <= 12'haaa;
                    end 
            end else if (120 <= y_pos && y_pos < 120 + 8 * 7) begin
                i = x_pos / 40;
                if (4 <= x_pos - i * 40 && x_pos - i * 40 < 36) begin
                    if (num_font[var[63 - i * 4 -: 4]][(y_pos - 120) >> 3][3 -((x_pos - i * 40 - 4) >> 3)]) begin
                        pixel_data <= 12'h00f;
                        end else begin
                        pixel_data <= 12'hfff;
                        end
                end else begin
                    pixel_data <= 12'hfff;
                end
            end else begin
                pixel_data <= 12'hfff;
            end
        end
    end
endmodule
