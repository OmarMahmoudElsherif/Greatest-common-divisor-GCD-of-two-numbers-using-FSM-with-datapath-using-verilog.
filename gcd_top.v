/**************************************************************************************
 * 
 * Name: Omar Mahmoud Mohamed Khalil Elsherif
 *
 * assignment: greatest common divisor
 *
************************************************************************************** 
*/
`timescale 10ps/10ps

module gcd_top(
	input clk,
	input start,
	input [7:0] A,B,
	output [7:0] resultt
);

wire done_flag;
wire A_great_B;
wire [7:0] Res ;
assign resultt=Res;

gcd_controller gcd_cnt(
	.clk(clk),
	.start(start),
	.done_flag(done_flag),
	.A_greater_B_flag(A_great_B) 
	);

gcd_datapath gcd_dp(
	.clk(clk),
	.start(start),
	.A_in(A),
	.B_in(B),
	.res(Res),
	.done_flag(done_flag),
	.A_greater_B(A_great_B) 
	);




endmodule


module gcd_tb();

reg start;
reg clk=0;
reg [7:0] A, B;
wire [7:0] Result;


always #(5) clk=~clk;

gcd_top gcd_tp(
	.clk(clk),
	.start(start),
	.A(A),
	.B(B),
	.resultt(Result)
);


initial begin

start = 0;
A= 8'd5;     // gcd(5,20) = 5
B= 8'd20;
#20;

A= 8'd30;    // gcd(30,7) = 1
B= 8'd7;
#20;

A= 8'd140;    // gcd(140,20) = 20
B= 8'd20;
#20;


end


endmodule
