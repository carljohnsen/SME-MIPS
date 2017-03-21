using System;
using SME;

namespace SingleCycleMIPS
{
    public class IF
    {
        [InitializedBus]
        public interface Instruction : IBus
        {
            uint instruction { get; set; }
        }

        [InitializedBus]
        public interface Address : IBus
        {
            uint address { get; set; }
        }

        [InitializedBus]
        public interface PCIn : IBus
        {
            uint newAddress { get; set; }
        }

        [InitializedBus]
        public interface IncrementerOut : IBus
        {
            uint address { get; set; }
        }

        [ClockedProcess]
        public class PC : SimpleProcess
        {
            [InputBus]
            PCIn input;

            [OutputBus]
            Address output;

            protected override void OnTick()
            {
                output.address = input.newAddress;
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

            byte[] program = System.IO.File.ReadAllBytes("programs/towers");

            protected override void OnTick()
            {
                uint i = addr.address;
                if (i >= 0 && i < program.Length)
                {
                    instr.instruction = 0u
                        |        program[i]
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
    }
}