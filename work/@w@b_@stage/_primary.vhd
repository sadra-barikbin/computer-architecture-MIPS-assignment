library verilog;
use verilog.vl_types.all;
entity WB_Stage is
    port(
        clk             : in     vl_logic;
        wb_en_in        : in     vl_logic;
        mem_r_en        : in     vl_logic;
        alu_result      : in     vl_logic_vector(31 downto 0);
        mem_r_value     : in     vl_logic_vector(31 downto 0);
        dst_in          : in     vl_logic_vector(4 downto 0);
        wb_en           : out    vl_logic;
        write_value     : out    vl_logic_vector(31 downto 0);
        dst             : out    vl_logic_vector(4 downto 0)
    );
end WB_Stage;
