/**************************************************************************************
 * 
 * Name: Omar Mahmoud Mohamed Khalil Elsherif
 *
 * assignment: greatest common divisor
 *
************************************************************************************** 
*/

module gcd_datapath(
	input clk,
	input start,
	input [7:0] A_in,B_in,
	output reg [7:0] res,
	output reg done_flag,
	output reg A_greater_B
);
reg [7:0] A,B;


always@(posedge clk or negedge start) begin
//default value
done_flag = 0;
if(~start) begin 
A = A_in;
B = B_in;

	while(A!=B) begin
		if(A>B) begin
			A = A - B;
			A_greater_B = 1;
		end
		else  begin 
			B = B - A;
			A_greater_B = 0;
		end 
	end
res = A;
done_flag = 1;

end
else res = res;
end


endmodule
