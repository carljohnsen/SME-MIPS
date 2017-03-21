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
    {/*
        [InitializedBus]
        public interface Address : IBus
        {
            int addr { get; set; }
        }

        [InitializedBus]
        public interface Data : IBus
        {
            int data { get; set; }
        }*/

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
            //EX.ALUResult addr;
            EX.JALOut addr;
            [InputBus]
            ID.OutputB write;
            //[InputBus]
            //IF.DEBUG_SHUTDOWN dbg;

            [OutputBus]
            ReadData output;

            /*int[] mem = new int[1024];

            protected override void OnTick()
            {
                if (memread.flg)
                {
                    output.data = mem[addr.data];
                    //Console.WriteLine("Reading " + tmp + " from " + addr.data);
                }
                else if (memwrite.flg)
                {
                    //Console.WriteLine("Writing " + write.data + " to " + addr.data);
                    mem[addr.data] = write.data;
                    output.data = 0; // Escape latch warning!
                }
                else // Escape latch warning!
                    output.data = 0;
                if (true)//!dbg.running)
                {
                    Console.Write("MEM [");
                    for (int i = 0; i < 10; i++)
                    {
                        Console.Write(mem[i] + ",");
                    }
                    Console.WriteLine("]");
                }
            }*/
            byte[] mem = new byte[16384];

            protected override void OnTick()
            {
                uint add = addr.val;
                if (memread.flg)
                {
                    byte b0 = mem[add];
                    byte b1 = mem[add + 1];
                    byte b2 = mem[add + 2];
                    byte b3 = mem[add + 3];
                    output.data = 0u 
                        | (uint) (b3 << 24) 
                        | (uint) (b2 << 16) 
                        | (uint) (b1 << 8) 
                        | b0;
                }
                else if (memwrite.flg)
                {
                    uint data = write.data;
                    mem[add] = (byte)(data & 0xFF);
                    mem[add + 1] = (byte)((data >> 8) & 0xFF);
                    mem[add + 2] = (byte)((data >> 16) & 0xFF);
                    mem[add + 3] = (byte)((data >> 24) & 0xFF);
                    output.data = 0;
                }
                else
                {
                    output.data = 0;
                }

                Console.Write("MEM [");
                for (int i = 0; i < 15; i++)
                {
                    int a = 0;
                    a |= mem[i * 4];
                    a |= mem[i * 4 + 1] << 8;
                    a |= mem[i * 4 + 2] << 16;
                    a |= mem[i * 4 + 3] << 24;
                    Console.Write(a + ",");
                }
                Console.WriteLine("]");
            }
        }

        public class Mux : SimpleProcess
        {
            [InputBus]
            ReadData mem;
            [InputBus]
            //EX.ALUResult alu;
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
