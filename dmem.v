module dmem(input clk, we,
				input  [31:0] a, wd,
				output [31:0] rd );
		
	reg [31:0] reg_file [31:0];
	
	reg  [31:0]  output_data;
	
	assign index = a >> 2;
	
	always @(posedge clk)
	begin		
		if(we)
			reg_file[index] <= wd;
	end
	
	assign rd = reg_file[index];
	
endmodule 