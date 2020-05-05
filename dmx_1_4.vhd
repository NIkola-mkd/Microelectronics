LIBRARY ieee;
use ieee.std_logic_1164.all;

entity dmx_1_4 is
  port (x0,x1,E: IN std_logic;
        f0,f1,f2,f3: INOUT std_logic);
end dmx_1_4;

architecture behav of dmx_1_4 is
begin
  process (x0,x1,E)
  begin
	f0 <= (not x1) and (not x0) and E;
	f1 <= (not x1) and x0 and E;
	f2 <= (not x0) and x1 and E;
	f3 <= x0 and x1 and E;
  end process;
end behav; 


