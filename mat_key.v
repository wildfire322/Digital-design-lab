`timescale 1ns / 1ps

module mat_key(input wire [3:0] BTNY,
               input wire scan_clk,
               output reg [3:0] BTNX,
               output reg btn [3:0][3:0],
               output wire sync_clk);
    assign sync_clk = (BTNX == 4'b1110) ? 1'b1 : 1'b0;
    reg [7:0] buffer [3:0][3:0];
    reg status [3:0][3:0];
    initial begin
        BTNX = 4'b0111;
        generate
        genvar i, j;
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                buffer[i][j] = 8'b00000000;
                status[i][j] = 1'b0;
                btn[i][j]    = 1'b0;
            end
        end
        endgenerate
    end
    always @(posedge scan_clk) begin
        case(BTNX)
            4'b0111: status[0] <= BTNY;
            4'b1011: status[1] <= BTNY;
            4'b1101: status[2] <= BTNY;
            4'b1110: status[3] <= BTNY;
        endcase
        BTNX <= {BTNX[0], BTNX[3:1]};
        generate
        genvar i, j;
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                assign buffer[i][j] = {buffer[i][j][6:0], status[i][j]};
                if (buffer[i][j] == 8'hff) begin
                    btn[i][j] <= 1'b1;
                end else if (buffer[i][j] == 8'h00) begin
                    btn[i][j] <= 1'b0;
                end
            end
        end
        endgenerate
    end


endmodule
