LIBRARY ieee;
use ieee.std_logic_1164.all;

entity data_transfer is
  port (D0,D1,D2,D3,K1,K2,K3,K: IN std_logic;
		E1_0,E1_1,E1_2,Enable1,E2_0, E2_1,E2_2,Enable2: IN std_logic;
        fD0, fD1, fD2, fD3, fK1, fK2, fK3, fK: INOUT std_logic);
end data_transfer;

ARCHITECTURE behav OF data_transfer IS
COMPONENT desif_3_8_en
  port (a0,a1,a2,EN: IN std_logic;
        q0, q1, q2, q3, q4, q5, q6, q7: INOUT std_logic);
END COMPONENT;
SIGNAL q10,q11,q12,q13,q14,q15,q16,q17: std_logic;
SIGNAL q20,q21,q22,q23,q24,q25,q26,q27: std_logic;
BEGIN

  desif1: desif_3_8_en
    PORT MAP(E1_0,E1_1,E1_2,Enable1,q10,q11,q12,q13,q14,q15,q16,q17);
  desif2: desif_3_8_en
	PORT MAP(E2_0,E2_1,E2_2,Enable2,q20,q21,q22,q23,q24,q25,q26,q27);

  fD0 <= not(not(D0 XOR q10) XOR q20);
  fD1 <= not(not(D1 XOR q11) XOR q21);
  fD2 <= not(not(D2 XOR q12) XOR q22);
  fD3 <= not(not(D3 XOR q13) XOR q23);
  fK1 <= not(not(K1 XOR q14) XOR q24);
  fK2 <= not(not(K2 XOR q15) XOR q25);
  fK3 <= not(not(K3 XOR q16) XOR q26);
  fK <= not(not(K XOR q17) XOR q27);
	
END behav;

