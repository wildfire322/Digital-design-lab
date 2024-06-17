module buzzer (
    input wire clk,        // 时钟输入     
    input S1,              // 开关输入
    output reg buzzer_pin  // 蜂鸣器输出引脚
);

    integer tone_counter;
    reg tone_active;
    integer tone_duration;
    parameter TONE_DURATION = 5000000; // 持续时间，假设为 50 ms

    parameter C4 = 191113;  // C音频率
    parameter D4 = 170262;  // D音频率
    parameter E4 = 151686;  // E音频率
    parameter F4 = 143173;  // F音频率
    parameter G4 = 127553;  // G音频率
    parameter A4 = 113636;  // A音频率
    parameter B4 = 101239;  // B音频率

    // 音符时长定义（假设每个音符时长为500ms）
    parameter NOTE_DURATION = 5000000;
    parameter REST_DURATION = 40000000; // 休止符时长，假设为10ms

    // 小星星音符序列
    reg [31:0] melody [0:47];
    initial begin
        melody[0] = C4;
        melody[1] = C4;
        melody[2] = G4;
        melody[3] = G4;
        melody[4] = A4;
        melody[5] = A4;
        melody[6] = G4;
        melody[7] = 0;  // 休止符
        melody[8] = F4;
        melody[9] = F4;
        melody[10] = E4;
        melody[11] = E4;
        melody[12] = D4;
        melody[13] = D4;
        melody[14] = C4;
        melody[15] = 0;  // 休止符
        melody[16] = G4;
        melody[17] = G4;
        melody[18] = F4;
        melody[19] = F4;
        melody[20] = E4;
        melody[21] = E4;
        melody[22] = D4;
        melody[23] = 0;  // 休止符
        melody[24] = G4;
        melody[25] = G4;
        melody[26] = F4;
        melody[27] = F4;
        melody[28] = E4;
        melody[29] = E4;
        melody[30] = D4;
        melody[31] = 0;  // 休止符
        melody[32] = C4;
        melody[33] = C4;
        melody[34] = G4;
        melody[35] = G4;
        melody[36] = A4;
        melody[37] = A4;
        melody[38] = G4;
        melody[39] = 0;  // 休止符
        melody[40] = F4;
        melody[41] = F4;
        melody[42] = E4;
        melody[43] = E4;
        melody[44] = D4;
        melody[45] = D4;
        melody[46] = C4;
        melody[47] = 0;  // 休止符
    end

    integer note_index;
    integer note_duration_counter;
    reg [31:0] current_tone;
    reg rest_period; // 标记是否处于休止符期间

    initial begin
        tone_counter <= 0;
        buzzer_pin <= 0;
        tone_active <= 0;
        tone_duration <= 0;
        note_index <= 0;
        note_duration_counter <= 0;
        current_tone <= melody[0];
        rest_period <= 0;
    end 

    always @(posedge clk) begin
        if(S1) begin
            if (!tone_active) begin
                tone_active <= 1;
                tone_duration <= 0;
                note_index <= 0;
                note_duration_counter <= 0;
                current_tone <= melody[0];
                rest_period <= 0;
            end
        end else begin 
            if (tone_active) begin
                if (note_duration_counter >= (rest_period ? REST_DURATION : NOTE_DURATION)) begin
                    if (rest_period) begin
                        note_index <= note_index + 1;
                        rest_period <= 0;
                    end else begin
                        rest_period <= 1;
                    end
                    
                    note_duration_counter <= 0;
                    if (note_index >= 48) begin
                        tone_active <= 0;
                        buzzer_pin <= 0;
                    end else begin
                        current_tone <= rest_period ? 0 : melody[note_index];
                    end
                end else begin
                    note_duration_counter <= note_duration_counter + 1;
                    if (current_tone != 0) begin
                        if (tone_counter >= current_tone) begin
                            tone_counter <= 0;
                            buzzer_pin <= ~buzzer_pin;  // 翻转蜂鸣器引脚状态，制造出方波信号，产生音调
                        end else begin
                            tone_counter <= tone_counter + 1;
                        end
                    end else begin
                        buzzer_pin <= 0;  // 休止符期间关闭蜂鸣器
                    end
                end
            end
        end
    end
endmodule
//引脚约束可以这么写：set_property PACKAGE_PIN AF25 [get_ports buzzer]
//。set_property IOSTANDARD LVCMOS33 [get_ports buzzer]

