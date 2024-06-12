`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/11 15:14:13
// Design Name: 
// Module Name: toptest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module toptest(
    input clk,
    output[3:0] AN,
    output[7:0] SEGMENT,
    input [3:0] col,
    output [3:0] row
    );
    wire [15:0] btn;
    wire [15:0] num;
    reg [31:0] cnt = 0;
    reg scan_clk = 0;
    always@(posedge clk) begin
        if(cnt == 2499) begin
            cnt <= 0;
            scan_clk <= ~scan_clk;
        end
        else
            cnt <= cnt + 1;
    end
    wire sync_clk;
    mat_key mat_key1(.BTNY(col),.scan_clk(scan_clk),.BTNX(row),.btn(btn),.sync_clk(sync_clk));
        CreateNumber CreateNumber1(.btn({btn[3],btn[7],btn[11],btn[15]}),.num(num));
        DisplayNumber DisplayNumber1(.clk(clk),.rst(1'b0),.hexs(num),.points(4'b0000),.LEs(4'b0000),.AN(AN),.SEGMENT(SEGMENT));
endmodule

