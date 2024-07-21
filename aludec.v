module aludec (
		input [5:0] funct,
		input [1:0] aluop,
		output reg [2:0] alucontrol
		);
	// Write your code here.
	
	always@(aluop or funct) begin
		if(aluop == 2'b00)
			alucontrol <= 3'b010;
		else if(aluop == 2'b01)
			alucontrol <= 3'b110;
		else if(aluop[1] == 1'b1)begin
			if(funct == 6'b100000)
				alucontrol <= 3'b010;
			else if(funct == 6'b100010)
				alucontrol <= 3'b110;
			else if(funct == 6'b100100)
				alucontrol <= 3'b000;
			else if(funct == 6'b100101)
				alucontrol <= 3'b001;
			else if(funct == 6'b101010)
				alucontrol <= 3'b111;
		end
	
	end
	
	
endmodule 