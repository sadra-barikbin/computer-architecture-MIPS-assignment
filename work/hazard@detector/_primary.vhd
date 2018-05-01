library verilog;
use verilog.vl_types.all;
entity hazardDetector is
    port(
        src1            : in     vl_logic_vector(4 downto 0);
        src2            : in     vl_logic_vector(4 downto 0);
        exeDst          : in     vl_logic_vector(4 downto 0);
        memDst          : in     vl_logic_vector(4 downto 0);
        isRegWriterAndImmediate: in     vl_logic;
        MEMwb_en        : in     vl_logic;
        EXEwb_en        : in     vl_logic;
        hazard          : out    vl_logic;
        fwEn            : in     vl_logic;
        IDRegMemReadEn  : in     vl_logic
    );
end hazardDetector;
