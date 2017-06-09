module memory(clk, reset, address, data_in, data_out, rwn, start, ready, 
				address_test1, address_test2, address_test3, data_test1, data_test2, data_test3);
	input clk, reset, start, rwn;
	input [7:0] address, address_test1, address_test2, address_test3;
	input [15:0] data_in;
	output ready;
	output [15:0] data_test1, data_test2, data_test3;
	output reg [15:0] data_out;
	
	reg [15:0] array[255:0],data_t;
	reg state;
	reg [7:0] ad_t;
	reg [1:0] counter;
	reg rwn_t;
	integer i;

	assign ready = ~state;
	assign data_test1 = array[address_test1];
	assign data_test2 = array[address_test2];
	assign data_test3 = array[address_test3];
	
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			array[0] <= 16'b0110000101000000;	// LUI $5, 1
			array[1] <= 16'b0000000000000010; 
			array[2] <= 16'b0110100101001010;	// ADDI $5, $5, 1
			array[3] <= 16'b0000000000000010;
			array[4] <= 16'b0111000101001010;	// ORI $5, $5, 0xFFFF
			array[5] <= 16'b0000000000000100;
			array[6] <= 16'b0111100101001010; 	// STLI $5, $5, 1
			array[7] <= 16'b0000000000000010;
			array[8] <= 16'b0000000000000000;
			array[9] <= 16'b0000000000000000;	
			array[10] <= 16'b0000000000000000;
			array[11] <= 16'b0000000000000000;
			array[12] <= 16'b0000000000000000;	
			array[13] <= 16'b0000000000000000;	
			array[14] <= 16'b0000000000000000;	
			array[15] <= 16'b0000000000000000;
			array[16] <= 16'b0000000000000000;	
			array[17] <= 16'b0000000000000000;
			array[18] <= 16'b0000000000000000;
			array[19] <= 16'b0000000000000000;
			array[20] <= 16'b0000000000000000;
			array[21] <= 16'b0000000000000000;
			array[22] <= 16'b0000000000000000;
			array[23] <= 16'b0000000000000000;
			array[24] <= 16'b0000000000000000;
			array[25] <= 16'b0000000000000000;
			array[26] <= 16'b0000000000000000;
			array[27] <= 16'b0000000000000000;
			array[28] <= 16'b0000000000000000;
			array[29] <= 16'b0000000000000000;
			array[30] <= 16'b0000000000000000;
			array[31] <= 16'b0000000000000000;
			array[32] <= 16'b0000000000000000;
			array[33] <= 16'b0000000000000000;
			array[34] <= 16'b0000000000000000;
			array[35] <= 16'b0000000000000000;
			array[36] <= 16'b0000000000000000;
			array[37] <= 16'b0000000000000000;
			array[38] <= 16'b0000000000000000;
			array[39] <= 16'b0000000000000000;
			array[40] <= 16'b0000000000000000;
			array[41] <= 16'b0000000000000000;
			array[42] <= 16'b0000000000000000;
			array[43] <= 16'b0000000000000000;
			array[44] <= 16'b0000000000000000;
			array[45] <= 16'b0000000000000000;
			array[46] <= 16'b0000000000000000;
			array[47] <= 16'b0000000000000000;
			array[48] <= 16'b0000000000000000;
			array[49] <= 16'b0000000000000000;
			array[50] <= 16'b0000000000000000;
			array[51] <= 16'b0000000000000000;
			array[52] <= 16'b0000000000000000;
			array[53] <= 16'b0000000000000000;
			array[54] <= 16'b0000000000000000;
			array[55] <= 16'b0000000000000000;
			array[56] <= 16'b0000000000000000;
			array[57] <= 16'b0000000000000000;
			array[58] <= 16'b0000000000000000;
			array[59] <= 16'b0000000000000000;
			array[60] <= 16'b0000000000000000;
			array[61] <= 16'b0000000000000000;
			array[62] <= 16'b0000000000000000;
			array[63] <= 16'b0000000000000000;
			array[64] <= 16'b0000000000000000;
			array[65] <= 16'b0000000000000000;
			array[66] <= 16'b0000000000000000;
			array[67] <= 16'b0000000000000000;
			array[68] <= 16'b0000000000000000;
			array[69] <= 16'b0000000000000000;
			array[70] <= 16'b0000000000000000;
			array[71] <= 16'b0000000000000000;
			array[72] <= 16'b0000000000000000;
			array[73] <= 16'b0000000000000000;
			array[74] <= 16'b0000000000000000;
			array[75] <= 16'b0000000000000000;
			array[76] <= 16'b0000000000000000;
			array[77] <= 16'b0000000000000000;
			array[78] <= 16'b0000000000000000;
			array[79] <= 16'b0000000000000000;
			array[80] <= 16'b0000000000000000;
			array[81] <= 16'b0000000000000000;
			array[82] <= 16'b0000000000000000;
			array[83] <= 16'b0000000000000000;
			array[84] <= 16'b0000000000000000;
			array[85] <= 16'b0000000000000000;
			array[86] <= 16'b0000000000000000;
			array[87] <= 16'b0000000000000000;
			array[88] <= 16'b0000000000000000;
			array[89] <= 16'b0000000000000000;
			array[90] <= 16'b0000000000000000;
			array[91] <= 16'b0000000000000000;
			array[92] <= 16'b0000000000000000;
			array[93] <= 16'b0000000000000000;
			array[94] <= 16'b0000000000000000;
			array[95] <= 16'b0000000000000000;
			array[96] <= 16'b0000000000000000;
			array[97] <= 16'b0000000000000000;
			array[98] <= 16'b0000000000000000;
			array[99] <= 16'b0000000000000000;
			array[100] <= 16'b0000000000000000;
			array[101] <= 16'b0000000000000000;
			array[102] <= 16'b0000000000000000;
			array[103] <= 16'b0000000000000000;
			array[104] <= 16'b0000000000000000;
			array[105] <= 16'b0000000000000000;
			array[106] <= 16'b0000000000000000;
			array[107] <= 16'b0000000000000000;
			array[108] <= 16'b0000000000000000;
			array[109] <= 16'b0000000000000000;
			array[110] <= 16'b0000000000000000;
			array[111] <= 16'b0000000000000000;
			array[112] <= 16'b0000000000000000;
			array[113] <= 16'b0000000000000000;
			array[114] <= 16'b0000000000000000;
			array[115] <= 16'b0000000000000000;
			array[116] <= 16'b0000000000000000;
			array[117] <= 16'b0000000000000000;
			array[118] <= 16'b0000000000000000;
			array[119] <= 16'b0000000000000000;
			array[120] <= 16'b0000000000000000;
			array[121] <= 16'b0000000000000000;
			array[122] <= 16'b0000000000000000;
			array[123] <= 16'b0000000000000000;
			array[124] <= 16'b0000000000000000;
			array[125] <= 16'b0000000000000000;
			array[126] <= 16'b0000000000000000;
			array[127] <= 16'b0000000000000000;
			array[128] <= 16'b0000000000000000;
			array[129] <= 16'b0000000000000000;
			array[130] <= 16'b0000000000000000;
			array[131] <= 16'b0000000000000000;
			array[132] <= 16'b0000000000000000;
			array[133] <= 16'b0000000000000000;
			array[134] <= 16'b0000000000000000;
			array[135] <= 16'b0000000000000000;
			array[136] <= 16'b0000000000000000;
			array[137] <= 16'b0000000000000000;
			array[138] <= 16'b0000000000000000;
			array[139] <= 16'b0000000000000000;
			array[140] <= 16'b0000000000000000;
			array[141] <= 16'b0000000000000000;
			array[142] <= 16'b0000000000000000;
			array[143] <= 16'b0000000000000000;
			array[144] <= 16'b0000000000000000;
			array[145] <= 16'b0000000000000000;
			array[146] <= 16'b0000000000000000;
			array[147] <= 16'b0000000000000000;
			array[148] <= 16'b0000000000000000;
			array[149] <= 16'b0000000000000000;
			array[150] <= 16'b0000000000000000;
			array[151] <= 16'b0000000000000000;
			array[152] <= 16'b0000000000000000;
			array[153] <= 16'b0000000000000000;
			array[154] <= 16'b0000000000000000;
			array[155] <= 16'b0000000000000000;
			array[156] <= 16'b0000000000000000;
			array[157] <= 16'b0000000000000000;
			array[158] <= 16'b0000000000000000;
			array[159] <= 16'b0000000000000000;
			array[160] <= 16'b0000000000000000;
			array[161] <= 16'b0000000000000000;
			array[162] <= 16'b0000000000000000;
			array[163] <= 16'b0000000000000000;
			array[164] <= 16'b0000000000000000;
			array[165] <= 16'b0000000000000000;
			array[166] <= 16'b0000000000000000;
			array[167] <= 16'b0000000000000000;
			array[168] <= 16'b0000000000000000;
			array[169] <= 16'b0000000000000000;
			array[170] <= 16'b0000000000000000;
			array[171] <= 16'b0000000000000000;
			array[172] <= 16'b0000000000000000;
			array[173] <= 16'b0000000000000000;
			array[174] <= 16'b0000000000000000;
			array[175] <= 16'b0000000000000000;
			array[176] <= 16'b0000000000000000;
			array[177] <= 16'b0000000000000000;
			array[178] <= 16'b0000000000000000;
			array[179] <= 16'b0000000000000000;
			array[180] <= 16'b0000000000000000;
			array[181] <= 16'b0000000000000000;
			array[182] <= 16'b0000000000000000;
			array[183] <= 16'b0000000000000000;
			array[184] <= 16'b0000000000000000;
			array[185] <= 16'b0000000000000000;
			array[186] <= 16'b0000000000000000;
			array[187] <= 16'b0000000000000000;
			array[188] <= 16'b0000000000000000;
			array[189] <= 16'b0000000000000000;
			array[190] <= 16'b0000000000000000;
			array[191] <= 16'b0000000000000000;
			array[192] <= 16'b0000000000000000;
			array[193] <= 16'b0000000000000000;
			array[194] <= 16'b0000000000000000;
			array[195] <= 16'b0000000000000000;
			array[196] <= 16'b0000000000000000;
			array[197] <= 16'b0000000000000000;
			array[198] <= 16'b0000000000000000;
			array[199] <= 16'b0000000000000000;
			array[200] <= 16'b0000000000000000;
			array[201] <= 16'b0000000000000000;
			array[202] <= 16'b0000000000000000;
			array[203] <= 16'b0000000000000000;
			array[204] <= 16'b0000000000000000;
			array[205] <= 16'b0000000000000000;
			array[206] <= 16'b0000000000000000;
			array[207] <= 16'b0000000000000000;
			array[208] <= 16'b0000000000000000;
			array[209] <= 16'b0000000000000000;
			array[210] <= 16'b0000000000000000;
			array[211] <= 16'b0000000000000000;
			array[212] <= 16'b0000000000000000;
			array[213] <= 16'b0000000000000000;
			array[214] <= 16'b0000000000000000;
			array[215] <= 16'b0000000000000000;
			array[216] <= 16'b0000000000000000;
			array[217] <= 16'b0000000000000000;
			array[218] <= 16'b0000000000000000;
			array[219] <= 16'b0000000000000000;
			array[220] <= 16'b0000000000000000;
			array[221] <= 16'b0000000000000000;
			array[222] <= 16'b0000000000000000;
			array[223] <= 16'b0000000000000000;
			array[224] <= 16'b0000000000000000;
			array[225] <= 16'b0000000000000000;
			array[226] <= 16'b0000000000000000;
			array[227] <= 16'b0000000000000000;
			array[228] <= 16'b0000000000000000;
			array[229] <= 16'b0000000000000000;
			array[230] <= 16'b0000000000000000;
			array[231] <= 16'b0000000000000000;
			array[232] <= 16'b0000000000000000;
			array[233] <= 16'b0000000000000000;
			array[234] <= 16'b0000000000000000;
			array[235] <= 16'b0000000000000000;
			array[236] <= 16'b0000000000000000;
			array[237] <= 16'b0000000000000000;
			array[238] <= 16'b0000000000000000;
			array[239] <= 16'b0000000000000000;
			array[240] <= 16'b0000000000000000;
			array[241] <= 16'b0000000000000000;
			array[242] <= 16'b0000000000000000;
			array[243] <= 16'b0000000000000000;
			array[244] <= 16'b0000000000000000;
			array[245] <= 16'b0000000000001000;
			array[246] <= 16'b0000000000000000;
			array[247] <= 16'b0000000000000000;
			array[248] <= 16'b0000000000000000;
			array[249] <= 16'b0000000000000101;
			array[250] <= 16'b0000000000000000;
			array[251] <= 16'b0000000000000000;
			array[252] <= 16'b0000000000000000;
			array[253] <= 16'b0000000000000000;
			array[254] <= 16'b0000000000000000;
			array[255] <= 16'b0000000000000000;
			state = 0;
		end
		else if(start & ~state) begin
			ad_t = address;
			rwn_t = rwn;
			data_t = data_in;
			counter = address[1:0];
			state = 1;
		end
		else if(|counter && state)
			counter = counter - 1;
		else if(state) begin
			if(rwn_t)
				data_out=array[ad_t];
			else
				array[ad_t] = data_t;
			state = 0;
		end
	end
	
endmodule
