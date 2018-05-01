library verilog;
use verilog.vl_types.all;
entity CU is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        execute_command : out    vl_logic_vector(3 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        wb_enable       : out    vl_logic;
        is_immediate    : out    vl_logic;
        branch_type     : out    vl_logic_vector(1 downto 0)
    );
end CU;
