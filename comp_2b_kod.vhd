LIBRARY ieee;
use ieee.std_logic_1164.all;

entity comp_2b_kod is
  port (x0,x1,y0,y1: IN std_logic;
        XMY, XLY, XEY: INOUT std_logic);
end comp_2b_kod;

architecture behav of comp_2b_kod is
signal x0ey0, x1ey1, x0ly0, x1ly1, x0my0, x1my1: std_logic;
begin
  process (x0, x1, y0, y1)
  begin
	x0ey0 <= not(x0 xor y0);
	x1ey1 <= not(x1 xor y1);
	x0ly0 <= (not x0) and y0;
	x1ly1 <= (not x1) and y1;
	x0my0 <= x0 and (not y0);
	x1my1 <= x1 and (not y1);
	
	XEY <= x0ey0 and x1ey1;
	XLY <= x1ly1 or (x1ey1 and x0ly0);
	XMY <= x1my1 or (x1ey1 and x0my0);
  end process;
end behav; 


