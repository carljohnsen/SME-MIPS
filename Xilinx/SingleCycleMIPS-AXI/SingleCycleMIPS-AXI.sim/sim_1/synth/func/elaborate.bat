@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 01f6d19fd3ff4415979556a661325922 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot design_1_wrapper_func_synth xil_defaultlib.design_1_wrapper -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
