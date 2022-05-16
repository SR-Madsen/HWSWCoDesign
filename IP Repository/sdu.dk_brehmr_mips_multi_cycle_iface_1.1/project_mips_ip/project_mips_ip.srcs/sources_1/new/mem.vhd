library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Memory is
    port(CS, WE, Clk: in std_logic;
        ADDR: in std_logic_vector(31 downto 0);
        Mem_Out: out std_logic_vector(31 downto 0);
        Mem_In: in std_logic_vector(31 downto 0)
        );
end Memory;

architecture Internal of Memory is
    type RAMtype is array (0 to 511) of std_logic_vector(31 downto 0);
    signal RAM1: RAMtype := (others => (others => '0'));
    signal output: std_logic_vector(31 downto 0);
begin
    Mem_Out <= (others => 'Z') when (CS = '0') or (WE = '1') else output;
    process(Clk)
        begin 
            if Clk = '0' and Clk'event then
                if CS = '1' and WE = '1' then
                    RAM1(to_integer(unsigned(ADDR(7 downto 0)))) <= Mem_In;
                end if;
                output <= std_logic_vector(RAM1(to_integer(unsigned(ADDR(7 downto 0)))));
            end if;
    end process;
end Internal;