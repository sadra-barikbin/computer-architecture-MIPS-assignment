module EXE_Stage_reg (
	input clk, rst,
	input wb_en_in, mem_r_en_in, mem_w_en_in,
	input[4:0] dst_in,
	input [31:0] PC_in, alu_result_in, st_val_in,
	output reg wb_en, mem_r_en, mem_w_en,
	output reg [31:0] PC, alu_result, st_val,
	output reg [4:0] dst
);
	always@(posedge clk,posedge rst)begin
		if(rst)
			{wb_en,mem_r_en,mem_w_en,PC,alu_result,st_val,dst}=104'd0;
		else begin
			wb_en<=wb_en_in;
			mem_r_en<=mem_r_en_in;
			mem_w_en<=mem_w_en_in;
			PC<=PC_in;
			alu_result<=alu_result_in;
			st_val<=st_val_in;
			dst<=dst_in;
		end
	end
endmodule