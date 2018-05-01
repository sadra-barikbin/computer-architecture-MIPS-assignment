library verilog;
use verilog.vl_types.all;
entity adder32bit is
    port(
        num1            : in     vl_logic_vector(31 downto 0);
        num2            : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end adder32bit;
