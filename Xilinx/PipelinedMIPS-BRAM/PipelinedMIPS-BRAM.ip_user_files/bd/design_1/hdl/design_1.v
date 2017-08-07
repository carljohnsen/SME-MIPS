//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Fri Aug  4 14:57:34 2017
//Host        : ArchDesktop running 64-bit unknown
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK,
    DEBUG_SHUTDOWN_running,
    RST);
  input CLK;
  output DEBUG_SHUTDOWN_running;
  input RST;

  wire CLK_1;
  wire PipelinedMIPS_export_0_DEBUG_SHUTDOWN_running;
  wire [31:0]PipelinedMIPS_export_0_EXTERNAL_Address_address;
  wire [31:0]PipelinedMIPS_export_0_EXTERNAL_MEM_Addr_addr;
  wire PipelinedMIPS_export_0_EXTERNAL_MEM_Read_flg;
  wire [31:0]PipelinedMIPS_export_0_EXTERNAL_MEM_WriteData_data;
  wire PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg;
  wire RST_1;
  wire [31:0]blk_mem_gen_0_doutb1;
  wire [31:0]blk_mem_gen_1_doutb;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]xlconstant_0_dout;

  assign CLK_1 = CLK;
  assign DEBUG_SHUTDOWN_running = PipelinedMIPS_export_0_DEBUG_SHUTDOWN_running;
  assign RST_1 = RST;
  design_1_PipelinedMIPS_export_0_0 PipelinedMIPS_export_0
       (.CLK(CLK_1),
        .DEBUG_SHUTDOWN_running(PipelinedMIPS_export_0_DEBUG_SHUTDOWN_running),
        .EXTERNAL_Address_address(PipelinedMIPS_export_0_EXTERNAL_Address_address),
        .EXTERNAL_Instruction_instruction(blk_mem_gen_1_doutb),
        .EXTERNAL_MEM_Addr_addr(PipelinedMIPS_export_0_EXTERNAL_MEM_Addr_addr),
        .EXTERNAL_MEM_ReadData_data(blk_mem_gen_0_doutb1),
        .EXTERNAL_MEM_Read_flg(PipelinedMIPS_export_0_EXTERNAL_MEM_Read_flg),
        .EXTERNAL_MEM_WriteData_data(PipelinedMIPS_export_0_EXTERNAL_MEM_WriteData_data),
        .EXTERNAL_MEM_Write_flg(PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg),
        .RST(RST_1));
  design_1_blk_mem_gen_0_2 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .addrb(PipelinedMIPS_export_0_EXTERNAL_MEM_Addr_addr),
        .clka(CLK_1),
        .clkb(CLK_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb(PipelinedMIPS_export_0_EXTERNAL_MEM_WriteData_data),
        .doutb(blk_mem_gen_0_doutb1),
        .ena(xlconstant_0_dout),
        .enb(util_vector_logic_0_Res),
        .rsta(RST_1),
        .rstb(RST_1),
        .wea({1'b0,1'b0,1'b0,1'b0}),
        .web({PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg,PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg,PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg,PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg}));
  design_1_blk_mem_gen_1_0 blk_mem_gen_1
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .addrb(PipelinedMIPS_export_0_EXTERNAL_Address_address),
        .clka(CLK_1),
        .clkb(CLK_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(blk_mem_gen_1_doutb),
        .ena(1'b0),
        .enb(xlconstant_0_dout),
        .rsta(RST_1),
        .rstb(RST_1),
        .wea({1'b0,1'b0,1'b0,1'b0}),
        .web({1'b0,1'b0,1'b0,1'b0}));
  design_1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(PipelinedMIPS_export_0_EXTERNAL_MEM_Read_flg),
        .Op2(PipelinedMIPS_export_0_EX_Pipe_MemWrite_flg),
        .Res(util_vector_logic_0_Res));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
