module d_flip_flop(output reg [31:0]q, input clk,input [31:0] D);
	
	always @(posedge clk)
			q <= D;
	
endmodule
