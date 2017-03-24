using System;
using SME;

namespace PipelinedMIPS
{
    public partial class MEM
    {
        public class Memory : SimpleProcess
        {
            [InputBus]
            EX.Pipe.MemWrite memwrite;
            [InputBus]
            EX.Pipe.MemRead memread;
            [InputBus]
            EX.Pipe.JALOut addr;
            [InputBus]
            EX.Pipe.OutputB write;

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

                Console.Write("MEM [");
                for (int i = 0; i < 15; i++)
                {
                    int a = 0
                    | mem[i * 4]     << 24
                    | mem[i * 4 + 1] << 16
                    | mem[i * 4 + 2] << 8
                    | mem[i * 4 + 3];
                    Console.Write(a + ",");
                }
                Console.WriteLine("]");
            }
        }
    }

    public partial class JumpUnit
    {
        public class BranchOrJumpMux : SimpleProcess
        {
            [InputBus]
            EX.Pipe.JumpAddress jump;
            [InputBus]
            EX.Pipe.BranchAddress branch;
            [InputBus]
            AndOut shouldBranch;

            [OutputBus]
            IF.MuxIn pc;

            protected override void OnTick()
            {
                pc.addr = shouldBranch.flg ? branch.addr : jump.addr;
            }
        }

        public class Or : SimpleProcess
        {
            [InputBus]
            EX.Pipe.Jmp jmp;
            [InputBus]
            EX.Pipe.JumpReg jr;
            [InputBus]
            AndOut branch;

            [OutputBus]
            PCSrc output;

            protected override void OnTick()
            {
                output.flg = jmp.flg || jr.flg || branch.flg;
            }
        }

        public class Condition : SimpleProcess
        {
            [InputBus]
            EX.Pipe.Zero zero;
            [InputBus]
            EX.Pipe.BranchNot bne;

            [OutputBus]
            BranchCondition cond;

            protected override void OnTick()
            {
                cond.flg = bne.flg ? !zero.flg : zero.flg;
            }
        }

        public class And : SimpleProcess
        {
            [InputBus]
            EX.Pipe.Branch branch;
            [InputBus]
            BranchCondition cond;

            [OutputBus]
            AndOut output;

            protected override void OnTick()
            {
                output.flg = cond.flg && branch.flg;
            }
        }
    }
}
