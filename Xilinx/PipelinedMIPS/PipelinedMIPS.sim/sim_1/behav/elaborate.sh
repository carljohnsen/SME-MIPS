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
ExecStep $xv_path/bin/xelab -wto 5d0698e7108b48089be01d390ee4606f -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot PipelinedMIPS_export_behav xil_defaultlib.PipelinedMIPS_export -log elaborate.log
