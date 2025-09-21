library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity ALU is
  Port (
        OP1    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0); 
        OP2    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0); 
        SA     : IN  STD_LOGIC;                     
        CONTROL: IN  STD_LOGIC_VECTOR(5 DOWNTO 0);  
        ZERO   : OUT STD_LOGIC;                     
        RES    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)  
  );
end ALU;

architecture Behavioral of ALU is

    signal temp_result : STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal temp_mul_full : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

    PROCESS(CONTROL, OP1, OP2, SA)
    begin
        temp_result <= (others => 'X'); 
        ZERO        <= '0';            
        temp_mul_full <= (others => '0');

        CASE CONTROL(5 DOWNTO 3) IS

            WHEN "010" => 
                CASE CONTROL(2 DOWNTO 0) IS 
                    WHEN "000" => 
                        temp_result <= std_logic_vector(signed(OP1) + signed(OP2));
                    WHEN "001" => 
                        temp_result <= std_logic_vector(signed(OP1) - signed(OP2));
                    WHEN "010" => 
                        IF SA = '1' THEN
                            temp_result <= OP2(14 DOWNTO 0) & '0';
                        ELSE
                            temp_result <= OP2; 
                        END IF;
                    WHEN "011" => 
                        IF SA = '1' THEN
                            temp_result <= '0' & OP2(15 DOWNTO 1); 
                        ELSE
                            temp_result <= OP2; 
                        END IF;
                    WHEN "100" => 
                        temp_result <= OP1 AND OP2;
                    WHEN "101" =>
                        temp_result <= OP1 OR OP2;
                    WHEN "110" => 
                        temp_result <= OP1 XOR OP2;
                    WHEN "111" => 
                        temp_mul_full <= std_logic_vector(signed(OP1) * signed(OP2));
                        temp_result   <= temp_mul_full(15 DOWNTO 0);
                    WHEN OTHERS =>
                        temp_result <= (others => 'X'); 
                END CASE;

            WHEN "000" => 
                temp_result <= std_logic_vector(signed(OP1) + signed(OP2));
                

            WHEN "111" => 
                temp_result <= std_logic_vector(signed(OP1) + signed(OP2));

            WHEN "100" => 
                IF OP1 = OP2 THEN
                    ZERO <= '1';
                END IF;
                temp_result <= (others => '0'); 

            WHEN "101" => 
                IF signed(OP1) < signed(OP2) THEN
                    ZERO <= '1';
                END IF;
                temp_result <= (others => '0'); 
            WHEN "110" => 
                IF signed(OP1) > signed(OP2) THEN
                    ZERO <= '1';
                END IF;
                temp_result <= (others => '0'); 

            WHEN OTHERS => 
                temp_result <= (others => 'X');
                ZERO        <= '0';
        END CASE;
    END PROCESS;

    RES <= temp_result;

end Behavioral;