library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
 
--Entity
entity DecoBCD_7segmentos is
   port(
		BCD: in std_logic_vector(3 downto 0);
		SEG7: out std_logic_vector(6 downto 0));
end DecoBCD_7segmentos;

--Architecture
architecture solve of DecoBCD_7segmentos	 is
	-- Signals,Constants,Variables,Components
	 begin
		SEG7 <=	"1111110"	when BCD = "0000" ELSE
			"0110000"  	when BCD = "0001" ELSE 
			"1101101" 	when BCD = "0010" ELSE 
			"1111001"	when BCD = "0011" ELSE 
			"0110011"	when BCD = "0100" ELSE 
			"1011011"	when BCD = "0101" ELSE --5 
			"1011111"	when BCD = "0110" ELSE 
			"1110000"	when BCD = "0111" ELSE 
			"1111111"	when BCD = "1000" ELSE 
			"1110011"	when BCD = "1001" ELSE 
			"0000000" ; 
		----ABCDEFG	
end solve;