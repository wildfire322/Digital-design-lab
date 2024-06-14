module ctrl_transfer#(parameter WIDTH = 4)
                     (input enable,
                      input [WIDTH - 1:0]data_in,
                      output [WIDTH - 1:0]data_out);
    assign data_out = data_in & {WIDTH{enable}};
endmodule
