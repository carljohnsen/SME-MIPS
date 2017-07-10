@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 81d3d27dbddc428a99d154509403791d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SingleCycleMIPS_v1_0_behav xil_defaultlib.SingleCycleMIPS_v1_0 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
