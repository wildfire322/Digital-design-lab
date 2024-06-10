`timescale 1ns / 1ps
module SEGDRV(
    input load,
    input clk,
    input [63:0] in,
    output reg dout,
    output reg finish
    );
    reg [63:0] mid=0;
    reg [6:0] cnt=0;
    always@(posedge clk) begin
        if(load)begin
            mid<=in;
            cnt<=0;
        end
        else begin
            mid <={1'b1,mid[63:1]};
        dout<=mid[0];
        cnt<=cnt+1'b1;
        if(cnt>=7'b1000000) begin
            finish<=1'b1;
            cnt<=7'b1000000;
        end
        else begin
            finish<=1'b0;
        end
        end
    end
endmodule
