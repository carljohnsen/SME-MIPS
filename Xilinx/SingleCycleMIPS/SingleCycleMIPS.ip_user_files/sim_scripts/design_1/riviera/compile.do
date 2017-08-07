vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_11
vlib riviera/xlconstant_v1_1_3

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 riviera/proc_sys_reset_v5_0_11
vmap xlconstant_v1_1_3 riviera/xlconstant_v1_1_3

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" \
"/home/carljohnsen/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/home/carljohnsen/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_SingleCycleMIPS_export_0_0/sim/design_1_SingleCycleMIPS_export_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -93 \
"../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" \
"../../../bd/design_1/hdl/design_1.v" \

vlog -work xlconstant_v1_1_3  -v2k5 "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" \
"../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/45df/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../SingleCycleMIPS.srcs/sources_1/bd/design_1/ipshared/65a4" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

