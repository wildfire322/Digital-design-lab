`timescale 1ns / 1ps

module Top(
	input clk,
	input rstn,
	input [15:0]SW,
	output hs,
	output vs,
	output [3:0] r,
	output [3:0] g,
	output [3:0] b,
	output SEGLED_CLK,
	output SEGLED_CLR,
	output SEGLED_DO,
	output SEGLED_PEN,
  output LED_CLK,
	output LED_CLR,
	output LED_DO,
	output LED_PEN,
	inout [4:0]BTN_X,
	inout [3:0]BTN_Y,
	output buzzer
    );
	
	// 每当 clk 滴答，clkdiv++
	reg [31:0]clkdiv;
	always@(posedge clk) begin
		clkdiv <= clkdiv + 1'b1;
	end
	
	// 蜂鸣器，这里并没有使用
	assign buzzer = 1'b1;
	
	// SW_OK 是防抖动完的开关，其他不用管
	wire [15:0] SW_OK;
	// #(4) 是给里面的常量赋值
	// AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
	
	// 处理按键输入：
	// keyCode 是按键的编号，左边四列为：
	// 0 1 2 3
	// 4 5 6 7
	// ...
	// keyReady 为 1，当有按钮被按下
	// 其他不用管
	// 最右边一列不属此处管
	wire [4:0] keyCode;
	wire keyReady;
	// Keypad k0 (.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady));
	
	// 处理七段数码管显示：
	// segTestData 是 8*4 位要显示的数据
	// 其他不用管
	wire [31:0] segTestData;
	wire [3:0] sout;
//    Seg7Device segDevice(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
		// .data(segTestData), .point(8'h0), .LES(8'h0), .sout(sout));
	assign SEGLED_CLK = sout[3];
	assign SEGLED_DO = sout[2];
	assign SEGLED_PEN = sout[1];
	assign SEGLED_CLR = sout[0];
 	
	// VGA 是 640*480 的，分别用 10 位和 9 位表示横纵位置
	reg [9:0] x;
	reg [8:0] y;
	
	// 处理 VGA 输出：
	// input clrn: ~clear, if it's 0 then clear
	// input vga_data: bbbb_gggg_rrrr
	// output row_addr & col_addr: 需要给出 vga_data 的像素坐标
 	reg [11:0] vga_data;
 	wire [9:0] col_addr;
 	wire [8:0] row_addr;
	vgac v0 (
		.vga_clk(clkdiv[1]), .clrn(SW_OK[0]), .d_in(vga_data), .row_addr(row_addr), 
		.col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs)
	);
	
	wire [19:0] x_sqr, y_sqr, r_sqr;
	reg wasReady;
	// 初始设 radius = 15
	reg [9:0] radius = 10'd15;
	always @(posedge clk) begin
		// rstn 是 top 的输入，两个红键中下面的那个
		// 如果被按下，重置 x, y, radius
		// 似乎开始时有 rstn 信号？
		if (!rstn) begin
			x <= 10'd320;
			y <= 9'd240;
			radius <= 10'd15;
		end else begin
			// 当上一个时钟信号时按钮未被按下且现在被按下了
			// 即非长按的情况
			wasReady <= keyReady;
			if (!wasReady&&keyReady) begin
				case (keyCode)
					5'h10: radius <= radius - 10'd5;
					5'h12: radius <= radius + 10'd5;
					5'hc: x <= x - 10'd20;
					5'he: x <= x + 10'd20;
					5'h9: y <= y - 9'd20;
					5'h11: y <= y + 9'd20;
					default: ;
				endcase
			end
		end
	end
	
	assign x_sqr = (x - col_addr) * (x - col_addr);
	assign y_sqr = (y - row_addr) * (y - row_addr);
	assign r_sqr = radius * radius;
	
	always@(*) begin
		// 如果当前位置在圆内，将 SW[12:1] 作为颜色输给 vga_data
		// 即将圆显示为 SW[12:1] 对应的颜色
		if ((x_sqr + y_sqr < r_sqr))
			vga_data <= SW[12:1];
		// 否则，显示白色
		else vga_data <= 12'hfff;
	end
	
	// 将 segTestData 设为 0000_000x_xxxx_xxxx_0000_0000_yyyy_yyyy
	// 即显示在 7 段数码管上
	assign segTestData = {7'b0,x,8'b0,y};
	
	// 处理 LED 输出：
	// ledData 是 16 个灯的显示控制
	// 其他不用管
	wire [15:0] ledData;
	// 这里把 SW_OK 赋给了 ledData，即显示开关情况
	assign ledData = SW_OK;
	// ShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), 
	// 											 .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));
endmodule
