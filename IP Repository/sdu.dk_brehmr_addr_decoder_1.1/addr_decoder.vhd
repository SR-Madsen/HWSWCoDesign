----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2021 09:34:29 AM
-- Design Name: 
-- Module Name: addr_decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addr_decoder is
    Port ( 
            addr_in : in STD_LOGIC_VECTOR(31 downto 0);
            mem_cs_in: in STD_LOGIC;
            mem_cs : out STD_LOGIC;
            gpio_cs : out STD_LOGIC
           );
end addr_decoder;

architecture Behavioral of addr_decoder is

begin

    mem_cs <= '1' when ( unsigned(addr_in) <= 2047 ) and ( mem_cs_in = '1' ) else '0';
    gpio_cs <= '1' when ( unsigned(addr_in) > 2047 ) and ( mem_cs_in = '1' ) else '0';

end Behavioral;
