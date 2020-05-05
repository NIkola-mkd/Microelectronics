LIBRARY ieee; 
use ieee.std_logic_1164.all;

entity hamming_4b is
  port (D0,D1,D2,D3: IN std_logic;
		E1_0,E1_1,E1_2,Enable1,E2_0, E2_1,E2_2,Enable2: IN std_logic;
        fD0, fD1, fD2, fD3, DBL_ERR, ONE_ERR: INOUT std_logic);
end hamming_4b;

ARCHITECTURE behav OF hamming_4b IS
COMPONENT coder_4b
  port (D0,D1,D2,D3: IN std_logic;
        fD0,fD1,fD2,fD3,K1,K2,K3,K: INOUT std_logic);
END COMPONENT;
COMPONENT data_transfer
  port (D0,D1,D2,D3,K1,K2,K3,K: IN std_logic;
		E1_0,E1_1,E1_2,Enable1,E2_0, E2_1,E2_2,Enable2: IN std_logic;
        fD0, fD1, fD2, fD3, fK1, fK2, fK3, fK: INOUT std_logic);
END COMPONENT;
COMPONENT dekoder_4b
  port (D0,D1,D2,D3,K1,K2,K3,K: IN std_logic;
        fD0, fD1, fD2, fD3, DBL_ERR, ONE_ERR: INOUT std_logic);
END COMPONENT;
SIGNAL cd0,cd1,cd2,cd3,ck1,ck2,ck3,ck: std_logic;
SIGNAL ed0,ed1,ed2,ed3,ek1,ek2,ek3,ek: std_logic;
BEGIN

  coder: coder_4b
    PORT MAP(D0,D1,D2,D3,cd0,cd1,cd2,cd3,ck1,ck2,ck3,ck);
  transfer: data_transfer
	PORT MAP(cd0,cd1,cd2,cd3,ck1,ck2,ck3,ck,
	         E1_0,E1_1,E1_2,Enable1,E2_0, E2_1,E2_2,Enable2,
			 ed0,ed1,ed2,ed3,ek1,ek2,ek3,ek);
  decoder: dekoder_4b
	PORT MAP(ed0,ed1,ed2,ed3,ek1,ek2,ek3,ek,
			fD0, fD1, fD2, fD3, DBL_ERR, ONE_ERR);
END behav;
