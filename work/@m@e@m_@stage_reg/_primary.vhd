library verilog;
use verilog.vl_types.all;
entity MEM_Stage_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wb_en_in        : in     vl_logic;
        mem_r_en_in     : in     vl_logic;
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        mem_read_value_in: in     vl_logic_vector(31 downto 0);
        dst_in          : in     vl_logic_vector(4 downto 0);
        wb_en           : out    vl_logic;
        mem_r_en        : out    vl_logic;
        alu_result      : out    vl_logic_vector(31 downto 0);
        mem_read_value  : out    vl_logic_vector(31 downto 0);
        dst             : out    vl_logic_vector(4 downto 0)
    );
end MEM_Stage_reg;
