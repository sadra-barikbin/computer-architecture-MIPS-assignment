module MEM_Stage (
	input clk, rst,mem_r_en_in, mem_w_en_in,
	input [31:0] alu_result_in, st_val,
	output [31:0] mem_read_value
);

reg[31:0] ram[63:0];
integer i;
wire[31:0] index=(alu_result_in[8:0])>>2;
assign mem_read_value=ram[index];
  always@(posedge clk,posedge rst) begin
    if(rst) begin
      for(i=0;i<64;i=i+1)begin
        ram[i]=i;
      end
    end
    else begin
      if(mem_w_en_in)
        ram[index] <= st_val;
    end
  end
endmodule