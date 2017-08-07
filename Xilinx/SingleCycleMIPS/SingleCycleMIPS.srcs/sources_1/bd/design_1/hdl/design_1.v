//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Mon Jun 19 10:54:48 2017
//Host        : ArchDesktop running 64-bit unknown
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (DEBUG_SHUTDOWN_running,
    reset,
    sys_clock);
  output DEBUG_SHUTDOWN_running;
  input reset;
  input sys_clock;

  wire SingleCycleMIPS_export_0_DEBUG_SHUTDOWN_running;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire proc_sys_reset_0_mb_reset;
  wire reset_1;
  wire sys_clock_1;
  wire [0:0]xlconstant_0_dout;

  assign DEBUG_SHUTDOWN_running = SingleCycleMIPS_export_0_DEBUG_SHUTDOWN_running;
  assign reset_1 = reset;
  assign sys_clock_1 = sys_clock;
  design_1_SingleCycleMIPS_export_0_0 SingleCycleMIPS_export_0
       (.CLK(clk_wiz_0_clk_out1),
        .DEBUG_SHUTDOWN_running(SingleCycleMIPS_export_0_DEBUG_SHUTDOWN_running),
        .RST(proc_sys_reset_0_mb_reset));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .reset(reset_1));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(xlconstant_0_dout),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(proc_sys_reset_0_mb_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
