module MEM_Stage_reg (
	input clk, rst, wb_en_in, mem_r_en_in,
	input [31:0] alu_result_in, mem_read_value_in,
	input [4:0] dst_in,
	output reg wb_en, mem_r_en,
	output reg [31:0] alu_result, mem_read_value,
	output reg [4:0] dst,
	input memReady
);
	always@(posedge clk,posedge rst)begin
		if(rst)
			{wb_en,mem_r_en,alu_result,mem_read_value,dst}=71'd0;
		else if(!memReady)
		  {wb_en,mem_r_en,alu_result,mem_read_value,dst}<={wb_en,mem_r_en,alu_result,mem_read_value,dst};
		else begin
			wb_en<=wb_en_in;
			mem_r_en<=mem_r_en_in;
			alu_result<=alu_result_in;
			mem_read_value<=mem_read_value_in;
			dst<=dst_in;
		end
	end
endmodule