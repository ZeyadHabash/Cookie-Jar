library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity seven_segment_display IS
    Port (BCD : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value to 7-segment display
           LED_out : out STD_LOGIC_VECTOR (1 TO 7));-- Cathode patterns of 7-segment display
end seven_segment_display;

architecture behavioral of seven_segment_display is
begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
    process(BCD)
        begin
         case BCD is
         when "0000" => LED_out <= "0000001"; -- "0"
         when "0001" => LED_out <= "1001111"; -- "1" 
         when "0010" => LED_out <= "0010010"; -- "2" 
         when "0011" => LED_out <= "0000110"; -- "3" 
         when "0100" => LED_out <= "1001100"; -- "4" 
         when "0101" => LED_out <= "0100100"; -- "5" 
         when "0110" => LED_out <= "0100000"; -- "6" 
         when "0111" => LED_out <= "0001111"; -- "7" 
         when "1000" => LED_out <= "0000000"; -- "8"
         when "1001" => LED_out <= "0000100"; -- "9" 
         when "1010" => LED_out <= "0110000"; -- E
         when "1011" => LED_out <= "0011001"; -- M1
         when "1100" => LED_out <= "0001101"; -- M2
         when "1101" => LED_out <= "0011000"; -- P
         when "1110" => LED_out <= "1110000"; -- T
         when "1111" => LED_out <= "1000100"; -- Y
            when OTHERS => LED_out <= "1111111"; -- blank
         end case;
    end process;
end behavioral;

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
PACKAGE seven_segment_package IS
    COMPONENT seven_segment_display
        Port (BCD : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- input value to 7-segment display
                LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
    END COMPONENT;
end seven_segment_package;