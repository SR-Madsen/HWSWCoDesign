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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
    port (
            clk: in std_logic;
            reg_write: in std_logic;
            dest_reg, src_reg_1, src_reg_2: in std_logic_vector(4 downto 0);
            write_data: in std_logic_vector(31 downto 0);
            read_reg_1,read_reg_2: out std_logic_vector(31 downto 0)
        );
end reg_file;

architecture Behavioral of reg_file is
    type reg_bank is array (0 to 31) of std_logic_vector(31 downto 0);
    signal Regs: reg_bank := (others => (others => '0')); -- set all reg bits to '1'
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reg_write = '1' then
                Regs(to_integer(unsigned(dest_reg))) <= write_data;
            end if;
        end if;
    end process;

    read_reg_1 <= Regs(to_integer(unsigned(src_reg_1))); -- asynchronous read
    read_reg_2 <= Regs(to_integer(unsigned(src_reg_2))); -- asynchronous read

end Behavioral;
