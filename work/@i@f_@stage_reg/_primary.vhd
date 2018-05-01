library verilog;
use verilog.vl_types.all;
entity IF_Stage_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        Instruction_in  : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        Instruction     : out    vl_logic_vector(31 downto 0);
        freeze          : in     vl_logic
    );
end IF_Stage_reg;
