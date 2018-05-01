module Register_file(
	input clk,rst,wr_en,
	input[31:0] valueToWrite,
	input[4:0] readSrc1,readSrc2,writeDest,
	output[31:0] readVal1,readVal2
	);
	reg [31:0] rf[31:0];
	integer i;
	always@(posedge rst,negedge clk) begin
		if (rst) begin
			// the value of each index is equal the index itself.
			for(i = 0; i < 32; i = i + 1) begin
				rf[i] = i;
			end
		end
		else begin
			if(wr_en && writeDest != 0) rf[writeDest]<=valueToWrite;
		end
	end
	assign readVal1=rf[readSrc1];
	assign readVal2=rf[readSrc2];
endmodule
