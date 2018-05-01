module ID_Stage_reg(
	input clk, rst,flush,
	input [4:0] dst_in,
	input [31:0] reg2_in, val2_in, val1_in, PC_in,
	input [1:0] Br_type_in,
	input [3:0] exe_cmd_in,
	input mem_r_en_in, mem_w_en_in, wb_en_in,
	input[4:0] src1_in,src2_in,
	output reg [4:0] dst,
	output reg [31:0] reg2, val2, val1, PC_out,
	output reg [1:0] Br_type,
	output reg [3:0] exe_cmd,
	output reg mem_r_en, mem_w_en, wb_en,
	output reg[4:0] src1,src2
);
	always@(posedge clk,posedge rst)begin
		if(rst )
			{dst,reg2,val2,val1,PC_out,Br_type,exe_cmd,mem_r_en,mem_w_en,wb_en,src1,src2}=0;
		else if( flush)
			{dst,reg2,val2,val1,PC_out,Br_type,exe_cmd,mem_r_en,mem_w_en,wb_en,src1,src2}=0;
		else begin
			dst<=dst_in;
			reg2<=reg2_in;
			val2<=val2_in;
			val1<=val1_in;
			PC_out<=PC_in;
			Br_type<=Br_type_in;
			exe_cmd<=exe_cmd_in;
			mem_r_en<=mem_r_en_in;
			mem_w_en<=mem_w_en_in;
			wb_en<=wb_en_in;
			src1<=src1_in;
			src2<=src2_in;
		end
	end
endmodule