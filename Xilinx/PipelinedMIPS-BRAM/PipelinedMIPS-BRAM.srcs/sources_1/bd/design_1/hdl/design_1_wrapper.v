//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Sun Aug  6 15:50:38 2017
//Host        : ArchDesktop running 64-bit unknown
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    DEBUG_SHUTDOWN_running,
    RST);
  input CLK;
  output DEBUG_SHUTDOWN_running;
  input RST;

  wire CLK;
  wire DEBUG_SHUTDOWN_running;
  wire RST;

  design_1 design_1_i
       (.CLK(CLK),
        .DEBUG_SHUTDOWN_running(DEBUG_SHUTDOWN_running),
        .RST(RST));
endmodule
