library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_tb is
end;

architecture bench of top_tb is

  component top
  generic (
  c_clkfreq   : integer := 100_000_000
  );
  Port (
      switch  : in std_logic;
      clock_i : in std_logic;
      sevseg_o : out unsigned (7 downto 0);
      reset   : in std_logic;
      anodes_o : out std_logic_vector (7 downto 0);
      led_o   : out std_logic
  );
  end component;

  signal switch: std_logic;
  signal clock_i: std_logic;
  signal sevseg_o: unsigned (7 downto 0);
  signal reset: std_logic;
  signal anodes_o: std_logic_vector (7 downto 0);
  signal led_o: std_logic ;

  constant clock_period: time := 1 ms;
  constant clock_period_my: time := 10 ns;

begin

  -- Insert values for generic parameters !!
  uut: top generic map ( c_clkfreq =>  100_000_000)
              port map ( switch    => switch,
                         clock_i   => clock_i,
                         sevseg_o  => sevseg_o,
                         reset     => reset,
                         anodes_o  => anodes_o,
                         led_o     => led_o );

  stimulus: process
  begin
    reset <= '1';
    wait for 2ms;
    reset <= '0';
    switch <= '1';
    wait for 20ms;
    reset <= '1';
    wait for 10ms;
    switch <= '0';
    wait for 20ms;
    switch <= '1';
    wait for 20ms;
    switch <= '0';
    -- Put initialisation code here


    -- Put test bench stimulus code her
    wait;
  end process;

  clocking: process
  begin
      clock_i <= '0', '1' after clock_period_my / 2;
      wait for clock_period_my;
  end process;

end;