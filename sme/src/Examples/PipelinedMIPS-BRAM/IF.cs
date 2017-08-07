using System;
using SME;

namespace PipelinedMIPS
{
    [ClockedProcess]
    public class IF_PC : SimpleProcess
    {
        [InputBus]
        IF_PCIn input;
        [InputBus]
        ID_Haz_Stall stall;
        [InputBus]
        ID_Haz_Flush flush;

        uint addr = 0;

        [OutputBus]
        IF_Address output;

        protected override void OnTick()
        {
            if (!stall.flg || flush.flg)
                addr = input.newAddress;
            output.address = addr;
        }
    }

    public class IF_PCSrcMux : SimpleProcess
    {
        [InputBus]
        IF_IncrementerOut inc;
        [InputBus]
        IF_MuxIn jump;
        [InputBus]
        JumpUnit_PCSrc jmp;

        [OutputBus]
        IF_PCIn pc;

        protected override void OnTick()
        {
            pc.newAddress = jmp.flg ? jump.addr : inc.address;
            //Console.WriteLine(jmp.flg + " " + jump.addr);
        }
    }

    public class IF_Incrementer : SimpleProcess
    {
        [InputBus]
        IF_Address input;

        [OutputBus]
        IF_IncrementerOut output;

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

    public class IF_InstructionMemory : SimpleProcess
    {
        [InputBus]
        IF_Address addr;

        [OutputBus]
        IF_Instruction instr;
        [OutputBus]
        DEBUG_SHUTDOWN shut;

        //byte[] program = System.IO.File.ReadAllBytes("fibforw");
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

    [ClockedProcess]
    public class IF_Pipe : SimpleProcess
    {
        [InputBus]
        IF_IncrementerOut inci;
        [InputBus]
        IF_Instruction insti;

        [InputBus]
        ID_Haz_Stall stall;
        [InputBus]
        ID_Haz_Flush flush;
        uint inctmp = 0;
        uint insttmp = 0;

        //bool toggled = false;

        [OutputBus]
        IF_Pipe_IncrementerOut inco;
        [OutputBus]
        IF_Pipe_Instruction insto;

        protected override void OnTick()
        {
            if (flush.flg)
            {
                inctmp = 0;
                insttmp = 0;
            }
            else if (!stall.flg)
            {
                inctmp = inci.address;
                insttmp = insti.instruction;
            }
            inco.addr = inctmp;
            insto.instruction = insttmp;
            //Console.WriteLine("0x{0:x8} 0x{1:x8}", inctmp, insttmp);
        }
    }
}