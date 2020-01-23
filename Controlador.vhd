library ieee;
use ieee.std_logic_1164.all;
Entity Controlador is
	port(
		clock, reset, start: in std_logic;
		LM324, LM35, N3904: in std_logic;
		dinero,consultar, ok50, ok10, okx: in std_logic;
		estados: out std_logic_vector(4 downto 0);
		m1,m2,m3,En324,En35,En3904,encount5,encount1,sel, reset324, reset35,reset3904, reset5, reset1: out std_logic);
end Controlador;

Architecture solution of Controlador is
Type estado is (ta,tb,tc,td,te,tf,tg,th,ti,tj,tk,tm,tn,tp,tq,tr,ts, tt, tu, tv);
signal y:estado;
signal formato_salidas: std_logic_vector(8 downto 0);
signal reset_salidas: std_logic_vector(4 downto 0);
Begin 
	
	m1<=formato_salidas(0);m2<=formato_salidas(1);m3<=formato_salidas(2);En35<=formato_salidas(3);En324<=formato_salidas(4);En3904<=formato_salidas(5);sel<=formato_salidas(6);encount5<=formato_salidas(7);encount1<=formato_salidas(8);
	reset324<=reset_salidas(1); reset35<=reset_salidas(0);reset3904<=reset_salidas(2); reset5<=reset_salidas(3);reset1<=reset_salidas(4);
	process(clock,reset)
	Begin	
		if reset='0' then y <= ta;
		elsif(clock'event and clock='1') then 
		case y is
			when ta => if start ='1' then y<=tb;else y<=ta; end if;
			when tb => if start ='0' then y<=tc;else y<=tb; end if;
			when tc => if LM35 ='1' then y<=td;
			elsif LM324='1' then y<=te;
			elsif N3904='1' then y<=tf;
			elsif consultar='1' then y<=tg;
			else y<=tc; end if;
			when td => if LM35='0' then y<=th;
				else y<=td; end if;
			when te => if LM324='0' then y<=ti;
				else y<=te; end if;
			when tf => if N3904='0' then y<=tj;
				else y<=tf; end if;
			when tg => if 	consultar='0' then y<=tk;
				else y<=tg; end if;
			when th => if dinero='1' then y<=tm;
				else y<=th; end if;
			when ti => if dinero='1' then y<=tn;
				else y<=ti; end if;
			when tj => if dinero='1' then y<=tp;
				else y<=tj; end if;
			when tp => if dinero='0' then y<=tq;
				else y<=tp; end if;
			when tm => if dinero='0' then y<=ts;
				else y<=tm; end if;
			when tn => if dinero='0' then y<=tr;
				else y<=tn; end if;
			when tk => if ok50='1' then y<=ta;
				else y<=tk; end if;
			when ts => if okx='1' then y<=tt;
				else y<=ts; end if;
			when tr => if okx='1' then y<=tu;
				else y<=tr; end if;
			when tq => if okx='1' then y<=tv;
				else y<=tq; end if;
		
		
			when tt => if ok10='1' then y<=tc;
				else y<=tt; end if;
			when tu => if ok10='1' then y<=tc;
				else y<=tu; end if;
			when tv => if ok10='1' then y<=tc;
				else y<=tv; end if;
				
		end case;
		end if;
	end Process;
	process(y)
	begin 
		formato_salidas<="000000000";
		reset_salidas<="00000";
		if reset='0'then reset_salidas<="11111";
		else 
			case y is 
			when ta=>estados<="00000"; reset_salidas<="11111";
			when tb=>estados <="00001";
			when tc=>estados <= "00010"; formato_salidas<="000000000"; reset_salidas<="11000";
			when td=>estados <= "00011";
			when te=>estados <= "00100";
			when tf=>estados<="00101";
			when tg=>estados <= "00110";
			when th=>estados <= "00111";
			when ti=>estados <= "01000";
			when tj=>estados<="01001";
			when tk=>formato_salidas<="011000000";estados<="01010";
			when tm=>estados <= "01011";
			when tn=>estados<="01100";
			when tp=>estados<="01101";
			when tq=>formato_salidas<="100100100";estados <= "01110";
			when tr=>formato_salidas<="100010001";estados <="01111";
			when ts=>formato_salidas<="100001010";estados<="10000";
			
			when tt=>formato_salidas<="100000100";estados <= "01110";
			when tu=>formato_salidas<="100000001";estados <="01111";
			when tv=>formato_salidas<="100000010";estados<="10000";
			
		end case;
		end if;
	end process;
end solution;