module top(input clock, reset);
	
	
	wire [31:0] instr, pc, aluout, writedata, readdata;
	wire [5:0] a;
	wire memwrite;
	
	assign a = pc[7:2];
	
	mips 	M( 
			.clk			(clock), 
			.reset		(reset),
			.pc			(pc),
			.instr		(instr),
			.memwrite	(memwrite),
			.aluout		(aluout), 
			.writedata	(writedata),
			.readdata	(readdata));
				 
	imem IM(
			.a		(a),
			.rd	(instr));
	
	dmem DM(
				.clk		(clock), 
				.we		(memwrite),
				.a			(aluout), 
				.wd		(writedata),
				.rd 		(readdata));
	
endmodule 