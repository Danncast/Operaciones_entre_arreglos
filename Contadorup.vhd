

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Contadorup is
	generic ( n: integer :=7);--<------- nbits
	port(
		Clk,resetCntup,encnt: in std_logic;
		Addr: buffer std_logic_vector(n-1 downto 0));
end Contadorup;

--Architecture
architecture solve of Contadorup is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(resetcntup,clk)
	--Sequential programming
		begin
			if resetcntup='1' then
				Addr <=(others => '0');
			elsif clk'event and clk='1' then
				if encnt='1' then Addr<=Addr+1;
				end if;
			end if;
	end process;
	--Process #n...
end solve;