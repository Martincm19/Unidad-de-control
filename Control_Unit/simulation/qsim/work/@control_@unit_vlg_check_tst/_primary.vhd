library verilog;
use verilog.vl_types.all;
entity Control_Unit_vlg_check_tst is
    port(
        A_Load          : in     vl_logic;
        ALU_Sel         : in     vl_logic_vector(2 downto 0);
        B_Load          : in     vl_logic;
        Bus1_Sel        : in     vl_logic_vector(1 downto 0);
        Bus2_Sel        : in     vl_logic_vector(1 downto 0);
        CCR_Load        : in     vl_logic;
        IR_Load         : in     vl_logic;
        MAR_Load        : in     vl_logic;
        PC_Inc          : in     vl_logic;
        PC_Load         : in     vl_logic;
        writen          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Control_Unit_vlg_check_tst;
