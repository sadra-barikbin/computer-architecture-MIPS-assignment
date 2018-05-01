library verilog;
use verilog.vl_types.all;
entity Condition_check is
    port(
        val1            : in     vl_logic_vector(31 downto 0);
        src2_val        : in     vl_logic_vector(31 downto 0);
        branch_type     : in     vl_logic_vector(1 downto 0);
        branch_taken    : out    vl_logic
    );
end Condition_check;
