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
        mem_read_value  : out    vl_logic_vector(31 downto 0)
    );
end MEM_Stage;
