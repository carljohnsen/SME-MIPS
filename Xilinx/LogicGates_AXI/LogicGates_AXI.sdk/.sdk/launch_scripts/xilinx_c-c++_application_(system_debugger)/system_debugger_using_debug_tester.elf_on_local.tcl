connect -url tcp:127.0.0.1:3121
source C:/Users/ihicajo/Documents/Xilinx/LogicGates_AXI/LogicGates_AXI.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248585378"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248585378"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248585378"} -index 0
dow C:/Users/ihicajo/Documents/Xilinx/LogicGates_AXI/LogicGates_AXI.sdk/Tester/Debug/Tester.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248585378"} -index 0
con
