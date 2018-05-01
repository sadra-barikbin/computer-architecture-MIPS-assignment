library verilog;
use verilog.vl_types.all;
entity EXE_Stage_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wb_en_in        : in     vl_logic;
        mem_r_en_in     : in     vl_logic;
        mem_w_en_in     : in     vl_logic;
        dst_in          : in     vl_logic_vector(4 downto 0);
        PC_in           : in     vl_logic_vector(31 downto 0);
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        st_val_in       : in     vl_logic_vector(31 downto 0);
        wb_en           : out    vl_logic;
        mem_r_en        : out    vl_logic;
        mem_w_en        : out    vl_logic;
        PC              : out    vl_logic_vector(31 downto 0);
        alu_result      : out    vl_logic_vector(31 downto 0);
        st_val          : out    vl_logic_vector(31 downto 0);
        dst             : out    vl_logic_vector(4 downto 0);
        memReady        : in     vl_logic
    );
end EXE_Stage_reg;
