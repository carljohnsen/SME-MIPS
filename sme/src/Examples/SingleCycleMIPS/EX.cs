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

    [InitializedBus]
    public interface JumpReg : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface Shift : IBus
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
        public interface ImmMuxOut : IBus
        {
            int data { get; set; }
        }

        [InitializedBus]
        public interface ShmtMuxOut : IBus
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

        public class ImmMux : SimpleProcess
        {
            [InputBus]
            ALUSrc src;
            [InputBus]
            ID.OutputB register;
            [InputBus]
            ID.SignExtOut immediate;

            [OutputBus]
            ImmMuxOut output;

            protected override void OnTick()
            {
                if (src.flg)
                    output.data = immediate.data;
                else
                    output.data = register.data;
            }
        }

        public class ShmtMux : SimpleProcess
        {
            [InputBus]
            ID.Shamt shmt;
            [InputBus]
            ID.OutputA reada;
            //ImmMuxOut immreg;
            [InputBus]
            Shift shift;

            [OutputBus]
            ShmtMuxOut output;

            protected override void OnTick()
            {
                output.data = shift.flg ? shmt.amount : reada.data;
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
            [OutputBus]
            JumpReg jr;
            [OutputBus]
            Shift shift;

            protected override void OnTick()
            {
                if (op.code == (byte)ALUOpcodes.RFormat) // R format
                {
                    switch ((Funcs)funct.val)
                    {
                        case Funcs.add: output.val = (byte)ALUOps.add; jr.flg = false; shift.flg = false; break;
                        case Funcs.sub: output.val = (byte)ALUOps.sub; jr.flg = false; shift.flg = false; break;
                        case Funcs.and: output.val = (byte)ALUOps.and; jr.flg = false; shift.flg = false; break;
                        case Funcs.or : output.val = (byte)ALUOps.or;  jr.flg = false; shift.flg = false; break;
                        case Funcs.slt: output.val = (byte)ALUOps.slt; jr.flg = false; shift.flg = false; break;
                        case Funcs.jr:  output.val = (byte)ALUOps.or;  jr.flg = true;  shift.flg = false; break;
                        case Funcs.srl: output.val = (byte)ALUOps.sr;  jr.flg = false; shift.flg = true;  break;
                        case Funcs.sll: output.val = (byte)ALUOps.sl;  jr.flg = false; shift.flg = true;  break;
                        default:        output.val = 0;                jr.flg = false; shift.flg = false; break; // nop
                    }
                }
                else
                {
                    switch ((ALUOpcodes)op.code)
                    {
                        case ALUOpcodes.add: output.val = (byte)ALUOps.add; break;
                        case ALUOpcodes.sub: output.val = (byte)ALUOps.sub; break;
                        case ALUOpcodes.or:  output.val = (byte)ALUOps.or;  break;
                        default:             output.val = 0;                break; // nop
                    }
                    jr.flg = false;
                    shift.flg = false;
                }
            }
        }

        public class ALU : SimpleProcess
        {
            [InputBus]
            //ID.OutputA inA;
            ShmtMuxOut inA;
            [InputBus]
            ImmMuxOut inB;
            //ShmtMuxOut inB;
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
                        tmp = (int) (unchecked((uint) inB.data) >> inA.data);
                        break;
                    case ALUOps.sl:
                        tmp = (int) (unchecked((uint) inB.data) << inA.data);
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
                //Console.WriteLine("ALU " + inA.data + " " + ((ALUOps) op.val) + " " + inB.data +  " = " + tmp);
                result.data = tmp;
                zero.flg = tmp == 0;
            }
        }

        [InitializedBus]
        public interface RegWriteAddr : IBus
        {
            byte addr { get; set; }
        }

        public class JalMux : SimpleProcess
        {
            [InputBus]
            ID.MuxOutput writeAddr;
            [InputBus]
            JAL jal;

            [OutputBus]
            RegWriteAddr output;

            protected override void OnTick()
            {
                output.addr = jal.flg ? (byte)31 : writeAddr.addr;
            }
        }

        [InitializedBus]
        public interface JALOut : IBus
        {
            int val { get; set; }
        }

        public class JalUnit : SimpleProcess
        {
            [InputBus]
            JAL jal;
            [InputBus]
            IF.IncrementerOut pc;
            [InputBus]
            ALUResult alu;

            [OutputBus]
            JALOut output;

            protected override void OnTick()
            {
                output.val = jal.flg ? pc.address : alu.data;
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

        [InitializedBus]
        public interface Mux2Out : IBus
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
            [InputBus]
            JumpReg jr;

            [OutputBus]
            IF.PCIn pc;

            protected override void OnTick()
            {
                pc.newAddress = jump.flg || jr.flg ? jumpAddr.addr : branch.addr;
            }
        }

        public class Mux2 : SimpleProcess
        {
            [InputBus]
            ID.OutputA outa;
            [InputBus]
            Instruction inst;
            [InputBus]
            JumpReg jr;

            [OutputBus]
            Mux2Out output;

            protected override void OnTick()
            {
                output.addr = jr.flg ? outa.data : inst.addr;
            }
        }

        // Packs the 4 most significant bits of the PC into the instr addr
        public class Packer : SimpleProcess
        {
            [InputBus]
            Mux2Out mux;
            [InputBus]
            IF.IncrementerOut pc;

            [OutputBus]
            JumpAddr output;

            protected override void OnTick()
            {
                output.addr = (pc.address & 0x3C000000) | mux.addr;
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
