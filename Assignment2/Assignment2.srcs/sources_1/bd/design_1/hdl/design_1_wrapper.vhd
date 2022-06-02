--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Thu Jun  2 10:05:20 2022
--Host        : Ubuntu-ZBook-15-G2 running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_clk : in STD_LOGIC;
    BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_en : in STD_LOGIC;
    BRAM_PORTB_0_rst : in STD_LOGIC;
    BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTB_1_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_clk : in STD_LOGIC;
    BRAM_PORTB_1_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_en : in STD_LOGIC;
    BRAM_PORTB_1_rst : in STD_LOGIC;
    BRAM_PORTB_1_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK_0 : in STD_LOGIC;
    PORTA_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTA_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RST_0 : in STD_LOGIC;
    rsta_0 : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    CLK_0 : in STD_LOGIC;
    RST_0 : in STD_LOGIC;
    rsta_0 : in STD_LOGIC;
    PORTA_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTA_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BRAM_PORTB_1_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_clk : in STD_LOGIC;
    BRAM_PORTB_1_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_1_en : in STD_LOGIC;
    BRAM_PORTB_1_rst : in STD_LOGIC;
    BRAM_PORTB_1_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_clk : in STD_LOGIC;
    BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTB_0_en : in STD_LOGIC;
    BRAM_PORTB_0_rst : in STD_LOGIC;
    BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      BRAM_PORTB_0_addr(31 downto 0) => BRAM_PORTB_0_addr(31 downto 0),
      BRAM_PORTB_0_clk => BRAM_PORTB_0_clk,
      BRAM_PORTB_0_din(31 downto 0) => BRAM_PORTB_0_din(31 downto 0),
      BRAM_PORTB_0_dout(31 downto 0) => BRAM_PORTB_0_dout(31 downto 0),
      BRAM_PORTB_0_en => BRAM_PORTB_0_en,
      BRAM_PORTB_0_rst => BRAM_PORTB_0_rst,
      BRAM_PORTB_0_we(3 downto 0) => BRAM_PORTB_0_we(3 downto 0),
      BRAM_PORTB_1_addr(31 downto 0) => BRAM_PORTB_1_addr(31 downto 0),
      BRAM_PORTB_1_clk => BRAM_PORTB_1_clk,
      BRAM_PORTB_1_din(31 downto 0) => BRAM_PORTB_1_din(31 downto 0),
      BRAM_PORTB_1_dout(31 downto 0) => BRAM_PORTB_1_dout(31 downto 0),
      BRAM_PORTB_1_en => BRAM_PORTB_1_en,
      BRAM_PORTB_1_rst => BRAM_PORTB_1_rst,
      BRAM_PORTB_1_we(3 downto 0) => BRAM_PORTB_1_we(3 downto 0),
      CLK_0 => CLK_0,
      PORTA_0(7 downto 0) => PORTA_0(7 downto 0),
      PORTA_1(7 downto 0) => PORTA_1(7 downto 0),
      PORTB_0(7 downto 0) => PORTB_0(7 downto 0),
      PORTB_1(7 downto 0) => PORTB_1(7 downto 0),
      PORTC_0(7 downto 0) => PORTC_0(7 downto 0),
      PORTC_1(7 downto 0) => PORTC_1(7 downto 0),
      PORTD_0(7 downto 0) => PORTD_0(7 downto 0),
      PORTD_1(7 downto 0) => PORTD_1(7 downto 0),
      RST_0 => RST_0,
      rsta_0 => rsta_0
    );
end STRUCTURE;
