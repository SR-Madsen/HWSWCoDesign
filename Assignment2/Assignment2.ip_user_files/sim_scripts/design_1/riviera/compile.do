vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../../Assignment2.srcs/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ipshared/a2f0/reg_bank.vhd" \
"../../../bd/design_1/ipshared/a2f0/mips_bram_iface.vhd" \
"../../../bd/design_1/ip/design_1_MIPS_BRAM_IFACE_0_0/sim/design_1_MIPS_BRAM_IFACE_0_0.vhd" \
"../../../bd/design_1/ip/design_1_MIPS_BRAM_IFACE_1_0/sim/design_1_MIPS_BRAM_IFACE_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ipshared/f64d/project_hscod_mips_gpio_module.srcs/sources_1/new/gpio_module.vhd" \
"../../../bd/design_1/ip/design_1_gpio_module_0_0/sim/design_1_gpio_module_0_0.vhd" \
"../../../bd/design_1/ipshared/ebf8/addr_decoder.vhd" \
"../../../bd/design_1/ip/design_1_addr_decoder_0_0/sim/design_1_addr_decoder_0_0.vhd" \
"../../../bd/design_1/ip/design_1_gpio_module_1_0/sim/design_1_gpio_module_1_0.vhd" \
"../../../bd/design_1/ip/design_1_addr_decoder_0_1/sim/design_1_addr_decoder_0_1.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

