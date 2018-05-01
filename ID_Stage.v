module ID_Stage(
	input clk, rst,
	input [31:0] Instruction, reg1, reg2,	// reg1 and reg2 are data read from register file
	output [4:0] src1, src2,hazardSrc2, dst,			// these signals go to register file
	output [31:0] Reg2, Val2, Val1,
	output [1:0] finalBr_type,
	output [3:0] exe_cmd,
	output finalMem_r_en, finalMem_w_en, finalWb_en,
	input freeze,
	output isRegWriterAndImmediate
);

	wire [31:0] imm_sign_extended;
	wire i_type;
	wire[1:0]Br_type;
	wire wb_en,mem_w_en,mem_r_en;
	CU control_unit(
		.opcode(Instruction[31:26]),
		.execute_command(exe_cmd),
		.mem_read(mem_r_en),
		.mem_write(mem_w_en),
		.wb_enable(wb_en),
		.is_immediate(i_type),
		.branch_type(Br_type)
	);
	
	mux #(5) bubbleORnormalInsreuction_Selector ({mem_r_en,mem_w_en,wb_en,Br_type},5'b0,
	                   {finalMem_r_en,finalMem_w_en,finalWb_en,finalBr_type},freeze);
	assign isRegWriterAndImmediate=/*i_type & wb_en*/(i_type && Instruction[31:26] != 37 && Instruction[31:26] != 41) ? 1 : 0;
	assign src1 = Instruction[25:21];//darbareye dastoore JMP moshkel ijad nemikone?
	assign src2 = Instruction[20:16];
	assign hazardSrc2=(!i_type)?Instruction[20:16]:5'b00000;
	assign dst = (!i_type) ? Instruction[15:11] : (i_type) ? Instruction[20:16] : 0;
	assign Val1 = reg1;
	assign imm_sign_extended = (Instruction[15]) ? {16'b1111111111111111, Instruction[15:0]} : {16'b0, Instruction[15:0]};
	assign Val2 = (i_type) ? (Br_type!=0?imm_sign_extended<<2:imm_sign_extended) : reg2;
	assign Reg2 = reg2;
	
	
	
endmodule