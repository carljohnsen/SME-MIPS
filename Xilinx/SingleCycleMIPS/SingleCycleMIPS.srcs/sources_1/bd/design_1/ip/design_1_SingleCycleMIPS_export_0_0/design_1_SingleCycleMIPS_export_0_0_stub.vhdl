-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Mon Jun 19 06:56:07 2017
-- Host        : ArchDesktop running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/carljohnsen/vivado/SingleCycleMIPS/SingleCycleMIPS.srcs/sources_1/bd/design_1/ip/design_1_SingleCycleMIPS_export_0_0/design_1_SingleCycleMIPS_export_0_0_stub.vhdl
-- Design      : design_1_SingleCycleMIPS_export_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_SingleCycleMIPS_export_0_0 is
  Port ( 
    DEBUG_SHUTDOWN_running : out STD_LOGIC;
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC
  );

end design_1_SingleCycleMIPS_export_0_0;

architecture stub of design_1_SingleCycleMIPS_export_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "DEBUG_SHUTDOWN_running,RST,CLK";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SingleCycleMIPS_export,Vivado 2017.1";
begin
end;
