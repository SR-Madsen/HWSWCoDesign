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

entity mips is
    port ( 
        clk,rst: in std_logic;
        to_mem: out std_logic_vector(31 downto 0)
    );
end mips;

architecture Behavioral of mips is

    component reg_file is
        port (
            clk: in std_logic;
            reg_write: in std_logic;
            dest_reg, src_reg_1, src_reg_2: in std_logic_vector(4 downto 0);
            write_data: in std_logic_vector(31 downto 0);
            read_reg_1,read_reg_2: out std_logic_vector(31 downto 0)
        );
    end component;
    
    component alu is
        port ( 
            a,b : in std_logic_vector(31 downto 0); -- src1, src2
            func : in std_logic_vector(2 downto 0); -- function select
            res: out std_logic_vector(31 downto 0); -- ALU Output Result
            zero: out std_logic -- Zero Flag 
        );
    end component;
    
    component alu_op is
        port (
            alu_control: out std_logic_vector(2 downto 0);
            alu_op : in std_logic_vector(1 downto 0);
            alu_funct : in std_logic_vector(3 downto 0)
        );
    end component;
    
    component memory is
        port (
            addr: in std_logic_vector(31 downto 0);
            data_out: out std_logic_vector(31 downto 0)
        );
    end component;   
    
    component prog_counter is
        port (
            clk: in std_logic;
            pc_out: buffer std_logic_vector(31 downto 0) := (others => '0');
            br_addr: in std_logic_vector(15 downto 0);
            jump_addr: in std_logic_vector(25 downto 0);
            addr_reg: in std_logic_vector(31 downto 0);
            pc_select: in std_logic_vector(1 downto 0);
            alu_zero_flag: in std_logic
        );
    end component;   
    
    component control_unit is
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
    end component;
    
    component data_memory is
    port(
         clk: in std_logic;
         addr: in std_logic_Vector(31 downto 0);
         data_in: in std_logic_Vector(31 downto 0);
         wrt_en: in std_logic;
         rd_en: in std_logic;
         data_out: out std_logic_Vector(31 downto 0)
    );
    end component;
    
    -- Register Bank
    signal reg_wr_ctrl: std_logic;
    signal reg_wr: std_logic;
    signal reg_dest_reg: std_logic_vector(4 downto 0);
    signal reg_read_reg_2: std_logic_vector(31 downto 0);
    signal reg_write_data: std_logic_vector(31 downto 0);
    
    -- ALU
    signal alu_a: std_logic_vector(31 downto 0);
    signal alu_b: std_logic_vector(31 downto 0);
    signal alu_out: std_logic_vector(31 downto 0);
    signal alu_func: std_logic_vector(2 downto 0);
    signal alu_zero: std_logic;
    
    -- Control Signals
    signal control_alu_op: std_logic_vector(1 downto 0);
    signal control_reg_or_imm: std_logic;
    signal control_dr_select: std_logic;
    signal control_pc_select: std_logic_vector(1 downto 0);
    signal control_mem_wrt_en: std_logic;
    signal control_alu_or_mem: std_logic;
    
    -- Data Memory
    signal mem_data_out: std_logic_vector(31 downto 0);
    
    signal instruction: std_logic_vector(31 downto 0);
    
    signal pc: std_logic_vector(31 downto 0);

    signal mips_clk: std_logic;

begin
    mips_reg_file: reg_file port map(
                    clk => clk, 
                    reg_write => reg_wr_ctrl, 
                    dest_reg => reg_dest_reg,
                    src_reg_1 => instruction(25 downto 21),
                    src_reg_2 => instruction(20 downto 16),
                    write_data => reg_write_data,
                    read_reg_1 => alu_a,
                    read_reg_2 => reg_read_reg_2
    );
    
    reg_dest_reg <= instruction(15 downto 11) when control_dr_select = '0' else instruction(20 downto 16);
    reg_write_data <= alu_out when control_alu_or_mem = '0' else mem_data_out;
    
    mips_alu: alu port map(
                   a => alu_a,
                   b => alu_b,
                   func => alu_func,
                   res => alu_out,
                   zero => alu_zero
    );
    
    alu_b <= reg_read_reg_2 when control_reg_or_imm = '0' else std_logic_vector(resize(signed(instruction(15 downto 0)),32));
    
    
    mips_alu_op: alu_op port map(
                   alu_control => alu_func,
                   alu_op => control_alu_op,
                   alu_funct => instruction(3 downto 0)
    );

    mips_text_mem: memory port map(
                    addr => pc,
                    data_out => instruction           
    );
    
    mips_pc: prog_counter port map(
            clk => clk,
            pc_out => pc,
            br_addr => instruction(15 downto 0),
            jump_addr => instruction(25 downto 0),
            addr_reg => (others => '0'),
            pc_select => control_pc_select,
            alu_zero_flag => alu_zero
    );
    
    mips_control_unit: control_unit port map(
            opcode => instruction(31 downto 26),
            rst => rst,
            alu_op => control_alu_op,
            reg_write => reg_wr_ctrl,
            dr_select => control_dr_select,
            reg_or_imm => control_reg_or_imm,
            pc_select => control_pc_select,
            mem_wrt_en => control_mem_wrt_en,
            alu_or_mem => control_alu_or_mem
    );
    
    mips_data_memory: data_memory port map(
            clk => clk,
            addr => alu_out,
            data_in => reg_read_reg_2,
            wrt_en => control_mem_wrt_en,
            rd_en => '1',
            data_out => mem_data_out
    );
    

end Behavioral;
