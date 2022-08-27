

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Sumador is
	generic ( n: integer := 17);--<------- nbits
	port(
		Potencia_S: in std_logic_vector(n downto 0);
		Acumulado: in std_logic_vector(n downto 0);
		Suma: out std_logic_vector(n downto 0));
end sumador;

--Architecture
architecture solve of sumador is
	-- Signals,Constants,Variables,Components
	begin
		Suma<=((Potencia_s)+(acumulado));--Without the sign bit
end solve;