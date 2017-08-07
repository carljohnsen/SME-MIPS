vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_11

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 msim/proc_sys_reset_v5_0_11

vlog -work xil_defaultlib -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_13 -L xil_common_vip_v1_0_0 -L axi_vip_v1_0_1 "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/2ad9/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/16a2/hdl/verilog" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/856d/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/d5eb/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/2ad9/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/16a2/hdl/verilog" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/856d/hdl" "+incdir+../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/d5eb/hdl" \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
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

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -64 -93 \
"../../../../LogicGates_AXI.srcs/sources_1/bd/design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
"../../../bd/design_1/hdl/design_1.vhd" \
"../../../bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_sim_netlist.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

