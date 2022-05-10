----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 09:55:42
-- Design Name: 
-- Module Name: clockDivider_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockDivider_tb is

end clockDivider_tb;


architecture Behavioral of clockDivider_tb is
component clockDivider
Port (
       clock_i : in STD_LOGIC;
       clock_o : out STD_LOGIC;
       reset_i : in STD_LOGIC);
      end component;

  signal clock_i: std_logic;
  signal clock_o: std_logic;
  signal reset_i: std_logic ;

  constant clock_period: time := 10 ns;


begin

  uut: clockDivider port map ( clock_i => clock_i,
                               clock_o => clock_o,
                               reset_i => reset_i );


stimulus: process
  begin
  
    -- Put initialisation code here

reset_i<='1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
    -- Put test bench stimulus code here


    wait;
  end process;

  clocking: process
  begin
  clock_i <= '0';
  wait for clock_period / 2;
  clock_i <= '1';
  wait for clock_period / 2;
  
--    while not stop_the_clock loop
--      clock_i <= '0', '1' after clock_period / 2;
--      wait for clock_period;
--    end loop;
--    wait;
  end process;

end;
--end Behavioral;
