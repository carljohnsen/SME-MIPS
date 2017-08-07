//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Mon Jun 19 10:54:48 2017
//Host        : ArchDesktop running 64-bit unknown
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DEBUG_SHUTDOWN_running,
    reset,
    sys_clock);
  output DEBUG_SHUTDOWN_running;
  input reset;
  input sys_clock;

  wire DEBUG_SHUTDOWN_running;
  wire reset;
  wire sys_clock;

  design_1 design_1_i
       (.DEBUG_SHUTDOWN_running(DEBUG_SHUTDOWN_running),
        .reset(reset),
        .sys_clock(sys_clock));
endmodule
