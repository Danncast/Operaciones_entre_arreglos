


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--Entity
entity RAM_c is
	--generic ( n: integer := 99);--<------- nbits
	port(
	     Direccion : in std_logic_vector ( 7 downto 0 );
		  clock: in STD_logic ;
		 -- clkrd: in STD_logic ;
		  Wren: in STD_logic ;
		  data : in std_logic_vector (7 downto 0);
		  q : out std_logic_vector (7 downto 0));
		
end RAM_c;

--Architecture
architecture solve of RAM_c is
   type matrix is array (0 to 99) of std_logic_vector(7 downto 0);
	signal memory : matrix ;
	attribute ram_init_file : string;
	attribute ram_init_file of memory : signal is "CORRIENTE.mif";
	
	signal Datain : std_logic_vector (7 downto 0);
	signal Direccescr :  std_logic_vector ( 7 downto 0 );
	signal Direcclec :  std_logic_vector ( 7 downto 0 );

begin
	--Process #1
	process(clock)
	--Sequential programming
		begin
			if ( clock 'event and clock = '1' and wren = '1') then
			     datain <= data;
				  direccescr <= direccion ;
				  memory(to_integer(unsigned(direccescr)))<=datain;
		   end if ;
end process;
	 
	 process (clock)
	 begin
	 if ( clock 'event and clock = '1') then
			     direcclec <= direccion;
				 q <= memory(to_integer(unsigned(direcclec)));
		   end if ;
end process;
	 
end solve;