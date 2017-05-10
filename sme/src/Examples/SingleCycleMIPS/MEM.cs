using System;
using SME;

namespace SingleCycleMIPS
{
    [InitializedBus]
    public interface MemRead : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface MemWrite : IBus
    {
        bool flg { get; set; }
    }

    public class MEM
    {
        [InitializedBus]
        public interface ReadData : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface MemOut : IBus
        {
            uint data { get; set; }
        }

        public class Memory : SimpleProcess
        {
            [InputBus]
            MemWrite memwrite;
            [InputBus]
            MemRead memread;
            [InputBus]
            EX.JALOut addr;
            [InputBus]
            ID.OutputB write;

            [OutputBus]
            ReadData output;

            byte[] mem = new byte[16384];

            protected override void OnTick()
            {
                uint add = addr.val;
                if (memread.flg)
                {
                    output.data = 0u 
                        | (uint) (mem[add]     << 24) 
                        | (uint) (mem[add + 1] << 16) 
                        | (uint) (mem[add + 2] << 8) 
                        |         mem[add + 3];
                }
                else if (memwrite.flg)
                {
                    uint data = write.data;
                    mem[add]     = (byte)((data >> 24) & 0xFF);
                    mem[add + 1] = (byte)((data >> 16) & 0xFF);
                    mem[add + 2] = (byte)((data >> 8)  & 0xFF);
                    mem[add + 3] = (byte)( data        & 0xFF);
                    output.data = 0;
                }
                else
                {
                    output.data = 0;
                }

                /*Console.Write("MEM [");
                for (int i = 0; i < 15; i++)
                {
                    int a = 0
                    | mem[i * 4]     << 24
                    | mem[i * 4 + 1] << 16
                    | mem[i * 4 + 2] << 8
                    | mem[i * 4 + 3];
                    Console.Write(a + ",");
                }
                Console.WriteLine("]");*/
            }
        }

        public class Mux : SimpleProcess
        {
            [InputBus]
            ReadData mem;
            [InputBus]
            EX.JALOut jal;
            [InputBus]
            MemToReg memtoreg;

            [OutputBus]
            MemOut output;

            protected override void OnTick()
            {
                output.data = memtoreg.flg ? mem.data : jal.val;
            }
        }
    }
}
