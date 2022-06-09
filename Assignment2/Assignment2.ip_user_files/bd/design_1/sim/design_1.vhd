--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Thu Jun  9 10:24:03 2022
--Host        : Ubuntu-ZBook-15-G2 running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=8,numReposBlks=8,numNonXlnxBlks=6,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC
  );
  end component design_1_blk_mem_gen_0_0;
  component design_1_MIPS_BRAM_IFACE_0_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    CS : out STD_LOGIC;
    WE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Data_In : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Data_Out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_MIPS_BRAM_IFACE_0_0;
  component design_1_MIPS_BRAM_IFACE_1_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    CS : out STD_LOGIC;
    WE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Data_In : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Data_Out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_MIPS_BRAM_IFACE_1_0;
  component design_1_blk_mem_gen_0_1 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC
  );
  end component design_1_blk_mem_gen_0_1;
  component design_1_gpio_module_0_0 is
  port (
    clk : in STD_LOGIC;
    cs : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PORTA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_gpio_module_0_0;
  component design_1_addr_decoder_0_0 is
  port (
    addr_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_cs_in : in STD_LOGIC;
    mem_cs : out STD_LOGIC;
    gpio_cs : out STD_LOGIC
  );
  end component design_1_addr_decoder_0_0;
  component design_1_gpio_module_1_0 is
  port (
    clk : in STD_LOGIC;
    cs : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PORTA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTC : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PORTD : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_gpio_module_1_0;
  component design_1_addr_decoder_0_1 is
  port (
    addr_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_cs_in : in STD_LOGIC;
    mem_cs : out STD_LOGIC;
    gpio_cs : out STD_LOGIC
  );
  end component design_1_addr_decoder_0_1;
  signal BRAM_PORTB_0_1_ADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_1_CLK : STD_LOGIC;
  signal BRAM_PORTB_0_1_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_1_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_0_1_EN : STD_LOGIC;
  signal BRAM_PORTB_0_1_RST : STD_LOGIC;
  signal BRAM_PORTB_0_1_WE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BRAM_PORTB_1_1_ADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_1_1_CLK : STD_LOGIC;
  signal BRAM_PORTB_1_1_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_1_1_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal BRAM_PORTB_1_1_EN : STD_LOGIC;
  signal BRAM_PORTB_1_1_RST : STD_LOGIC;
  signal BRAM_PORTB_1_1_WE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal CLK_0_1 : STD_LOGIC;
  signal MIPS_BRAM_IFACE_0_ADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MIPS_BRAM_IFACE_0_CS : STD_LOGIC;
  signal MIPS_BRAM_IFACE_0_Data_Out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MIPS_BRAM_IFACE_0_WE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MIPS_BRAM_IFACE_1_ADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MIPS_BRAM_IFACE_1_CS : STD_LOGIC;
  signal MIPS_BRAM_IFACE_1_Data_Out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MIPS_BRAM_IFACE_1_WE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal RST_0_1 : STD_LOGIC;
  signal addr_decoder_0_gpio_cs : STD_LOGIC;
  signal addr_decoder_0_mem_cs : STD_LOGIC;
  signal addr_decoder_1_gpio_cs : STD_LOGIC;
  signal addr_decoder_1_mem_cs : STD_LOGIC;
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal blk_mem_gen_1_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal gpio_module_0_PORTA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_0_PORTB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_0_PORTC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_0_PORTD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_1_PORTA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_1_PORTB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_1_PORTC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gpio_module_1_PORTD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rsta_0_1 : STD_LOGIC;
  signal NLW_blk_mem_gen_0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_blk_mem_gen_0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_blk_mem_gen_1_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_blk_mem_gen_1_rstb_busy_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_clk : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 CLK";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_en : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 EN";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_rst : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 RST";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_clk : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 CLK";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_en : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 EN";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_rst : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 RST";
  attribute X_INTERFACE_INFO of CLK_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET RST_0, CLK_DOMAIN design_1_CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of RST_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of RST_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of rsta_0 : signal is "xilinx.com:signal:reset:1.0 RST.RSTA_0 RST";
  attribute X_INTERFACE_PARAMETER of rsta_0 : signal is "XIL_INTERFACENAME RST.RSTA_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_addr : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 ADDR";
  attribute X_INTERFACE_PARAMETER of BRAM_PORTB_0_addr : signal is "XIL_INTERFACENAME BRAM_PORTB_0, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_din : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 DIN";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_dout : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 DOUT";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_we : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 WE";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_addr : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 ADDR";
  attribute X_INTERFACE_PARAMETER of BRAM_PORTB_1_addr : signal is "XIL_INTERFACENAME BRAM_PORTB_1, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_din : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 DIN";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_dout : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 DOUT";
  attribute X_INTERFACE_INFO of BRAM_PORTB_1_we : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_1 WE";
begin
  BRAM_PORTB_0_1_ADDR(31 downto 0) <= BRAM_PORTB_0_addr(31 downto 0);
  BRAM_PORTB_0_1_CLK <= BRAM_PORTB_0_clk;
  BRAM_PORTB_0_1_DIN(31 downto 0) <= BRAM_PORTB_0_din(31 downto 0);
  BRAM_PORTB_0_1_EN <= BRAM_PORTB_0_en;
  BRAM_PORTB_0_1_RST <= BRAM_PORTB_0_rst;
  BRAM_PORTB_0_1_WE(3 downto 0) <= BRAM_PORTB_0_we(3 downto 0);
  BRAM_PORTB_0_dout(31 downto 0) <= BRAM_PORTB_0_1_DOUT(31 downto 0);
  BRAM_PORTB_1_1_ADDR(31 downto 0) <= BRAM_PORTB_1_addr(31 downto 0);
  BRAM_PORTB_1_1_CLK <= BRAM_PORTB_1_clk;
  BRAM_PORTB_1_1_DIN(31 downto 0) <= BRAM_PORTB_1_din(31 downto 0);
  BRAM_PORTB_1_1_EN <= BRAM_PORTB_1_en;
  BRAM_PORTB_1_1_RST <= BRAM_PORTB_1_rst;
  BRAM_PORTB_1_1_WE(3 downto 0) <= BRAM_PORTB_1_we(3 downto 0);
  BRAM_PORTB_1_dout(31 downto 0) <= BRAM_PORTB_1_1_DOUT(31 downto 0);
  CLK_0_1 <= CLK_0;
  PORTA_0(7 downto 0) <= gpio_module_0_PORTA(7 downto 0);
  PORTA_1(7 downto 0) <= gpio_module_1_PORTA(7 downto 0);
  PORTB_0(7 downto 0) <= gpio_module_0_PORTB(7 downto 0);
  PORTB_1(7 downto 0) <= gpio_module_1_PORTB(7 downto 0);
  PORTC_0(7 downto 0) <= gpio_module_0_PORTC(7 downto 0);
  PORTC_1(7 downto 0) <= gpio_module_1_PORTC(7 downto 0);
  PORTD_0(7 downto 0) <= gpio_module_0_PORTD(7 downto 0);
  PORTD_1(7 downto 0) <= gpio_module_1_PORTD(7 downto 0);
  RST_0_1 <= RST_0;
  rsta_0_1 <= rsta_0;
MIPS_BRAM_IFACE_0: component design_1_MIPS_BRAM_IFACE_0_0
     port map (
      ADDR(31 downto 0) => MIPS_BRAM_IFACE_0_ADDR(31 downto 0),
      CLK => CLK_0_1,
      CS => MIPS_BRAM_IFACE_0_CS,
      Data_In(31 downto 0) => blk_mem_gen_0_douta(31 downto 0),
      Data_Out(31 downto 0) => MIPS_BRAM_IFACE_0_Data_Out(31 downto 0),
      RST => RST_0_1,
      WE(3 downto 0) => MIPS_BRAM_IFACE_0_WE(3 downto 0)
    );
MIPS_BRAM_IFACE_1: component design_1_MIPS_BRAM_IFACE_1_0
     port map (
      ADDR(31 downto 0) => MIPS_BRAM_IFACE_1_ADDR(31 downto 0),
      CLK => CLK_0_1,
      CS => MIPS_BRAM_IFACE_1_CS,
      Data_In(31 downto 0) => blk_mem_gen_1_douta(31 downto 0),
      Data_Out(31 downto 0) => MIPS_BRAM_IFACE_1_Data_Out(31 downto 0),
      RST => RST_0_1,
      WE(3 downto 0) => MIPS_BRAM_IFACE_1_WE(3 downto 0)
    );
addr_decoder_0: component design_1_addr_decoder_0_0
     port map (
      addr_in(31 downto 0) => MIPS_BRAM_IFACE_0_ADDR(31 downto 0),
      gpio_cs => addr_decoder_0_gpio_cs,
      mem_cs => addr_decoder_0_mem_cs,
      mem_cs_in => MIPS_BRAM_IFACE_0_CS
    );
addr_decoder_1: component design_1_addr_decoder_0_1
     port map (
      addr_in(31 downto 0) => MIPS_BRAM_IFACE_1_ADDR(31 downto 0),
      gpio_cs => addr_decoder_1_gpio_cs,
      mem_cs => addr_decoder_1_mem_cs,
      mem_cs_in => MIPS_BRAM_IFACE_1_CS
    );
blk_mem_gen_0: component design_1_blk_mem_gen_0_0
     port map (
      addra(31 downto 0) => MIPS_BRAM_IFACE_0_ADDR(31 downto 0),
      addrb(31 downto 0) => BRAM_PORTB_0_1_ADDR(31 downto 0),
      clka => CLK_0_1,
      clkb => BRAM_PORTB_0_1_CLK,
      dina(31 downto 0) => MIPS_BRAM_IFACE_0_Data_Out(31 downto 0),
      dinb(31 downto 0) => BRAM_PORTB_0_1_DIN(31 downto 0),
      douta(31 downto 0) => blk_mem_gen_0_douta(31 downto 0),
      doutb(31 downto 0) => BRAM_PORTB_0_1_DOUT(31 downto 0),
      ena => addr_decoder_0_mem_cs,
      enb => BRAM_PORTB_0_1_EN,
      rsta => rsta_0_1,
      rsta_busy => NLW_blk_mem_gen_0_rsta_busy_UNCONNECTED,
      rstb => BRAM_PORTB_0_1_RST,
      rstb_busy => NLW_blk_mem_gen_0_rstb_busy_UNCONNECTED,
      wea(3 downto 0) => MIPS_BRAM_IFACE_0_WE(3 downto 0),
      web(3 downto 0) => BRAM_PORTB_0_1_WE(3 downto 0)
    );
blk_mem_gen_1: component design_1_blk_mem_gen_0_1
     port map (
      addra(31 downto 0) => MIPS_BRAM_IFACE_1_ADDR(31 downto 0),
      addrb(31 downto 0) => BRAM_PORTB_1_1_ADDR(31 downto 0),
      clka => CLK_0_1,
      clkb => BRAM_PORTB_1_1_CLK,
      dina(31 downto 0) => MIPS_BRAM_IFACE_1_Data_Out(31 downto 0),
      dinb(31 downto 0) => BRAM_PORTB_1_1_DIN(31 downto 0),
      douta(31 downto 0) => blk_mem_gen_1_douta(31 downto 0),
      doutb(31 downto 0) => BRAM_PORTB_1_1_DOUT(31 downto 0),
      ena => addr_decoder_1_mem_cs,
      enb => BRAM_PORTB_1_1_EN,
      rsta => rsta_0_1,
      rsta_busy => NLW_blk_mem_gen_1_rsta_busy_UNCONNECTED,
      rstb => BRAM_PORTB_1_1_RST,
      rstb_busy => NLW_blk_mem_gen_1_rstb_busy_UNCONNECTED,
      wea(3 downto 0) => MIPS_BRAM_IFACE_1_WE(3 downto 0),
      web(3 downto 0) => BRAM_PORTB_1_1_WE(3 downto 0)
    );
gpio_module_0: component design_1_gpio_module_0_0
     port map (
      PORTA(7 downto 0) => gpio_module_0_PORTA(7 downto 0),
      PORTB(7 downto 0) => gpio_module_0_PORTB(7 downto 0),
      PORTC(7 downto 0) => gpio_module_0_PORTC(7 downto 0),
      PORTD(7 downto 0) => gpio_module_0_PORTD(7 downto 0),
      addr(31 downto 0) => MIPS_BRAM_IFACE_0_ADDR(31 downto 0),
      clk => CLK_0_1,
      cs => addr_decoder_0_gpio_cs,
      data(31 downto 0) => MIPS_BRAM_IFACE_0_Data_Out(31 downto 0)
    );
gpio_module_1: component design_1_gpio_module_1_0
     port map (
      PORTA(7 downto 0) => gpio_module_1_PORTA(7 downto 0),
      PORTB(7 downto 0) => gpio_module_1_PORTB(7 downto 0),
      PORTC(7 downto 0) => gpio_module_1_PORTC(7 downto 0),
      PORTD(7 downto 0) => gpio_module_1_PORTD(7 downto 0),
      addr(31 downto 0) => MIPS_BRAM_IFACE_1_ADDR(31 downto 0),
      clk => CLK_0_1,
      cs => addr_decoder_1_gpio_cs,
      data(31 downto 0) => MIPS_BRAM_IFACE_1_Data_Out(31 downto 0)
    );
end STRUCTURE;
