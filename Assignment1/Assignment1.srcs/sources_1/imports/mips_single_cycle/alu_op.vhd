----------------------------------------------------------------------------------
-- Company: Center for Industrial Electronics - Syddansk Universitet
-- Engineer: Robert Brehm
-- 
-- Create Date: 03/02/2021 08:37:28 AM
-- Design Name: 
-- Module Name: mips - Behavioral
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

entity alu_op is
    port (
        alu_control: out std_logic_vector(2 downto 0);
        alu_op : in std_logic_vector(1 downto 0);
        alu_funct : in std_logic_vector(3 downto 0)
    );
end alu_op;

architecture Behavioral of alu_op is

begin
    process(alu_op, alu_funct)
    begin
        case alu_op is
            when "00" => 
                alu_control <= "010";                   -- I-Type Instructions (addi)
            when "01" => 
                alu_control <= "110";                   -- Branching (substract)                  
            when "10" => 
                case alu_funct(3 downto 0) is
                    when "0000" =>
                        alu_control <= "010";    --add
                    when "0010" =>
                        alu_control <= "110";    --sub
                    when "0100" =>
                        alu_control <= "000";    --and    
                    when "0101" =>
                        alu_control <= "001";    --or    
                    when "1010" =>
                        alu_control <= "111";    --slt
                    when others => 
                        alu_control <= "010";
                end case;
            when "11" => 
                alu_control <= "000";
            when others => 
                alu_control <= "000";
    end case;
end process;

end Behavioral;
