#!/bin/bash -f
xv_path="/home/carljohnsen/Xilinx/Vivado/2017.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 825f0cc4bdc143e4aefce7de4874d11a -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L secureip --snapshot design_1_wrapper_func_synth xil_defaultlib.design_1_wrapper xil_defaultlib.glbl -log elaborate.log
