module ALU(
	input[31:0] val1, val2,
	input [3:0] exe_cmd,
	output reg [31:0] alu_res
);

	always@(*) begin
		case(exe_cmd)
			0: alu_res <= val1 + val2;
			2: alu_res <= val1 - val2;
			4: alu_res <= val1 & val2;
			5: alu_res <= val1 | val2;
			6: alu_res <= ~(val1 | val2);		// nor
			7: alu_res <= val1 ^ val2;			// xor
			8: alu_res <= val1 << val2;
			//9: alu_res <= (val1[31]) ? {val2{1'b1}, val1} : {val2{1'b0}, val1};
			9: alu_res<=val1 >>> val2;
			10: alu_res <= val1 >> val2;
		endcase
	end

endmodule
