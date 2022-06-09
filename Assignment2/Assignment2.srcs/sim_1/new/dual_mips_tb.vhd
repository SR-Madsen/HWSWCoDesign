----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 09:58:55 AM
-- Design Name: 
-- Module Name: dual_mips_tb - Behavioral
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

entity dual_mips_tb is
end;

architecture bench of dual_mips_tb is
    Component design_1_wrapper
        Port (BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
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
    end Component;

-- Connection for wrapper signals
  signal BRAM_PORTB_0_addr: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTB_0_clk: STD_LOGIC := '0';
  signal BRAM_PORTB_0_din: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTB_0_dout: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_en: STD_LOGIC;
  signal BRAM_PORTB_0_rst: STD_LOGIC;
  signal BRAM_PORTB_0_we: STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
  signal BRAM_PORTB_1_addr: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTB_1_clk: STD_LOGIC := '0';
  signal BRAM_PORTB_1_din: STD_LOGIC_VECTOR ( 31 downto 0 ) := (others => '0');
  signal BRAM_PORTB_1_dout: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_1_en: STD_LOGIC;
  signal BRAM_PORTB_1_rst: STD_LOGIC;
  signal BRAM_PORTB_1_we: STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
  signal CLK_0: STD_LOGIC := '0';
  signal PORTA_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTA_1: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTB_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTB_1: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTC_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTC_1: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTD_0: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PORTD_1: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RST_0: STD_LOGIC;
  signal rsta_0: STD_LOGIC;

-- Text region contents
constant N: integer := 8;
constant W: integer := 28;

-- https://www.eg.bucknell.edu/~csci320/mips_web/
-- Address 0 to 0xFF is text area of BRAM
-- Address 0x100 to 0x7FF is data area of BRAM
-- Address 0x800 to 0x803 is GPIO. Adresses are in order: Port A, B, C, D.
type Iarr is array(1 to W) of unsigned(31 downto 0);
constant Instr_List_0: Iarr := (
    x"30000000", -- 0x00 andi $0, $0, 0 => $0 = 0
    x"20010006", -- 0x04 addi $1, $0, 6 => $1 = 6 
    x"34020012", -- 0x08 ori $2, $0, 18 => $2 = 18
    x"00221820", -- 0x0c add $3, $1, $2 => $3 = $1 + $2 = 24
    x"00412022", -- 0x10 sub $4, $2, $1 => $4 = $2 - $1 = 12
    x"00222824", -- 0x14 and $5, $1, $2 => $5 = $1 and $2 = 2
    x"00223025", -- 0x18 or $6, $1, $2 => $6 = $1 or $2 = 22
    x"0022382A", -- 0x1c slt $7, $1, $2 => $7 = 1 because $1<$2
    x"00024100", -- 0x20 sll $8, $2, 4 => $8 = 18 * 16 = 288
    x"00014842", -- 0x24 srl $9, $1, 1 => $9 = 6/2 = 3
    x"10220001", -- 0x28 beq $1, $2, 1 => should not branch
    x"8C0A0004", -- 0x2c lw $10, 4($0) => $10 = 5th instr = x"00412022" = 4268066
    x"14620001", -- 0x30 bne $1, $2, 1 => must branch to PC+1+1
    x"30210000", -- 0x34 andi $1, $1, 0 => $1 = 0 (skipped if bne worked correctly)
    x"08000010", -- 0x38 j 16 => PC = 16
    x"30420000", -- 0x3c andi $2, $2, 0 => $2 = 0 (skipped if j 16 worked correctly)
    x"00400008", -- 0x40 jr $2 => PC = $2 = 18 = PC+1+1. $3 wrong if fails
    x"30630000", -- 0x44 andi $3, $3, 0 => $3 = 0 (skipped if jr $2 worked correctly)
    x"AC030040", -- 0x48 sw $3, 64($0) => Mem(64) = $3
    x"AC040041", -- 0x4c sw $4, 65($0) => Mem(65) = $4
    x"AC050042", -- 0x50 sw $5, 66($0) => Mem(66) = $5
    x"AC060043", -- 0x54 sw $6, 67($0) => Mem(67) = $6
    x"AC070044", -- 0x58 sw $7, 68($0) => Mem(68) = $7
    x"AC080045", -- 0x5c sw $8, 69($0) => Mem(69) = $8
    x"AC090046", -- 0x60 sw $9, 70($0) => Mem(70) = $9
    x"AC090047", -- 0x64 sw $10, 71($0) => Mem(71) = $10
    x"20010003", -- 0x68 addi $1, $0, 3 => $1 = 3
    x"AC010200"  -- 0x6c sw $1, 512($0) => Mem(512) = $1 (Activate GPIO A pin 0 and 1)
);

constant Instr_List_1: Iarr := (
    x"30000000", -- 0x00 andi $0, $0, 0 => $0 = 0
    x"20010006", -- 0x04 addi $1, $0, 6 => $1 = 6 
    x"34020012", -- 0x08 ori $2, $0, 18 => $2 = 18
    x"00221820", -- 0x0c add $3, $1, $2 => $3 = $1 + $2 = 24
    x"00412022", -- 0x10 sub $4, $2, $1 => $4 = $2 - $1 = 12
    x"00222824", -- 0x14 and $5, $1, $2 => $5 = $1 and $2 = 2
    x"00223025", -- 0x18 or $6, $1, $2 => $6 = $1 or $2 = 22
    x"0022382A", -- 0x1c slt $7, $1, $2 => $7 = 1 because $1<$2
    x"00024100", -- 0x20 sll $8, $2, 4 => $8 = 18 * 16 = 288
    x"00014842", -- 0x24 srl $9, $1, 1 => $9 = 6/2 = 3
    x"10220001", -- 0x28 beq $1, $2, 1 => should not branch
    x"8C0A0004", -- 0x2c lw $10, 4($0) => $10 = 5th instr = x"00412022" = 4268066
    x"14620001", -- 0x30 bne $1, $2, 1 => must branch to PC+1+1
    x"30210000", -- 0x34 andi $1, $1, 0 => $1 = 0 (skipped if bne worked correctly)
    x"08000010", -- 0x38 j 16 => PC = 16
    x"30420000", -- 0x3c andi $2, $2, 0 => $2 = 0 (skipped if j 16 worked correctly)
    x"00400008", -- 0x40 jr $2 => PC = $2 = 18 = PC+1+1. $3 wrong if fails
    x"30630000", -- 0x44 andi $3, $3, 0 => $3 = 0 (skipped if jr $2 worked correctly)
    x"AC030040", -- 0x48 sw $3, 64($0) => Mem(64) = $3
    x"AC040041", -- 0x4c sw $4, 65($0) => Mem(65) = $4
    x"AC050042", -- 0x50 sw $5, 66($0) => Mem(66) = $5
    x"AC060043", -- 0x54 sw $6, 67($0) => Mem(67) = $6
    x"AC070044", -- 0x58 sw $7, 68($0) => Mem(68) = $7
    x"AC080045", -- 0x5c sw $8, 69($0) => Mem(69) = $8
    x"AC090046", -- 0x60 sw $9, 70($0) => Mem(70) = $9
    x"AC090047", -- 0x64 sw $10, 71($0) => Mem(71) = $10
    x"20010005", -- 0x68 addi $1, $0, 5 => $1 = 5
    x"AC010200"  -- 0x6c sw $1, 512($0) => Mem(512) = $1 (Activate GPIO A pin 0 and 2)
);


begin

uut: design_1_wrapper port map ( BRAM_PORTB_0_addr => BRAM_PORTB_0_addr,
                                 BRAM_PORTB_0_clk  => BRAM_PORTB_0_clk,
                                 BRAM_PORTB_0_din  => BRAM_PORTB_0_din,
                                 BRAM_PORTB_0_dout => BRAM_PORTB_0_dout,
                                 BRAM_PORTB_0_en   => BRAM_PORTB_0_en,
                                 BRAM_PORTB_0_rst  => BRAM_PORTB_0_rst,
                                 BRAM_PORTB_0_we   => BRAM_PORTB_0_we,
                                 BRAM_PORTB_1_addr => BRAM_PORTB_1_addr,
                                 BRAM_PORTB_1_clk  => BRAM_PORTB_1_clk,
                                 BRAM_PORTB_1_din  => BRAM_PORTB_1_din,
                                 BRAM_PORTB_1_dout => BRAM_PORTB_1_dout,
                                 BRAM_PORTB_1_en   => BRAM_PORTB_1_en,
                                 BRAM_PORTB_1_rst  => BRAM_PORTB_1_rst,
                                 BRAM_PORTB_1_we   => BRAM_PORTB_1_we,
                                 CLK_0             => CLK_0,
                                 PORTA_0           => PORTA_0,
                                 PORTA_1           => PORTA_1,
                                 PORTB_0           => PORTB_0,
                                 PORTB_1           => PORTB_1,
                                 PORTC_0           => PORTC_0,
                                 PORTC_1           => PORTC_1,
                                 PORTD_0           => PORTD_0,
                                 PORTD_1           => PORTD_1,
                                 RST_0             => RST_0,
                                 rsta_0            => rsta_0 );


BRAM_PORTB_0_clk <= not BRAM_PORTB_0_clk after 10 ns;
BRAM_PORTB_1_clk <= not BRAM_PORTB_1_clk after 10 ns;
CLK_0 <= not CLK_0 after 10 ns;

stimulus: process
begin
    rsta_0 <= '0';
    RST_0 <= '1';
    
    -- BRAM enable
    BRAM_PORTB_0_rst <= '0';
    BRAM_PORTB_0_en <= '1';
    BRAM_PORTB_1_rst <= '0';
    BRAM_PORTB_1_en <= '1';
    
    -- Wait to allow BRAM circuits to ready up
    wait for 100 ns;
    
    -- BRAM write enable
    BRAM_PORTB_0_we <= "1111";
    BRAM_PORTB_1_we <= "1111";
    
    -- Write instructions to BRAM text regions
    for i in 0 to W-1 loop
        wait until BRAM_PORTB_0_clk = '0' and BRAM_PORTB_0_clk'event;
            BRAM_PORTB_0_din <= std_logic_vector(Instr_List_0(i+1));
            BRAM_PORTB_0_addr <= std_logic_vector(to_unsigned(i*4,32));
            BRAM_PORTB_1_din <= std_logic_vector(Instr_List_1(i+1));
            BRAM_PORTB_1_addr <= std_logic_vector(to_unsigned(i*4,32));
    end loop;
    
    -- Stop writing and start processor
    wait until BRAM_PORTB_0_clk = '1' and BRAM_PORTB_0_clk'event;
        BRAM_PORTB_0_we <= "0000"; 
        BRAM_PORTB_1_we <= "0000"; 
    wait until BRAM_PORTB_0_clk = '1' and BRAM_PORTB_0_clk'event;
        RST_0 <= '0';
    
    wait;
end process;


end bench;
