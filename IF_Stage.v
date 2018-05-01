module IF_Stage(
	input clk,
	input rst, 
	input Br_taken,
	input [31:0] Br_addr,
	output [31:0] PCp4, instruction,
	input freeze,
	input memReady
);
	reg [31:0] pc;
	wire [31:0] next_offset, next_pc, Instruction;
	//adder32bit forNextPC(.num1(pc),
			//					.num2(next_offset),
					//			.result(next_pc));
	assign next_pc=(Br_taken==0)?(PCp4):(Br_addr);
	//mux #(32) branch_or_not(
	   //           .a(32'd4),
						//		.b(Br_addr << 2),
								//.out(next_offset),
								//.select(Br_taken));
	
	Instruction_memory I_M(.clk(clk),
									.rst(rst),
									.address(pc),
									.data_out(Instruction));
									
	
	always@(posedge clk,posedge rst) begin
		if (rst) pc <= 0;
		else begin
			pc <= (freeze || !memReady) ? pc : next_pc;
		end
	end
	
	assign PCp4 = pc+32'd4;
	assign instruction = Instruction;

endmodule
