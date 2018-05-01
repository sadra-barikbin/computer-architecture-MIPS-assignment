module EXE_Stage (
	input clk,
	input [3:0] exe_cmd,
	input [31:0] val1, val2, val_src2, PC,
	input [1:0] Br_type,
	output [31:0] alu_result, Br_addr,
	output Br_taken,
	input[31:0] exeStVal,memStVal,
	input[1:0] val1Forward,val2Forward,src2_valForward
);
	wire[31:0] finalVal2=(val2Forward==1)?exeStVal:(val2Forward==2)?memStVal:val2;
	wire[31:0] finalVal1=(val1Forward==1)?exeStVal:(val1Forward==2)?memStVal:val1;
	ALU arithmetic_and_logic_unit(
		.val1((Br_type!=0)?PC:finalVal1),
		.val2(finalVal2),
		.exe_cmd(exe_cmd),
		.alu_res(alu_result)
	);
	wire[31:0] finalVal_src2=(src2_valForward==1)?exeStVal:(src2_valForward==2)?memStVal:val_src2;
	Condition_check  conditionCheck(
		.val1(finalVal1),
		.src2_val(finalVal_src2),
		.branch_type(Br_type),
		.branch_taken(Br_taken)
	);

	assign Br_addr = /*PC + val2*/  alu_result;

endmodule