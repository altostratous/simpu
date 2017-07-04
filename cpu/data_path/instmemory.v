module instmemory( write, addr, datain, dataout, clk, reset);
	input [31:0] datain;
	input [15:0] addr;
	input write, clk, reset;
	output [31:0] dataout;
	
	reg[31:0] mem[63 : 0];
	
	assign dataout = mem[addr];
	
	always @(posedge clk) begin
		if(reset) begin
			mem[0] <=32'b0110000001000001_1111111111111110;
			mem[1] <=32'b0110000010000000_0000000000000100;
			mem[2] <=32'b0110000100000000_0000000000001000;
			mem[3] <=32'b0110000101000000_0000000000001000;
			mem[4] <=32'b0110000011000000_0000000000000100;
			mem[5] <=32'b1000000010000110_0000000000000000;
		end
		else begin
			if(write==1)
				mem[addr]<=datain;
			
		end

	end
endmodule
