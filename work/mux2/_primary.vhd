library verilog;
use verilog.vl_types.all;
entity mux2 is
    generic(
        n               : vl_notype
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        \out\           : out    vl_logic_vector;
        \select\        : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 5;
end mux2;
