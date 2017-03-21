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

    [InitializedBus]
    public interface BranchNot : IBus
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
            mtlo,
            mthi,
            mflo,
            mfhi,
            sltu,
        }

        [InitializedBus]
        public interface ALUOperation : IBus
        {
            short val { get; set; }
        }

        [InitializedBus]
        public interface ImmMuxOut : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface ShmtMuxOut : IBus
        {
            uint data { get; set; }
        }

        [InitializedBus]
        public interface Zero : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface ALUResult : IBus
        {
            uint data { get; set; }
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
                        case Funcs.add:   output.val = (short)ALUOps.add;   jr.flg = false; shift.flg = false; break;
                        case Funcs.addu:  output.val = (short)ALUOps.addu;  jr.flg = false; shift.flg = false; break;
                        case Funcs.sub:   output.val = (short)ALUOps.sub;   jr.flg = false; shift.flg = false; break;
                        case Funcs.subu:  output.val = (short)ALUOps.subu;  jr.flg = false; shift.flg = false; break;    
                        case Funcs.and:   output.val = (short)ALUOps.and;   jr.flg = false; shift.flg = false; break;
                        case Funcs.or :   output.val = (short)ALUOps.or;    jr.flg = false; shift.flg = false; break;
                        case Funcs.nor:   output.val = (short)ALUOps.nor;   jr.flg = false; shift.flg = false; break;    
                        case Funcs.slt:   output.val = (short)ALUOps.slt;   jr.flg = false; shift.flg = false; break;
                        case Funcs.sltu:  output.val = (short)ALUOps.sltu;  jr.flg = false; shift.flg = false; break;    
                        case Funcs.jr:    output.val = (short)ALUOps.or;    jr.flg = true;  shift.flg = false; break;
                        case Funcs.srl:   output.val = (short)ALUOps.sr;    jr.flg = false; shift.flg = true;  break;
                        case Funcs.sll:   output.val = (short)ALUOps.sl;    jr.flg = false; shift.flg = true;  break;
                        case Funcs.mtlo:  output.val = (short)ALUOps.mtlo;  jr.flg = false; shift.flg = false; break;
                        case Funcs.mthi:  output.val = (short)ALUOps.mthi;  jr.flg = false; shift.flg = false; break;
                        case Funcs.mflo:  output.val = (short)ALUOps.mflo;  jr.flg = false; shift.flg = false; break;
                        case Funcs.mfhi:  output.val = (short)ALUOps.mfhi;  jr.flg = false; shift.flg = false; break;
                        case Funcs.mult:  output.val = (short)ALUOps.mult;  jr.flg = false; shift.flg = false; break;
                        case Funcs.multu: output.val = (short)ALUOps.multu; jr.flg = false; shift.flg = false; break;
                        case Funcs.div:   output.val = (short)ALUOps.div;   jr.flg = false; shift.flg = false; break;
                        case Funcs.divu:  output.val = (short)ALUOps.divu;  jr.flg = false; shift.flg = false; break;
                        default:          output.val = 0;                   jr.flg = false; shift.flg = false; break; // nop
                    }
                }
                else
                {
                    switch ((ALUOpcodes)op.code)
                    {
                        case ALUOpcodes.add:  output.val = (short)ALUOps.add;  break;
                        case ALUOpcodes.sub:  output.val = (short)ALUOps.sub;  break;
                        case ALUOpcodes.or:   output.val = (short)ALUOps.or;   break;
                        case ALUOpcodes.addu: output.val = (short)ALUOps.addu; break;    
                        case ALUOpcodes.slt:  output.val = (short)ALUOps.slt;  break;
                        case ALUOpcodes.sltu: output.val = (short)ALUOps.sltu; break;    
                        default:              output.val = 0;                  break; // nop
                    }
                    jr.flg = false;
                    shift.flg = false;
                }
            }
        }

        public class ALU : SimpleProcess
        {
            [InputBus]
            ShmtMuxOut inA;
            [InputBus]
            ImmMuxOut inB;
            [InputBus]
            ALUOperation op;

            [OutputBus]
            Zero zero;
            [OutputBus]
            ALUResult result;

            uint HI = 0;
            uint LO = 0;

            protected override void OnTick()
            {
                uint tmp = unchecked((uint) -1);
                ulong tmp2 = unchecked((ulong) -1L);
                switch ((ALUOps) op.val)
                {
                    case ALUOps.sr: // Second operand of >> must be int......
                        tmp = inB.data >> (int) inA.data;
                        break;
                    case ALUOps.sl:
                        tmp = inB.data << (int) inA.data;
                        break;
                    case ALUOps.sra:
                        tmp = (uint) ((int) inA.data << (int) inB.data);
                        break;
                    case ALUOps.add:
                        tmp = (uint) ((int) inA.data + (int) inB.data);
                        break;
                    case ALUOps.addu:
                        tmp = inA.data + inB.data;
                        break;
                    case ALUOps.sub:
                        tmp = (uint) ((int) inA.data - (int) inB.data);
                        break;
                    case ALUOps.subu:
                        tmp = inA.data - inB.data;
                        break;
                    case ALUOps.mult:
                        tmp2 = (ulong) ((int) inA.data * (int) inB.data);
                        HI = (uint) (tmp2 >> 32);
                        LO = (uint) tmp2;
                        break;
                    case ALUOps.multu: 
                        tmp2 = inA.data * inB.data;
                        HI = (uint) (tmp2 >> 32);
                        LO = (uint) tmp2;
                        break;
                    case ALUOps.div: // Remember divide by 0...
                        HI = (uint) ((int) inA.data % (int) inB.data);
                        LO = (uint) ((int) inA.data / (int) inB.data);
                        break;
                    case ALUOps.divu: // Remember divide by 0...
                        HI = inA.data % inB.data;
                        LO = inA.data / inB.data;
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
                        tmp = (int) inA.data < (int) inB.data ? 1u : 0u;
                        break;
                    case ALUOps.sltu:
                        tmp = inA.data < inB.data ? 1u : 0u;
                        break;
                    case ALUOps.mtlo:
                        LO = inA.data;
                        break;
                    case ALUOps.mthi:
                        HI = inA.data;
                        break;
                    case ALUOps.mflo:
                        tmp = LO;
                        break;
                    case ALUOps.mfhi:
                        tmp = HI;
                        break;
                    default: // Catch unknown
                        Console.WriteLine("Should not be!");
                        tmp = unchecked((uint)-1);
                        break;
                }
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
            uint val { get; set; }
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
            uint address { get; set; }
        }

        [InitializedBus]
        public interface AndOut : IBus
        {
            bool flg { get; set; }
        }

        [InitializedBus]
        public interface Instruction : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface JumpAddr : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface Mux0Out : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface Mux2Out : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface ShiftBranch : IBus
        {
            uint addr { get; set; }
        }

        [InitializedBus]
        public interface ShiftJump : IBus
        {
            uint addr { get; set; }
        }

        public class Adder : SimpleProcess
        {
            [InputBus]
            ShiftBranch immediate;
            [InputBus]
            IF.IncrementerOut pc;

            [OutputBus]
            AdderOut output;

            protected override void OnTick()
            {
                output.address = immediate.addr + pc.address;
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
            ShiftJump inst;
            [InputBus]
            JumpReg jr;

            [OutputBus]
            Mux2Out output;

            protected override void OnTick()
            {
                output.addr = jr.flg ? outa.data : inst.addr;
            }
        }

        public class ShiftB : SimpleProcess
        {
            [InputBus]
            ID.SignExtOut immediate;

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
            Instruction inst;

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
            [InputBus]
            BranchNot bne;

            [OutputBus]
            AndOut output;

            protected override void OnTick()
            {
                output.flg = (bne.flg ? !zero.flg : zero.flg) && branch.flg;
            }
        }
    }
}
