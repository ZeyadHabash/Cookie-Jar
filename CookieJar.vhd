library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;
USE work.seven_segment_package.all;


entity CookieJar is
port (sensorInput:in std_logic;
	   keypad: in std_logic_vector(3 downto 0);
	   motor:out std_logic;
	   seg5,seg4,seg3,seg2,seg1,seg0 :OUT std_logic_vector(1 TO 7));
end CookieJar;

Architecture logic_of_cookieJarr of CookieJar is
    Signal count : std_logic_vector(7 downto 0):="00001000";
    Signal bcd : std_logic_vector(7 downto 0);
	 Signal ss0,ss1,ss2,ss3,ss4,ss5 : std_logic_vector(3 downto 0) := "0000";
	 Signal tempCount : std_logic_vector(7 downto 0):="00001000";
	 Signal tempbcd : std_logic_vector(7 downto 0);
	 
begin
	 sevenSeg0: seven_segment_display PORT MAP (ss0, seg0);
    sevenSeg1: seven_segment_display PORT MAP (ss1, seg1);
	 sevenSeg2: seven_segment_display PORT MAP (ss2, seg2);
    sevenSeg3: seven_segment_display PORT MAP (ss3, seg3);
	 sevenSeg4: seven_segment_display PORT MAP (ss4, seg4);
    sevenSeg5: seven_segment_display PORT MAP (ss5, seg5);

	bcd <= count + 18 when count > 29 else
			 count + 12 when count > 19 else
			 count + 6 when count > 9 else
			 count;
			 
	tempbcd <= tempcount + 18 when tempcount > 29 else
				  tempcount + 12 when tempcount > 19 else
				  tempcount + 6 when tempcount > 9 else
				  tempcount;
	
	
	tempCount <= (count - keypad) when keypad <= count;
	motor <= '1' when sensorInput = '1' and keypad > 0 and keypad <= count else '0'; 

	
	
	ss0 <= "1111" when (keypad > count) or count = 0 else tempbcd(3 downto 0);
	ss1 <= "1110" when (keypad > count) or count = 0 else tempbcd(7 downto 4); -- always "0000"
	ss2 <= "1101" when (keypad > count) or count = 0 else "0000";
	ss3 <= "1100" when (keypad > count) or count = 0 else "0000";
	ss4 <= "1011" when (keypad > count) or count = 0 else "0000";
	ss5 <= "1010" when (keypad > count) or count = 0 else "0000";
	

end logic_of_cookieJarr;