// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Mon Jun 19 06:56:07 2017
// Host        : ArchDesktop running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/carljohnsen/vivado/SingleCycleMIPS/SingleCycleMIPS.srcs/sources_1/bd/design_1/ip/design_1_SingleCycleMIPS_export_0_0/design_1_SingleCycleMIPS_export_0_0_stub.v
// Design      : design_1_SingleCycleMIPS_export_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SingleCycleMIPS_export,Vivado 2017.1" *)
module design_1_SingleCycleMIPS_export_0_0(DEBUG_SHUTDOWN_running, RST, CLK)
/* synthesis syn_black_box black_box_pad_pin="DEBUG_SHUTDOWN_running,RST,CLK" */;
  output DEBUG_SHUTDOWN_running;
  input RST;
  input CLK;
endmodule
