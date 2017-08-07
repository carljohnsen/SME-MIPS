-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Wed Jun 21 11:30:28 2017
-- Host        : ArchDesktop running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/carljohnsen/vivado/SingleCycleMIPS-AXI/SingleCycleMIPS-AXI.srcs/sources_1/bd/design_1/ip/design_1_SingleCycleMIPS_axi_v1_0_0_0/design_1_SingleCycleMIPS_axi_v1_0_0_0_stub.vhdl
-- Design      : design_1_SingleCycleMIPS_axi_v1_0_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_SingleCycleMIPS_axi_v1_0_0_0 is
  Port ( 
    cpu_clk : in STD_LOGIC;
    cpu_rst : in STD_LOGIC;
    control_aclk : in STD_LOGIC;
    control_aresetn : in STD_LOGIC;
    control_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_awvalid : in STD_LOGIC;
    control_awready : out STD_LOGIC;
    control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_wvalid : in STD_LOGIC;
    control_wready : out STD_LOGIC;
    control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    control_bvalid : out STD_LOGIC;
    control_bready : in STD_LOGIC;
    control_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    control_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_arvalid : in STD_LOGIC;
    control_arready : out STD_LOGIC;
    control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    control_rvalid : out STD_LOGIC;
    control_rready : in STD_LOGIC;
    instruction_aclk : in STD_LOGIC;
    instruction_aresetn : in STD_LOGIC;
    instruction_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    instruction_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    instruction_awvalid : in STD_LOGIC;
    instruction_awready : out STD_LOGIC;
    instruction_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    instruction_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    instruction_wvalid : in STD_LOGIC;
    instruction_wready : out STD_LOGIC;
    instruction_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    instruction_bvalid : out STD_LOGIC;
    instruction_bready : in STD_LOGIC;
    instruction_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    instruction_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    instruction_arvalid : in STD_LOGIC;
    instruction_arready : out STD_LOGIC;
    instruction_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    instruction_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    instruction_rvalid : out STD_LOGIC;
    instruction_rready : in STD_LOGIC;
    memory_aclk : in STD_LOGIC;
    memory_aresetn : in STD_LOGIC;
    memory_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    memory_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    memory_awvalid : in STD_LOGIC;
    memory_awready : out STD_LOGIC;
    memory_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    memory_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    memory_wvalid : in STD_LOGIC;
    memory_wready : out STD_LOGIC;
    memory_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    memory_bvalid : out STD_LOGIC;
    memory_bready : in STD_LOGIC;
    memory_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    memory_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    memory_arvalid : in STD_LOGIC;
    memory_arready : out STD_LOGIC;
    memory_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    memory_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    memory_rvalid : out STD_LOGIC;
    memory_rready : in STD_LOGIC
  );

end design_1_SingleCycleMIPS_axi_v1_0_0_0;

architecture stub of design_1_SingleCycleMIPS_axi_v1_0_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "cpu_clk,cpu_rst,control_aclk,control_aresetn,control_awaddr[3:0],control_awprot[2:0],control_awvalid,control_awready,control_wdata[31:0],control_wstrb[3:0],control_wvalid,control_wready,control_bresp[1:0],control_bvalid,control_bready,control_araddr[3:0],control_arprot[2:0],control_arvalid,control_arready,control_rdata[31:0],control_rresp[1:0],control_rvalid,control_rready,instruction_aclk,instruction_aresetn,instruction_awaddr[8:0],instruction_awprot[2:0],instruction_awvalid,instruction_awready,instruction_wdata[31:0],instruction_wstrb[3:0],instruction_wvalid,instruction_wready,instruction_bresp[1:0],instruction_bvalid,instruction_bready,instruction_araddr[8:0],instruction_arprot[2:0],instruction_arvalid,instruction_arready,instruction_rdata[31:0],instruction_rresp[1:0],instruction_rvalid,instruction_rready,memory_aclk,memory_aresetn,memory_awaddr[8:0],memory_awprot[2:0],memory_awvalid,memory_awready,memory_wdata[31:0],memory_wstrb[3:0],memory_wvalid,memory_wready,memory_bresp[1:0],memory_bvalid,memory_bready,memory_araddr[8:0],memory_arprot[2:0],memory_arvalid,memory_arready,memory_rdata[31:0],memory_rresp[1:0],memory_rvalid,memory_rready";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SingleCycleMIPS_v1_0,Vivado 2017.1";
begin
end;
