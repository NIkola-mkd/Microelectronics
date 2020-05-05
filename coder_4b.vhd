LIBRARY ieee;
use ieee.std_logic_1164.all;

entity coder_4b is
  port (D0,D1,D2,D3: IN std_logic;
        fD0,fD1,fD2,fD3,K1,K2,K3,K: INOUT std_logic);
end coder_4b;

ARCHITECTURE behav OF coder_4b IS
BEGIN
  fD0 <= D0;
  fD1 <= D1;
  fD2 <= D2;
  fD3 <= D3;
  K1 <= D0 XOR D1 XOR D3;
  K2 <= D0 XOR D2 XOR D3;
  K3 <= D1 XOR D2 XOR D3;
  K <= K1 XOR K2 XOR D0 XOR K3 XOR D1 XOR D2 XOR D3;
	
END behav;


