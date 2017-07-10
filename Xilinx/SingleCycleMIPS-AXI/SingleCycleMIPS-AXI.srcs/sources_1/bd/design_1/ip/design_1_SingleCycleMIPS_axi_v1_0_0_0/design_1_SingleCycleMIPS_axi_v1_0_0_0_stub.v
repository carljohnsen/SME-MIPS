// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Mon Jul 10 10:41:29 2017
// Host        : L10-0002 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/ihicajo/Documents/Xilinx/SingleCycleMIPS-AXI/SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ip/design_1_SingleCycleMIPS_axi_v1_0_0_0/design_1_SingleCycleMIPS_axi_v1_0_0_0_stub.v
// Design      : design_1_SingleCycleMIPS_axi_v1_0_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SingleCycleMIPS_v1_0,Vivado 2017.1" *)
module design_1_SingleCycleMIPS_axi_v1_0_0_0(cpu_clk, control_aclk, control_aresetn, 
  control_awaddr, control_awprot, control_awvalid, control_awready, control_wdata, 
  control_wstrb, control_wvalid, control_wready, control_bresp, control_bvalid, 
  control_bready, control_araddr, control_arprot, control_arvalid, control_arready, 
  control_rdata, control_rresp, control_rvalid, control_rready, instruction_aclk, 
  instruction_aresetn, instruction_awaddr, instruction_awprot, instruction_awvalid, 
  instruction_awready, instruction_wdata, instruction_wstrb, instruction_wvalid, 
  instruction_wready, instruction_bresp, instruction_bvalid, instruction_bready, 
  instruction_araddr, instruction_arprot, instruction_arvalid, instruction_arready, 
  instruction_rdata, instruction_rresp, instruction_rvalid, instruction_rready, 
  memory_aclk, memory_aresetn, memory_awaddr, memory_awprot, memory_awvalid, memory_awready, 
  memory_wdata, memory_wstrb, memory_wvalid, memory_wready, memory_bresp, memory_bvalid, 
  memory_bready, memory_araddr, memory_arprot, memory_arvalid, memory_arready, memory_rdata, 
  memory_rresp, memory_rvalid, memory_rready)
/* synthesis syn_black_box black_box_pad_pin="cpu_clk,control_aclk,control_aresetn,control_awaddr[3:0],control_awprot[2:0],control_awvalid,control_awready,control_wdata[31:0],control_wstrb[3:0],control_wvalid,control_wready,control_bresp[1:0],control_bvalid,control_bready,control_araddr[3:0],control_arprot[2:0],control_arvalid,control_arready,control_rdata[31:0],control_rresp[1:0],control_rvalid,control_rready,instruction_aclk,instruction_aresetn,instruction_awaddr[8:0],instruction_awprot[2:0],instruction_awvalid,instruction_awready,instruction_wdata[31:0],instruction_wstrb[3:0],instruction_wvalid,instruction_wready,instruction_bresp[1:0],instruction_bvalid,instruction_bready,instruction_araddr[8:0],instruction_arprot[2:0],instruction_arvalid,instruction_arready,instruction_rdata[31:0],instruction_rresp[1:0],instruction_rvalid,instruction_rready,memory_aclk,memory_aresetn,memory_awaddr[8:0],memory_awprot[2:0],memory_awvalid,memory_awready,memory_wdata[31:0],memory_wstrb[3:0],memory_wvalid,memory_wready,memory_bresp[1:0],memory_bvalid,memory_bready,memory_araddr[8:0],memory_arprot[2:0],memory_arvalid,memory_arready,memory_rdata[31:0],memory_rresp[1:0],memory_rvalid,memory_rready" */;
  input cpu_clk;
  input control_aclk;
  input control_aresetn;
  input [3:0]control_awaddr;
  input [2:0]control_awprot;
  input control_awvalid;
  output control_awready;
  input [31:0]control_wdata;
  input [3:0]control_wstrb;
  input control_wvalid;
  output control_wready;
  output [1:0]control_bresp;
  output control_bvalid;
  input control_bready;
  input [3:0]control_araddr;
  input [2:0]control_arprot;
  input control_arvalid;
  output control_arready;
  output [31:0]control_rdata;
  output [1:0]control_rresp;
  output control_rvalid;
  input control_rready;
  input instruction_aclk;
  input instruction_aresetn;
  input [8:0]instruction_awaddr;
  input [2:0]instruction_awprot;
  input instruction_awvalid;
  output instruction_awready;
  input [31:0]instruction_wdata;
  input [3:0]instruction_wstrb;
  input instruction_wvalid;
  output instruction_wready;
  output [1:0]instruction_bresp;
  output instruction_bvalid;
  input instruction_bready;
  input [8:0]instruction_araddr;
  input [2:0]instruction_arprot;
  input instruction_arvalid;
  output instruction_arready;
  output [31:0]instruction_rdata;
  output [1:0]instruction_rresp;
  output instruction_rvalid;
  input instruction_rready;
  input memory_aclk;
  input memory_aresetn;
  input [8:0]memory_awaddr;
  input [2:0]memory_awprot;
  input memory_awvalid;
  output memory_awready;
  input [31:0]memory_wdata;
  input [3:0]memory_wstrb;
  input memory_wvalid;
  output memory_wready;
  output [1:0]memory_bresp;
  output memory_bvalid;
  input memory_bready;
  input [8:0]memory_araddr;
  input [2:0]memory_arprot;
  input memory_arvalid;
  output memory_arready;
  output [31:0]memory_rdata;
  output [1:0]memory_rresp;
  output memory_rvalid;
  input memory_rready;
endmodule
