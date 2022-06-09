
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set BRAM_PORTB_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_PORTB_0 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $BRAM_PORTB_0

  set BRAM_PORTB_1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_PORTB_1 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $BRAM_PORTB_1


  # Create ports
  set CLK_0 [ create_bd_port -dir I -type clk CLK_0 ]
  set PORTA_0 [ create_bd_port -dir O -from 7 -to 0 PORTA_0 ]
  set PORTA_1 [ create_bd_port -dir O -from 7 -to 0 PORTA_1 ]
  set PORTB_0 [ create_bd_port -dir O -from 7 -to 0 PORTB_0 ]
  set PORTB_1 [ create_bd_port -dir O -from 7 -to 0 PORTB_1 ]
  set PORTC_0 [ create_bd_port -dir O -from 7 -to 0 PORTC_0 ]
  set PORTC_1 [ create_bd_port -dir O -from 7 -to 0 PORTC_1 ]
  set PORTD_0 [ create_bd_port -dir O -from 7 -to 0 PORTD_0 ]
  set PORTD_1 [ create_bd_port -dir O -from 7 -to 0 PORTD_1 ]
  set RST_0 [ create_bd_port -dir I -type rst RST_0 ]
  set rsta_0 [ create_bd_port -dir I -type rst rsta_0 ]

  # Create instance: MIPS_BRAM_IFACE_0, and set properties
  set MIPS_BRAM_IFACE_0 [ create_bd_cell -type ip -vlnv sdu.dk:user:MIPS_BRAM_IFACE:1.0 MIPS_BRAM_IFACE_0 ]

  # Create instance: MIPS_BRAM_IFACE_1, and set properties
  set MIPS_BRAM_IFACE_1 [ create_bd_cell -type ip -vlnv sdu.dk:user:MIPS_BRAM_IFACE:1.0 MIPS_BRAM_IFACE_1 ]

  # Create instance: addr_decoder_0, and set properties
  set addr_decoder_0 [ create_bd_cell -type ip -vlnv sdu.dk:user:addr_decoder:1.1 addr_decoder_0 ]

  # Create instance: addr_decoder_1, and set properties
  set addr_decoder_1 [ create_bd_cell -type ip -vlnv sdu.dk:user:addr_decoder:1.1 addr_decoder_1 ]

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_1 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_1

  # Create instance: gpio_module_0, and set properties
  set gpio_module_0 [ create_bd_cell -type ip -vlnv sdu.dk:user:gpio_module:1.0 gpio_module_0 ]

  # Create instance: gpio_module_1, and set properties
  set gpio_module_1 [ create_bd_cell -type ip -vlnv sdu.dk:user:gpio_module:1.0 gpio_module_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net BRAM_PORTB_0_1 [get_bd_intf_ports BRAM_PORTB_0] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB]
  connect_bd_intf_net -intf_net BRAM_PORTB_1_1 [get_bd_intf_ports BRAM_PORTB_1] [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net CLK_0_1 [get_bd_ports CLK_0] [get_bd_pins MIPS_BRAM_IFACE_0/CLK] [get_bd_pins MIPS_BRAM_IFACE_1/CLK] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins blk_mem_gen_1/clka] [get_bd_pins gpio_module_0/clk] [get_bd_pins gpio_module_1/clk]
  connect_bd_net -net MIPS_BRAM_IFACE_0_ADDR [get_bd_pins MIPS_BRAM_IFACE_0/ADDR] [get_bd_pins addr_decoder_0/addr_in] [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins gpio_module_0/addr]
  connect_bd_net -net MIPS_BRAM_IFACE_0_CS [get_bd_pins MIPS_BRAM_IFACE_0/CS] [get_bd_pins addr_decoder_0/mem_cs_in]
  connect_bd_net -net MIPS_BRAM_IFACE_0_Data_Out [get_bd_pins MIPS_BRAM_IFACE_0/Data_Out] [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins gpio_module_0/data]
  connect_bd_net -net MIPS_BRAM_IFACE_0_WE [get_bd_pins MIPS_BRAM_IFACE_0/WE] [get_bd_pins blk_mem_gen_0/wea]
  connect_bd_net -net MIPS_BRAM_IFACE_1_ADDR [get_bd_pins MIPS_BRAM_IFACE_1/ADDR] [get_bd_pins addr_decoder_1/addr_in] [get_bd_pins blk_mem_gen_1/addra] [get_bd_pins gpio_module_1/addr]
  connect_bd_net -net MIPS_BRAM_IFACE_1_CS [get_bd_pins MIPS_BRAM_IFACE_1/CS] [get_bd_pins addr_decoder_1/mem_cs_in]
  connect_bd_net -net MIPS_BRAM_IFACE_1_Data_Out [get_bd_pins MIPS_BRAM_IFACE_1/Data_Out] [get_bd_pins blk_mem_gen_1/dina] [get_bd_pins gpio_module_1/data]
  connect_bd_net -net MIPS_BRAM_IFACE_1_WE [get_bd_pins MIPS_BRAM_IFACE_1/WE] [get_bd_pins blk_mem_gen_1/wea]
  connect_bd_net -net RST_0_1 [get_bd_ports RST_0] [get_bd_pins MIPS_BRAM_IFACE_0/RST] [get_bd_pins MIPS_BRAM_IFACE_1/RST]
  connect_bd_net -net addr_decoder_0_gpio_cs [get_bd_pins addr_decoder_0/gpio_cs] [get_bd_pins gpio_module_0/cs]
  connect_bd_net -net addr_decoder_0_mem_cs [get_bd_pins addr_decoder_0/mem_cs] [get_bd_pins blk_mem_gen_0/ena]
  connect_bd_net -net addr_decoder_1_gpio_cs [get_bd_pins addr_decoder_1/gpio_cs] [get_bd_pins gpio_module_1/cs]
  connect_bd_net -net addr_decoder_1_mem_cs [get_bd_pins addr_decoder_1/mem_cs] [get_bd_pins blk_mem_gen_1/ena]
  connect_bd_net -net blk_mem_gen_0_douta [get_bd_pins MIPS_BRAM_IFACE_0/Data_In] [get_bd_pins blk_mem_gen_0/douta]
  connect_bd_net -net blk_mem_gen_1_douta [get_bd_pins MIPS_BRAM_IFACE_1/Data_In] [get_bd_pins blk_mem_gen_1/douta]
  connect_bd_net -net gpio_module_0_PORTA [get_bd_ports PORTA_0] [get_bd_pins gpio_module_0/PORTA]
  connect_bd_net -net gpio_module_0_PORTB [get_bd_ports PORTB_0] [get_bd_pins gpio_module_0/PORTB]
  connect_bd_net -net gpio_module_0_PORTC [get_bd_ports PORTC_0] [get_bd_pins gpio_module_0/PORTC]
  connect_bd_net -net gpio_module_0_PORTD [get_bd_ports PORTD_0] [get_bd_pins gpio_module_0/PORTD]
  connect_bd_net -net gpio_module_1_PORTA [get_bd_ports PORTA_1] [get_bd_pins gpio_module_1/PORTA]
  connect_bd_net -net gpio_module_1_PORTB [get_bd_ports PORTB_1] [get_bd_pins gpio_module_1/PORTB]
  connect_bd_net -net gpio_module_1_PORTC [get_bd_ports PORTC_1] [get_bd_pins gpio_module_1/PORTC]
  connect_bd_net -net gpio_module_1_PORTD [get_bd_ports PORTD_1] [get_bd_pins gpio_module_1/PORTD]
  connect_bd_net -net rsta_0_1 [get_bd_ports rsta_0] [get_bd_pins blk_mem_gen_0/rsta] [get_bd_pins blk_mem_gen_1/rsta]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


