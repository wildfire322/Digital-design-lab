module chooseadder #(
    parameter N = 10 // 默认10个对象
)(
    input enable,
    input clk,
    input clkdiv,
    input [N*4-1:0] status, // N个对象的状态
    input [N-1:0] buttons, // N个按钮
    output reg [3:0] values, // N个可操作对象的值
    output reg [3:0] selected_index // 新增变量，用于保存第一次按下按钮时的i值,以此确定status[i]的位置
);
    reg [3:0] selected;
    reg [3:0] to_add;
    wire [3:0] adder_result;
    wire [N-1:0] out_buttons;
    initial begin
            values <= 4'b0;
            selected <= 4'b0000;
            to_add <= 4'b0000;
            selected_index<=4'b1111;
    end
    genvar j;
    generate
        for (j = 0; j < N; j = j + 1) begin : gen
            pbdebounce pb(
                .clk(clkdiv),
                .button(buttons[j]),
                .pbreg(out_buttons[j])
            );
        end
    endgenerate            
    integer i;
     always @(posedge clk) begin
        else if (enable) begin
            for (i = 0; i < N; i = i + 1) begin
                if (buttons[i] == 1'b1&&i!=selected_index) begin
                    if (selected == 4'b0) begin
                        selected <= status[i*4 +: 4]; // 第一次按下，选择为A
                        selected_index <= i; // 保存第一次按下按钮时的i值
                    end else begin
                        to_add = status[i*4 +: 4]; // 第二次按下，选择为B
                        values = 4'b0000 + (($signed(selected) + $signed(to_add)) % 10); // 计算selected和to_add的和，然后对结果进行模10运算，并将结果赋值给values
                        selected = 4'b0; // 重置选定
                    end
                end
            end
        end
    end
endmodule
