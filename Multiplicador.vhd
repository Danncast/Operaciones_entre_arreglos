


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Multiplicador is
	generic ( n: integer := 8);--<------- nbits
	port(
	   enMultiplicacion , reset : in std_logic ;
		Corriente, Voltaje : in std_logic_vector(n-1 downto 0); -- 7 voltaje/ 7 corriente
		Potencia: out std_logic_vector(2*n-1 downto 0)); --14 bits
end Multiplicador;

--Architecture
architecture solve of Multiplicador is
	-- Signals,Constants,Variables,Components
	begin
	
	process(enMultiplicacion , reset)
	    begin
	         if reset ='0' and enMultiplicacion ='1' then
		          Potencia <= Corriente*Voltaje;
	 end if ;
end process;
end solve;