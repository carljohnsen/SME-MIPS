create_clock -period 14.500 -name clk -waveform {0.000 7.250} [get_ports CLK]
set_property IOSTANDARD LVCMOS18 [get_ports DEBUG_SHUTDOWN_running]
set_property IOSTANDARD LVCMOS18 [get_ports CLK]
set_property IOSTANDARD LVCMOS18 [get_ports RST]
set_property PACKAGE_PIN U14 [get_ports DEBUG_SHUTDOWN_running]
set_property PACKAGE_PIN P16 [get_ports RST]
set_property PACKAGE_PIN Y9 [get_ports CLK]













