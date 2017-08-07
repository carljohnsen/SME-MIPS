vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/util_vector_logic_v2_0_1
vlib msim/blk_mem_gen_v8_3_6
vlib msim/xlconstant_v1_1_3

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap util_vector_logic_v2_0_1 msim/util_vector_logic_v2_0_1
vmap blk_mem_gen_v8_3_6 msim/blk_mem_gen_v8_3_6
vmap xlconstant_v1_1_3 msim/xlconstant_v1_1_3

vlog -work xil_defaultlib -64 -incr -sv \
"/home/carljohnsen/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/carljohnsen/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work util_vector_logic_v2_0_1 -64 -incr \
"../../../../PipelinedMIPS-BRAM.srcs/sources_1/bd/design_1/ipshared/6d4d/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_util_vector_logic_0_0/sim/design_1_util_vector_logic_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_PipelinedMIPS_export_0_0/sim/design_1_PipelinedMIPS_export_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/hdl/design_1.v" \

vlog -work blk_mem_gen_v8_3_6 -64 -incr \
"../../../../PipelinedMIPS-BRAM.srcs/sources_1/bd/design_1/ipshared/4158/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_2/sim/design_1_blk_mem_gen_0_2.v" \

vlog -work xlconstant_v1_1_3 -64 -incr \
"../../../../PipelinedMIPS-BRAM.srcs/sources_1/bd/design_1/ipshared/45df/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_1_0/sim/design_1_blk_mem_gen_1_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

