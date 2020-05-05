LIBRARY ieee;
use ieee.std_logic_1164.all;
entity ram_4b is
  port (A0, A1, D, C : IN std_logic;
        Q : OUT std_logic);
end ram_4b;

architecture behav of ram_4b is
signal d0,d1,d2,d3: std_logic := '0';

begin

process (A0,A1,D,C)
  begin

    if A1='0' and A0='0' then
      if C='1' then
        d0 <= D;
	  end if;
	  Q <= d0;

    elsif A1='0' and A0='1' then
      if C='1' then
        d1 <= D;
	  end if;
	  Q <= d1;
    elsif A1='1' and A0='0' then
      if C='1' then
        d2 <= D;
	  end if;
	  Q <= d2;

    elsif A1='1' and A0='1' then
      if C='1' then
        d3 <= D;
	  end if;
	  Q <= d3;
    end if;

  end process;
end behav;  
