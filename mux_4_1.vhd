LIBRARY ieee;
use ieee.std_logic_1164.all;

entity mux_4_1 is
  port (x0,x1,x2,x3,a0,a1,enable: IN std_logic;
        output: INOUT std_logic);
end mux_4_1;

architecture behav of mux_4_1 is
signal n1, n2, n3, n4, and4: std_logic;
begin
  process (x0,x1,x2,x3,a0,a1,enable)
  begin
	n1 <= not(x0 and (not a0) and (not a1));
	n2 <= not(x1 and (not a1) and a0);
	n3 <= not(x2 and (not a0) and a1);
	n4 <= not(x3 and a1 and a0);
	and4 <= n1 and n2 and n3 and n4;
	output <= and4 and enable;
  end process;
end behav; 

