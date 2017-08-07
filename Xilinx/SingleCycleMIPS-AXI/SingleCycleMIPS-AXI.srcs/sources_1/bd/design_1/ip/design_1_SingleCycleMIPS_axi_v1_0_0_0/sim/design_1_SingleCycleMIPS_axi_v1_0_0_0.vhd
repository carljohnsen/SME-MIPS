-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: carljohnsen:user:SingleCycleMIPS_axi_v1_0:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_SingleCycleMIPS_axi_v1_0_0_0 IS
  PORT (
    cpu_clk : IN STD_LOGIC;
    cpu_rst : IN STD_LOGIC;
    control_aclk : IN STD_LOGIC;
    control_aresetn : IN STD_LOGIC;
    control_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    control_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    control_awvalid : IN STD_LOGIC;
    control_awready : OUT STD_LOGIC;
    control_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    control_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    control_wvalid : IN STD_LOGIC;
    control_wready : OUT STD_LOGIC;
    control_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    control_bvalid : OUT STD_LOGIC;
    control_bready : IN STD_LOGIC;
    control_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    control_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    control_arvalid : IN STD_LOGIC;
    control_arready : OUT STD_LOGIC;
    control_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    control_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    control_rvalid : OUT STD_LOGIC;
    control_rready : IN STD_LOGIC;
    instruction_aclk : IN STD_LOGIC;
    instruction_aresetn : IN STD_LOGIC;
    instruction_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    instruction_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    instruction_awvalid : IN STD_LOGIC;
    instruction_awready : OUT STD_LOGIC;
    instruction_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    instruction_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    instruction_wvalid : IN STD_LOGIC;
    instruction_wready : OUT STD_LOGIC;
    instruction_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    instruction_bvalid : OUT STD_LOGIC;
    instruction_bready : IN STD_LOGIC;
    instruction_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    instruction_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    instruction_arvalid : IN STD_LOGIC;
    instruction_arready : OUT STD_LOGIC;
    instruction_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    instruction_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    instruction_rvalid : OUT STD_LOGIC;
    instruction_rready : IN STD_LOGIC;
    memory_aclk : IN STD_LOGIC;
    memory_aresetn : IN STD_LOGIC;
    memory_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    memory_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    memory_awvalid : IN STD_LOGIC;
    memory_awready : OUT STD_LOGIC;
    memory_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    memory_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    memory_wvalid : IN STD_LOGIC;
    memory_wready : OUT STD_LOGIC;
    memory_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    memory_bvalid : OUT STD_LOGIC;
    memory_bready : IN STD_LOGIC;
    memory_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    memory_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    memory_arvalid : IN STD_LOGIC;
    memory_arready : OUT STD_LOGIC;
    memory_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    memory_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    memory_rvalid : OUT STD_LOGIC;
    memory_rready : IN STD_LOGIC
  );
END design_1_SingleCycleMIPS_axi_v1_0_0_0;

ARCHITECTURE design_1_SingleCycleMIPS_axi_v1_0_0_0_arch OF design_1_SingleCycleMIPS_axi_v1_0_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_SingleCycleMIPS_axi_v1_0_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT SingleCycleMIPS_v1_0 IS
    GENERIC (
      C_Control_DATA_WIDTH : INTEGER;
      C_Control_ADDR_WIDTH : INTEGER;
      C_Instruction_DATA_WIDTH : INTEGER;
      C_Instruction_ADDR_WIDTH : INTEGER;
      C_Memory_DATA_WIDTH : INTEGER;
      C_Memory_ADDR_WIDTH : INTEGER
    );
    PORT (
      cpu_clk : IN STD_LOGIC;
      cpu_rst : IN STD_LOGIC;
      control_aclk : IN STD_LOGIC;
      control_aresetn : IN STD_LOGIC;
      control_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      control_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      control_awvalid : IN STD_LOGIC;
      control_awready : OUT STD_LOGIC;
      control_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      control_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      control_wvalid : IN STD_LOGIC;
      control_wready : OUT STD_LOGIC;
      control_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      control_bvalid : OUT STD_LOGIC;
      control_bready : IN STD_LOGIC;
      control_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      control_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      control_arvalid : IN STD_LOGIC;
      control_arready : OUT STD_LOGIC;
      control_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      control_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      control_rvalid : OUT STD_LOGIC;
      control_rready : IN STD_LOGIC;
      instruction_aclk : IN STD_LOGIC;
      instruction_aresetn : IN STD_LOGIC;
      instruction_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      instruction_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      instruction_awvalid : IN STD_LOGIC;
      instruction_awready : OUT STD_LOGIC;
      instruction_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      instruction_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      instruction_wvalid : IN STD_LOGIC;
      instruction_wready : OUT STD_LOGIC;
      instruction_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      instruction_bvalid : OUT STD_LOGIC;
      instruction_bready : IN STD_LOGIC;
      instruction_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      instruction_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      instruction_arvalid : IN STD_LOGIC;
      instruction_arready : OUT STD_LOGIC;
      instruction_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      instruction_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      instruction_rvalid : OUT STD_LOGIC;
      instruction_rready : IN STD_LOGIC;
      memory_aclk : IN STD_LOGIC;
      memory_aresetn : IN STD_LOGIC;
      memory_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      memory_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      memory_awvalid : IN STD_LOGIC;
      memory_awready : OUT STD_LOGIC;
      memory_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      memory_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      memory_wvalid : IN STD_LOGIC;
      memory_wready : OUT STD_LOGIC;
      memory_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      memory_bvalid : OUT STD_LOGIC;
      memory_bready : IN STD_LOGIC;
      memory_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      memory_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      memory_arvalid : IN STD_LOGIC;
      memory_arready : OUT STD_LOGIC;
      memory_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      memory_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      memory_rvalid : OUT STD_LOGIC;
      memory_rready : IN STD_LOGIC
    );
  END COMPONENT SingleCycleMIPS_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF cpu_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 cpu_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 cpu_rst RST";
  ATTRIBUTE X_INTERFACE_INFO OF control_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 control_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF control_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 control_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF control_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 control AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF control_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 control AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF control_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 control AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF control_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF control_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF control_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF control_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 control WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF control_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF control_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF control_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF control_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF control_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 control ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF control_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 control ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF control_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 control ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF control_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF control_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF control_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF control_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF control_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 instruction_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 instruction_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF instruction_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 instruction RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF memory_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 memory_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF memory_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 memory_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF memory_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF memory_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF memory_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF memory_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF memory_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF memory_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF memory_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF memory_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF memory_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF memory_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF memory_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF memory_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF memory_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF memory_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF memory_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF memory_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF memory_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF memory_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF memory_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 memory RREADY";
BEGIN
  U0 : SingleCycleMIPS_v1_0
    GENERIC MAP (
      C_Control_DATA_WIDTH => 32,
      C_Control_ADDR_WIDTH => 4,
      C_Instruction_DATA_WIDTH => 32,
      C_Instruction_ADDR_WIDTH => 9,
      C_Memory_DATA_WIDTH => 32,
      C_Memory_ADDR_WIDTH => 9
    )
    PORT MAP (
      cpu_clk => cpu_clk,
      cpu_rst => cpu_rst,
      control_aclk => control_aclk,
      control_aresetn => control_aresetn,
      control_awaddr => control_awaddr,
      control_awprot => control_awprot,
      control_awvalid => control_awvalid,
      control_awready => control_awready,
      control_wdata => control_wdata,
      control_wstrb => control_wstrb,
      control_wvalid => control_wvalid,
      control_wready => control_wready,
      control_bresp => control_bresp,
      control_bvalid => control_bvalid,
      control_bready => control_bready,
      control_araddr => control_araddr,
      control_arprot => control_arprot,
      control_arvalid => control_arvalid,
      control_arready => control_arready,
      control_rdata => control_rdata,
      control_rresp => control_rresp,
      control_rvalid => control_rvalid,
      control_rready => control_rready,
      instruction_aclk => instruction_aclk,
      instruction_aresetn => instruction_aresetn,
      instruction_awaddr => instruction_awaddr,
      instruction_awprot => instruction_awprot,
      instruction_awvalid => instruction_awvalid,
      instruction_awready => instruction_awready,
      instruction_wdata => instruction_wdata,
      instruction_wstrb => instruction_wstrb,
      instruction_wvalid => instruction_wvalid,
      instruction_wready => instruction_wready,
      instruction_bresp => instruction_bresp,
      instruction_bvalid => instruction_bvalid,
      instruction_bready => instruction_bready,
      instruction_araddr => instruction_araddr,
      instruction_arprot => instruction_arprot,
      instruction_arvalid => instruction_arvalid,
      instruction_arready => instruction_arready,
      instruction_rdata => instruction_rdata,
      instruction_rresp => instruction_rresp,
      instruction_rvalid => instruction_rvalid,
      instruction_rready => instruction_rready,
      memory_aclk => memory_aclk,
      memory_aresetn => memory_aresetn,
      memory_awaddr => memory_awaddr,
      memory_awprot => memory_awprot,
      memory_awvalid => memory_awvalid,
      memory_awready => memory_awready,
      memory_wdata => memory_wdata,
      memory_wstrb => memory_wstrb,
      memory_wvalid => memory_wvalid,
      memory_wready => memory_wready,
      memory_bresp => memory_bresp,
      memory_bvalid => memory_bvalid,
      memory_bready => memory_bready,
      memory_araddr => memory_araddr,
      memory_arprot => memory_arprot,
      memory_arvalid => memory_arvalid,
      memory_arready => memory_arready,
      memory_rdata => memory_rdata,
      memory_rresp => memory_rresp,
      memory_rvalid => memory_rvalid,
      memory_rready => memory_rready
    );
END design_1_SingleCycleMIPS_axi_v1_0_0_0_arch;
