
library ieee;
use ieee.std_logic_1164.all;


entity Registro_sos is
	generic ( n: integer := 17);--<-- nbits
	port(
		Clk,reset_reg,en_regsum: in std_logic;
		suma: in std_logic_vector(n downto 0);--SUMA
		acumulado: out std_logic_vector(n downto 0));
end Registro_sos;

--Architecture
architecture solve of Registro_sos is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(reset_reg,en_regsum)
	--Sequential programming
		begin
			if reset_reg='1' then
				acumulado<=(others => '0');
			elsif clk'event and clk='1' then
				if en_regsum='1' then
					acumulado<=suma;
				end if;
			end if;
	end process;
	--Process #n...
end solve;