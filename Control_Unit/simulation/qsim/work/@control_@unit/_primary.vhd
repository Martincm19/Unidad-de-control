library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        CCR_Result      : in     vl_logic_vector(3 downto 0);
        IR              : in     vl_logic_vector(7 downto 0);
        ALU_Sel         : out    vl_logic_vector(2 downto 0);
        Bus1_Sel        : out    vl_logic_vector(1 downto 0);
        Bus2_Sel        : out    vl_logic_vector(1 downto 0);
        IR_Load         : out    vl_logic;
        MAR_Load        : out    vl_logic;
        PC_Load         : out    vl_logic;
        PC_Inc          : out    vl_logic;
        A_Load          : out    vl_logic;
        B_Load          : out    vl_logic;
        CCR_Load        : out    vl_logic;
        writen          : out    vl_logic
    );
end Control_Unit;
