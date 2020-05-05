LIBRARY ieee;
use ieee.std_logic_1164.all;

entity sifr_8_3 is
  port (r0,r1,r2,r3,r4,r5,r6,r7, ei: IN std_logic;
        a0, a1, a2, eo, g: INOUT std_logic);
end sifr_8_3;

architecture behav of sifr_8_3 is
begin
  process (r0,r1,r2,r3,r4,r5,r6,r7,ei)
  begin
    a2 <= (r7 or r6 or r5 or r4) and ei;
    a1 <= (r7 or r6 or ((not r5) and (not r4) and r3) or 
		   ((not r5) and (not r4) and r2)) and ei;
    a0 <= (r7 or ((not r6) and r5) or ((not r6) and (not r4) and r3) or
		   ((not r6) and (not r4) and (not r2) and r1)) and ei;
	eo <= ((not r7) and (not r6) and (not r5) and (not r4) and 
		    (not r3) and (not r2) and (not r1) and (not r0) and ei);
	g <= (r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7) and ei;
  end process;
end behav; 

