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
            int address { get; set; }
        }

        [InitializedBus]
        public interface PCIn : IBus
        {
            int newAddress { get; set; }
        }

        [InitializedBus]
        public interface IncrementerOut : IBus
        {
            int address { get; set; }
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
                output.address = input.address + 1;// + 4; traditionally, however, we are working with an int array
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

            // https://www.eg.bucknell.edu/~csci320/mips_web/
            uint[] program = 
            {
                0x20010005, // addi r1 r0 0x5 - 5
                0x20020002, // addi r2 r0 0x2 - 2
                0x00221820, // add r3 r1 r2 - 7
                0x00232020, // add r4 r1 r3 - 12
                0x00842820, // add r5 r4 r4 - 24
                0x00A13022, // sub r6 r5 r1 - 19
                0x00233824, // and r7 r1 r3 - 5
                0x00234025, // or  r8 r1 r3 - 7
                0x0023482A, // slt r9 r1 r3 - 1
                0x0061502A, // slt r10 r3 r1 - 0
                //0xAD2B0008, // sw r11 0x8 r9 - 9 -- should not write to register
                0xAC060008, // sw r6 0x8 r0 - address 8, M[8] = 19 
                0x8C0B0008, // lw r11 0x8 r0 - address 8, r11 = M[8] = 19
                0x10270002, // beq r1 r7 0x2 - 0 -- should not write to register, but should jump the next
                0x200C0003, // addi r12 r0 0x3 - 3 -- should not be executed
                0x200C0003, // addi r12 r0 0x3 - 3 -- should not be executed
                0x200C000F, // addi r12 r0 0xF - 15
                0x200DFFFF, // addi r13 r3 0xFFFF - -1

                // for (int i = 0; i < 10; i++) {}
                0x200E000A, // addi r14 r0 0xA - 10
                0x200F0000, // addi r15 r0 0x0 - i = 0
                0x20110001, // addi r17 r0 0x1 - 1 (true)
                // {}
                0x21EF0001, // addi r15 r15 0x1 - i++
                0x01EE802A, // slt r16 r15 r14 - i < 10
                0x1211FFFD, // beq r16 r17 0xFFFD - if r16 == true: branch -3

                // line 24:
                0x0800001E, // j 0x1E - jump to 30
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20010055, // addi r1 r0 0x55 -- should not be executed
                0x20125555, // addi r18 r0 0x5555
                0x34135555, // ori r19 r0 0x5555
            };

            protected override void OnTick()
            {
                int i = addr.address;
                if (i >= 0 && i < program.Length)
                {
                    instr.instruction = program[i];
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
