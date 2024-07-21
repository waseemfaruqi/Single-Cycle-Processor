module datapath(input clk, reset,
					input memtoreg, pcsrc,
					input alusrc, regdst,
					input regwrite, jump,
					input [2:0] alucontrol,
					output zero,
					output [31:0] pc,
					input [31:0] instr,
					output [31:0] aluout, writedata,
					input [31:0] readdata);
					
	wire [31:0] rd1, rd2, b, wd3, PC_in, PC_Sig, PC_Branch, PC_Jump, PC_Plus_4, Imm_Ext;
	wire [27:0] instr_ext;
	wire  [4:0] A3;
	reg  [31:0] pc_out;
	
	assign writedata = rd2;
	assign Imm_Ext	  = { {16{instr[15]}}, instr[15:0]};
	assign PC_Plus_4 = pc + 4'h4;
	assign PC_Branch = PC_Plus_4 + (Imm_Ext<<2);
	assign instr_ext = instr[25:0] << 2;
	assign PC_Jump	  = {PC_Plus_4[31:28], instr_ext};
	assign pc		  = pc_out;
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			pc_out 	<= 32'h00000000;
		else
			pc_out	<= PC_in;
	end
	
	mux #(.WIDTH(5)) m1
		(.in0		(instr[20:16]), 
		 .in1		(instr[15:11]), 
		 .select	(regdst),
		 .out		(A3)
		);
		
	regfile rf (.clk(clk), 
               .we3(regwrite), 
               .ra1(instr[25:21]), 
					.ra2(instr[20:16]), 
					.wa3(A3), 
               .wd3(wd3), 
               .rd1(rd1), 
					.rd2(rd2)
					);		
	
	mux m2
		(.in0		(rd2), 
		 .in1		(Imm_Ext), 
		 .select	(alusrc),
		 .out		(b)
		);
	
	alu alu_0 ( .a		(rd1), 
					.b		(b), 
					.f		(alucontrol), 
					.y		(aluout), 
					.zero	(zero) 
				 );
				 
	mux m3
		(.in0		(aluout), 
		 .in1		(readdata), 
		 .select	(memtoreg),
		 .out		(wd3)
		);
	
	mux m4
		(.in0		(PC_Sig), 
		 .in1		(PC_Jump), 
		 .select	(jump),
		 .out		(PC_in)
		);
		
	mux m5
		(.in0		(PC_Plus_4), 
		 .in1		(PC_Branch), 
		 .select	(pcsrc),
		 .out		(PC_Sig)
		);
endmodule 