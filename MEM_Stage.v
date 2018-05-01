module MEM_Stage (
	input clk, rst,mem_r_en_in, mem_w_en_in,
	input [31:0] alu_result_in, st_val,
	output [31:0] mem_read_value,
	inout[15:0] sramDQ,
	output[17:0] sramAddr,
	output sramUB,
	output sramLB,
	output sramWE,
	output sramCE,
	output sramOE,
	output reg ready
);
reg[31:0] dataReg;
assign mem_read_value=dataReg;
assign {sramOE,sramCE,sramLB,sramUB}=4'd0;
reg[2:0] state;
assign sramWE=~mem_w_en_in;
assign sramDQ=(mem_w_en_in)?((state==0 || state==1)?dataReg[15:0]:dataReg[31:16]):16'bz;
assign sramAddr=(state==0 || state==1)?({alu_result_in[18:2],1'b0}):(state==2 || state==3)?({alu_result_in[18:2],1'b1}):0;

always@(posedge clk,posedge rst)begin
  ready<=!((mem_r_en_in || mem_w_en_in)&& (state==0))  ;
  if(rst)begin
    ready=1;
    state=0;
  end
else begin 
  state<=state+1;
  case(state )
    0:begin
      if(mem_w_en_in)
        dataReg[15:0]<=st_val[15:0];
    end
    1:begin
      if(mem_r_en_in)
        dataReg[15:0]<=sramDQ;
      end
    2:begin
      if(mem_w_en_in)
         dataReg[31:16]<=st_val[31:16];
    end 
    3:begin
      if(mem_r_en_in)
        dataReg[31:16]<=sramDQ;
    end
    4:begin
      ready<=1;
      state<=0;
    end
 endcase
 end     
 end
endmodule
/*reg[31:0] ram[63:0];
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
  end*/