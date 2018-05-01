module WB_Stage (
	input clk, wb_en_in, mem_r_en,
	input [31:0] alu_result, mem_r_value,
	input [4:0] dst_in,
	output wb_en, 
	output [31:0] write_value,
	output [4:0] dst
);

mux #(32) wb_result (alu_result,mem_r_value,write_value,mem_r_en);
assign wb_en=wb_en_in;
assign dst=dst_in;

endmodule