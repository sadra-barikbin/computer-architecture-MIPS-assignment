module IF_Stage_reg(
	input clk,
	input rst,
	input flush,
	input[31:0] PC_in, Instruction_in,
	output reg [31:0] PC, Instruction,
	input freeze,
	input memReady
);
	always@(posedge clk,posedge rst)begin
		if(rst)
			{PC,Instruction}=64'd0;
		else if(flush)
			{PC,Instruction}=64'd0;
		else begin
			{Instruction, PC} <= (freeze || !memReady) ? {Instruction, PC} : {Instruction_in, PC_in};
		end
	end

endmodule