library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
ENTITY sumador IS
	generic (n:INTEGER:=7); 
	PORT (a : IN std_logic_vector(n DOWNTO 0); 
         b : IN std_logic_vector(n DOWNTO 0);  
         salida : OUT std_logic_vector(n DOWNTO 0));
end sumador;
ARCHITECTURE sol OF sumador IS
	BEGIN
		salida <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
END sol;
