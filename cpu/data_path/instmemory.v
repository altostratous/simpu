module instmemory( write, addr, datain, dataout, clk, reset);
	input [31:0] datain;
	input [15:0] addr;
	input write, clk, reset;
	output [31:0] dataout;
	
	reg[31:0] mem[255 : 0];
	
	assign dataout = mem[addr];
	
	always @(posedge clk) begin
		if(reset) begin
			mem[0] <=32'b0110100001000010_0000000000001010;
			mem[1] <=32'b0110100010000100_0000000000001100;
			mem[2] <=32'b0100000011000010_0010000000000000;
			mem[3] <=32'b0100000011000100_0001000000000000;
		end
		else begin
			if(write==1)
				mem[addr]<=datain;
			
		end

	end
endmodule
