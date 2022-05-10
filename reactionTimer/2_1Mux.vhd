----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.05.2022 14:33:07
-- Design Name: 
-- Module Name: 2_1Mux - Behavioral
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

entity mux2_1 is
    Port ( I0 : in std_logic;
           I1 : in std_logic;
           s : in STD_LOGIC;
           outValue : out STD_LOGIC);
end mux2_1;

architecture Behavioral of mux2_1 is

begin

    process(I0,I1,S)
    begin
        case (S) is
        when '0' => outValue <= I0;
        when '1' => outValue <= I1;    
        end case;
    end process;

end Behavioral;

