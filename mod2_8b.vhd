LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mod2_8b IS
  PORT(x0,x1,x2,x3,x4,x5,x6,x7,D: IN std_logic;
	   E, O: INOUT std_logic);
END mod2_8b;

ARCHITECTURE behav OF mod2_8b IS
COMPONENT mod2_2b
  port (x0,x1,D: IN std_logic;
        E, O: INOUT std_logic);
END COMPONENT;
SIGNAL e1,o1,e2,o2,e3,o3,e4,o4: STD_LOGIC;
BEGIN
  mod2_1: mod2_2b
	PORT MAP(x0,x1,x2,e1,o1);
  mod2_2: mod2_2b
	PORT MAP(x3,x4,x5,e2,o2);
  mod2_3: mod2_2b
	PORT MAP(x6,x7,D,e3,o3);
  mod2_4: mod2_2b
	PORT MAP(o1,o2,o3,e4,o4);
  E <= e4;
  O <= o4;

END behav;
