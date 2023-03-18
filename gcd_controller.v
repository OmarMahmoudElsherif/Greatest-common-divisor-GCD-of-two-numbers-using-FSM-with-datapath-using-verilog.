/**************************************************************************************
 * 
 * Name: Omar Mahmoud Mohamed Khalil Elsherif
 *
 * assignment: greatest common divisor
 *
************************************************************************************** 
*/

module gcd_controller(
	input clk,
	input start,
	input A_greater_B_flag,
	input done_flag
	//output reg start_flag
);

reg [2:0] curr_state,next_state;
parameter [2:0] start_state = 3'd0,
		check_A_B = 3'd1,
		A_greater_B = 3'd2,
		A_decrement = 3'd3,
		B_decrement = 3'd4;

// state register
always@(posedge clk) begin
	if(!start) 
		curr_state<= start;
	else
		curr_state<= next_state;
end

//state logic
always@(*) begin


case(curr_state)
start_state : begin


if(done_flag) next_state <= start_state;
else next_state<= check_A_B;

end

check_A_B : begin

if(done_flag) next_state <= start_state;
else next_state<= A_greater_B;

end

A_greater_B : begin

if(A_greater_B_flag) next_state<= A_decrement;
else next_state<= B_decrement;

end


A_decrement : begin

next_state<= check_A_B;

end

B_decrement : begin

next_state<= check_A_B;

end


endcase
end


endmodule
