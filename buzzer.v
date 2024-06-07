module buzzer (
    input wire clk,        // 时钟输入
    input wire rst,        // 复位输入
    input wire [3:0] counter, // 操作对象（4位计数器）
    output reg buzzer_pin  // 蜂鸣器输出引脚
);

    reg [31:0] tone_counter;
    reg tone_active;
    reg [31:0] tone_duration;

    // 设置音调频率，假设时钟频率为 50 MHz
    parameter TONE_1KHZ = 50000;  // 1 kHz 音调
    parameter TONE_DURATION = 2500000; // 持续时间，假设为 50 ms

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tone_counter <= 0;
            buzzer_pin <= 0;
            tone_active <= 0;
            tone_duration <= 0;
        end else begin
            // 检测计数器是否达到 10
            if (counter == 4'd10 && !tone_active) begin
                tone_active <= 1;
                tone_duration <= 0;
            end
            
            // 如果音调激活，生成蜂鸣器信号
            if (tone_active) begin
                if (tone_duration >= TONE_DURATION) begin
                    tone_active <= 0;
                    buzzer_pin <= 0;
                end else begin
                    if (tone_counter >= TONE_1KHZ) begin
                        tone_counter <= 0;
                        buzzer_pin <= ~buzzer_pin;  // 翻转蜂鸣器引脚状态，制造出方波信号，产生音调
                    end else begin
                        tone_counter <= tone_counter + 1;
                    end
                    tone_duration <= tone_duration + 1;
                end
            end else begin
                buzzer_pin <= 0;
            end
        end
    end

endmodule
//引脚约束可以这么写：set_property PACKAGE_PIN AF25 [get_ports buzzer]
//。set_property IOSTANDARD LVCMOS33 [get_ports buzzer]
// 在top模块中，或许可以这么使用：module top_module (
//     input wire clk,        // 时钟输入
//     input wire rst,        // 复位输入
//     input wire [3:0] counter1, // 第一个操作对象（4位计数器）
//     input wire [3:0] counter2, // 第二个操作对象（4位计数器）
//     output wire buzzer_pin // 蜂鸣器输出引脚
// );

//     wire buzzer1_pin;
//     wire buzzer2_pin;

//     // 实例化第一个buzzer模块
//     buzzer buzzer1 (
//         .clk(clk),
//         .rst(rst),
//         .activate(counter1 == 4'd10), // 当counter1达到10时激活
//         .buzzer_pin(buzzer1_pin)
//     );

//     // 实例化第二个buzzer模块
//     buzzer buzzer2 (
//         .clk(clk),
//         .rst(rst),
//         .activate(counter2 == 4'd10), // 当counter2达到10时激活
//         .buzzer_pin(buzzer2_pin)
//     );

//     // 合并buzzer模块的输出信号
//     assign buzzer_pin = buzzer1_pin | buzzer2_pin;

// endmodule
