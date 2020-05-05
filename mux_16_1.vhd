LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_16_1 IS
  PORT(x0,x1,x2,x3,x4,x5,x6,x7,x8: IN std_logic;
	   x9,x10,x11,x12,x13,x14,x15: IN std_logic;
	   a0,a1,a2,a3,enable: IN std_logic;
	   output:INOUT std_logic);
END mux_16_1;

ARCHITECTURE behav OF mux_16_1 IS
COMPONENT mux_4_1
  port (x0,x1,x2,x3,a0,a1,enable: IN std_logic;
        output: INOUT std_logic);
END COMPONENT;
SIGNAL o1, o2, o3, o4: std_logic;
BEGIN
  mux1: mux_4_1
	PORT MAP(x0,x1,x2,x3,a0,a1,enable,o1);
  mux2: mux_4_1
	PORT MAP(x4,x5,x6,x7,a0,a1,enable,o2);
  mux3: mux_4_1
	PORT MAP(x8,x9,x10,x11,a0,a1,enable,o3);
  mux4: mux_4_1
	PORT MAP(x12,x13,x14,x15,a0,a1,enable,o4);
  mux5: mux_4_1
	PORT MAP(o1,o2,o3,o4,a2,a3,enable,output);
END behav;
