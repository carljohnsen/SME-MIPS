--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Fri Jun  9 15:17:34 2017
--Host        : L10-0002 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DEBUG_SHUTDOWN_running : out STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    reset_rtl : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    DEBUG_SHUTDOWN_running : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,
      reset_rtl => reset_rtl,
      reset_rtl_0 => reset_rtl_0,
      sys_clock => sys_clock
    );
end STRUCTURE;
