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
use IEEE.std_logic_signed.all;

entity prog_counter is
    port (
        clk: in std_logic;
        pc_out: buffer std_logic_vector(31 downto 0) := (others => '0');
        br_addr: in std_logic_vector(15 downto 0);
        jump_addr: in std_logic_vector(25 downto 0);
        addr_reg: in std_logic_vector(31 downto 0);
        pc_select: in std_logic_vector(1 downto 0);
        alu_zero_flag: in std_logic   
    );   
end prog_counter;

architecture Behavioral of prog_counter is

begin
    process(clk, pc_select)
        begin
            if rising_edge(clk) then
                case pc_select is
                    when "00" => -- PC + 4 
                        pc_out <= pc_out + 4;
                    when "01" => -- PC Branch 
                        if alu_zero_flag = '1' then
                            pc_out <= std_logic_vector(signed(pc_out) + 4 + (resize(signed(br_addr)*4,32)));
                        else 
                            pc_out <= pc_out + 4;
                        end if;
                        
                    when "10" => -- PC Jump 
                        pc_out <= std_logic_vector(resize(signed(jump_addr(25 downto 0))*4, 32));
                    when "11" =>
                        pc_out <= std_logic_vector(signed(pc_out) + 4 + signed(addr_reg));  
                    when others =>
                        pc_out <= pc_out + 4;
                end case;
            end if;
    end process;
    
end Behavioral;
