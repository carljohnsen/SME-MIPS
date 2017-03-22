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

            [OutputBus]
            Address output;

            protected override void OnTick()
            {
                uint a = input.newAddress;
                //Console.WriteLine(a);
                output.address = a;
                //output.address = input.newAddress;
            }
        }

        public class Mux : SimpleProcess
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

            byte[] program = System.IO.File.ReadAllBytes("programs/pipelinenobranch");

            protected override void OnTick()
            {
                uint i = addr.address;
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

                [OutputBus]
                IncrementerOut inco;
                [OutputBus]
                Instruction insto;

                protected override void OnTick()
                {
                    inco.addr = inci.address;
                    insto.instruction = insti.instruction;
                }
            }
        }
    }
}