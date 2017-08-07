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
ExecStep $xv_path/bin/xsim PipelinedMIPS_export_time_impl -key {Post-Implementation:sim_1:Timing:PipelinedMIPS_export} -tclbatch PipelinedMIPS_export.tcl -log simulate.log
