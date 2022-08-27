library ieee;
use ieee.std_logic_1164.all;

entity MSS is
port ( 	Clock, Resetn: IN STD_LOGIC;
			START, btn30,btn100,AddMenor30: 	IN STD_LOGIC;
			enCnt,enMultiplicacion,W_RPotencia,En_RegSum,En_divisor,Sel,En_RegMux: OUT STD_LOGIC;
			Endispuno,Endispdos,Endisptres,Endispcuatro: OUT STD_LOGIC;
			ResetCntup,Reset_reg , resetRamPotencia,Reset_Reg_Mux : OUT STD_LOGIC;
			state1,state2,state3,state4: OUT STD_LOGIC);
end MSS;

architecture funcionamiento of MSS is
type estado is (A,B,C,D,E,F,G,H,I,J,L,M,N,K); --KLMN
signal y: estado;
begin 
	MSS_transiciones: process (Resetn, Clock)
	begin
	if Resetn='1' then y <= A;
	elsif (Clock'event and Clock ='1') then 
		case y is
		   when A => if START='1' then y <= L; else y <= A; end if;    
			When L => if btn30='1' then y<=M; else y<=k;end if;
			When K => if btn100='1' then y<=N; else y<=L;end if;
			When M => y<=B;
			When N => y<=B;
			when B => if AddMenor30='1' then y <= C;
						 else y <= E; end if;
			when C => y <= D;
			when D => y <= B;
			when E => y <= F;
			when F => y <= G;
			when G => if AddMenor30='1' then y <= H;
						 else y <= I; end if;
			when H => y <= F;
			when I => y <= J;
			when J => y <= A;
			
		end case;
	end if;
	end process;
	
	MSS_salidas: process (y, AddMenor30)
	begin
	Reset_Reg_Mux<='0';En_RegMux<='0';Sel<='0';state1<='0';state2<='0';state3<='0';state4<='0';enCnt<='0';enMultiplicacion<='0';W_RPotencia<='0';En_RegSum<='0';En_divisor<='0';ResetCntup<='0';Reset_reg<='0'; resetRamPotencia <='0';Endispuno<='0';Endispdos<='0';Endisptres<='0';Endispcuatro<='0';
		case y is
			when A => Reset_Reg_Mux<='1';Reset_reg<= '1';resetCntUp <= '1' ; resetRamPotencia <= '1' ; state1<='0';state2<='0';state3<='0';state4<='1';
			When L => state1<='0';state2<='0';state3<='1';state4<='0';	 -- estado despues del antirebote
			When K => state1<='0';state2<='0';state3<='1';state4<='1';
			When M => En_RegMux<='1';Sel<='1';state1<='0';state2<='1';state3<='0';state4<='0'; --selecciona el dato 30  --en caso de error sel pasara hacer de mas bits , por eso se lo incluye
			When N => En_RegMux<='1';Sel<='0';state1<='0';state2<='1';state3<='0';state4<='1'; -- selecciona el dato 100
			when B => state1<='0';state2<='1';state3<='1';state4<='0'; --estado 6
			when C => enMultiplicacion <= '1'; W_RPotencia <= '1'; state1<='0';state2<='1';state3<='1';state4<='1'; --estado 7
			when D => enCnt <= '1'; state1<='1';state2<='0';state3<='0';state4<='0'; --estado 8
			when E => resetCntUp <= '1'; Reset_reg<= '1'; state1<='1';state2<='0';state3<='0';state4<='1';
			when F => state1<='1';state2<='0';state3<='1';state4<='0';
			when G => en_RegSum <= '1'; state1<='1';state2<='0';state3<='1';state4<='1';
			when H => EnCnt <= '1'; state1<='1';state2<='1';state3<='0';state4<='0';
			when I => state1<='1';state2<='1';state3<='0';state4<='1';  --estado 13
			when J => en_divisor<= '1';endispuno<= '1';endispdos<= '1';endisptres<= '1';endispcuatro <= '1'; state1<='1';state2<='1';state3<='1';state4<='0';
		end case;
	end process;
end funcionamiento;