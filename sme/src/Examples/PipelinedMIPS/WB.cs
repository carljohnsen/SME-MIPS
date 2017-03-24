using System;
using SME;

namespace PipelinedMIPS
{
    public partial class WB
    {

        public class MemMux : SimpleProcess
        {
            [InputBus]
            MEM.Pipe.ReadData mem;
            [InputBus]
            MEM.Pipe.JALOut jal;
            [InputBus]
            MEM.Pipe.MemToReg memtoreg;

            [OutputBus]
            WriteData output;

            protected override void OnTick()
            {
                output.data = memtoreg.flg ? mem.data : jal.val;
            }
        }
    }
}