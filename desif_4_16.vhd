LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY desif_4_16 IS
  PORT(a0,a1,a2,a3: IN std_logic;
	   q0,q1,q2,q3,q4,q5,q6,q7:INOUT std_logic;
	   q8,q9,q10,q11,q12,q13,q14,q15:INOUT std_logic);
END desif_4_16;

ARCHITECTURE behav OF desif_4_16 IS
COMPONENT desif_3_8
  PORT(a0,a1,a2:IN std_logic;
	   q0,q1,q2,q3,q4,q5,q6,q7:INOUT std_logic);
END COMPONENT;
SIGNAL d1q0, d2q0: std_logic;
SIGNAL fa0, fa1, fa2: std_logic;
SIGNAL ga0, ga1, ga2: std_logic;
BEGIN
  fa0 <= a0 and (not a3);
  fa1 <= a1 and (not a3);
  fa2 <= a2 and (not a3);

  d1: desif_3_8 
    PORT MAP(fa0, fa1, fa2, d1q0, q1, q2, q3, q4, q5, q6, q7);
  
  q0 <= d1q0 or a3;

  ga0 <= a0 and a3;
  ga1 <= a1 and a3;
  ga2 <= a2 and a3;

  d2: desif_3_8
	PORT MAP(ga0, ga1, ga2, d2q0, q9, q10, q11, q12, q13, q14, q15);

  q8 <= d2q0 or (not a3);
END behav;


