library verilog;
use verilog.vl_types.all;
entity mux is
    generic(
        n               : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        \out\           : out    vl_logic_vector;
        \select\        : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end mux;
