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
use IEEE.numeric_std.all;   -- arithmetic functions with Signed or Unsigned values 
use IEEE.STD_LOGIC_signed.all;

entity alu is
    port ( 
        a,b : in std_logic_vector(31 downto 0); -- src1, src2
        func : in std_logic_vector(2 downto 0); -- function select
        res: out std_logic_vector(31 downto 0); -- ALU Output Result
        zero: out std_logic -- Zero Flag 
    );
end alu;

architecture Behavioral of alu is
    signal alu_res: std_logic_vector(31 downto 0);
begin
    process(func, a, b)
    begin
        case func is
            when b"000" =>
                alu_res <= a and b;     -- and
                
            when b"001" =>
                alu_res <= a or b;      -- or
                
            when b"010" => 
                alu_res <= a + b;       -- add
                
            when b"110" =>
                alu_res <= a - b;       -- sub
                
            when b"111" =>              -- slt (set-less-then)
                if (a<b) then
                    alu_res <= x"00000001";
                else 
                    alu_res <= x"00000000";
                end if;
                
            when others => 
                alu_res <= a + b;       -- add
        end case;
    end process;
    
    zero <= '1' when alu_res=x"00000000" else '0';
    
    res <= alu_res;

end Behavioral;
