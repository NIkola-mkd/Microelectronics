LIBRARY ieee;
use ieee.std_logic_1164.all;

entity dekoder_4b is
  port (D0,D1,D2,D3,K1,K2,K3,K: IN std_logic;
        fD0, fD1, fD2, fD3, DBL_ERR, ONE_ERR: INOUT std_logic);
end dekoder_4b;

ARCHITECTURE behav OF dekoder_4b IS
COMPONENT desif_3_8
  port (a0,a1,a2: IN std_logic;
        q0, q1, q2, q3, q4, q5, q6, q7: INOUT std_logic);
END COMPONENT;
SIGNAL P1, P2, P3, KP:std_logic;
SIGNAL Q3, Q5, Q6, Q7: std_logic;
SIGNAL q0,q1,q2,q4: std_logic;
BEGIN

  P1 <= K1 XOR D0 XOR D1 XOR D3;
	P2 <= K2 XOR D0 XOR D2 XOR D3;
	P3 <= K3 XOR D1 XOR D2 XOR D3;
	KP <= K1 XOR K2 XOR D0 XOR K3 XOR D1 XOR D2 XOR D3 XOR K;

  desif: desif_3_8
    PORT MAP(P1, P2, P3,q0,q1,q2,Q3,q4,Q5,q6,Q7);
  
  fD0 <= not(D0 XOR Q3);
  fD1 <= not(D1 XOR Q5);
  fD2 <= not(D2 XOR Q6);
  fD3 <= not(D3 XOR Q7);
  DBL_ERR <= (P1 OR P2 OR P3) AND (not KP);
  ONE_ERR <= KP;
	
END behav;

