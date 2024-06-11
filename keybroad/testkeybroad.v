module toptest(
    input clk,
    output[3:0] AN,
    output[7:0] SEGMENT,
    input [3:0] col,
    output reg [3:0] row
    );
    initial row=4'b0111;
    reg [3:0] key;
    wire [15:0] num;
    reg [31:0] cnt = 0;
    reg scan_clk = 0;
    always@(posedge clk) begin
        if(cnt == 2499) begin
            cnt <= 0;
            scan_clk <= ~scan_clk;
        end
        else
            cnt <= cnt + 1;
    end
    wire [31:0] clkdi;
    clkdiv clkdiv_inst(
    .clk(clk),
    .rst(1'b0),
    .div_res(clkdi)
);
    always@(posedge scan_clk)
        row <= {row[0],row[3:1]}; 
    always@(negedge scan_clk) 
        case(row)
        4'b0111: key <= {2'b00,col[3]&col[2],col[3]&col[1]};//0代表按下
        4'b1011: key <= {2'b01,col[3]&col[2],col[3]&col[1]};
        4'b1101: key <= {2'b10,col[3]&col[2],col[3]&col[1]};
        4'b1110: key <= {2'b11,col[3]&col[2],col[3]&col[1]};
        endcase
        wire[3:0]btn;
        assign btn[0] = (key==4'b0000)?1'b1:1'b0;
        assign btn[1] = (key==4'b0100)?1'b1:1'b0; 
        assign btn[2] = (key==4'b1000)?1'b1:1'b0;
        assign btn[3] = (key==4'b1100)?1'b1:1'b0;
        CreateNumber CreateNumber1(.btn(btn),.num(num));
        DisplayNumber DisplayNumber1(.clk(clk),.rst(1'b0),.hexs(num),.points(4'b0000),.LEs(4'b0000),.AN(AN),.SEGMENT(SEGMENT));
endmodule
