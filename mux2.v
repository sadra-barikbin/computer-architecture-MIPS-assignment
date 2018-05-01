module mux (a,b,out,select);//to use:  mux #(how many bits do inputs have?) name(arguments);
  parameter n=32;
  input[n-1:0] a,b;
  output reg[n-1:0] out;
  input select;
	always@(a, b, select) out = (select==0) ? a : b;

endmodule


module self_test();
  reg[31:0] a,b;
  wire[31:0] out;
  reg s;
  mux2 #(32) m(a,b,out,s);
  initial begin
    a=32'd14;
    b=32'd16;
    s=0;
    #500 s=1;
end
endmodule