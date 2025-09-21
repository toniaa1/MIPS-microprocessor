library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

entity INSTRUCTION_DECODE is
  Port ( CLK: IN STD_LOGIC;
         EN: IN STD_LOGIC;
         REG_WRITE: IN STD_LOGIC;
         REGDst:IN STD_LOGIC;
         EXTop:IN STD_LOGIC;
         INSTR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         WD:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RD1: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RD2: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         FUNC: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         SA:OUT STD_LOGIC;      
         EXT_IMM:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
         
end INSTRUCTION_DECODE;
architecture Behavioral of INSTRUCTION_DECODE is
SIGNAL RA1, RA2:STD_LOGIC_VECTOR(2 DOWNTO 0);
type register_file_memory is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg : register_file_memory := (others => x"0000");
signal wa:std_logic_vector(2 downto 0);

begin

rd1 <= reg(conv_integer(INSTR(12 DOWNTO 10)));
rd2 <= reg(conv_integer(INSTR(9 DOWNTO 7)));

reg_file_process: process(clk,wa,wd,reg_write)
begin
    if rising_edge(clk) then
        if en='1' and reg_write = '1' and wa/="000" then
                reg(conv_integer(wa)) <= wd;
         end if;
         reg(0)<=x"0000";
    end if;
   
end process reg_file_process;

wa<=instr(6 downto 4) when REGDst='1' else instr(9 downto 7);

ext_imm(6 downto 0)<=instr(6 downto 0);
ext_imm(15 downto 7) <= (others => Instr(6)) when ExtOp = '1' else (others => '0');  

func<=instr(2 downto 0);
sa<= instr(3);

end Behavioral;
