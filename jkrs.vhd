library ieee;
use ieee.std_logic_1164.all;

entity jkrs is 
  port(s,j,k,r: IN std_logic;
	   q, qi: INOUT std_logic);
end jkrs;

architecture behavior of jkrs is
begin
 process(s,j,k,r)
 begin
   if s /= r then
	 q <= r;
   end if;
   if k = '1' and j = '1' then
     q <= qi;
   end if;
   if k /= j then
     q <= j;
   end if;
   qi <= not q;
 end process;
end behavior;
