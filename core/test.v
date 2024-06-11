module numberchoose(
    input S2,//开关控制当前增大还是减小
// 这个模块是让用户选择有几个东西（操作的那玩意的个数）
input btn,//调大小
output reg [2:0] numberchoose
);
initial begin
    numberchoose = 3'b000;
end
reg [2:0] number=3'b000;
always @(posedge btn) begin
        if (S2) begin
            number <= number + 3'b001;
        end else begin
            number <= number - 3'b001;
        end
    end
always @(number) begin
    if(number>3'b101)begin
        numberchoose <= 3'b000;
        number <= 3'b000;
    end else begin
        numberchoose <= number;
    end
end
endmodule
