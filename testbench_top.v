`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module testbench_top();
	reg clk, rst;
	
	top tp (.clock(clk), .reset(rst));
	
	always
	begin
		clk = 0; #10; clk = 1; #10;
		$display("clk:%b rst= %b, pc=%h, instr=%h, aluout=%d, writedata=%h, memwrite:%b, readdata=%h", 
		
					 clk, 	rst, 	  tp.pc, tp.instr, tp.aluout, tp.writedata, tp.memwrite, tp.readdata);
	end
	
	initial
	begin
		rst = 1'b0;
		#5;
		rst = 1'b1;
	end
	
endmodule 