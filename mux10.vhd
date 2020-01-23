library ieee;
use ieee.std_logic_1164.all;

Entity mux10 is
generic (n:INTEGER:=9); 
PORT(	A: IN std_logic_vector(n downto 0);
		B: IN std_logic_vector(n downto 0);
		S: IN std_logic;
		Q: OUT std_logic_vector(n downto 0));
end mux10;

Architecture sol of mux10 is
Begin
	with S select
	Q<=A when '0',
		B when '1',
		A when others;
end sol;