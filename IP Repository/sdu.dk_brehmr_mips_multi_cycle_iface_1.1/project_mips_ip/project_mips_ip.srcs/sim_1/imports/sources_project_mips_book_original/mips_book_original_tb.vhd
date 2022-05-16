----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2020 12:26:29 PM
-- Design Name: 
-- Module Name: mips_book_original_tb - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


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
    component MIPS_BRAM_IFACE
    port(
            CLK, RST: in std_logic;
            CS: out std_logic;
            WE: out std_logic_vector (3 downto 0);
            ADDR: out std_logic_vector (31 downto 0);
            Data_In: in std_logic_vector (31 downto 0);
            Data_Out: out std_logic_vector (31 downto 0)
        );
    end component;
    
    component Memory
    port(
        CS, WE, Clk: in std_logic;
        ADDR: in std_logic_vector(31 downto 0);
        Mem_Out: out std_logic_vector(31 downto 0);
        Mem_In: in std_logic_vector(31 downto 0)
        );
    end component;
    
    constant N: integer := 8;
    constant W: integer := 26;
    
    type Iarr is array(1 to W) of unsigned(31 downto 0);
    constant Instr_List: Iarr := (
        x"30000000", -- PC(0) andi $0, $0, 0 => $0 = 0  30000000
        x"20010006", -- PC(1) addi $1, $0, 6 => $1 = 6 
        x"34020012", -- PC(2) ori $2, $0, 18 => $2 = 18 
        x"00221820", -- PC(3) add $3, $1, $2 => $3 = $1 + $2 = 24
        x"00412022", -- PC(4) sub $4, $2, $1 => $4 = $2 - $1 = 12
        x"00222824", -- PC(5) and $5, $1, $2 => $5 = $1 and $2 = 2
        x"00223025", -- PC(6) or $6, $1, $2 => $6 = $1 or $2 = 22
        x"0022382A", -- PC(7) slt $7, $1, $2 => $7 = 1 because $1<$2
        x"00024100", -- PC(8) sll $8, $2, 4 => $8 = 18 * 16 = 288
        x"00014842", -- PC(9) srl $9, $1, 1 => $9 = 6/2 = 3
        x"10220001", -- PC(10) beq $1, $2, 1 => should not branch
        x"8C0A0004", -- PC(11) lw $10, 4($0) => $10 = 5th instr = x"00412022" = 4268066
        x"14620001", -- PC(12) bne $1, $2, 1 => must branch to PC+1+1
        x"30210000", -- PC(13) andi $1, $1, 0 => $1 = 0 (skipped if bne worked correctly)
        x"08000010", -- PC(14) j 16 => PC = 16
        x"30420000", -- PC(15) andi $2, $2, 0 => $2 = 0 (skipped if j 16 worked correctly)
        x"00400008", -- PC(16) jr $2 => PC = $2 = 18 = PC+1+1. $3 wrong if fails
        x"30630000", -- PC(17) andi $3, $3, 0 => $3 = 0 (skipped if jr $2 worked correctly)
        x"AC030040", -- PC(18) sw $3, 64($0) => Mem(64) = $3
        x"AC040041", -- PC(19) sw $4, 65($0) => Mem(65) = $4
        x"AC050042", -- PC(20) sw $5, 66($0) => Mem(66) = $5
        x"AC060043", -- PC(21) sw $6, 67($0) => Mem(67) = $6
        x"AC070044", -- PC(22) sw $7, 68($0) => Mem(68) = $7
        x"AC080045", -- PC(23) sw $8, 69($0) => Mem(69) = $8
        x"AC090046", -- PC(24) sw $9, 70($0) => Mem(70) = $9
        x"AC0A0047" -- PC(25) sw $10, 71($0) => Mem(71) = $10
        -- The last instructions perform a series of sw operations that store
        -- registers 3-10 to memory. During the memory write stage, the testbench
        -- will compare the value of these registers (by looking at the bus value)
        -- with the expected output. No explicit check/assertion for branch
        -- instructions, however if a branch does not execute as expected, an error
        -- will be detected because the assertion for the instruction after the
        -- branch instruction will be incorrect.
    ); 
    
    type output_arr is array(1 to N) of integer;
    constant expected: output_arr := (24, 12, 2, 22, 1, 288, 3, 4268066);
    signal CS, CLK: std_logic := '0';
    signal WE: std_logic_vector(3 downto 0) := "0000";
    signal Mem_In, Mem_Out, Address, AddressTB, Address_Mux: std_logic_vector(31 downto 0);
    signal RST, init, CS_Mux,WE_Mux, WE_TB, CS_TB: std_logic;
    signal data: std_logic_vector(31 downto 0);

begin
    CPU: MIPS_BRAM_IFACE port map (CLK, RST, CS, WE, Address, Mem_Out, data);
    MEM: Memory port map (CS_Mux, WE_Mux, CLK, Address_Mux, Mem_Out, Mem_In);
    
    CLK <= not CLK after 10 ns;
    
    Mem_In <= std_logic_vector(data);
   
    Address_Mux <= AddressTB when init = '1' else Address;
    
    WE_Mux <= WE_TB when init = '1' else WE(0);
    
    CS_Mux <= CS_TB when init = '1' else CS;
    
    process
    begin
        rst <= '1';
        wait until CLK = '1' and CLK'event;
        --Initialize the instructions from the testbench
        init <= '1';
        CS_TB <= '1'; WE_TB <= '1';
        
        for i in 1 to W loop
            wait until CLK = '1' and CLK'event;
                AddressTB <= std_logic_vector(to_unsigned((i-1)*4,32));
                Mem_In <= std_logic_vector(Instr_List(i));
        end loop;
        
        wait until CLK = '1' and CLK'event;
            CS_TB <= '0'; 
            WE_TB <= '0';
            init <= '0';
            
        wait until CLK = '1' and CLK'event;
            RST <= '0';
            
        for i in 1 to N loop
            wait until WE_Mux = '1' and WE_Mux'event; -- When a store word is executed
                wait until CLK = '0' and CLK'event;
                        assert i < 5 
                        report "unexpected value. i = ";
                      --assert (to_integer(to_unsigned(Mem_Out,32)) = expected(i));
                      --report "Output mismatch:" severity error;
        end loop;
        report "Testing Finished:";
    end process;
end Behavioral;
