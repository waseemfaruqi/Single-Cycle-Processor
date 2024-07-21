module imem (
	input [5:0] a,
	output[31:0]rd);
	
	reg [31:0] reg_file [17:0];
	
	initial
	begin
		$readmemh("memfile.dat", reg_file);
	end
	
	assign rd = reg_file[a];	
	
endmodule 