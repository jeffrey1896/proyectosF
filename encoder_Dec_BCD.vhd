library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoder_Dec_BCD is
	Port (Ent: in STD_LOGIC_VECTOR(9 downto 0);
		Salida : OUT STD_LOGIC_VECTOR(3 downto 0));
end encoder_Dec_BCD;

Architecture sol of encoder_Dec_BCD is
signal Temp:STD_LOGIC_VECTOR(3 downto 0);
Begin
	process(Ent)
	Begin
					--0987654321
		   if Ent="0000000001" then Temp<="0001"; 
		elsif Ent="0000000010" then Temp<="0010";
		elsif Ent="0000000100" then Temp<="0011";
		elsif Ent="0000001000" then Temp<="0100";
		elsif Ent="0000010000" then Temp<="0101";
		elsif Ent="0000100000" then Temp<="0110";
		elsif Ent="0001000000" then Temp<="0111";
		elsif Ent="0010000000" then Temp<="1000";
		elsif Ent="0100000000" then Temp<="1001";
		elsif Ent="1000000000" then Temp<="0000";
		else Temp<="0000"; end if;
--				  if Ent="10001000" then Temp<="0001"; --1
--		elsif Ent="10000100" then Temp<="0010";--2
--		elsif Ent="10000010" then Temp<="0011";--3
--		elsif Ent="01001000" then Temp<="0100";--4
--		elsif Ent="01000100" then Temp<="0101";--5
--		elsif Ent="01000010" then Temp<="0110";--6
--		elsif Ent="00101000" then Temp<="0111";--7
--		elsif Ent="00100100" then Temp<="1000";--8
--		elsif Ent="00100010" then Temp<="1001";--9
--		elsif Ent="00010100" then Temp<="0000";--0
--		else Temp<="0000"; end if;
		
		
	end process;
	Salida<=Temp;
end sol;