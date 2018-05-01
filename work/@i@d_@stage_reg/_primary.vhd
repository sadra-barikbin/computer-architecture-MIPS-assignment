library verilog;
use verilog.vl_types.all;
entity ID_Stage_reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        dst_in          : in     vl_logic_vector(4 downto 0);
        reg2_in         : in     vl_logic_vector(31 downto 0);
        val2_in         : in     vl_logic_vector(31 downto 0);
        val1_in         : in     vl_logic_vector(31 downto 0);
        PC_in           : in     vl_logic_vector(31 downto 0);
        Br_type_in      : in     vl_logic_vector(1 downto 0);
        exe_cmd_in      : in     vl_logic_vector(3 downto 0);
        mem_r_en_in     : in     vl_logic;
        mem_w_en_in     : in     vl_logic;
        wb_en_in        : in     vl_logic;
        src1_in         : in     vl_logic_vector(4 downto 0);
        src2_in         : in     vl_logic_vector(4 downto 0);
        dst             : out    vl_logic_vector(4 downto 0);
        reg2            : out    vl_logic_vector(31 downto 0);
        val2            : out    vl_logic_vector(31 downto 0);
        val1            : out    vl_logic_vector(31 downto 0);
        PC_out          : out    vl_logic_vector(31 downto 0);
        Br_type         : out    vl_logic_vector(1 downto 0);
        exe_cmd         : out    vl_logic_vector(3 downto 0);
        mem_r_en        : out    vl_logic;
        mem_w_en        : out    vl_logic;
        wb_en           : out    vl_logic;
        src1            : out    vl_logic_vector(4 downto 0);
        src2            : out    vl_logic_vector(4 downto 0)
    );
end ID_Stage_reg;
