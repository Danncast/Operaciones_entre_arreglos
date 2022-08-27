

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--Entity
entity Divisor is 
       generic (  n: integer :=17);
port(
   en_divisor , reset : in std_logic ;
   Suma , Q : in std_logic_vector( n downto 0);
	potencia_promedio : out std_logic_vector( n-1 downto 0));
end Divisor ;

--Architecture
 architecture solutio of Divisor is
 begin 
	
	process(en_divisor, reset)
	    begin
		 
		 if reset ='0' and en_divisor ='1' then
 potencia_promedio <= std_logic_vector (to_unsigned(to_integer(unsigned(suma))/ to_integer(unsigned(q)),17));
 
  end if ;
end process;
 end solutio ;