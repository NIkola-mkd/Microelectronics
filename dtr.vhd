LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtr IS
  PORT(D: IN std_logic;
	   L: IN std_logic;
	   Q: INOUT std_logic;
	   QB: INOUT std_logic);
END dtr;

ARCHITECTURE beh OF dtr IS
COMPONENT rstr
  PORT(s: IN std_logic;
	   r: IN std_logic;
	   q: INOUT std_logic;
	   qb: INOUT std_logic);
END COMPONENT;
COMPONENT notand
  PORT(a: IN std_logic;
	   b: IN std_logic;
	   c: INOUT std_logic);
END COMPONENT;
 SIGNAL S: std_logic;
 SIGNAL R: std_logic;
BEGIN
 u1: notand
	PORT MAP(D, L, R);
 u2: notand
	PORT MAP(R, L, S);
 rs: rstr
	PORT MAP(R, S, Q, QB);
END beh;

CONFIGURATION con OF dtr IS
  FOR beh
	FOR u1,u2: notand
		USE ENTITY work.notand(beh);
	END FOR;
	FOR rs: rstr
		USE ENTITY work.rstr(beh);
	END FOR;
  END FOR;
END con;

