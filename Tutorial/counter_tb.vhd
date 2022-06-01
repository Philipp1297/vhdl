library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all; 

entity counter_tb is
end;

architecture counter_tb of counter_tb is

component counter
  port ( clk   : in std_logic;
         reset : in std_logic;
         enable: in std_logic;
         count : out std_logic_vector(7 downto 0));
end component ;

signal clk    : std_logic := '0';
signal reset  : std_logic := '0';
signal enable : std_logic := '0';
signal count  : std_logic_vector(7 downto 0);

begin

  dut : counter 
  port map (
    clk    => clk,
    reset  => reset,
    enable => enable,
    count  => count );

  clock : process
  begin
     wait for 1 ns; clk <= not clk;
  end process clock;

  stimulus : process
  begin
    wait for 2 ns; reset  <= '1';
    wait for 2 ns; reset  <= '0';
    wait for 4 ns; enable <= '1';
    wait;
  end process stimulus;

  monitor : process (clk)
  variable c_str : line;
  begin
    if (clk = '1' and clk'event) then
      write(c_str,count);
      assert false report time'image(now) & 
        ": Current Count Value : " & c_str.all
      severity note;
      deallocate(c_str);
    end if;
  end process monitor;

end counter_tb;
