module numberchoose(
input A,D;
output reg [2:0] numberchoose
);
initial begin
    numberchoose = 3'b000;
end
reg [2:0] number=3'b000;
always @(posedge btn) begin
        if (A) begin
            number <= number + 3'b001;
        end 
        if(D) begin
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
