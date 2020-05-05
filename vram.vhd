-- Behavioural implementation of VDP Video Ram
-- Provides warning errors of RAM timing parameters
-- are not met
-- Thomas Clarke, 2001
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;



ENTITY vram IS
   PORT(
      data   : INout  STD_LOGIC_VECTOR(15 DOWNTO 0);
      address  : IN  STD_LOGIC_vector (3 downto 0);
      reset, en : IN  STD_LOGIC;
      clk: IN STD_LOGIC
      );
END vram;


ARCHITECTURE behav OF vram IS
  type ram1 is array (3 to 15) of std_logic_vector (15 downto 0);
begin
  signal my_ram, : ram1 := (0 <= x "010f", 1 <= x"0300", others => x"0000");
  ram_process : process(en, reset, clk)
begin
  if (reset = '1') then 
    my_ram <= (0 => x"0000", others => x"0000");
  elsif (en = '0') then
    data <= my_ram (conv_int (adress) );
    if (clk'event and clk = '1') then
      my_ram (conv_int (adress)) <= data;
    end if;
  end if;
end process;

END behav;