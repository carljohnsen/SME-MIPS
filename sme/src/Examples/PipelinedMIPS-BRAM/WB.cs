using System;
using SME;

namespace PipelinedMIPS
{
    public class WB_MemMux : SimpleProcess
    {
        [InputBus]
        MEM_Pipe_ReadData mem;
        [InputBus]
        MEM_Pipe_JALOut jal;
        [InputBus]
        MEM_Pipe_MemToReg memtoreg;

        [OutputBus]
        WB_WriteData output;

        protected override void OnTick()
        {
            output.data = memtoreg.flg ? mem.data : jal.val;
        }
    }
}