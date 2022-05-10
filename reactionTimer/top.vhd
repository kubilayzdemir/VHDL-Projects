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

entity top is
generic (
c_clkfreq   : integer := 100_000_000
);
--  Port ( );
Port (
    switch  : in std_logic; -- button
    clock_i : in std_logic;
    --   w       : in std_logic;
    sevseg_o : out unsigned (7 downto 0);
    reset   : in std_logic;
    anodes_o : out std_logic_vector (7 downto 0);
    led_o   : out std_logic
);
end top;

architecture Behavioral of top is

component clockDivider is
--  Port ( );
    Port (
    clock_i : in std_logic;
    clock_o : out std_logic;
    reset_i : in std_logic
    );
end component;

component bcdAdder is
--  Port ( );
Port (
    clock_i : in std_logic;
    enable_i : in std_logic;
    counter_o : out unsigned(3 downto 0);
    counter2_o : out unsigned(3 downto 0);
    reset_i : in std_logic
);
end component;

component converter is -- 0-9 to 7 segment converter
    Port ( converter_i : in unsigned (3 downto 0);
           converter_o : out unsigned (7 downto 0));
end component;

component dFlipFlop is
    Port ( d : in STD_LOGIC;
           q : out STD_LOGIC;
           clk : in STD_LOGIC);
end component;

component mux2_1 is
    Port ( I0 : in std_logic;
           I1 : in std_logic;
           s : in STD_LOGIC;
           outValue : out STD_LOGIC);
end component;


---------------------------------------------------------------------------------------
-- CONSTANT DEFINITIONS
---------------------------------------------------------------------------------------
constant c_timer1mslim			: integer := c_clkfreq/1000;

---------------------------------------------------------------------------------------
-- SIGNAL DEFINITIONS
---------------------------------------------------------------------------------------
signal clock_new: std_logic;
signal flipFlop_o: std_logic :='0';
signal mux_o: std_logic := '0';
signal and_o: std_logic;
signal counter_o: unsigned(3 downto 0);
signal counter2_o: unsigned(3 downto 0);
signal sevseg1_o : unsigned (7 downto 0);
signal sevseg2_o : unsigned (7 downto 0);

signal anodes					: std_logic_vector (7 downto 0) := "11111110";
signal timer1ms					: integer range 0 to c_timer1mslim 			:= 0;

begin

clkDivider: clockDivider port map (
                                    clock_i => clock_i,
                                    clock_o => clock_new,
                                    reset_i => reset
);

--mux: mux2_1 port map ( -- p_w process i ayný iþi yapýyor 
--                        I0 => flipFlop_o,
--                        I1 => '1',
--                       s => w,
--                       outValue => mux_o 
--);

Dff: dFlipFlop port map (
                        d => and_o,
                        q => flipFlop_o,
                        clk => clock_new
                        --clk => clock_i
);

counter: bcdAdder port map (
                            clock_i => clock_new,
                            enable_i => flipFlop_o,
                           -- enable_i => '1',
                            counter_o => counter_o,
                            counter2_o => counter2_o,
                            reset_i => reset                            
);

converter_1: converter port map(
                                    converter_i => counter_o,
                                    converter_o => sevseg1_o
);

converter_2: converter port map(
                                converter_i => counter2_o,
                                converter_o => sevseg2_o
);


anadoes: process (clock_i) begin
if(rising_edge(clock_i)) then
    anodes_o(7 downto 2) <= "111111";
    anodes(7 downto 2) <= "111111";
    if(timer1ms = 100000-1) then
        timer1ms    <= 0;
        --anodes(1) <= anodes(0);
        --anodes(1) <= not anodes(1);
        --anodes(0) <= anodes(1);
        --anodes(0) <= not anodes(0);
        if (anodes = "11111101") then
            anodes <= "11111110";
        else
            anodes <= "11111101";
         end if;
    else
        timer1ms <= timer1ms + 1;
    end if; 
end if;
end process;

cathodes: process (clock_i) begin
if rising_edge(clock_i) then
    if (anodes(0) = '0') then
        sevseg_o <= sevseg1_o;
    elsif ( anodes(1) = '0') then
        sevseg_o <= sevseg2_o;
    else
        sevseg_o <= (others => '1');
    end if;
end if;
end process;
and_o <= mux_o and switch;
p_w: process (clock_i) begin 
if (switch = '1') then
    --w <= '1'; -- burasi olmuyor inout mu yapmak lazým ki
    mux_o <= '1'; -- w 1 olunca mux_o 1 olacak direkt onu deðiþtirsem
else    
  mux_o <= flipFlop_o;
end if;

end process;

anodes_o <= anodes;
led_o <= not flipFlop_o;


end Behavioral;
