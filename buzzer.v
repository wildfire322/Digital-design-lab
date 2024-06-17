module buzzer (
    input wire clk,        // 时钟输入     
    input S1,              // 开关输入
    output reg buzzer_pin  // 蜂鸣器输出引脚
);

    integer tone_counter;
    reg tone_active;
    integer tone_duration;
    parameter TONE_DURATION = 5000000; // 持续时间，假设为 50 ms

    // 音符频率定义
    parameter C7 = 191113;  // C音频率
    parameter D7 = 170262;  // D音频率
    parameter E7 = 151686;  // E音频率
    parameter F7 = 143173;  // F音频率
    parameter G7 = 127553;  // G音频率
    parameter A7 = 113636;  // A音频率
    parameter B7 = 101239;  // B音频率
    parameter Bb6 = 214519; // Bb音频率
    parameter G6 = 255102;  // G音频率
    parameter E6 = 303375;  // E音频率
    parameter A6 = 227272;  // A音频率
    parameter B6 = 202478;  // B音频率

    // 音符时长定义（假设每个音符时长为500ms）
    parameter NOTE_DURATION = 2000000;
    parameter REST_DURATION = 20000000;// 休止符时长，假设为50ms

    // 马里奥主题曲音符序列
    reg [31:0] melody [0:95]; // 扩展音符序列长度
    initial begin
        melody[0] = E7;
        melody[1] = E7;
        melody[2] = 0;  
        melody[3] = E7;
        melody[4] = 0; 
        melody[5] = C7;
        melody[6] = E7;
        melody[7] = 0;  
        melody[8] = G7;
        melody[9] = 0;  
        melody[10] = 0;  
        melody[11] = 0;  
        melody[12] = G6;
        melody[13] = 0;  
        melody[14] = 0;  
        melody[15] = 0;  
        melody[16] = C7;
        melody[17] = 0;  
        melody[18] = 0;  
        melody[19] = G6;
        melody[20] = 0;  
        melody[21] = 0;  
        melody[22] = E6;
        melody[23] = 0;  
        melody[24] = A6;
        melody[25] = 0;  
        melody[26] = B6;
        melody[27] = 0;  
        melody[28] = Bb6; // 修正为Bb6
        melody[29] = A6;
        melody[30] = 0;  
        melody[31] = G6;
        melody[32] = E7;
        melody[33] = 0;  
        melody[34] = G7;
        melody[35] = A7;
        melody[36] = 0;  
        melody[37] = F7;
        melody[38] = G7;
        melody[39] = 0;  
        melody[40] = E7;
        melody[41] = 0;  
        melody[42] = C7;
        melody[43] = D7;
        melody[44] = B6;
        melody[45] = 0;  
        melody[46] = 0;  
        melody[47] = 0;  

        // 扩展部分的音符
        melody[48] = G6;
        melody[49] = F7;
        melody[50] = E7;
        melody[51] = D7;
        melody[52] = C7;
        melody[53] = 0;  
        melody[54] = E6;
        melody[55] = 0;  
        melody[56] = A6;
        melody[57] = 0;  
        melody[58] = B6;
        melody[59] = 0;  
        melody[60] = Bb6;
        melody[61] = A6;
        melody[62] = 0;  
        melody[63] = G6;
        melody[64] = E7;
        melody[65] = 0;  
        melody[66] = G7;
        melody[67] = A7;
        melody[68] = 0;  
        melody[69] = F7;
        melody[70] = G7;
        melody[71] = 0;  
        melody[72] = E7;
        melody[73] = 0;  
        melody[74] = C7;
        melody[75] = D7;
        melody[76] = B6;
        melody[77] = 0; 
        melody[78] = 0;  
        melody[79] = 0;  
        melody[80] = G6;
        melody[81] = F7;
        melody[82] = E7;
        melody[83] = D7;
        melody[84] = C7;
        melody[85] = 0; 
        melody[86] = E6;
        melody[87] = 0;  
        melody[88] = A6;
        melody[89] = 0;  
        melody[90] = B6;
        melody[91] = 0;
        melody[92] = Bb6;
        melody[93] = A6;
        melody[94] = 0;
        melody[95] = G6;
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
                    if (note_index >= 96) begin // 更新为新的音符序列长度
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
                        buzzer_pin <= 0;  期间关闭蜂鸣器
                    end
                end
            end
        end
    end
endmodule
//引脚约束可以这么写：set_property PACKAGE_PIN AF25 [get_ports buzzer]
//。set_property IOSTANDARD LVCMOS33 [get_ports buzzer]

