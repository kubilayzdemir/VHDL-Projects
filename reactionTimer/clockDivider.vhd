----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 09:32:20
-- Design Name: 
-- Module Name: clockDivider - Behavioral
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

entity clockDivider is
--  Port ( );
    Port (
    clock_i : in std_logic;
    clock_o : out std_logic;
    reset_i : in std_logic
    );
end clockDivider;

architecture Behavioral of clockDivider is

signal counter : integer;
signal ctrl : std_logic;
begin
--counter <= 0;

process (clock_i,reset_i)
begin
    if (reset_i = '1') then
    -- resetle her þey 0     
    counter <= 0;
    ctrl <= '1';
    elsif ( clock_i = '1' and clock_i'event) then
    -- counter arttir
        if counter = 100000 then
            counter <= 0;
            ctrl <= not ctrl;        
           -- clock_o <= '1';
       else
        counter <= counter + 1;
  
        end if;
        
    end if;
clock_o <= ctrl;    
end process;


end Behavioral;

