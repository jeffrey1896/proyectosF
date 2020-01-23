library ieee;
use ieee.std_logic_1164.all;

Entity mux4a2 is
generic (n:INTEGER:=3); 
PORT(	A: IN std_logic_vector(n downto 0);
		B: IN std_logic_vector(n downto 0);
		C: IN std_logic_vector(n downto 0);
		D: IN std_logic_vector(n downto 0);
		S: IN std_logic_vector(1 downto 0);
		Q: OUT std_logic_vector(n downto 0));
end mux4a2;

Architecture sol of mux4a2 is
Begin
	with S select
	Q<=A when "00",
		B when "01",
		C when "10",
		D when "11",
		A when others;
end sol;