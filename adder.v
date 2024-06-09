`timescale 1ns / 1ps
module adder(
    input clk,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] result//这里我想将a+b的结果还给a
);
    reg [4:0] sum;
    always @(posedge clk) begin
        sum <= a + b;
        if(sum > 5'd10) result <= sum - 10;
        else result <= sum;
    end    
endmodule
