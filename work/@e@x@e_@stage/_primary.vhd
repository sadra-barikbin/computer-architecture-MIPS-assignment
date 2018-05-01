library verilog;
use verilog.vl_types.all;
entity EXE_Stage is
    port(
        clk             : in     vl_logic;
        exe_cmd         : in     vl_logic_vector(3 downto 0);
        val1            : in     vl_logic_vector(31 downto 0);
        val2            : in     vl_logic_vector(31 downto 0);
        val_src2        : in     vl_logic_vector(31 downto 0);
        PC              : in     vl_logic_vector(31 downto 0);
        Br_type         : in     vl_logic_vector(1 downto 0);
        alu_result      : out    vl_logic_vector(31 downto 0);
        Br_addr         : out    vl_logic_vector(31 downto 0);
        Br_taken        : out    vl_logic;
        exeStVal        : in     vl_logic_vector(31 downto 0);
        memStVal        : in     vl_logic_vector(31 downto 0);
        val1Forward     : in     vl_logic_vector(1 downto 0);
        val2Forward     : in     vl_logic_vector(1 downto 0);
        src2_valForward : in     vl_logic_vector(1 downto 0)
    );
end EXE_Stage;
