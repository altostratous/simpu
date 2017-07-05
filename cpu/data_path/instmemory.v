module instmemory( write, addr, datain, dataout, clk, reset);
	input [31:0] datain;
	input [15:0] addr;
	input write, clk, reset;
	output [31:0] dataout;
	
	reg[31:0] mem[255 : 0];
	
	assign dataout = mem[addr];
	
	always @(posedge clk) begin
		if(reset) begin
			mem[0] <=32'b0111000001000010_0000000000001010;
			mem[1] <=32'b0111000010000010_0000000000000100;
			mem[2] <=32'b1011000001000000_0000000000000000;
			mem[3] <=32'b1011000010000000_0000000000000010;
			mem[4] <=32'b0110000001000000_0000000000000000;
			mem[5] <=32'b0111000010000010_0000000000000010;
			mem[6] <=32'b0101100011000100_0001000000000000;
			mem[7] <=32'b1011000011000000_0000000000000100;
		end
		else begin
			if(write==1)
				mem[addr]<=datain;
			
		end

	end
endmodule
