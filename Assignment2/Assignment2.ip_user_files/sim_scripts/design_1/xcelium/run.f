-makelib xcelium_lib/xpm -sv \
  "/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../Assignment2.srcs/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ipshared/a2f0/reg_bank.vhd" \
  "../../../bd/design_1/ipshared/a2f0/mips_bram_iface.vhd" \
  "../../../bd/design_1/ip/design_1_MIPS_BRAM_IFACE_0_0/sim/design_1_MIPS_BRAM_IFACE_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_MIPS_BRAM_IFACE_1_0/sim/design_1_MIPS_BRAM_IFACE_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ipshared/f64d/project_hscod_mips_gpio_module.srcs/sources_1/new/gpio_module.vhd" \
  "../../../bd/design_1/ip/design_1_gpio_module_0_0/sim/design_1_gpio_module_0_0.vhd" \
  "../../../bd/design_1/ipshared/ebf8/addr_decoder.vhd" \
  "../../../bd/design_1/ip/design_1_addr_decoder_0_0/sim/design_1_addr_decoder_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_gpio_module_1_0/sim/design_1_gpio_module_1_0.vhd" \
  "../../../bd/design_1/ip/design_1_addr_decoder_0_1/sim/design_1_addr_decoder_0_1.vhd" \
  "../../../bd/design_1/sim/design_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

