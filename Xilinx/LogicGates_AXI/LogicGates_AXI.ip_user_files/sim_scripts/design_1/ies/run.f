-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ipshared/cf76/src/system_types.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/Types_LogicGates.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/AndGate.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/OrGate.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/NotGate.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/XorGate.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/LogicGates.vhdl" \
  "../../../bd/design_1/ipshared/cf76/src/Export_LogicGates.vhdl" \
  "../../../bd/design_1/ipshared/cf76/hdl/LogicGates_AXI_v1_0_S00_AXI.vhd" \
  "../../../bd/design_1/ipshared/cf76/hdl/LogicGates_AXI_v1_0.vhd" \
  "../../../bd/design_1/ip/design_1_LogicGates_AXI_0_0/sim/design_1_LogicGates_AXI_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0_sim_netlist.vhdl" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
  "../../../bd/design_1/hdl/design_1.vhd" \
  "../../../bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_sim_netlist.vhdl" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

