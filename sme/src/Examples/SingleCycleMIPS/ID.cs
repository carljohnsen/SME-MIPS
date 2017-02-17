using System;
using System.Linq;
using SME;

namespace SingleCycleMIPS
{
    public enum Opcodes
    {
        Rformat,
        j = 2,
        jal,
        beq,
        bne,
        blez,
        bgtz,
        addi,
        addiu,
        slti,
        sltiu,
        andi,
        ori,
        xori,
        lui,
        floating=17,
        lb=32,
        lh,
        lwl,
        lw,
        lbu,
        lhu,
        lwr,
        sb=40,
        sh,
        swl,
        sw,
        swr=46,
        cache,
        ll,
        lwc1,
        lwc2,
        pref,
        ldc1=53,
        ldc2,
        sc=56,
        swc1,
        swc2,
        sdc1=61,
        sdc2=62,
    }

    public enum ALUOpcodes
    {
        RFormat,
        sub,
        add,
    }

    [InitializedBus]
    public interface RegDst : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface RegWrite : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface LogicalImmediate : IBus
    {
        bool flg { get; set; }
    }

    public class ID
    {
        [InitializedBus]
        public interface ReadA : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface ReadB : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus, ClockedBus]
        public interface WriteAddr : IBus
        {
            byte val { get; set; }
        }

        [InitializedBus]
        public interface WriteData : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface SignExtIn : IBus
        {
            short data { get; set; }
        }

        [InitializedBus]
        public interface SignExtOut : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface OutputA : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface OutputB : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface ControlIn : IBus
        {
            byte opcode { get; set; }
        }

        [InitializedBus]
        public interface MuxInput : IBus
        {
            byte rt { get; set; }
            byte rd { get; set; }
        }

        [InitializedBus]
        public interface MuxOutput : IBus
        {
            byte addr { get; set; }
        }

        [InitializedBus]
        public interface WriteEnabled : IBus
        {
            bool flg { get; set; }
        }

        public class Splitter : SimpleProcess
        {
            [InputBus]
            IF.Instruction instr;

            [OutputBus]
            ReadA readA;
            [OutputBus]
            ReadB readB;
            [OutputBus]
            SignExtIn signExt;
            [OutputBus]
            ControlIn control;
            [OutputBus]
            MuxInput mux;
            [OutputBus]
            ALUFunct aluFunct;
            [OutputBus]
            JumpUnit.Instruction jump;

            protected override void OnTick()
            {
                uint  tmp    = instr.instruction;
                byte  opcode = (byte) ((tmp >> 26) & 0x3F);
                byte  rs     = (byte) ((tmp >> 21) & 0x1F);
                byte  rt     = (byte) ((tmp >> 16) & 0x1F);
                byte  rd     = (byte) ((tmp >> 11) & 0x1F);
                byte  funct  = (byte) ( tmp        & 0x3F);
                int   addr   = (int)  ( tmp        & 0x03FFFFFF); // Last 25 bit
                short ext    = (short)( tmp        & 0xFFFF); // Last 16 bit

                readA.addr = rs;
                readB.addr = rt;
                mux.rd = rd;
                mux.rt = rt;
                control.opcode = opcode;
                signExt.data = ext; 
                aluFunct.val = funct;
                jump.addr = addr;
            }
        }

        public class Mux : SimpleProcess
        {
            [InputBus]
            RegDst regdst;
            [InputBus]
            MuxInput input;

            [OutputBus]
            MuxOutput write;

            protected override void OnTick()
            {
                write.addr = regdst.flg ? input.rd : input.rt;
            }
        }

        public class SignExtend : SimpleProcess
        {
            [InputBus]
            SignExtIn input;
            [InputBus]
            LogicalImmediate logIm;

            [OutputBus]
            SignExtOut output;

            protected override void OnTick()
            {
                if (logIm.flg)
                    output.data = 0 | input.data;
                else
                    output.data = input.data;
            }
        }

        public class Control : SimpleProcess
        {
            [InputBus]
            ControlIn input;

            [OutputBus]
            RegDst regdst;
            [OutputBus]
            Branch branch;
            [OutputBus]
            MemRead memread;
            [OutputBus]
            MemToReg memtoreg;
            [OutputBus]
            ALUOp aluop;
            [OutputBus]
            MemWrite memwrite;
            [OutputBus]
            ALUSrc alusrc;
            [OutputBus]
            RegWrite regwrite;
            [OutputBus]
            Jump jump;
            [OutputBus]
            JAL jal;
            [OutputBus]
            LogicalImmediate logIm;

            protected override void OnTick()
            {
                // flag format = [Logical immediate, JAL, Jump, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch]
                short flags = 0; // nop
                ALUOpcodes alu = 0; // nop
                switch ((Opcodes)input.opcode)
                { // The comments are the flags, X is dont care
                    case Opcodes.Rformat: flags = 0x048;                       break; // 00 0100 1000
                    case Opcodes.lw:      flags = 0x03C; alu = ALUOpcodes.add; break; // 00 0011 1100
                    case Opcodes.sw:      flags = 0x022; alu = ALUOpcodes.add; break; // 00 001X 0010
                    case Opcodes.beq:     flags = 0x001; alu = ALUOpcodes.sub; break; // 00 0X0X 0001
                    case Opcodes.addi:    flags = 0x028; alu = ALUOpcodes.add; break; // 00 0010 1000
                    // default: flags = 0; alu = 0; break;
                }
                logIm.flg    = ((flags >> 9) & 1) == 1;
                jal.flg      = ((flags >> 8) & 1) == 1;
                jump.flg     = ((flags >> 7) & 1) == 1;
                regdst.flg   = ((flags >> 6) & 1) == 1;
                alusrc.flg   = ((flags >> 5) & 1) == 1;
                memtoreg.flg = ((flags >> 4) & 1) == 1;
                regwrite.flg = ((flags >> 3) & 1) == 1;
                memread.flg  = ((flags >> 2) & 1) == 1;
                memwrite.flg = ((flags >> 1) & 1) == 1;
                branch.flg   = ( flags       & 1) == 1;
                aluop.code   = (byte)alu;
            }
        }



        public class Register : SimpleProcess
        {
            [InputBus]
            ReadA readA;
            [InputBus]
            ReadB readB;
            [InputBus]
            WriteEnabled regWrite;
            [InputBus]
            WriteAddr writeAddr;
            [InputBus]
            WriteData writeData;

            [OutputBus]
            OutputA outputA;
            [OutputBus]
            OutputB outputB;

            //int[] data = new int[32];
            int[] data = Enumerable.Repeat(0, 32).ToArray();

            protected override void OnTick()
            {
                if (regWrite.flg && writeAddr.val > 0)
                {
                    data[writeAddr.val] = writeData.data;
                }
                outputA.data = data[readA.addr];
                outputB.data = data[readB.addr];
                /* Print the register file */
                Console.Write("[");
                for (int i = 0; i < 4; i++)
                {
                    Console.Write("\t");
                    for (int j = 0; j < 7; j++)
                    {
                        Console.Write(data[i * 8 + j] + ",\t");
                    }
                    Console.WriteLine(data[i * 8 + 7] + (i == 3 ? "\t]" : ","));
                }
            }
        }
    }
}
