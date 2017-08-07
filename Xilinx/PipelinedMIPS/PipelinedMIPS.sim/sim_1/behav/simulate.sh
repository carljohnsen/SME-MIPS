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
ExecStep $xv_path/bin/xsim PipelinedMIPS_export_behav -key {Behavioral:sim_1:Functional:PipelinedMIPS_export} -tclbatch PipelinedMIPS_export.tcl -log simulate.log
