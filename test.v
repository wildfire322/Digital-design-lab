module numberchoose(
    input S1,//开关控制当前是不是在选择个数
    input S2,//开关控制当前增大还是减小
// 这个模块是让用户选择有几个东西（操作的那玩意的个数）
input [1:0]btn,//一个调大小，一个确定
output reg [3:0] numberchoose
);
initial begin
    numberchoose = 4'b0000;
end
reg [3:0] number=4'b0000;
always @(posedge btn[0]) begin
    if (S1) begin
        if (S2) begin
            number <= number + 4'b0010;
        end else begin
            number <= number - 4'b0010;
        end
    end
end

always @(posedge btn[1]) begin
    if (S1) begin
        numberchoose <= number;
    end
end
endmodule