module ctrl_transfer#(parameter WIDTH = 4)
                     (input enable,
                      input [WIDTH - 1:0]data_in,
                      output [WIDTH - 1:0]data_out);
    reg [WIDTH - 1:0] mask;
    always @(posedge enable) begin
        for(int i = 0; i < WIDTH; i = i + 1) begin
            mask[i] <= 1;
        end
    end
    always @(negedge enable) begin
        for(int i = 0; i < WIDTH; i = i + 1) begin
            mask[i] <= 0;
        end
    end
    assign data_out = data_in & mask;
endmodule
