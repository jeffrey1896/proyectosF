library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity decoder_bcd_a_7segmentos is
	Port ( BCD: in STD_LOGIC_VECTOR(7 downto 0);
		enable_n: in std_logic;
		SEG7: OUT STD_LOGIC_VECTOR(20 downto 0));
end decoder_bcd_a_7segmentos;

Architecture sol of decoder_bcd_a_7segmentos is
signal mod1:STD_LOGIC_VECTOR(6 downto 0);
signal mod2:STD_LOGIC_VECTOR(3 downto 0);
signal numA:STD_LOGIC_VECTOR(3 downto 0);
signal numB:STD_LOGIC_VECTOR(3 downto 0);
signal numC:STD_LOGIC_VECTOR(3 downto 0);
Begin
	process(BCD,mod1,mod2,numA,numB,numC)
	begin
		mod1<=conv_std_logic_vector(conv_integer(BCD) MOD 100,7);
		mod2<=conv_std_logic_vector(conv_integer(mod1) MOD 10,4);
		numA<=conv_std_logic_vector(conv_integer(BCD) / 100,4);
		numB<=conv_std_logic_vector(conv_integer(mod1) / 10,4);
		numC<=mod2;
	end process;
			  --abcdefg
		SEG7(20 downto 14) <=	"0000001"	when numA = "0000" and enable_n='0' ELSE --0
				"1001111"  	when numA = "0001" and enable_n='0' ELSE --1
				"0010010" 	when numA = "0010" and enable_n='0' ELSE --2
				"0000110"	when numA = "0011" and enable_n='0' ELSE --3
				"1001100"	when numA = "0100" and enable_n='0' ELSE --4
				"0100100"	when numA = "0101" and enable_n='0' ELSE --5
				"0100000"	when numA = "0110" and enable_n='0' ELSE --6
				"0001111"	when numA = "0111" and enable_n='0' ELSE --7
				"0000000"	when numA = "1000" and enable_n='0' ELSE --8
				"0000100"	when numA = "1001" and enable_n='0' ELSE --9
				"0000001";
		SEG7(13 downto 7) <=	"0000001"	when numB = "0000" and enable_n='0' ELSE --0
				"1001111"  	when numB = "0001" and enable_n='0' ELSE --1
				"0010010" 	when numB = "0010" and enable_n='0' ELSE --2
				"0000110"	when numB = "0011" and enable_n='0' ELSE --3
				"1001100"	when numB = "0100" and enable_n='0' ELSE --4
				"0100100"	when numB = "0101" and enable_n='0' ELSE --5
				"0100000"	when numB = "0110" and enable_n='0' ELSE --6
				"0001111"	when numB = "0111" and enable_n='0' ELSE --7
				"0000000"	when numB = "1000" and enable_n='0' ELSE --8
				"0000100"	when numB = "1001" and enable_n='0' ELSE --9
				"0000001"; 		
		SEG7(6 downto 0) <=	"0000001"	when numC = "0000" and enable_n='0' ELSE --0
				"1001111"  	when numC = "0001" and enable_n='0' ELSE --1
				"0010010" 	when numC = "0010" and enable_n='0' ELSE --2
				"0000110"	when numC = "0011" and enable_n='0' ELSE --3
				"1001100"	when numC = "0100" and enable_n='0' ELSE --4
				"0100100"	when numC = "0101" and enable_n='0' ELSE --5
				"0100000"	when numC = "0110" and enable_n='0' ELSE --6
				"0001111"	when numC = "0111" and enable_n='0' ELSE --7
				"0000000"	when numC = "1000" and enable_n='0' ELSE --8
				"0000100"	when numC = "1001" and enable_n='0' ELSE --9
				"0000001";
end sol;