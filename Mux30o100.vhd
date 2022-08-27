
--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Mux30o100 is
	generic ( n: integer:=7);--<-- nbits
	port (
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		
		--sel : in std_logic_vector(1 downto 0);
		sel: in std_logic;
		Q : out std_logic_vector(n-1 downto 0));
end Mux30o100;

--Architecture
architecture solve of Mux30o100 is
	-- Signals,Constants,Variables,Components
	signal f: std_logic_vector(n-1 downto 0);
	begin
		with sel select 
		f<= A when '1',  --selecciona el 30
			 B when '0';  --seleccion el 100
			 
		Q<= f ;	 
end solve;