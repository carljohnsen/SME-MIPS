using System;
using SME;

namespace PipelinedMIPS
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

    public partial class EX
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

        public class ImmMux : SimpleProcess
        {
            [InputBus]
            ID.Pipe.ALUSrc src;
            [InputBus]
            ID.Pipe.OutputB register;
            [InputBus]
            ID.Pipe.SignExtOut immediate;

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

        public class JumpJrMux : SimpleProcess
        {
            [InputBus]
            ID.Pipe.OutputA outa;
            [InputBus]
            JumpPacked inst;
            [InputBus]
            JumpReg jr;

            [OutputBus]
            JumpAddress output;

            protected override void OnTick()
            {
                output.addr = jr.flg ? outa.data : inst.addr;
            }
        }

        public class JumpPacker : SimpleProcess
        {
            [InputBus]
            ShiftJump mux;
            [InputBus]
            IF.Pipe.IncrementerOut pc;

            [OutputBus]
            JumpPacked output;

            protected override void OnTick()
            {
                output.addr = (pc.addr & 0xF0000000) | mux.addr;
            }
        }

        public class JumpShift : SimpleProcess
        {
            [InputBus]
            ID.Pipe.Jump inst;

            [OutputBus]
            ShiftJump output;

            protected override void OnTick()
            {
                output.addr = inst.addr << 2;
            }
        }

        public class ShmtMux : SimpleProcess
        {
            [InputBus]
            ID.Pipe.Shamt shmt;
            [InputBus]
            ID.Pipe.OutputA reada;
            [InputBus]
            Shift shift;

            [OutputBus]
            ShmtMuxOut output;

            protected override void OnTick()
            {
                output.data = shift.flg ? shmt.amount : reada.data;
            }
        }

        public class BranchAdder : SimpleProcess
        {
            [InputBus]
            ShiftBranch immediate;
            [InputBus]
            IF.Pipe.IncrementerOut pc;

            [OutputBus]
            BranchAddress output;

            protected override void OnTick()
            {
                output.addr = immediate.addr + pc.addr;
            }
        }

        public class BranchShift : SimpleProcess
        {
            [InputBus]
            ID.Pipe.SignExtOut immediate;

            [OutputBus]
            ShiftBranch output;

            protected override void OnTick()
            {
                output.addr = immediate.data << 2;
            }
        }

        public class ALUControl : SimpleProcess
        {
            [InputBus]
            ID.Pipe.ALUOp op;
            [InputBus]
            ID.Pipe.ALUFunct funct;

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

        public class JalMux : SimpleProcess
        {
            [InputBus]
            ID.Pipe.WriteDst writeAddr;
            [InputBus]
            ID.Pipe.JAL jal;

            [OutputBus]
            RegWriteAddr output;

            protected override void OnTick()
            {
                output.addr = jal.flg ? (byte)31 : writeAddr.addr;
            }
        }

        public class JalUnit : SimpleProcess
        {
            [InputBus]
            ID.Pipe.JAL jal;
            [InputBus]
            IF.Pipe.IncrementerOut pc;
            [InputBus]
            ALUResult alu;

            [OutputBus]
            JALOut output;

            protected override void OnTick()
            {
                output.val = jal.flg ? pc.addr : alu.data;
            }
        }

        public partial class Pipe
        {
            [ClockedProcess]
            public class Reg : SimpleProcess
            {
                [InputBus]
                ID.Pipe.Branch branchi;
                [InputBus]
                EX.BranchAddress baddri;
                [InputBus]
                ID.Pipe.BranchNot bnei;
                [InputBus]
                EX.JALOut jouti;
                [InputBus]
                ID.Pipe.Jmp jmpi;
                [InputBus]
                EX.JumpAddress jaddri;
                [InputBus]
                EX.JumpReg jmpregi;
                [InputBus]
                ID.Pipe.MemRead memreadi;
                [InputBus]
                ID.Pipe.MemToReg memtoregi;
                [InputBus]
                ID.Pipe.MemWrite memwritei;
                [InputBus]
                ID.Pipe.OutputB outputbi;
                [InputBus]
                ID.Pipe.RegWrite regwritei;
                [InputBus]
                EX.RegWriteAddr regaddri;
                [InputBus]
                EX.Zero zeroi;

                [OutputBus]
                Branch brancho;
                [OutputBus]
                BranchAddress baddro;
                [OutputBus]
                BranchNot bneo;
                [OutputBus]
                JALOut jouto;
                [OutputBus]
                Jmp jmpo;
                [OutputBus]
                JumpAddress jaddro;
                [OutputBus]
                JumpReg jmprego;
                [OutputBus]
                MemRead memreado;
                [OutputBus]
                MemToReg memtorego;
                [OutputBus]
                MemWrite memwriteo;
                [OutputBus]
                OutputB outputbo;
                [OutputBus]
                RegWrite regwriteo;
                [OutputBus]
                RegWriteAddr regaddro;
                [OutputBus]
                Zero zeroo;

                protected override void OnTick()
                {
                    brancho.flg = branchi.flg;
                    baddro.addr = baddri.addr;
                    bneo.flg = bnei.flg;
                    jouto.val = jouti.val;
                    jmpo.flg = jmpi.flg;
                    jaddro.addr = jaddri.addr;
                    jmprego.flg = jmpregi.flg;
                    memreado.flg = memreadi.flg;
                    memtorego.flg = memtoregi.flg;
                    memwriteo.flg = memwritei.flg;
                    outputbo.data = outputbi.data;
                    regwriteo.flg = regwritei.flg;
                    regaddro.addr = regaddri.addr;
                    zeroo.flg = zeroi.flg;
                }
            }
        }
    }
}
