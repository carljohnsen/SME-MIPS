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
echo "xvlog -m64 --relax -prj design_1_wrapper_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj design_1_wrapper_vlog.prj 2>&1 | tee compile.log
