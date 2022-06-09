#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Jun 09 11:00:43 CEST 2022
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto ab73d4f13fb6482c89206ac854d1fcd0 --incr --debug typical --relax --mt 8 -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot dual_mips_tb_behav xil_defaultlib.dual_mips_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto ab73d4f13fb6482c89206ac854d1fcd0 --incr --debug typical --relax --mt 8 -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot dual_mips_tb_behav xil_defaultlib.dual_mips_tb xil_defaultlib.glbl -log elaborate.log
