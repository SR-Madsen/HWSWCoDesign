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
use IEEE.NUMERIC_STD.ALL;

entity data_memory is
    port(
         clk: in std_logic;
         addr: in std_logic_Vector(31 downto 0);
         data_in: in std_logic_Vector(31 downto 0);
         wrt_en: in std_logic;
         rd_en: in std_logic;
         data_out: out std_logic_Vector(31 downto 0)
     );
end data_memory;

architecture Behavioral of data_memory is
    
        signal i: integer;
        signal mem_addr: std_logic_vector(7 downto 0);
        type data_mem is array (0 to 255 ) of std_logic_vector (31 downto 0);
        signal mem: data_mem :=((others=> (others=>'0')));
    
begin
        mem_addr(7 downto 0) <= addr(7 downto 0);
        process(clk)
        begin
            if(rising_edge(clk)) then
                if (wrt_en = '1') then
                    mem(to_integer(unsigned(mem_addr))) <= data_in;
                end if;
            end if;
        end process;
        data_out <= mem(to_integer(unsigned(mem_addr))) when (rd_en='1') else x"00000000";

end Behavioral;
