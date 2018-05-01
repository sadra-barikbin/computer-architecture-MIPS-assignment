library verilog;
use verilog.vl_types.all;
entity ID_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Instruction     : in     vl_logic_vector(31 downto 0);
        reg1            : in     vl_logic_vector(31 downto 0);
        reg2            : in     vl_logic_vector(31 downto 0);
        src1            : out    vl_logic_vector(4 downto 0);
        src2            : out    vl_logic_vector(4 downto 0);
        hazardSrc2      : out    vl_logic_vector(4 downto 0);
        dst             : out    vl_logic_vector(4 downto 0);
        \Reg2\          : out    vl_logic_vector(31 downto 0);
        Val2            : out    vl_logic_vector(31 downto 0);
        Val1            : out    vl_logic_vector(31 downto 0);
        finalBr_type    : out    vl_logic_vector(1 downto 0);
        exe_cmd         : out    vl_logic_vector(3 downto 0);
        finalMem_r_en   : out    vl_logic;
        finalMem_w_en   : out    vl_logic;
        finalWb_en      : out    vl_logic;
        freeze          : in     vl_logic;
        isRegWriterAndImmediate: out    vl_logic
    );
end ID_Stage;
