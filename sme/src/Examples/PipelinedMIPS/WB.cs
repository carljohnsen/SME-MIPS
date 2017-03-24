using System;
using SME;

namespace PipelinedMIPS
{
    public partial class WB
    {
        [ClockedProcess]
        public class WriteBuffer : SimpleProcess
        {
            [InputBus]
            EX.Pipe.RegWriteAddr addrIn;
            [InputBus]
            MemOut dataIn;
            [InputBus]
            EX.Pipe.RegWrite regwriteIn;

            [OutputBus]
            ID.WriteAddr addrOut;
            [OutputBus]
            ID.WriteData dataOut;
            [OutputBus]
            ID.WriteEnabled regwriteOut;

            protected override void OnTick()
            {
                addrOut.val = addrIn.addr;
                dataOut.data = dataIn.data;
                regwriteOut.flg = regwriteIn.flg;
            }
        }

        public class MemMux : SimpleProcess
        {
            [InputBus]
            MEM.ReadData mem;
            [InputBus]
            EX.Pipe.JALOut jal;
            [InputBus]
            EX.Pipe.MemToReg memtoreg;

            [OutputBus]
            MemOut output;

            protected override void OnTick()
            {
                output.data = memtoreg.flg ? mem.data : jal.val;
            }
        }
    }
}