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
ExecStep $xv_path/bin/xelab -wto 825f0cc4bdc143e4aefce7de4874d11a -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_11 -L xlconstant_v1_1_3 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot design_1_wrapper_behav xil_defaultlib.design_1_wrapper xil_defaultlib.glbl -log elaborate.log
