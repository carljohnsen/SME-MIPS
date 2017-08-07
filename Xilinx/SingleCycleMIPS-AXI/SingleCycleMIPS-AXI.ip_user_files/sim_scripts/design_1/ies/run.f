-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_infrastructure_v1_1_0 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies/xil_common_vip_v1_0_0 -sv \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/16a2/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_protocol_checker_v1_1_13 -sv \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/8017/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_1 -sv \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/856d/hdl/axi_vip_v1_0_vl_rfs.sv" \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/d5eb/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ipshared/9e02/src/system_types.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Types_SingleCycleMIPS.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/ALU.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/ALUControl.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Adder.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/AndGate.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Control.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Splitter.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Mux.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/SignExtend.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/vhdl_Register.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/PC.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Incrementer.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/InstructionMemory.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Memory.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/MemMux.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/ImmMux.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/ShmtMux.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/JalMux.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/JalUnit.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Mux0.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Mux1.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Mux2.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/ShiftB.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/shiftJ.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Packer.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/WriteBuffer.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/SingleCycleMIPS.vhdl" \
  "../../../bd/design_1/ipshared/9e02/src/Export_SingleCycleMIPS.vhdl" \
  "../../../bd/design_1/ipshared/9e02/hdl/SingleCycleMIPS_v1_0_Control.vhd" \
  "../../../bd/design_1/ipshared/9e02/hdl/SingleCycleMIPS_v1_0_Instruction.vhd" \
  "../../../bd/design_1/ipshared/9e02/hdl/SingleCycleMIPS_v1_0_Memory.vhd" \
  "../../../bd/design_1/ipshared/9e02/hdl/SingleCycleMIPS_v1_0.vhd" \
  "../../../bd/design_1/ip/design_1_SingleCycleMIPS_axi_v1_0_0_0/sim/design_1_SingleCycleMIPS_axi_v1_0_0_0.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
-endlib
-makelib ies/generic_baseblocks_v2_1_0 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_register_slice_v2_1_12 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/0e33/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/axi_data_fifo_v2_1_11 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/5235/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_crossbar_v2_1_13 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/78eb/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
-endlib
-makelib ies/util_vector_logic_v2_0_1 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/6d4d/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_util_vector_logic_0_0/sim/design_1_util_vector_logic_0_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/hdl/design_1.vhd" \
-endlib
-makelib ies/axi_protocol_converter_v2_1_12 \
  "../../../../SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ipshared/138d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

