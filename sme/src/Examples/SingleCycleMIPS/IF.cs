using System;
using SME;

namespace SingleCycleMIPS
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

    [TopLevelOutputBus]
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

        //byte[] program = System.IO.File.ReadAllBytes("/home/carljohnsen/Dropbox/Kandidat/MIPS/fibforw");
        byte[] program = {
                0x01,0x00,0x08,0x34,
                0x01,0x00,0x09,0x34,
                0x00,0x00,0x04,0x34,
                0x0a,0x00,0x0c,0x34,
                0x00,0x00,0x88,0xac,
                0x04,0x00,0x84,0x20,
                0x00,0x00,0x89,0xac,
                0x04,0x00,0x84,0x20,
                0xfc,0xff,0x88,0x8c,
                0xf8,0xff,0x89,0x8c,
                0x20,0x50,0x09,0x01,
                0x00,0x00,0x8a,0xac,
                0x04,0x00,0x84,0x20,
                0xff,0xff,0x8c,0x21,
                0xf9,0xff,0x80,0x15,
                0x14,0x00,0x00,0x08,
                0x00,0x00,0x0a,0xac,
                0x04,0x00,0x0a,0xac,
                0x08,0x00,0x0a,0xac,
                0x0c,0x00,0x0a,0xac,
                0x00,0x00,0x00,0x00,
                0x00,0x00,0x00,0x00,
                0x00,0x00,0x00,0x00,
                0x00,0x00,0x00,0x00,
                0x00,0x00,0x00,0x00,
            };

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
}
