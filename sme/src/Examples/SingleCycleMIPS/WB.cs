using System;
using SME;

namespace SingleCycleMIPS
{
    [InitializedBus]
    public interface MemToReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface BufIn : IBus
    {
        uint data { get; set; }
    }

    [ClockedProcess]
    public class WriteBuffer : SimpleProcess
    {
        [InputBus]
        RegWriteAddr addrIn;
        [InputBus]
        MemOut dataIn;
        [InputBus]
        RegWrite regwriteIn;

        [OutputBus]
        WriteAddr addrOut;
        [OutputBus]
        WriteData dataOut;
        [OutputBus]
        WriteEnabled regwriteOut;

        protected override void OnTick()
        {
            addrOut.val = addrIn.addr;
            dataOut.data = dataIn.data;
            regwriteOut.flg = regwriteIn.flg;
        }
    }
}
