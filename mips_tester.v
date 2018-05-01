module mips_tester();
  reg clock;
  reg reset;
  wire clock_selector;
  assign clock_selector=0;
  MIPS mips(
    .SW({13'd0,1'b1,clock_selector,clock,reset})
    );
    
  always@(clock)
    #40 clock <= ~clock;
  
  initial begin
    reset=0;
    clock=0;
    #40
    reset=1;
    #40
    reset=0;
  end
endmodule
