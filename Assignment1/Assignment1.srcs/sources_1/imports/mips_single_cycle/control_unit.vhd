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

entity control_unit is
    port (
        opcode: in std_logic_vector(5 downto 0);
        rst: in std_logic;
        alu_op: out std_logic_vector(1 downto 0);
        reg_write: out std_logic;
        dr_select: out std_logic;
        reg_or_imm: out std_logic;
        pc_select: out std_logic_vector(1 downto 0);
        mem_wrt_en: out std_logic;
        alu_or_mem: out std_logic
    );
end control_unit;

architecture Behavioral of control_unit is

begin

    process(rst,opcode)
    begin
        if(rst = '1') then
            alu_op <= "00";         -- Determines the ALU operation --> (connected to mips_alu_op). 
                                    -- See the ALU control bits as a function of ALUop bits and opcode bits table.
            reg_write <= '0';       -- Controls write access to the register bank --> mips_reg_file
            dr_select <= '0';       -- Controls whether destination register is numbered from isntruction[20-16] or instruction[15-11] 
            reg_or_imm <= '0';      -- Controls if teh ALU input B is an immediate (then instruction[15-0]) or is 
                                    -- Sourced from the register bank (source register 2)
            pc_select <= "00";      -- Selects the PC brnaching control multiplexer
            mem_wrt_en <= '0';      -- Enables data memory write
            alu_or_mem <= '0';      -- Determines if the destination register is sourced from teh ALU or the memory data output port.
        else 
            case opcode is
                when "000000" =>            -- add  
                    alu_op <= "10"; -- Action given by function
                    reg_write <= '1'; -- Write to register
                    dr_select <= '0'; -- Instruction(15-11) indicates destination register
                    reg_or_imm <= '0'; -- ALU input B is register 2
                    pc_select <= "00"; -- Program counter = Program counter + 4
                    mem_wrt_en <= '0'; -- Do not write to memory
                    alu_or_mem <= '0'; -- Destination register is sourced from ALU result
                    
                when "001000" =>            -- addi
                    alu_op <= "00"; -- Add for load
                    reg_write <= '1'; -- Write to register
                    dr_select <= '1'; -- Instruction(20-16) indicates destination register
                    reg_or_imm <= '1'; -- ALU input B is immediate at instruction(15-0)
                    pc_select <= "00"; -- Program counter = Program counter + 4
                    mem_wrt_en <= '0'; -- Do not write to memory
                    alu_or_mem <= '0'; -- Destination register is sourced from ALU result

                when "000010" =>            -- jump
                    alu_op <= "10"; -- Does not matter
                    reg_write <= '0'; -- Do not write to register
                    dr_select <= '1'; -- Does not matter
                    reg_or_imm <= '1'; -- ALU input B is immediate/address at instruction(15-0)
                    pc_select <= "10"; -- Program counter = Jump address
                    mem_wrt_en <= '0'; -- Do not write to memory
                    alu_or_mem <= '0'; -- Destination register is sourced from ALU result
                    
                when "000100" =>            -- beq
                    alu_op <= "01"; -- Subtract for branch equal
                    reg_write <= '0'; -- Do not write to register
                    dr_select <= '1'; -- Instruction(20-16) indicates destination register
                    reg_or_imm <= '0'; -- ALU input B is register 2
                    pc_select <= "01"; -- Program counter depends on zero flag (either jump address or + 4)
                    mem_wrt_en <= '0'; -- Do not write to memory
                    alu_or_mem <= '0'; -- Destination register is sourced from ALU result

                when "101011" =>            -- sw
                    alu_op <= "00"; -- Add for store
                    reg_write <= '0'; -- Do not write to register
                    dr_select <= '1'; -- Does not matter
                    reg_or_imm <= '1'; -- ALU input B is immediate/address at instruction(15-0)
                    pc_select <= "00"; -- Program counter = Program counter + 4
                    mem_wrt_en <= '1'; -- Write to memory
                    alu_or_mem <= '0'; -- Does not matter

                when "100011" =>            -- lw
                    alu_op <= "00"; -- Add for load
                    reg_write <= '1'; -- Write to register
                    dr_select <= '1'; -- Instruction(20-16) indicates destination register
                    reg_or_imm <= '1'; -- ALU input B is immediate/address at instruction(15-0)
                    pc_select <= "00"; -- Program counter = Program counter + 4
                    mem_wrt_en <= '0'; -- Do not write to memory
                    alu_or_mem <= '1'; -- Destination register is sourced from data memory

                when others =>
                    alu_op <= "00";
                    reg_write <= '0';
                    dr_select <= '0';
                    reg_or_imm <= '0';
                    pc_select <= "00";
                    mem_wrt_en <= '0';
                    alu_or_mem <= '0';

            end case;
       end if;
   end process;
end Behavioral;
