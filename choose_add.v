module chooseadder #(
    parameter N = 10 // 默认10个对象
)(
    input clk,
    input [N-1:0] buttons, // N个按钮
    output reg [3:0] values [N-1:0] // N个可操作对象的值
);
    reg [3:0] selected;
    reg [3:0] to_add;
    wire [3:0] adder_result;
    wire [N-1] out_buttons;
    adder add(
        .clk(clk),
        .a(selected),
        .b(to_add),
        .result(adder_result)
    );
    genvar j;
    generate
        for (j = 0; j < N; j = j + 1) begin : gen
            pbdebounce pb(
                .clk(clk),
                .button(buttons[j]),
                .pbreg(out_buttons[j])
            );
        end
    endgenerate
    always @(posedge clk) begin
        integer i;
        for (i = 0; i < N; i = i + 1) begin
            if (out_buttons[i] == 1'b1) begin
                if (selected == 4'b0) begin
                    selected <= values[i]; // 第一次按下，选择为A
                end else begin
                    to_add <= values[i]; // 第二次按下，选择为B
                    values[i] <= adder_result; // 结果保存到A
                    selected <= 4'b0; // 重置选定
                end
            end
        end
    end
endmodule