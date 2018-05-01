library verilog;
use verilog.vl_types.all;
entity MEM_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_r_en_in     : in     vl_logic;
        mem_w_en_in     : in     vl_logic;
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        st_val          : in     vl_logic_vector(31 downto 0);
        mem_read_value  : out    vl_logic_vector(31 downto 0);
        sramDQ          : inout  vl_logic_vector(15 downto 0);
        sramAddr        : out    vl_logic_vector(17 downto 0);
        sramUB          : out    vl_logic;
        sramLB          : out    vl_logic;
        sramWE          : out    vl_logic;
        sramCE          : out    vl_logic;
        sramOE          : out    vl_logic;
        ready           : out    vl_logic
    );
end MEM_Stage;
