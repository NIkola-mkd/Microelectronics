library ieee;
use ieee.std_logic_1164.all;
entity shift_reg is
  port (clk, data, reset: IN std_logic;
        q: OUT std_logic);
end shift_reg;

architecture behav of shift_reg is
  signal rs: std_logic_vector (3 downto 0);
begin
 process (clk,reset)
 begin
  if reset='0' then rs<="0000";
  elsif (clk'event and clk='1') then rs <= data & rs(3 downto 1);
  end if;
 end process;
 q<=rs(0);
end behav;