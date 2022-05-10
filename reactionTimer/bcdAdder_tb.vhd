
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity bcdAdder_tb is
end;

architecture bench of bcdAdder_tb is

  component bcdAdder
  Port (
      clock_i : in std_logic;
      counter_o : out unsigned(3 downto 0);
      reset_i : in std_logic;
      counter2_o : out unsigned (3downto 0)
  );
  end component;

  signal clock_i: std_logic;
  signal counter_o: unsigned(3 downto 0);
  signal reset_i: std_logic ;
  signal counter2_o: unsigned(3 downto 0);
  constant clock_period: time := 10 ns;
--  signal stop_the_clock: boolean;

begin

  uut: bcdAdder port map ( clock_i   => clock_i,
                           counter_o => counter_o,
                           reset_i   => reset_i,
                           counter2_o => counter2_o );

  stimulus: process
  begin
  
    -- Put initialisation code here
reset_i<='1' after 10 ns, '0' after 20 ns, '1' after 30 ns;

    -- Put test bench stimulus code here

--    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
  clock_i <= '0';
  wait for clock_period / 2;
  clock_i <= '1';
  wait for clock_period / 2;
  end process;

end;