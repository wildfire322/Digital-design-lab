`timescale 1ns / 1ps
module adder(
    input clk,
    input [3:0] a,
    input [3:0] b,
    output [3:0] result//这里我想将a+b的结果还给a
);
    parameter state1 =4'b0000;
    parameter state2 =4'b0001;
    parameter state3 =4'b0010;
    parameter state4 =4'b0011;
    parameter state5 =4'b0100;
    parameter state6 =4'b0101;
    parameter state7 =4'b0110;
    parameter state8 =4'b0111;
    parameter state9 =4'b1000;
    parameter state10 =4'b1001;
    always@(posedge clk)begin
        case(a)
            state1:case(b)
                state1:result<=4'b0000;
                state2:result<=4'b0001;
                state3:result<=4'b0010;
                state4:result<=4'b0011;
                state5:result<=4'b0100;
                state6:result<=4'b0101;
                state7:result<=4'b0110;
                state8:result<=4'b0111;
                state9:result<=4'b1000;
                state10:result<=4'b1001;
            endcase
            state2:case(b)
                state1:result<=4'b0001;
                state2:result<=4'b0010;
                state3:result<=4'b0011;
                state4:result<=4'b0100;
                state5:result<=4'b0101;
                state6:result<=4'b0110;
                state7:result<=4'b0111;
                state8:result<=4'b1000;
                state9:result<=4'b1001;
                state10:result<=4'0000;
            endcase
            state3:case(b)
                state1:result<=4'b0010;
                state2:result<=4'b0011;
                state3:result<=4'b0100;
                state4:result<=4'b0101;
                state5:result<=4'b0110;
                state6:result<=4'b0111;
                state7:result<=4'b1000;
                state8:result<=4'b1001;
                state9:result<=4'0000;
                state10:result<=4'0001;
            endcase
            state4:case(b)
                state1:result<=4'b0011;
                state2:result<=4'b0100;
                state3:result<=4'b0101;
                state4:result<=4'b0110;
                state5:result<=4'b0111;
                state6:result<=4'b1000;
                state7:result<=4'b1001;
                state8:result<=4'0000;
                state9:result<=4'0001;
                state10:result<=4'0010;
            endcase
            state5:case(b)
                state1:result<=4'b0100;
                state2:result<=4'b0101;
                state3:result<=4'b0110;
                state4:result<=4'b0111;
                state5:result<=4'b1000;
                state6:result<=4'b1001;
                state7:result<=4'0000;
                state8:result<=4'0001;
                state9:result<=4'0010;
                state10:result<=4'0011;
            endcase
            state6:case(b)
                state1:result<=4'b0101;
                state2:result<=4'b0110;
                state3:result<=4'b0111;
                state4:result<=4'b1000;
                state5:result<=4'b1001;
                state6:result<=4'0000;
                state7:result<=4'0001;
                state8:result<=4'0010;
                state9:result<=4'0011;
                state10:result<=4'0100;
            endcase
            state7:case(b)
                state1:result<=4'b0110;
                state2:result<=4'b0111;
                state3:result<=4'b1000;
                state4:result<=4'b1001;
                state5:result<=4'0000;
                state6:result<=4'0001;
                state7:result<=4'0010;
                state8:result<=4'0011;
                state9:result<=4'0100;
                state10:result<=4'0101;
            endcase
            state8:case(b)
                state1:result<=4'b0111;
                state2:result<=4'b1000;
                state3:result<=4'b1001;
                state4:result<=4'0000;
                state5:result<=4'0001;
                state6:result<=4'0010;
                state7:result<=4'0011;
                state8:result<=4'0100;
                state9:result<=4'0101;
                state10:result<=4'0110;
            endcase
            state9:case(b)
                state1:result<=4'b1000;
                state2:result<=4'b1001;
                state3:result<=4'0000;
                state4:result<=4'0001;
                state5:result<=4'0010;
                state6:result<=4'0011;
                state7:result<=4'0100;
                state8:result<=4'0101;
                state9:result<=4'0110;
                state10:result<=4'0111;
            endcase
            state10:case(b)
                state1:result<=4'b1001;
                state2:result<=4'0000;
                state3:result<=4'0001;
                state4:result<=4'0010;
                state5:result<=4'0011;
                state6:result<=4'0100;
                state7:result<=4'0101;
                state8:result<=4'0110;
                state9:result<=4'0111;
                state10:result<=4'1000;
            endcase
    end
    endmodule