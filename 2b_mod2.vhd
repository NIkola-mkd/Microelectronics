LIBRARY ieee;
use ieee.std_logic_1164.all;

entity 2b_mod2 is
  port (x0,x1,D IN std_logic;
        E, O: INOUT std_logic);
end 2b_mod2;

architecture behav of 2b_mod2 is
signal m2: std_logic;
begin
  m2 <= (x0 xor x1) xor D;
  O <= m2;
  E <= (not m2);
end behav; 


