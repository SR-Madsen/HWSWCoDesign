----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2021 02:47:24 PM
-- Design Name: 
-- Module Name: gpio_module - Behavioral
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

entity gpio_module is
    Port ( 
        clk: in std_logic;
        cs: in std_logic;
        addr: in std_logic_vector(31 downto 0);
        data: in std_logic_vector(31 downto 0);
        PORTA: out std_logic_vector(7 downto 0);
        PORTB: out std_logic_vector(7 downto 0);
        PORTC: out std_logic_vector(7 downto 0);
        PORTD: out std_logic_vector(7 downto 0)
        
    );
end gpio_module;

architecture Behavioral of gpio_module is

    type gport is array (integer range <>) of std_logic_vector(7 downto 0);
    signal GPIO_PORT: gport(0 to 3);

    signal port_state: std_logic_vector(7 downto 0);
    
begin

    process(clk)
    begin
        if cs = '1' then
            if rising_edge(clk) then
                GPIO_PORT(to_integer(unsigned(addr(3 downto 0)))) <= data(7 downto 0);
            end if;
        end if;
    end process;
    
    PORTA <= GPIO_PORT(0);
    PORTB <= GPIO_PORT(1);
    PORTC <= GPIO_PORT(2);
    PORTD <= GPIO_PORT(3);

end Behavioral;
