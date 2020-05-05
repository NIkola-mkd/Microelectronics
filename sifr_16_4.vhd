LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sifr_16_4 IS
  PORT(r0,r1,r2,r3,r4,r5,r6,r7: IN std_logic;
	   r8,r9,r10,r11,r12,r13,r14,r15, ei: IN std_logic;
	   a0,a1,a2,a3,g:INOUT std_logic);
END sifr_16_4;

ARCHITECTURE behav OF sifr_16_4 IS
COMPONENT sifr_8_3
  port (r0,r1,r2,r3,r4,r5,r6,r7, ei: IN std_logic;
        a0, a1, a2, eo, g: INOUT std_logic);
END COMPONENT;
SIGNAL s1a0, s1a1, s1a2, s1g, s1eo: std_logic;
SIGNAL s2a0, s2a1, s2a2, s2g, s2eo: std_logic;
BEGIN

  d2: sifr_8_3
    PORT MAP(r8,r9,r10,r11,r12,r13,r14,r15,ei,
			 s2a0,s2a1,s2a2,s2eo,s2g);
  d1: sifr_8_3
	PORT MAP(r0,r1,r2,r3,r4,r5,r6,r7,ei,
		     s1a0,s1a1,s1a2,s1eo,s1g);
	
  a0 <= s1a0 or s2a0;
  a1 <= s1a1 or s2a1;
  a2 <= s1a2 or s2a2;
  a3 <= s2g and not s1g;
  g <= s1g or s2g;
END behav;
