library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD_DRIVER is
  Port (
    CLK: IN STD_LOGIC;
    NUM1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    NUM2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    NUM3: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    NUM4: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    an : out std_logic_vector(3 downto 0);
    cat : out std_logic_vector(6 downto 0));
end SSD_DRIVER;

architecture Behavioral of SSD_DRIVER is

SIGNAL COUNT: STD_LOGIC_VECTOR(15 DOWNTO 0); 
SIGNAL NUM: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

PROCESS(CLK) IS
BEGIN
    IF RISING_EDGE(CLK) THEN
        COUNT<=COUNT+1;
    END IF;
END PROCESS;


ANODE:PROCESS(COUNT, NUM1, NUM2, NUM3, NUM4) IS
BEGIN

CASE COUNT(15 DOWNTO 14) IS

WHEN "00"=>AN<="0111"; NUM<=NUM1;
WHEN "01"=>AN<="1011"; NUM<=NUM2;
WHEN "10"=>AN<="1101"; NUM<=NUM3;
WHEN "11"=>AN<="1110"; NUM<=NUM4;
END CASE;

END PROCESS;

CATODE:PROCESS(NUM) IS
BEGIN
case NUM is
        when x"1" => cat <= "1111001";
        when x"2" => cat <= "0100100";     
        when x"3" => cat <= "0110000";     
        when x"4" => cat <= "0011001";     
        when x"5" => cat <= "0010010";     
        when x"6" => cat <= "0000010";    
        when x"7" => cat <= "1111000";     
        when x"8" => cat <= "0000000";     
        when x"9" => cat <= "0011000";     
        when x"a" => cat <= "0001000";
        when x"b" => cat <= "0000011";
        when x"c" => cat <= "1000110";
        when x"d" => cat <= "0100001";
        when x"e" => cat <= "0000110";
        when x"f" => cat <= "0001110";
        when x"0" => cat <= "1000000";
end case;        
END PROCESS;

end Behavioral;
