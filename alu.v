module alu ( input [31:0] a, b, input [2:0] f, output reg [31:0] y , output reg zero );
	
	reg [31:0] t;
	
	always @(*)
	begin
	
		if(f == 3'b000)	y = a & b;
		
		else if (f  == 3'b001)	y = a | b;
		
		else if (f  == 3'b010)	y = a + b;
		
		else if (f  == 3'b100)	y = a & ~b;
		
		else if (f  == 3'b101)	y = a | ~b;
		
		else if (f  == 3'b110)	y = a - b;
		
		else if (f  == 3'b111)	begin
			
			t = a - b;
			if (t[31] == 1'b1)
				y = 32'h00000001;
			else
				y = 32'h00000000;
			
		end
			
		if ( y == 32'h00000000)
			zero = 1;
		else
			zero = 0;
	
	end

endmodule 