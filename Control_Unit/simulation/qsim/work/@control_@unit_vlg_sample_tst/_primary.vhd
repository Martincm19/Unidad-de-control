library verilog;
use verilog.vl_types.all;
entity Control_Unit_vlg_sample_tst is
    port(
        CCR_Result      : in     vl_logic_vector(3 downto 0);
        Clock           : in     vl_logic;
        IR              : in     vl_logic_vector(7 downto 0);
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Control_Unit_vlg_sample_tst;
