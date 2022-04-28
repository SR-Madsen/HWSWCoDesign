----------------------------------------------------------------------------------
-- Company: SDU / MCI / CIE
-- Engineer: Robert Brehm
-- 
-- Create Date: 04/26/2020 10:14:02 PM
-- Design Name: 
-- Module Name: dual_bram_handson_tb - Behavioral
-- Project Name: Hardware/Software Co-Design Lecture (Robert Brehm 2020)
-- Target Devices: Zedboard (Zynq)
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity design_1_wrapper_tb is
end;

architecture bench of design_1_wrapper_tb is

  component design_1_wrapper
    port (
      BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTA_0_clk : in STD_LOGIC;
      BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTA_0_en : in STD_LOGIC;
      BRAM_PORTA_0_rst : in STD_LOGIC;
      BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
      BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTB_0_clk : in STD_LOGIC;
      BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_PORTB_0_en : in STD_LOGIC;
      BRAM_PORTB_0_rst : in STD_LOGIC;
      BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 )
    );
  end component;

  signal BRAM_PORTA_0_addr: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTA_0_clk: STD_LOGIC := '0';
  signal BRAM_PORTA_0_din: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTA_0_dout: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTA_0_en: STD_LOGIC := '0';
  signal BRAM_PORTA_0_rst: STD_LOGIC := '0';
  signal BRAM_PORTA_0_we: STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
  signal BRAM_PORTB_0_addr: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_clk: STD_LOGIC := '0';
  signal BRAM_PORTB_0_din: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTB_0_dout: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_en: STD_LOGIC := '0';
  signal BRAM_PORTB_0_rst: STD_LOGIC := '0';
  signal BRAM_PORTB_0_we: STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');

begin

  uut: design_1_wrapper port map ( BRAM_PORTA_0_addr => BRAM_PORTA_0_addr,
                                   BRAM_PORTA_0_clk  => BRAM_PORTA_0_clk,
                                   BRAM_PORTA_0_din  => BRAM_PORTA_0_din,
                                   BRAM_PORTA_0_dout => BRAM_PORTA_0_dout,
                                   BRAM_PORTA_0_en   => BRAM_PORTA_0_en,
                                   BRAM_PORTA_0_rst  => BRAM_PORTA_0_rst,
                                   BRAM_PORTA_0_we   => BRAM_PORTA_0_we,
                                   BRAM_PORTB_0_addr => BRAM_PORTB_0_addr,
                                   BRAM_PORTB_0_clk  => BRAM_PORTB_0_clk,
                                   BRAM_PORTB_0_din  => BRAM_PORTB_0_din,
                                   BRAM_PORTB_0_dout => BRAM_PORTB_0_dout,
                                   BRAM_PORTB_0_en   => BRAM_PORTB_0_en,
                                   BRAM_PORTB_0_rst  => BRAM_PORTB_0_rst,
                                   BRAM_PORTB_0_we   => BRAM_PORTB_0_we );
                                   
    BRAM_PORTA_0_clk <= not BRAM_PORTA_0_clk after 10 ns;
    BRAM_PORTB_0_clk <= not BRAM_PORTB_0_clk after 10 ns;
    
  stimulus: process
  begin
    BRAM_PORTA_0_we <= "0000";
    BRAM_PORTA_0_rst <= '0';
    BRAM_PORTA_0_en <= '1';
    
    BRAM_PORTB_0_we <= "0000";
    BRAM_PORTB_0_rst <= '0';
    BRAM_PORTB_0_en <= '1';
    
    for i in 0 to 20 loop
        wait until BRAM_PORTA_0_clk = '0' and BRAM_PORTA_0_clk'event;
            BRAM_PORTA_0_we <= "1111";
            BRAM_PORTA_0_din <= std_logic_vector(to_unsigned(i+10,32));
            BRAM_PORTA_0_addr <= std_logic_vector(to_unsigned(i,32));
            if (i >= 1) then 
                BRAM_PORTB_0_addr <= std_logic_vector(to_unsigned((i-1),32));  
            end if;
    end loop;

    wait;
  end process;
end;
