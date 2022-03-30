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

entity memory is
    port (
        addr: in std_logic_vector(31 downto 0);
        data_out: out std_logic_vector(31 downto 0)
    );
end memory;

architecture Behavioral of memory is
    signal rom_addr: std_logic_vector(31 downto 0);

    type ROM_type is array (0 to 5 ) of std_logic_vector(31 downto 0);
    constant rom_data: ROM_type:=(
        -- LISTING 1
--        x"21290006",    -- addi t1 t1 0x6
--        x"214A0007",    -- addi t2 t2 0x7
--        x"01495820",    -- add t3 t2 t1
--        x"01496022",    -- sub t4 t2 t1
--        x"0149682A",    -- slt t5 t2 t1
--        x"08000001"     -- j 0x1
        
        --LISTING 2
        x"21290003",      -- addi t1 t1 0x3  
        x"214A0001",      -- addi t2 t2 0x1  
        x"112A0001",      -- beq t1 t2 0x1
        x"08000001",      -- j 0x1
        x"01495820",      -- add t3 t2 t1
        x"00000000"
        
        --LISTING 3       
--        x"21290001",        -- addi t1 t1 0x1 
--        x"AD490000",        -- sw t1 0x0 t2
--        x"21290002",        -- addi t1 t1 0x1 
--        x"AD490001",        -- sw t1 0x1 t2
--        x"8D4A0001",        -- lw t2 0x1 t2
--        x"00000000"
    );
    
begin

    rom_addr <= std_logic_vector(shift_right(unsigned(addr), 2));
    data_out <= rom_data(to_integer(unsigned(rom_addr))) when rom_addr < x"00000006" else x"00000000";

end Behavioral;
