library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is 
port( clk:    in std_logic;
      reset:  in std_logic;
      enable: in std_logic;
      count:  out std_logic_vector(7 downto 0)
);
end counter;

architecture behav of counter is      
  signal pre_count: std_logic_vector(7 downto 0);
begin
  process(clk, reset, enable)
  begin
    if reset = '1' then
      pre_count <= "00000000";
    elsif (clk='1' and clk'event) then
      if enable = '1' then
        pre_count <= pre_count + "1";
      end if;
    end if;
  end process;  
  count <= pre_count;
end behav;
