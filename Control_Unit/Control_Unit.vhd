-- Estados

library IEEE;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 --use ieee.std_logic_signed.all;
 
 entity Control_Unit is
	
	port
	(
		-- Pines de entrada
	Clock,Reset: in  std_logic;
	CCR_Result : in std_logic_vector(3 downto 0);
	IR: in std_logic_vector (7 downto 0);
		
	-- Pines de salida
	ALU_Sel: out std_logic_vector (2 downto 0);
	Bus1_Sel , Bus2_Sel: out std_logic_vector (1 downto 0);
	IR_Load , MAR_Load ,PC_Load , PC_Inc , A_Load , B_Load ,
   CCR_Load, writen	: out  std_logic);

end Control_Unit;  


architecture dataflow of Control_Unit is

constant LDA_IMM : std_logic_vector (7 downto 0) := "10000110";
constant LDA_DIR : std_logic_vector (7 downto 0) := x"87";
constant LDB_IMM : std_logic_vector (7 downto 0) := x"88";
constant LDB_DIR : std_logic_vector (7 downto 0) := x"89";
constant STA_DIR : std_logic_vector (7 downto 0) := x"96";
constant STB_DIR : std_logic_vector (7 downto 0) := x"97";
constant ADD_AB : std_logic_vector (7 downto 0) := x"42";
constant BRA : std_logic_vector (7 downto 0) := x"20";
constant BEQ : std_logic_vector (7 downto 0) := x"23";
type state_type is

(S_FETCH_0, S_FETCH_1, S_FETCH_2,
S_DECODE_3,
S_LDA_IMM_4, S_LDA_IMM_5, S_LDA_IMM_6,
S_LDA_DIR_4, S_LDA_DIR_5, S_LDA_DIR_6, S_LDA_DIR_7, S_LDA_DIR_8,
S_LDB_IMM_4, S_LDB_IMM_5, S_LDB_IMM_6,
S_LDB_DIR_4, S_LDB_DIR_5, S_LDB_DIR_6, S_LDB_DIR_7, S_LDB_DIR_8,
S_STA_DIR_4, S_STA_DIR_5, S_STA_DIR_6, S_STA_DIR_7,
S_STB_DIR_4, S_STB_DIR_5, S_STB_DIR_6, S_STB_DIR_7,
S_ADD_AB_4,
S_BRA_4, S_BRA_5, S_BRA_6,
S_BEQ_4, S_BEQ_5, S_BEQ_6, S_BEQ_7);

signal current_state, next_state : state_type;

begin
STATE_MEMORY : process (Clock, Reset)
begin
if (Reset = '0') then
current_state <= S_FETCH_0;
elsif (clock'event and clock = '1') then
current_state <= next_state;
end if;
end process;

--------------------------------------------------
NEXT_STATE_LOGIC : process (current_state, IR, CCR_Result)
begin
if (current_state = S_FETCH_0) then
next_state <= S_FETCH_1;
elsif (current_state = S_FETCH_1) then
next_state <= S_FETCH_2;
elsif (current_state = S_FETCH_2) then
next_state <= S_DECODE_3;
elsif (current_state = S_DECODE_3) then

-- select execution path
if (IR = "10000110") then -- Load A Immediate
next_state <= S_LDA_IMM_4;
elsif (IR = LDA_DIR) then -- Load A Direct
next_state <= S_LDA_DIR_4;
elsif (IR = STA_DIR) then -- Store A Direct
next_state <= S_STA_DIR_4;
elsif (IR = ADD_AB) then -- Add A and B
next_state <= S_ADD_AB_4;
elsif (IR = BRA) then -- Branch Always
next_state <= S_BRA_4;
elsif (IR=BEQ and CCR_Result(2)='1') then -- BEQ and Z1⁄41
next_state <= S_BEQ_4;
elsif (IR=BEQ and CCR_Result(2)='0') then -- BEQ and Z1⁄40
next_state <= S_BEQ_7;
else
next_state <= S_FETCH_0;
end if;
end if;
end process;
----------------------------------------------------

OUTPUT_LOGIC : process (current_state)
	begin
		case(current_state) is
			when S_FETCH_0 => -- Put PC onto MAR to read Opcode
				IR_Load <= '0';
				MAR_Load <= '1';
				PC_Load <= '0';
				PC_Inc <= '0';
				A_Load <= '0';
				B_Load <= '0';
				ALU_Sel <= "000";
				CCR_Load <= '0';
				Bus1_Sel <= "00"; -- "00"1⁄4PC, "01"1⁄4A, "10"1⁄4B
				Bus2_Sel <= "01"; -- "00"1⁄4ALU_Result, "01"1⁄4Bus1, "10"1⁄4from_memory
				writen <= '0';
			when S_FETCH_1 => -- Increment PC
				IR_Load <= '0';
				MAR_Load <= '0';
				PC_Load <= '0' ;
				PC_Inc <= '1';
				A_Load <= '0';
				B_Load <= '0';
				ALU_Sel <= "000";
				CCR_Load <= '0';
				Bus1_Sel <= "00"; -- "00"1⁄4PC, "01"1⁄4A, "10"1⁄4B
				Bus2_Sel <= "00"; -- "00"1⁄4ALU, "01"1⁄4Bus1, "10"1⁄4from_memory
				writen <= '0';
				
		when others => --:

				--“output assignments for all other states go here...”

				--:
		end case;
	end process;


end dataflow;