using System;
using SME;

namespace SingleCycleMIPS
{
    // Values taken from MIPS reference data card from the book
    public enum Funcs
    {
        sll,
        srl=2,
        sra,
        sllv,
        srlv=6,
        srav,
        jr,
        jalr,
        movz,
        movn,
        syscall,
        _break, // break is a keyword
        sync=15,
        mfhi,
        mthi,
        mflo,
        mtlo,
        mult=24,
        multu,
        div,
        divu,
        add=32,
        addu,
        sub,
        subu,
        and,
        or,
        xor,
        nor,
        slt=42,
        sltu,
        tge=48,
        tgeu,
        tlt,
        tltu,
        teq,
        tne=54
    }

    [InitializedBus]
    public interface ALUOp : IBus
    {
        byte code { get; set; }
    }

    [InitializedBus]
    public interface ALUFunct : IBus
    {
        byte val { get; set; }
    }

    [InitializedBus]
    public interface ALUSrc : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface Branch : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface Jump : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface JAL : IBus
    {
        bool flg { get; set; }
    }

    public class EX
    {
        public enum ALUOps
        {
            and,
            or,
            add,
            sl,
            sr,
            sra,
            sub,
            slt,
            addu,
            subu,
            mult,
            multu,
            nor,
            div,
            divu,
            xor,
        }

        [InitializedBus]
        public interface ALUOperation : IBus
        {
            byte val { get; set; }
        }

        [InitializedBus]
        public interface MuxOut : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface Zero : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface ALUResult : IBus
        {
            int data { get; set; }
        }

        public class Mux : SimpleProcess
        {
            [InputBus]
            ALUSrc src;
            [InputBus]
            ID.OutputB register;
            [InputBus]
            ID.SignExtOut immediate;

            [OutputBus]
            MuxOut output;

            protected override void OnTick()
            {
                if (src.flg)
                    output.data = immediate.data;
                else
                    output.data = register.data;
            }
        }

        public class ALUControl : SimpleProcess
        {
            [InputBus]
            ALUOp op;
            [InputBus]
            ALUFunct funct;

            [OutputBus]
            ALUOperation output;

            protected override void OnTick()
            {
                if (op.code == (byte)ALUOpcodes.RFormat) // R format
                {
                    switch ((Funcs)funct.val)
                    {
                        case Funcs.add: output.val = (byte)ALUOps.add; break;
                        case Funcs.sub: output.val = (byte)ALUOps.sub; break;
                        case Funcs.and: output.val = (byte)ALUOps.and; break;
                        case Funcs.or : output.val = (byte)ALUOps.or;  break;
                        case Funcs.slt: output.val = (byte)ALUOps.slt; break;
                        default: output.val = 0; break; // nop
                    }
                }
                else
                {
                    switch ((ALUOpcodes)op.code)
                    {
                        case ALUOpcodes.add: output.val = (byte)ALUOps.add; break;
                        case ALUOpcodes.sub: output.val = (byte)ALUOps.sub; break;
                        default: output.val = 0; break; // nop
                    }
                }
            }
        }

        public class ALU : SimpleProcess
        {
            [InputBus]
            ID.OutputA inA;
            [InputBus]
            MuxOut inB;
            [InputBus]
            ALUOperation op;

            [OutputBus]
            Zero zero;
            [OutputBus]
            ALUResult result;
            //WB.BufIn result;

            protected override void OnTick()
            {
                int tmp = -1;
                switch ((ALUOps) op.val)
                {
                    case ALUOps.sr:
                        tmp = (int) (unchecked((uint) inA.data) >> inB.data);
                        break;
                    case ALUOps.sl:
                        tmp = (int) (unchecked((uint) inA.data) << inB.data);
                        break;
                    case ALUOps.sra:
                        tmp = inA.data << inB.data;
                        break;
                    case ALUOps.add:
                        tmp = inA.data + inB.data;
                        break;
                    case ALUOps.addu:
                        tmp = (int) (((uint)inA.data) + ((uint)inB.data));
                        break;
                    case ALUOps.sub:
                        tmp = inA.data - inB.data;
                        break;
                    case ALUOps.subu:
                        tmp = (int)(((uint)inA.data) - ((uint)inB.data));
                        break;
                    case ALUOps.mult: // TODO HI og LO
                        tmp = inA.data * inB.data;
                        break;
                    case ALUOps.multu: // TODO HI og LO
                        tmp = (int)(((uint)inA.data) * ((uint)inB.data));
                        break;
                    case ALUOps.div: // TODO HI og LO
                        tmp = inA.data / inB.data;
                        break;
                    case ALUOps.divu: // TODO HI og LO
                        tmp = (int)(((uint)inA.data) / ((uint)inB.data));
                        break;
                    case ALUOps.and:
                        tmp = inA.data & inB.data;
                        break;
                    case ALUOps.or:
                        tmp = inA.data | inB.data;
                        break;
                    case ALUOps.xor:
                        tmp = inA.data ^ inB.data;
                        break;
                    case ALUOps.nor:
                        tmp = ~(inA.data | inB.data);
                        break;
                    case ALUOps.slt:
                        tmp = inA.data < inB.data ? 1 : 0;
                        break;
                    default: // Catch unknown
                        Console.WriteLine("Should not be!");
                        tmp = -1;
                        break;
                }
                Console.WriteLine("ALU " + inA.data + " " + ((ALUOps) op.val) + " " + inB.data +  " = " + tmp);
                result.data = tmp;
                zero.flg = tmp == 0;
            }
        }
    }

    public class JumpUnit
    {
        [InitializedBus]
        public interface AdderOut : IBus
        {
            int address { get; set; }
        }

        [InitializedBus]
        public interface AndOut : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Instruction : IBus
        {
            int addr { get; set; }
        }

        [InitializedBus]
        public interface JumpAddr : IBus
        {
            int addr { get; set; }
        }

        [InitializedBus]
        public interface Mux0Out : IBus
        {
            int addr { get; set; }
        }

        public class Adder : SimpleProcess
        {
            [InputBus]
            ID.SignExtOut immediate;
            [InputBus]
            IF.IncrementerOut pc;

            [OutputBus]
            AdderOut output;

            protected override void OnTick()
            {
                output.address = immediate.data + pc.address;
            }
        }

        public class Mux0 : SimpleProcess
        {
            [InputBus]
            AdderOut adder;
            [InputBus]
            IF.IncrementerOut oldPc;
            [InputBus]
            AndOut control;

            [OutputBus]
            //IF.PCIn pc;
            Mux0Out output;

            protected override void OnTick()
            {
                output.addr = control.flg ? adder.address : oldPc.address;
            }
        }

        public class Mux1 : SimpleProcess
        {
            [InputBus]
            JumpAddr jumpAddr;
            [InputBus]
            Mux0Out branch;
            [InputBus]
            Jump jump;

            [OutputBus]
            IF.PCIn pc;

            protected override void OnTick()
            {
                pc.newAddress = jump.flg ? jumpAddr.addr : branch.addr;
            }
        }

        // Packs the 4 most significant bits of the PC into the instr addr
        public class Packer : SimpleProcess
        {
            [InputBus]
            Instruction inst;
            [InputBus]
            IF.IncrementerOut pc;

            [OutputBus]
            JumpAddr output;

            protected override void OnTick()
            {
                output.addr = (pc.address & 0x3C000000) | inst.addr;
            }
        }

        public class And : SimpleProcess
        {
            [InputBus]
            Branch branch;
            [InputBus]
            EX.Zero zero;

            [OutputBus]
            AndOut output;

            protected override void OnTick()
            {
                output.flg = zero.flg && branch.flg;
            }
        }
    }
}
