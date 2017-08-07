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
ExecStep $xv_path/bin/xsim design_1_wrapper_time_synth -key {Post-Synthesis:sim_1:Timing:design_1_wrapper} -tclbatch design_1_wrapper.tcl -log simulate.log
