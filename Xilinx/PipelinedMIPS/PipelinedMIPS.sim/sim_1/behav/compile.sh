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
echo "xvhdl -m64 --relax -prj PipelinedMIPS_export_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj PipelinedMIPS_export_vhdl.prj 2>&1 | tee -a compile.log
