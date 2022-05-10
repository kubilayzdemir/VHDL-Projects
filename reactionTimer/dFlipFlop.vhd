----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.05.2022 14:22:35
-- Design Name: 
-- Module Name: dFlipFlop - Behavioral
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

entity dFlipFlop is
    Port ( d : in STD_LOGIC;
           q : out STD_LOGIC;
           clk : in STD_LOGIC);
end dFlipFlop;


architecture Behavioral of dFlipFlop is

begin
process (clk)
begin
    if clk'event and clk = '1' then
        q <= d;
    end if;
end process;


end Behavioral;
