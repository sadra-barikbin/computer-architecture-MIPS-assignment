module CU(input [5:0] opcode,
        output reg [3:0] execute_command,
        output  mem_read,
        output  mem_write,
        output  wb_enable,
        output is_immediate,
        output [1:0] branch_type
);

    wire is_i_type;
	assign is_i_type = (opcode == 32 || 
	                       opcode == 33 || 
	                         opcode == 36 || 
	                           opcode == 37 || 
	                             opcode == 40 || 
	                               opcode == 41 || 
	                                 opcode == 42 ) ? 1 : 0;
    assign is_immediate = is_i_type;
    // determine branch type
	// BEZ = 3; BNE = 2; JMP = 1; no jump = 0;
	assign branch_type = ((opcode == 40) ? 3 : (opcode == 41) ? 2 : (opcode == 42) ? 1 : 0);
	
    // memory signals
	assign mem_read = ((opcode == 36) ? 1 : 0);   // for load instruction
	assign mem_write = ((opcode == 37) ? 1 : 0);  // for store instruction
	assign wb_enable = ((opcode == 32 || opcode == 33 || (!is_i_type == 1 && opcode!=0) || opcode==36) ? 1 : 0);

	// alu commands. Note that in some cases there might be identical aluop for different instructions
	always@(opcode) begin
        case(opcode) 
            1: execute_command = 0;
            3: execute_command = 2;
            5: execute_command = 4;
            6: execute_command = 5;
            7: execute_command = 6;
            8: execute_command = 7;
            9: execute_command = 8;    // aluop for this instruction and next on are identical referring to 02-MIPS.pdf > table 2
            10: execute_command = 8;
            11: execute_command = 9;
            12: execute_command = 10;
            32: execute_command = 0;
            33: execute_command = 2;
            36: execute_command = 0;
            37: execute_command = 0;
            40: execute_command=0;
            41: execute_command=0;
            42: execute_command=0;
			0:execute_command=0;
        endcase
    end
endmodule