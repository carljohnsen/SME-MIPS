using System;
using SME;

namespace PipelinedMIPS
{
    public partial class IF
    {
        [ClockedProcess]
        public class PC : SimpleProcess
        {
            [InputBus]
            PCIn input;
            [InputBus]
            ID.HazardDetection.Stall stall;

            uint addr = 0;
            uint dontCare;

            [OutputBus]
            Address output;

            protected override void OnTick()
            {
                if (!stall.flg)
                    addr = input.newAddress;
                else
                    dontCare = input.newAddress;
                output.address = addr;
            }
        }

        public class PCSrcMux : SimpleProcess
        {
            [InputBus]
            IncrementerOut inc;
            [InputBus]
            MuxIn jump;
            [InputBus]
            JumpUnit.PCSrc jmp;

            [OutputBus]
            PCIn pc;

            protected override void OnTick()
            {
                pc.newAddress = jmp.flg ? jump.addr : inc.address;
                //Console.WriteLine(jmp.flg + " " + inc.address);
            }
        }

        public class Incrementer : SimpleProcess
        {
            [InputBus]
            Address input;

            [OutputBus]
            IncrementerOut output;

            protected override void OnTick()
            {
                output.address = input.address + 4;
                //Console.WriteLine(input.address + "+4");
            }
        }

        public interface DEBUG_SHUTDOWN : IBus
        {
            [InitialValue(true)]
            bool running { get; set; }
        }

        public class InstructionMemory : SimpleProcess
        {
            [InputBus]
            Address addr;

            [OutputBus]
            Instruction instr;
            [OutputBus]
            DEBUG_SHUTDOWN shut;

            byte[] program = System.IO.File.ReadAllBytes("/home/carljohnsen/Dropbox/Kandidat/MIPS/fibforw");

            protected override void OnTick()
            {
                uint i = addr.address;
                //Console.WriteLine("0x{0:x8}", i);
                if (i >= 0 && i < program.Length)
                {
                    instr.instruction = 0u
                        | program[i]
                        | (uint)(program[i + 1] << 8)
                        | (uint)(program[i + 2] << 16)
                        | (uint)(program[i + 3] << 24);
                    shut.running = true;
                }
                else
                {
                    instr.instruction = 0x0; // nop
                    shut.running = false;
                }
            }
        }

        public partial class Pipe
        {
            [ClockedProcess]
            public class Reg : SimpleProcess
            {
                [InputBus]
                IF.IncrementerOut inci;
                [InputBus]
                IF.Instruction insti;

                [InputBus]
                ID.HazardDetection.Stall stall;
                uint inctmp = 0;
                uint insttmp = 0;

                [OutputBus]
                IncrementerOut inco;
                [OutputBus]
                Instruction insto;

                protected override void OnTick()
                {
                    if (stall.flg)
                    {
                        inco.addr = 0;
                        insto.instruction = 0;
                    }
                    else
                    {
                        inctmp = inci.address;
                        insttmp = insti.instruction;
                        inco.addr = inctmp;
                        insto.instruction = insttmp;
                    }
                    inco.addr = inctmp;
                    insto.instruction = insttmp;
                    //Console.WriteLine("0x{0:x8}", insttmp);
                }
            }
        }
    }
}