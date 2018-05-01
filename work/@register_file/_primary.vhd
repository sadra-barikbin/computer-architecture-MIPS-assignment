library verilog;
use verilog.vl_types.all;
entity Register_file is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wr_en           : in     vl_logic;
        valueToWrite    : in     vl_logic_vector(31 downto 0);
        readSrc1        : in     vl_logic_vector(4 downto 0);
        readSrc2        : in     vl_logic_vector(4 downto 0);
        writeDest       : in     vl_logic_vector(4 downto 0);
        readVal1        : out    vl_logic_vector(31 downto 0);
        readVal2        : out    vl_logic_vector(31 downto 0)
    );
end Register_file;
