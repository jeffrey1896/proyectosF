-- Decodificador BCD para display de leds.
library IEEE;
use IEEE.std_logic_1164.all;

entity decoderBCD4to7segments is
    port (
        a : out std_logic_vector(6 downto 0);
        x : in std_logic_vector (3 downto 0)
    );
end entity;

architecture arch of decoderBCD4to7segments is
begin

    -- Decodificamos..
    process (x)
        variable auxVectOut : std_logic_vector (6 downto 0);
        variable auxVectIn : std_logic_vector (3 downto 0);
    begin

        -- Cargamos entradas al vector auxiliar.
        auxVectIn(3) := x(3);
        auxVectIn(2) := x(2);
        auxVectIn(1) := x(1);
        auxVectIn(0) := x(0);

        if auxVectIn = "0000" then auxVectOut := "1111110"; -- 0
        elsif auxVectIn = "0001" then auxVectOut := "0110000"; -- 1
        elsif auxVectIn = "0010" then auxVectOut := "1101101"; -- 2
        elsif auxVectIn = "0011" then auxVectOut := "1111001"; -- 3
        elsif auxVectIn = "0100" then auxVectOut := "0110011"; -- 4
        elsif auxVectIn = "0101" then auxVectOut := "1011011"; -- 5
        elsif auxVectIn = "0110" then auxVectOut := "1011111"; -- 6
        elsif auxVectIn = "0111" then auxVectOut := "1110000"; -- 7
        elsif auxVectIn = "1000" then auxVectOut := "1111111"; -- 8
        elsif auxVectIn = "1001" then auxVectOut := "1110011"; -- 9
        else auxVectOut := "UUUUUUU";
        end if;

        -- Cargamos salidas al vector auxiliar.
        a <= auxVectOut;
        
    end process;

end architecture;