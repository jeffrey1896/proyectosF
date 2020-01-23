library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity binario_bcd is
    PORT(
        num_bin: in  STD_LOGIC_VECTOR(8 downto 0);
        num_bcd: out STD_LOGIC_VECTOR(3 downto 0);
		  num_bcd2: out STD_LOGIC_VECTOR(3 downto 0);
		  num_bcd3: out STD_LOGIC_VECTOR(2 downto 0));
end binario_bcd;
 
architecture Behavioral of binario_bcd is
begin
    proceso_bcd: process(num_bin)
        variable z: STD_LOGIC_VECTOR(19 downto 0);
    begin
        -- Inicialización de datos en cero.
        z := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z(11 downto 3) := num_bin;
        for i in 0 to 5 loop
            -- Unidades (4 bits).
            if z(12 downto 9) > 4 then
                z(12 downto 9) := z(12 downto 9) + 3;
            end if;
            -- Decenas (4 bits).
            if z(16 downto 13) > 4 then
                z(16 downto 13) := z(16 downto 13) + 3;
            end if;
            -- Centenas (3 bits).
            if z(19 downto 17) > 4 then
                z(19 downto 17) := z(19 downto 17) + 3;
            end if;
            -- Corrimiento a la izquierda.
            z(19 downto 1) := z(18 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        num_bcd <= z(12 downto 9);
		  num_bcd2 <= z(16 downto 13);
		  num_bcd3 <= z(19 downto 17);
    end process;
end Behavioral;