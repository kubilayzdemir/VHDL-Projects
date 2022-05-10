----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.05.2022 13:04:32
-- Design Name: 
-- Module Name: converter - Behavioral
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

entity converter is
    Port ( converter_i : in unsigned (3 downto 0);
           converter_o : out unsigned (7 downto 0));
end converter;

architecture Behavioral of converter is
-- cathode 7 segment
begin
    process(converter_i)
    begin
        case (converter_i) is
            when "0000" => converter_o <= "00000011"; --CA CB CC CD CE CF CG DP
            when "0001" => converter_o <= "10011111";
            when "0010" => converter_o <= "00100101";
            when "0011" => converter_o <= "00001101";
            when "0100" => converter_o <= "10011001";
            when "0101" => converter_o <= "01001001";
            when "0110" => converter_o <= "01000001";
            when "0111" => converter_o <= "00011111";
            when "1000" => converter_o <= "00000001";
            when "1001" => converter_o <= "00001001";
            when others => converter_o <= "11111111";
        end case;
    end process;
end Behavioral;
