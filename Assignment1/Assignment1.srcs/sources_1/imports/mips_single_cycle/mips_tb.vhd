----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2021 02:32:32 PM
-- Design Name: 
-- Module Name: mips_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mips_tb is
--  Port ( );
end mips_tb;

architecture Behavioral of mips_tb is

  component mips
      port (
        clk,rst: in std_logic;
        to_mem: out std_logic_vector(31 downto 0)
      );   
  end component;
  
    signal mips_clk: std_logic := '1';
    signal mips_rst: std_logic := '0';
    signal mips_to_mem: std_logic_vector(31 downto 0);

  
begin
    mips_clk <= not mips_clk after 10ns;
    
    uut_mips: mips port map(
        clk => mips_clk,
        rst => mips_rst,
        to_mem => mips_to_mem
    );
    
end Behavioral;
