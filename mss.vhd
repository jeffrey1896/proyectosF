library ieee;
use ieee.std_logic_1164.all;

entity mss is
	Port( clock, reset, start, ingresar_moneda, venta, dar_cambio: in std_logic;
			soda, vuelto: out std_logic;
			estados:	out std_logic_vector(2 downto 0));
end mss;

Architecture solucion of mss is
type estado is(Ta, Tb, Tc, Td, Te, Tf);
Signal y: estado;
Begin
	Process(clock, reset)
	Begin
		if reset='0' then y<=Ta;
		elsif (clock'event and clock='1') then
			case y is
				when Ta=> 	if start='1' then y<=Tb;
								else y<=Ta;
								end if;
				when Tb=> 	if start='1' then y<=Tb;
								else y<=Tc;
								end if;
				when Tc=> 	if ingresar_moneda='1' then y<=Td;
								else y<=Tc;
								end if;
				when Td=> 	if (venta='1' and dar_cambio='1') then y<=Te;
								elsif (venta='1' and dar_cambio='0') then y<=Tf;
								else y<=Tc;
								end if;
				when Te=> 	y<=Tc;
				when Tf=> 	y<=Tc;
			end case;
		end if;
	end Process;
	Process(y)
	Begin
		soda<='0'; vuelto<='0';estados<="000";
		case y is
			when Ta=>estados<="001";
			when Tb=>estados<="010";
			when Tc=>estados<="011";
			when Td=>estados<="100";
			when Te=> soda<='1'; vuelto<='1';estados<="101";
			when Tf=> soda<='1';estados<="110";
		end case;
	end Process;
end solucion;