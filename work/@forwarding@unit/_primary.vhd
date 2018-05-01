library verilog;
use verilog.vl_types.all;
entity ForwardingUnit is
    port(
        forwardEn       : in     vl_logic;
        exeWbEn         : in     vl_logic;
        memWbEn         : in     vl_logic;
        exeRegDst       : in     vl_logic_vector(4 downto 0);
        memRegDst       : in     vl_logic_vector(4 downto 0);
        stAndBneSrc     : in     vl_logic_vector(4 downto 0);
        src1            : in     vl_logic_vector(4 downto 0);
        src2            : in     vl_logic_vector(4 downto 0);
        val1Forward     : out    vl_logic_vector(1 downto 0);
        val2Forward     : out    vl_logic_vector(1 downto 0);
        src2_valForward : out    vl_logic_vector(1 downto 0)
    );
end ForwardingUnit;
