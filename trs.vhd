library ieee;
use ieee.std_logic_1164.all;

entity trs is 
  port(s,t,r: IN std_logic;
	   q, qi: INOUT std_logic);
end trs;

architecture behavior of trs is
begin
 process(s,t,r)
 begin
   if s /= r then
	 q <= r;
   end if;
   if t = '1' then
     q <= qi;
   end if;
   qi <= not q;
 end process;
end behavior;
