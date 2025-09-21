library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MAIN_CONTROL is
Port ( 
        INSTR: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        ALUOP: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        REGDST, EXTOP, ALUSRC, BRANCH, JUMP, MEMWRITE, MEMTOREG, REGWRITE: OUT STD_LOGIC
);
end MAIN_CONTROL;


architecture Behavioral of MAIN_CONTROL is

begin

PROCESS(INSTR) IS 
BEGIN 
CASE(INSTR) IS

WHEN "000" => 
    ALUSRC<='0';
    ALUOP<="010";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='1';
    JUMP<='0';
    BRANCH<='0';
    EXTOP<='0';
    REGDST<='1';
WHEN "001" => 
    ALUSRC<='1';
    ALUOP<="111";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='1';
    JUMP<='0';
    BRANCH<='0';
    EXTOP<='1';
    REGDST<='0';
WHEN "010" => 
    ALUSRC<='1';
    ALUOP<="000";
    MEMWRITE<='0';
    MEMTOREG<='1';
    REGWRITE<='1';
    JUMP<='0';
    BRANCH<='0';
    EXTOP<='1';
    REGDST<='0';
WHEN "011" => 
    ALUSRC<='1';
    ALUOP<="000";
    MEMWRITE<='1';
    MEMTOREG<='0';
    REGWRITE<='0';
    JUMP<='0';
    BRANCH<='0';
    EXTOP<='1';
    REGDST<='0';
WHEN "100" => 
    ALUSRC<='1';
    ALUOP<="100";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='0';
    JUMP<='0';
    BRANCH<='1';
    EXTOP<='1';
    REGDST<='0';
WHEN "101" => 
    ALUSRC<='1';
    ALUOP<="101";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='0';
    JUMP<='0';
    BRANCH<='1';
    EXTOP<='1';
    REGDST<='0';
WHEN "110" => 
    ALUSRC<='1';
    ALUOP<="110";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='0';
    JUMP<='0';
    BRANCH<='1';
    EXTOP<='1';
    REGDST<='0';
WHEN "111" => 
    ALUSRC<='0';
    ALUOP<="000";
    MEMWRITE<='0';
    MEMTOREG<='0';
    REGWRITE<='1';
    JUMP<='1';
    BRANCH<='0';
    EXTOP<='1';
    REGDST<='0';
END CASE;
END PROCESS;

end Behavioral;
