library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoder_bcd_binario is
	Port (Ent: in STD_LOGIC_VECTOR(7 downto 0);
		Salida : OUT STD_LOGIC_VECTOR(6 downto 0));
end encoder_bcd_binario;

Architecture sol of encoder_bcd_binario is
signal Temp:STD_LOGIC_VECTOR(7 downto 0);
Begin	
	process(Ent)
	Begin
		Temp<=(Ent(7 downto 4)*"1010")+("0000"&Ent(3 downto 0));
	end process;
	Salida<=Temp(6 downto 0);
end sol;