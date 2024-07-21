module maindec (
		input [5:0] op,
		output reg memtoreg, memwrite,
		output reg branch, alusrc,
		output reg regdst, regwrite,
		output reg jump,
		output reg [1:0] aluop
		);
	// Write your code here.
		
	always@(op) begin
		if(op == 6'b000000) begin
			regwrite <= 1'b1;
			regdst	<= 1'b1;
			alusrc	<= 1'b0;
			branch	<= 1'b0;
			memwrite <= 1'b0;
			memtoreg <= 1'b0;
			aluop		<= 2'b10;
			jump		<= 1'b0;
		end
		else if(op == 6'b100011) begin
			regwrite <= 1'b1;
			regdst	<= 1'b0;
			alusrc	<= 1'b1;
			branch	<= 1'b0;
			memwrite <= 1'b0;
			memtoreg <= 1'b1;
			aluop		<= 2'b00;
			jump		<= 1'b0;
		end
		else if(op == 6'b101011) begin
			regwrite <= 1'b0;
			regdst	<= 1'b0;
			alusrc	<= 1'b1;
			branch	<= 1'b0;
			memwrite <= 1'b1;
			memtoreg <= 1'b0;
			aluop		<= 2'b00;
			jump		<= 1'b0;
		end
		else if(op == 6'b000100) begin
			regwrite <= 1'b0;
			regdst	<= 1'b0;
			alusrc	<= 1'b0;
			branch	<= 1'b1;
			memwrite <= 1'b0;
			memtoreg <= 1'b0;
			aluop		<= 2'b01;
			jump		<= 1'b0;
		end
		else if(op == 6'b001000) begin
			regwrite <= 1'b1;
			regdst	<= 1'b0;
			alusrc	<= 1'b1;
			branch	<= 1'b0;
			memwrite <= 1'b0;
			memtoreg <= 1'b0;
			aluop		<= 2'b00;
			jump		<= 1'b0;
		end
		else if(op == 6'b000010) begin
			regwrite <= 1'b0;
			regdst	<= 1'b0;
			alusrc	<= 1'b0;
			branch	<= 1'b0;
			memwrite <= 1'b0;
			memtoreg <= 1'b0;
			aluop		<= 2'b00;
			jump		<= 1'b1;
		end
	end
	
	
	
endmodule 