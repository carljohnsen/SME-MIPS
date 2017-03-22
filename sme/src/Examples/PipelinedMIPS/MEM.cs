using System;
using SME;

namespace PipelinedMIPS
{
    public partial class MEM
    {
        public class Memory : SimpleProcess
        {
            [InputBus]
            ID.Pipe.MemWrite memwrite;
            [InputBus]
            ID.Pipe.MemRead memread;
            [InputBus]
            EX.JALOut addr;
            [InputBus]
            ID.Pipe.OutputB write;

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
        public class Adder : SimpleProcess
        {
            [InputBus]
            ShiftBranch immediate;
            [InputBus]
            IF.Pipe.IncrementerOut pc;

            [OutputBus]
            AdderOut output;

            protected override void OnTick()
            {
                output.address = immediate.addr + pc.addr;
            }
        }

        public class JrMux : SimpleProcess
        { 
            [InputBus]
            ID.Pipe.OutputA outa;
            [InputBus]
            JumpPacker inst;
            [InputBus]
            EX.JumpReg jr;

            [OutputBus]
            JrMuxOut output;

            protected override void OnTick()
            {
                output.addr = jr.flg ? outa.data : inst.addr;
            }
        }

        public class BranchOrJumpMux : SimpleProcess
        {
            [InputBus]
            JrMuxOut jump;
            [InputBus]
            AdderOut branch;
            [InputBus]
            AndOut shouldBranch;

            [OutputBus]
            IF.MuxIn pc;

            protected override void OnTick()
            {
                pc.addr = shouldBranch.flg ? branch.address : jump.addr;
            }
        }

        public class Or : SimpleProcess
        {
            [InputBus]
            ID.Pipe.Jmp jmp;
            [InputBus]
            EX.JumpReg jr;
            [InputBus]
            AndOut branch;

            [OutputBus]
            PCSrc output;

            protected override void OnTick()
            {
                output.flg = jmp.flg || jr.flg || branch.flg;
            }
        }

        public class ShiftB : SimpleProcess
        {
            [InputBus]
            ID.Pipe.SignExtOut immediate;

            [OutputBus]
            ShiftBranch output;

            protected override void OnTick()
            {
                output.addr = immediate.data << 2;
            }
        }

        public class shiftJ : SimpleProcess
        {
            [InputBus]
            ID.Pipe.Jump inst;

            [OutputBus]
            ShiftJump output;

            protected override void OnTick()
            {
                output.addr = inst.addr << 2;
            }
        }

        // Packs the 4 most significant bits of the PC into the instr addr
        public class Packer : SimpleProcess
        {
            [InputBus]
            ShiftJump mux;
            [InputBus]
            IF.Pipe.IncrementerOut pc;

            [OutputBus]
            JumpPacker output;

            protected override void OnTick()
            {
                output.addr = (pc.addr & 0xF0000000) | mux.addr;
            }
        }

        public class Condition : SimpleProcess
        {
            [InputBus]
            EX.Zero zero;
            [InputBus]
            ID.Pipe.BranchNot bne;

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
            ID.Pipe.Branch branch;
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
