library verilog;
use verilog.vl_types.all;
entity IF_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Br_taken        : in     vl_logic;
        Br_addr         : in     vl_logic_vector(31 downto 0);
        PCp4            : out    vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0);
        freeze          : in     vl_logic
    );
end IF_Stage;
