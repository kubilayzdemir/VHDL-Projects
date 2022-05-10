----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 11:02:15
-- Design Name: 
-- Module Name: bcdAdder - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcdAdder is
--  Port ( );
Port (
    clock_i : in std_logic;
    enable_i : in std_logic;
    counter_o : out unsigned(3 downto 0);
    counter2_o : out unsigned(3 downto 0);
    reset_i : in std_logic
);
end bcdAdder;

architecture Behavioral of bcdAdder is

signal cntr : unsigned(3 downto 0);
signal cntr2 : unsigned(3 downto 0);

begin

process (clock_i,reset_i)
    begin 
        if(reset_i = '1') then 
            cntr <= "0000";
            cntr2 <= "0000";
        elsif ( clock_i = '1' and clock_i'event and enable_i = '1') then
            if cntr = "1001" then
                cntr <= "0000";
                if cntr2 = "1001" then
                    cntr2 <= "0000";
                else
                    cntr2 <= cntr2 + 1;
                end if;
            else
                cntr <= cntr + 1;
            end if;
         end if;
         counter_o <= cntr;
         counter2_o <= cntr2;
end process;        
          
end Behavioral;
