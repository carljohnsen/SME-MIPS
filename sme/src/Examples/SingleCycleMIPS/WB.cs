using System;
using SME;

namespace SingleCycleMIPS
{
    [InitializedBus]
    public interface MemToReg : IBus
    {
        bool flg { get; set; }
    }

    public class WB
    {
        [InitializedBus]
        public interface BufIn : IBus
        {
            uint data { get; set; }
        }

        [ClockedProcess]
        public class WriteBuffer : SimpleProcess
        {
            [InputBus]
            EX.RegWriteAddr addrIn;
            [InputBus]
            MEM.MemOut dataIn;
            [InputBus]
            RegWrite regwriteIn;

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
    }
}