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
ExecStep $xv_path/bin/xelab -wto c0118652838b41bbbfc90f62313e35bd -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L secureip --snapshot design_1_wrapper_func_impl xil_defaultlib.design_1_wrapper xil_defaultlib.glbl -log elaborate.log
