

library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity RAM_potencia is 
	generic(n: integer:= 17);-- n-bits per data

	port(
		clk,wr , reset: in std_logic; 
		addr : in std_logic_vector(7 downto 0); 
		Din : in std_logic_vector( n downto 0);
		Dout : out std_logic_vector(n downto 0)); 
end RAM_potencia;

--Architecture
architecture solve of RAM_potencia is
	-- Signals,Constants,Variables,Components	
	type ram_type is array (0 to 99 ) of std_logic_vector(n downto 0); 
	signal tmp_ram: ram_type; 
	begin
	--Process #1:
	process(clk,wr)
	--Sequential programming
		begin 
			if (clk'event and clk='1') then 
				if wr='1' then --write
					tmp_ram(conv_integer(addr)) <= Din; 
				end if; 
			end if; 
	end process; 
	Dout <= tmp_ram(conv_integer(addr));--read
	--Process #n...
end solve;