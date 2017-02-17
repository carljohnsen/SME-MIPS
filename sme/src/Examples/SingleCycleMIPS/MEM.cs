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
            int data { get; set; }
        }

        [InitializedBus]
        public interface MemOut : IBus
        {
            int data { get; set; }
        }

        public class Memory : SimpleProcess
        {
            [InputBus]
            MemWrite memwrite;
            [InputBus]
            MemRead memread;
            [InputBus]
            EX.ALUResult addr;
            [InputBus]
            ID.OutputB write;

            [OutputBus]
            ReadData output;

            int[] mem = new int[1024];

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
            }
        }

        public class Mux : SimpleProcess
        {
            [InputBus]
            ReadData mem;
            [InputBus]
            EX.ALUResult alu;
            [InputBus]
            MemToReg memtoreg;

            [OutputBus]
            MemOut output;

            protected override void OnTick()
            {
                output.data = memtoreg.flg ? mem.data : alu.data;
            }
        }
    }
}
