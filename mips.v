module mips( input clk, reset,
				 output [31:0] pc,
				 input [31:0] instr,
				 output memwrite,
				 output [31:0] aluout, writedata,
				 input [31:0] readdata);
// Write your code here. Instantiate Controller and Datapath module.

wire zero, memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
wire [2:0] alucontrol;

datapath DP	  (
					.clk			(clk),
					.reset		(reset),
					.memtoreg	(memtoreg), 
					.pcsrc		(pcsrc),
					.alusrc		(alusrc), 
					.regdst		(regdst),
					.regwrite	(regwrite), 
					.jump			(jump),
					.alucontrol(alucontrol),
					.zero			(zero),
					.pc			(pc),
					.instr		(instr),
					.aluout		(aluout), 
					.writedata	(writedata),
					.readdata	(readdata));
					
controller CR	(
					.op			(instr[31:26]), 
					.funct		(instr[5:0]),
					.zero			(zero),
					.memtoreg	(memtoreg), 
					.memwrite	(memwrite),
					.pcsrc		(pcsrc), 
					.alusrc		(alusrc),
					.regdst		(regdst), 
					.regwrite	(regwrite),
					.jump			(jump),
					.alucontrol (alucontrol));

endmodule 