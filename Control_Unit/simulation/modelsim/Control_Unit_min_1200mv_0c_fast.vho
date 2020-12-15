-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "12/13/2020 23:46:39"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Control_Unit IS
    PORT (
	Clock : IN std_logic;
	Reset : IN std_logic;
	CCR_Result : IN std_logic_vector(3 DOWNTO 0);
	IR : IN std_logic_vector(7 DOWNTO 0);
	ALU_Sel : OUT std_logic_vector(2 DOWNTO 0);
	Bus1_Sel : OUT std_logic_vector(1 DOWNTO 0);
	Bus2_Sel : OUT std_logic_vector(1 DOWNTO 0);
	IR_Load : OUT std_logic;
	MAR_Load : OUT std_logic;
	PC_Load : OUT std_logic;
	PC_Inc : OUT std_logic;
	A_Load : OUT std_logic;
	B_Load : OUT std_logic;
	CCR_Load : OUT std_logic;
	writen : OUT std_logic
	);
END Control_Unit;

-- Design Ports Information
-- CCR_Result[0]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CCR_Result[1]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CCR_Result[3]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_Sel[0]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_Sel[1]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_Sel[2]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Bus1_Sel[0]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Bus1_Sel[1]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Bus2_Sel[0]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Bus2_Sel[1]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR_Load	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MAR_Load	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Load	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_Inc	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_Load	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_Load	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CCR_Load	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writen	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CCR_Result[2]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[3]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[2]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[6]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[1]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[5]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[7]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[4]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[0]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Control_Unit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_CCR_Result : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_IR : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ALU_Sel : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Bus1_Sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Bus2_Sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_IR_Load : std_logic;
SIGNAL ww_MAR_Load : std_logic;
SIGNAL ww_PC_Load : std_logic;
SIGNAL ww_PC_Inc : std_logic;
SIGNAL ww_A_Load : std_logic;
SIGNAL ww_B_Load : std_logic;
SIGNAL ww_CCR_Load : std_logic;
SIGNAL ww_writen : std_logic;
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \WideNor0~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CCR_Result[0]~input_o\ : std_logic;
SIGNAL \CCR_Result[1]~input_o\ : std_logic;
SIGNAL \CCR_Result[3]~input_o\ : std_logic;
SIGNAL \CCR_Result[2]~input_o\ : std_logic;
SIGNAL \ALU_Sel[0]~output_o\ : std_logic;
SIGNAL \ALU_Sel[1]~output_o\ : std_logic;
SIGNAL \ALU_Sel[2]~output_o\ : std_logic;
SIGNAL \Bus1_Sel[0]~output_o\ : std_logic;
SIGNAL \Bus1_Sel[1]~output_o\ : std_logic;
SIGNAL \Bus2_Sel[0]~output_o\ : std_logic;
SIGNAL \Bus2_Sel[1]~output_o\ : std_logic;
SIGNAL \IR_Load~output_o\ : std_logic;
SIGNAL \MAR_Load~output_o\ : std_logic;
SIGNAL \PC_Load~output_o\ : std_logic;
SIGNAL \PC_Inc~output_o\ : std_logic;
SIGNAL \A_Load~output_o\ : std_logic;
SIGNAL \B_Load~output_o\ : std_logic;
SIGNAL \CCR_Load~output_o\ : std_logic;
SIGNAL \writen~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \IR[3]~input_o\ : std_logic;
SIGNAL \IR[7]~input_o\ : std_logic;
SIGNAL \IR[4]~input_o\ : std_logic;
SIGNAL \IR[2]~input_o\ : std_logic;
SIGNAL \IR[1]~input_o\ : std_logic;
SIGNAL \IR[6]~input_o\ : std_logic;
SIGNAL \IR[5]~input_o\ : std_logic;
SIGNAL \next_state~1_combout\ : std_logic;
SIGNAL \IR[0]~input_o\ : std_logic;
SIGNAL \next_state~2_combout\ : std_logic;
SIGNAL \next_state~0_combout\ : std_logic;
SIGNAL \next_state~3_combout\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \next_state.S_FETCH_1_922~combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_state.S_FETCH_1~q\ : std_logic;
SIGNAL \comb~1_combout\ : std_logic;
SIGNAL \next_state.S_FETCH_2_913~combout\ : std_logic;
SIGNAL \current_state.S_FETCH_2~q\ : std_logic;
SIGNAL \comb~2_combout\ : std_logic;
SIGNAL \next_state.S_DECODE_3_904~combout\ : std_logic;
SIGNAL \current_state.S_DECODE_3~q\ : std_logic;
SIGNAL \next_state.S_ADD_AB_4~1_combout\ : std_logic;
SIGNAL \next_state.S_FETCH_0_930~combout\ : std_logic;
SIGNAL \current_state.S_FETCH_0~0_combout\ : std_logic;
SIGNAL \current_state.S_FETCH_0~q\ : std_logic;
SIGNAL \WideNor0~0_combout\ : std_logic;
SIGNAL \WideNor0~0clkctrl_outclk\ : std_logic;
SIGNAL \Bus2_Sel[0]$latch~combout\ : std_logic;
SIGNAL \PC_Inc$latch~combout\ : std_logic;

BEGIN

ww_Clock <= Clock;
ww_Reset <= Reset;
ww_CCR_Result <= CCR_Result;
ww_IR <= IR;
ALU_Sel <= ww_ALU_Sel;
Bus1_Sel <= ww_Bus1_Sel;
Bus2_Sel <= ww_Bus2_Sel;
IR_Load <= ww_IR_Load;
MAR_Load <= ww_MAR_Load;
PC_Load <= ww_PC_Load;
PC_Inc <= ww_PC_Inc;
A_Load <= ww_A_Load;
B_Load <= ww_B_Load;
CCR_Load <= ww_CCR_Load;
writen <= ww_writen;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);

\WideNor0~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \WideNor0~0_combout\);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);

-- Location: IOOBUF_X41_Y13_N9
\ALU_Sel[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ALU_Sel[0]~output_o\);

-- Location: IOOBUF_X35_Y0_N16
\ALU_Sel[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ALU_Sel[1]~output_o\);

-- Location: IOOBUF_X5_Y29_N30
\ALU_Sel[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ALU_Sel[2]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\Bus1_Sel[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Bus1_Sel[0]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\Bus1_Sel[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Bus1_Sel[1]~output_o\);

-- Location: IOOBUF_X19_Y0_N9
\Bus2_Sel[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bus2_Sel[0]$latch~combout\,
	devoe => ww_devoe,
	o => \Bus2_Sel[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\Bus2_Sel[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Bus2_Sel[1]~output_o\);

-- Location: IOOBUF_X21_Y29_N2
\IR_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \IR_Load~output_o\);

-- Location: IOOBUF_X19_Y0_N16
\MAR_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bus2_Sel[0]$latch~combout\,
	devoe => ww_devoe,
	o => \MAR_Load~output_o\);

-- Location: IOOBUF_X30_Y29_N9
\PC_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \PC_Load~output_o\);

-- Location: IOOBUF_X19_Y0_N2
\PC_Inc~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_Inc$latch~combout\,
	devoe => ww_devoe,
	o => \PC_Inc~output_o\);

-- Location: IOOBUF_X41_Y7_N16
\A_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \A_Load~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\B_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \B_Load~output_o\);

-- Location: IOOBUF_X14_Y29_N2
\CCR_Load~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CCR_Load~output_o\);

-- Location: IOOBUF_X23_Y29_N23
\writen~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \writen~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\Clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G4
\Clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X19_Y0_N29
\IR[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(3),
	o => \IR[3]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\IR[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(7),
	o => \IR[7]~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\IR[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(4),
	o => \IR[4]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\IR[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(2),
	o => \IR[2]~input_o\);

-- Location: IOIBUF_X23_Y0_N1
\IR[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(1),
	o => \IR[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\IR[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(6),
	o => \IR[6]~input_o\);

-- Location: IOIBUF_X23_Y0_N22
\IR[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(5),
	o => \IR[5]~input_o\);

-- Location: LCCOMB_X20_Y1_N4
\next_state~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state~1_combout\ = (\IR[1]~input_o\ & (!\IR[6]~input_o\ & (\IR[2]~input_o\ $ (\IR[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[2]~input_o\,
	datab => \IR[1]~input_o\,
	datac => \IR[6]~input_o\,
	datad => \IR[5]~input_o\,
	combout => \next_state~1_combout\);

-- Location: IOIBUF_X23_Y0_N29
\IR[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(0),
	o => \IR[0]~input_o\);

-- Location: LCCOMB_X20_Y1_N2
\next_state~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state~2_combout\ = (\IR[4]~input_o\ & (((\next_state~1_combout\ & !\IR[0]~input_o\)) # (!\IR[7]~input_o\))) # (!\IR[4]~input_o\ & (\next_state~1_combout\ $ (((!\IR[7]~input_o\ & \IR[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[4]~input_o\,
	datab => \IR[7]~input_o\,
	datac => \next_state~1_combout\,
	datad => \IR[0]~input_o\,
	combout => \next_state~2_combout\);

-- Location: LCCOMB_X20_Y1_N6
\next_state~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state~0_combout\ = (!\IR[2]~input_o\ & ((\IR[6]~input_o\ & (\IR[1]~input_o\ & !\IR[5]~input_o\)) # (!\IR[6]~input_o\ & ((\IR[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[2]~input_o\,
	datab => \IR[1]~input_o\,
	datac => \IR[6]~input_o\,
	datad => \IR[5]~input_o\,
	combout => \next_state~0_combout\);

-- Location: LCCOMB_X20_Y1_N28
\next_state~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state~3_combout\ = (!\IR[3]~input_o\ & ((\IR[7]~input_o\ & (\next_state~2_combout\ & !\next_state~0_combout\)) # (!\IR[7]~input_o\ & (!\next_state~2_combout\ & \next_state~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR[3]~input_o\,
	datab => \IR[7]~input_o\,
	datac => \next_state~2_combout\,
	datad => \next_state~0_combout\,
	combout => \next_state~3_combout\);

-- Location: LCCOMB_X20_Y1_N16
\comb~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = (\current_state.S_FETCH_0~q\ & ((\current_state.S_FETCH_2~q\) # ((\current_state.S_DECODE_3~q\) # (\current_state.S_FETCH_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_FETCH_2~q\,
	datab => \current_state.S_DECODE_3~q\,
	datac => \current_state.S_FETCH_1~q\,
	datad => \current_state.S_FETCH_0~q\,
	combout => \comb~0_combout\);

-- Location: LCCOMB_X20_Y1_N20
\next_state.S_FETCH_1_922\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.S_FETCH_1_922~combout\ = (!\comb~0_combout\ & ((\next_state.S_FETCH_1_922~combout\) # (!\current_state.S_FETCH_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comb~0_combout\,
	datac => \current_state.S_FETCH_0~q\,
	datad => \next_state.S_FETCH_1_922~combout\,
	combout => \next_state.S_FETCH_1_922~combout\);

-- Location: IOIBUF_X0_Y14_N8
\Reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: CLKCTRL_G2
\Reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X20_Y1_N17
\current_state.S_FETCH_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~input_o\,
	asdata => \next_state.S_FETCH_1_922~combout\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_FETCH_1~q\);

-- Location: LCCOMB_X20_Y1_N8
\comb~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \comb~1_combout\ = ((!\current_state.S_FETCH_1~q\ & ((\current_state.S_DECODE_3~q\) # (\current_state.S_FETCH_2~q\)))) # (!\current_state.S_FETCH_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_FETCH_1~q\,
	datab => \current_state.S_FETCH_0~q\,
	datac => \current_state.S_DECODE_3~q\,
	datad => \current_state.S_FETCH_2~q\,
	combout => \comb~1_combout\);

-- Location: LCCOMB_X20_Y1_N0
\next_state.S_FETCH_2_913\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.S_FETCH_2_913~combout\ = (!\comb~1_combout\ & ((\current_state.S_FETCH_1~q\) # (\next_state.S_FETCH_2_913~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_FETCH_1~q\,
	datac => \comb~1_combout\,
	datad => \next_state.S_FETCH_2_913~combout\,
	combout => \next_state.S_FETCH_2_913~combout\);

-- Location: FF_X20_Y1_N23
\current_state.S_FETCH_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \next_state.S_FETCH_2_913~combout\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_FETCH_2~q\);

-- Location: LCCOMB_X20_Y1_N22
\comb~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \comb~2_combout\ = (!\current_state.S_FETCH_2~q\ & ((\current_state.S_FETCH_1~q\) # ((\current_state.S_DECODE_3~q\) # (!\current_state.S_FETCH_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_FETCH_1~q\,
	datab => \current_state.S_DECODE_3~q\,
	datac => \current_state.S_FETCH_2~q\,
	datad => \current_state.S_FETCH_0~q\,
	combout => \comb~2_combout\);

-- Location: LCCOMB_X20_Y1_N10
\next_state.S_DECODE_3_904\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.S_DECODE_3_904~combout\ = (!\comb~2_combout\ & ((\current_state.S_FETCH_2~q\) # (\next_state.S_DECODE_3_904~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_FETCH_2~q\,
	datab => \comb~2_combout\,
	datad => \next_state.S_DECODE_3_904~combout\,
	combout => \next_state.S_DECODE_3_904~combout\);

-- Location: FF_X20_Y1_N9
\current_state.S_DECODE_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \next_state.S_DECODE_3_904~combout\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DECODE_3~q\);

-- Location: LCCOMB_X20_Y1_N24
\next_state.S_ADD_AB_4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.S_ADD_AB_4~1_combout\ = ((\current_state.S_FETCH_2~q\) # (\current_state.S_FETCH_1~q\)) # (!\current_state.S_FETCH_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_FETCH_0~q\,
	datac => \current_state.S_FETCH_2~q\,
	datad => \current_state.S_FETCH_1~q\,
	combout => \next_state.S_ADD_AB_4~1_combout\);

-- Location: LCCOMB_X20_Y1_N26
\next_state.S_FETCH_0_930\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.S_FETCH_0_930~combout\ = (!\next_state.S_ADD_AB_4~1_combout\ & ((\current_state.S_DECODE_3~q\ & ((!\next_state~3_combout\))) # (!\current_state.S_DECODE_3~q\ & (\next_state.S_FETCH_0_930~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.S_FETCH_0_930~combout\,
	datab => \next_state~3_combout\,
	datac => \current_state.S_DECODE_3~q\,
	datad => \next_state.S_ADD_AB_4~1_combout\,
	combout => \next_state.S_FETCH_0_930~combout\);

-- Location: LCCOMB_X20_Y1_N30
\current_state.S_FETCH_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state.S_FETCH_0~0_combout\ = !\next_state.S_FETCH_0_930~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \next_state.S_FETCH_0_930~combout\,
	combout => \current_state.S_FETCH_0~0_combout\);

-- Location: FF_X20_Y1_N31
\current_state.S_FETCH_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \current_state.S_FETCH_0~0_combout\,
	clrn => \Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_FETCH_0~q\);

-- Location: LCCOMB_X20_Y1_N18
\WideNor0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~0_combout\ = (\current_state.S_FETCH_0~q\ & !\current_state.S_FETCH_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.S_FETCH_0~q\,
	datad => \current_state.S_FETCH_1~q\,
	combout => \WideNor0~0_combout\);

-- Location: CLKCTRL_G16
\WideNor0~0clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \WideNor0~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \WideNor0~0clkctrl_outclk\);

-- Location: LCCOMB_X20_Y1_N14
\Bus2_Sel[0]$latch\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Bus2_Sel[0]$latch~combout\ = (GLOBAL(\WideNor0~0clkctrl_outclk\) & (\Bus2_Sel[0]$latch~combout\)) # (!GLOBAL(\WideNor0~0clkctrl_outclk\) & ((!\current_state.S_FETCH_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Bus2_Sel[0]$latch~combout\,
	datac => \WideNor0~0clkctrl_outclk\,
	datad => \current_state.S_FETCH_1~q\,
	combout => \Bus2_Sel[0]$latch~combout\);

-- Location: LCCOMB_X20_Y1_N12
\PC_Inc$latch\ : cycloneiii_lcell_comb
-- Equation(s):
-- \PC_Inc$latch~combout\ = (GLOBAL(\WideNor0~0clkctrl_outclk\) & (\PC_Inc$latch~combout\)) # (!GLOBAL(\WideNor0~0clkctrl_outclk\) & ((\current_state.S_FETCH_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PC_Inc$latch~combout\,
	datac => \WideNor0~0clkctrl_outclk\,
	datad => \current_state.S_FETCH_1~q\,
	combout => \PC_Inc$latch~combout\);

-- Location: IOIBUF_X21_Y0_N8
\CCR_Result[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CCR_Result(0),
	o => \CCR_Result[0]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\CCR_Result[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CCR_Result(1),
	o => \CCR_Result[1]~input_o\);

-- Location: IOIBUF_X41_Y24_N1
\CCR_Result[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CCR_Result(3),
	o => \CCR_Result[3]~input_o\);

-- Location: IOIBUF_X41_Y26_N15
\CCR_Result[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CCR_Result(2),
	o => \CCR_Result[2]~input_o\);

ww_ALU_Sel(0) <= \ALU_Sel[0]~output_o\;

ww_ALU_Sel(1) <= \ALU_Sel[1]~output_o\;

ww_ALU_Sel(2) <= \ALU_Sel[2]~output_o\;

ww_Bus1_Sel(0) <= \Bus1_Sel[0]~output_o\;

ww_Bus1_Sel(1) <= \Bus1_Sel[1]~output_o\;

ww_Bus2_Sel(0) <= \Bus2_Sel[0]~output_o\;

ww_Bus2_Sel(1) <= \Bus2_Sel[1]~output_o\;

ww_IR_Load <= \IR_Load~output_o\;

ww_MAR_Load <= \MAR_Load~output_o\;

ww_PC_Load <= \PC_Load~output_o\;

ww_PC_Inc <= \PC_Inc~output_o\;

ww_A_Load <= \A_Load~output_o\;

ww_B_Load <= \B_Load~output_o\;

ww_CCR_Load <= \CCR_Load~output_o\;

ww_writen <= \writen~output_o\;
END structure;


