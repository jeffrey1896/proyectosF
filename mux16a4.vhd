library ieee;
use ieee.std_logic_1164.all;

Entity mux16a4 is
generic (n:INTEGER:=3); 
PORT(	A: IN std_logic_vector(n downto 0);
		B: IN std_logic_vector(n downto 0);
		C: IN std_logic_vector(n downto 0);
		D: IN std_logic_vector(n downto 0);
		E: IN std_logic_vector(n downto 0);
		F: IN std_logic_vector(n downto 0);
		G: IN std_logic_vector(n downto 0);
		H: IN std_logic_vector(n downto 0);
		I: IN std_logic_vector(n downto 0);
		J: IN std_logic_vector(n downto 0);
		K: IN std_logic_vector(n downto 0);
		L: IN std_logic_vector(n downto 0);
		M: IN std_logic_vector(n downto 0);
		W: IN std_logic_vector(n downto 0);
		P: IN std_logic_vector(n downto 0);
		T: IN std_logic_vector(n downto 0);
		S: IN std_logic_vector(3 downto 0);
		Q: OUT std_logic_vector(n downto 0));
end mux16a4;

Architecture sol of mux16a4 is
Begin
	with S select
	Q<=A when "0000",
		B when "0001",
		C when "0010",
		D when "0011",
		E when "0100",
		F when "0101",
		G when "0110",
		H when "0111",
		I when "1000",
		J when "1001",
		K when "1010",
		L when "1011",
		M when "1100",
		W when "1101",
		P when "1110",
		T when "1111",
		A when others;
end sol;