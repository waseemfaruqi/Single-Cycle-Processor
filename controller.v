module controller (
		input [5:0] op, funct,
		input zero,
		output memtoreg, memwrite,
		output pcsrc, alusrc,
		output regdst, regwrite,
		output jump,
		output [2:0] alucontrol
		);
	// Write your code here.
	wire [1:0] alu_cntrl;
	wire branch_cntrl;
	
	maindec md (.op(op), .memtoreg(memtoreg), .memwrite(memwrite), .branch(branch_cntrl), .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .jump(jump), .aluop(alu_cntrl));
	
	aludec  ad (.funct(funct), .aluop(alu_cntrl), .alucontrol(alucontrol));

	assign pcsrc = branch_cntrl & zero;
	
endmodule  