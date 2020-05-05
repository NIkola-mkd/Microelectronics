LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comp_4b_kod IS
  PORT(x0,x1,x2,x3: IN std_logic;
	   y0,y1,y2,y3: IN std_logic;
	   XMY, XLY, XEY: INOUT std_logic);
END comp_4b_kod;

ARCHITECTURE behav OF comp_4b_kod IS
COMPONENT comp_2b_kod
  port (x0,x1,y0,y1: IN std_logic;
        XMY, XLY, XEY: INOUT std_logic);
END COMPONENT;
SIGNAL xmy1, xly1, xey1, xmy0, xly0, xey0: std_logic;
BEGIN

  c1: comp_2b_kod
	PORT MAP(x2,x3,y2,y3,xmy1,xly1,xey1);
  c2: comp_2b_kod
	PORT MAP(x0,x1,y0,y1,xmy0,xly0,xey0);
  
  XMY <= xmy1 or (xey1 and xmy0);
  XLY <= xly1 or (xey1 and xly0);
  XEY <= xey1 and xey0;

END behav;
