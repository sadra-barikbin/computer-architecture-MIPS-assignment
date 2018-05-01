library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        val1            : in     vl_logic_vector(31 downto 0);
        val2            : in     vl_logic_vector(31 downto 0);
        exe_cmd         : in     vl_logic_vector(3 downto 0);
        alu_res         : out    vl_logic_vector(31 downto 0)
    );
end ALU;
