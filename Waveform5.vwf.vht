-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/06/2020 22:02:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          partefuncional
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY partefuncional_vhd_vec_tst IS
END partefuncional_vhd_vec_tst;
ARCHITECTURE partefuncional_arch OF partefuncional_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL consultar : STD_LOGIC;
SIGNAL dinero : STD_LOGIC;
SIGNAL display1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL display3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Estados : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL LM35 : STD_LOGIC;
SIGNAL LM324 : STD_LOGIC;
SIGNAL Motor1 : STD_LOGIC;
SIGNAL Motor2 : STD_LOGIC;
SIGNAL Motor3 : STD_LOGIC;
SIGNAL N3904 : STD_LOGIC;
SIGNAL pin_name1 : STD_LOGIC;
SIGNAL pin_name2 : STD_LOGIC;
SIGNAL pin_name3 : STD_LOGIC;
SIGNAL reloj_FPGA : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT partefuncional
	PORT (
	consultar : IN STD_LOGIC;
	dinero : IN STD_LOGIC;
	display1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	display3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Estados : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	LM35 : IN STD_LOGIC;
	LM324 : IN STD_LOGIC;
	Motor1 : OUT STD_LOGIC;
	Motor2 : OUT STD_LOGIC;
	Motor3 : OUT STD_LOGIC;
	N3904 : IN STD_LOGIC;
	pin_name1 : OUT STD_LOGIC;
	pin_name2 : OUT STD_LOGIC;
	pin_name3 : OUT STD_LOGIC;
	reloj_FPGA : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : partefuncional
	PORT MAP (
-- list connections between master ports and signals
	consultar => consultar,
	dinero => dinero,
	display1 => display1,
	display2 => display2,
	display3 => display3,
	Estados => Estados,
	LM35 => LM35,
	LM324 => LM324,
	Motor1 => Motor1,
	Motor2 => Motor2,
	Motor3 => Motor3,
	N3904 => N3904,
	pin_name1 => pin_name1,
	pin_name2 => pin_name2,
	pin_name3 => pin_name3,
	reloj_FPGA => reloj_FPGA,
	reset => reset,
	start => start
	);

-- consultar
t_prcs_consultar: PROCESS
BEGIN
	consultar <= '0';
WAIT;
END PROCESS t_prcs_consultar;

-- dinero
t_prcs_dinero: PROCESS
BEGIN
	dinero <= '0';
	WAIT FOR 510000 ps;
	dinero <= '1';
	WAIT FOR 70000 ps;
	dinero <= '0';
WAIT;
END PROCESS t_prcs_dinero;

-- LM35
t_prcs_LM35: PROCESS
BEGIN
	LM35 <= '0';
	WAIT FOR 390000 ps;
	LM35 <= '1';
	WAIT FOR 60000 ps;
	LM35 <= '0';
WAIT;
END PROCESS t_prcs_LM35;

-- LM324
t_prcs_LM324: PROCESS
BEGIN
	LM324 <= '0';
WAIT;
END PROCESS t_prcs_LM324;

-- N3904
t_prcs_N3904: PROCESS
BEGIN
	N3904 <= '0';
WAIT;
END PROCESS t_prcs_N3904;

-- reloj_FPGA
t_prcs_reloj_FPGA: PROCESS
BEGIN
LOOP
	reloj_FPGA <= '0';
	WAIT FOR 5000 ps;
	reloj_FPGA <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reloj_FPGA;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 30000 ps;
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 120000 ps;
	start <= '1';
	WAIT FOR 190000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;
END partefuncional_arch;
