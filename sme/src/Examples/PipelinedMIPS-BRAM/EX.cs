using System;
using SME;

namespace PipelinedMIPS
{
    public class EX_ForwardAMux : SimpleProcess
    {
        [InputBus]
        ID_Pipe_OutputA original;
        [InputBus]
        EX_Pipe_JALOut mem;
        [InputBus]
        WB_WriteData wb;
        //MEM.Pipe.JALOut wb;
        [InputBus]
        EX_Forw_ForwardA forwardingUnit;

        [OutputBus]
        EX_ForwardA output;

        protected override void OnTick()
        {
            switch (forwardingUnit.selection)
            {
                case ForwardSelection.original: //Console.WriteLine("a org");
                    output.data = original.data; break;
                case ForwardSelection.mem: //Console.WriteLine("a mem");
                    output.data = mem.val; break;
                case ForwardSelection.wb: //Console.WriteLine("a wb");
                    output.data = wb.data; break;
            }
        }
    }

    public class EX_ForwardBMux : SimpleProcess
    {
        [InputBus]
        ID_Pipe_OutputB original;
        [InputBus]
        EX_Pipe_JALOut mem;
        [InputBus]
        WB_WriteData wb;
        //MEM.Pipe.JALOut wb;
        [InputBus]
        EX_Forw_ForwardB forwardingUnit;

        [OutputBus]
        EX_ForwardB output;

        protected override void OnTick()
        {
            switch (forwardingUnit.selection)
            {
                case ForwardSelection.original:
                    output.data = original.data; break;
                case ForwardSelection.mem: //Console.WriteLine("b mem");
                    output.data = mem.val; break;
                case ForwardSelection.wb: //Console.WriteLine("b wb");
                    output.data = wb.data; break;
            }
        }
    }

    public class EX_ImmMux : SimpleProcess
    {
        [InputBus]
        ID_Pipe_ALUSrc src;
        [InputBus]
        EX_ForwardB register;
        [InputBus]
        ID_Pipe_SignExtOut immediate;

        [OutputBus]
        EX_ImmMuxOut output;

        protected override void OnTick()
        {
            if (src.flg)
                output.data = immediate.data;
            else
                output.data = register.data;
        }
    }

    public class EX_JumpJrMux : SimpleProcess
    {
        [InputBus]
        EX_ForwardA outa;
        [InputBus]
        EX_JumpPacked inst;
        [InputBus]
        EX_JumpReg jr;

        [OutputBus]
        EX_JumpAddress output;

        protected override void OnTick()
        {
            output.addr = jr.flg ? outa.data : inst.addr;
        }
    }

    public class EX_JumpPacker : SimpleProcess
    {
        [InputBus]
        EX_ShiftJump mux;
        [InputBus]
        ID_Pipe_IncrementerOut pc;

        [OutputBus]
        EX_JumpPacked output;

        protected override void OnTick()
        {
            output.addr = (pc.addr & 0xF0000000) | mux.addr;
        }
    }

    public class EX_JumpShift : SimpleProcess
    {
        [InputBus]
        ID_Pipe_Jump inst;

        [OutputBus]
        EX_ShiftJump output;

        protected override void OnTick()
        {
            output.addr = inst.addr << 2;
        }
    }

    public class EX_ShmtMux : SimpleProcess
    {
        [InputBus]
        ID_Pipe_Shamt shmt;
        [InputBus]
        EX_ForwardA reada;
        [InputBus]
        EX_Shift shift;

        [OutputBus]
        EX_ShmtMuxOut output;

        protected override void OnTick()
        {
            output.data = shift.flg ? shmt.amount : reada.data;
        }
    }

    public class EX_BranchAdder : SimpleProcess
    {
        [InputBus]
        EX_ShiftBranch immediate;
        [InputBus]
        ID_Pipe_IncrementerOut pc;

        [OutputBus]
        EX_BranchAddress output;

        protected override void OnTick()
        {
            output.addr = immediate.addr + pc.addr;
        }
    }

    public class EX_BranchShift : SimpleProcess
    {
        [InputBus]
        ID_Pipe_SignExtOut immediate;

        [OutputBus]
        EX_ShiftBranch output;

        protected override void OnTick()
        {
            output.addr = immediate.data << 2;
        }
    }

    public class EX_ALUControl : SimpleProcess
    {
        [InputBus]
        ID_Pipe_ALUOp op;
        [InputBus]
        ID_Pipe_ALUFunct funct;

        [OutputBus]
        EX_ALUOperation output;
        [OutputBus]
        EX_JumpReg jr;
        [OutputBus]
        EX_Shift shift;

        protected override void OnTick()
        {
            if (op.code == ALUOpcodes.RFormat) // R format
            {
                Funcs func = funct.val;
                if (func == Funcs.add) { output.code = ALUOps.add; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.addu) { output.code = ALUOps.addu; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.sub) { output.code = ALUOps.sub; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.subu) { output.code = ALUOps.subu; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.and) { output.code = ALUOps.and; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.or) { output.code = ALUOps.or; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.nor) { output.code = ALUOps.nor; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.slt) { output.code = ALUOps.slt; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.sltu) { output.code = ALUOps.sltu; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.jr) { output.code = ALUOps.or; jr.flg = true; shift.flg = false; }
                else if (func == Funcs.srl) { output.code = ALUOps.sr; jr.flg = false; shift.flg = true; }
                else if (func == Funcs.sll) { output.code = ALUOps.sl; jr.flg = false; shift.flg = true; }
                else if (func == Funcs.mtlo) { output.code = ALUOps.mtlo; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.mthi) { output.code = ALUOps.mthi; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.mflo) { output.code = ALUOps.mflo; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.mfhi) { output.code = ALUOps.mfhi; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.mult) { output.code = ALUOps.mult; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.multu) { output.code = ALUOps.multu; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.div) { output.code = ALUOps.div; jr.flg = false; shift.flg = false; }
                else if (func == Funcs.divu) { output.code = ALUOps.divu; jr.flg = false; shift.flg = false; }
                else { output.code = 0; jr.flg = false; shift.flg = false; } // nop

                /*switch (funct.val)
				{
					case Funcs.add:   output.code = ALUOps.add;   jr.flg = false; shift.flg = false; break;
					case Funcs.addu:  output.code = ALUOps.addu;  jr.flg = false; shift.flg = false; break;
					case Funcs.sub:   output.code = ALUOps.sub;   jr.flg = false; shift.flg = false; break;
					case Funcs.subu:  output.code = ALUOps.subu;  jr.flg = false; shift.flg = false; break;
					case Funcs.and:   output.code = ALUOps.and;   jr.flg = false; shift.flg = false; break;
					case Funcs.or:    output.code = ALUOps.or;    jr.flg = false; shift.flg = false; break;
					case Funcs.nor:   output.code = ALUOps.nor;   jr.flg = false; shift.flg = false; break;
					case Funcs.slt:   output.code = ALUOps.slt;   jr.flg = false; shift.flg = false; break;
					case Funcs.sltu:  output.code = ALUOps.sltu;  jr.flg = false; shift.flg = false; break;
					case Funcs.jr:    output.code = ALUOps.or;    jr.flg = true;  shift.flg = false; break;
					case Funcs.srl:   output.code = ALUOps.sr;    jr.flg = false; shift.flg = true;  break;
					case Funcs.sll:   output.code = ALUOps.sl;    jr.flg = false; shift.flg = true;  break;
					case Funcs.mtlo:  output.code = ALUOps.mtlo;  jr.flg = false; shift.flg = false; break;
					case Funcs.mthi:  output.code = ALUOps.mthi;  jr.flg = false; shift.flg = false; break;
					case Funcs.mflo:  output.code = ALUOps.mflo;  jr.flg = false; shift.flg = false; break;
					case Funcs.mfhi:  output.code = ALUOps.mfhi;  jr.flg = false; shift.flg = false; break;
					case Funcs.mult:  output.code = ALUOps.mult;  jr.flg = false; shift.flg = false; break;
					case Funcs.multu: output.code = ALUOps.multu; jr.flg = false; shift.flg = false; break;
					case Funcs.div:   output.code = ALUOps.div;   jr.flg = false; shift.flg = false; break;
					case Funcs.divu:  output.code = ALUOps.divu;  jr.flg = false; shift.flg = false; break;
					default:          output.code = 0;                   jr.flg = false; shift.flg = false; break; // nop
				}*/
            }
            else
            {
                switch (op.code)
                {
                    case ALUOpcodes.add: output.code = ALUOps.add; break;
                    case ALUOpcodes.sub: output.code = ALUOps.sub; break;
                    case ALUOpcodes.and: output.code = ALUOps.and; break;
                    case ALUOpcodes.or: output.code = ALUOps.or; break;
                    case ALUOpcodes.xor: output.code = ALUOps.xor; break;
                    case ALUOpcodes.addu: output.code = ALUOps.addu; break;
                    case ALUOpcodes.slt: output.code = ALUOps.slt; break;
                    case ALUOpcodes.sltu: output.code = ALUOps.sltu; break;
                    default: output.code = 0; break; // nop
                }
                jr.flg = false;
                shift.flg = false;
            }
        }
    }

    public class EX_ALU : SimpleProcess
    {
        [InputBus]
        EX_ShmtMuxOut inA;
        [InputBus]
        EX_ImmMuxOut inB;
        [InputBus]
        EX_ALUOperation op;

        [OutputBus]
        EX_Zero zero;
        [OutputBus]
        EX_ALUResult result;

        uint HI = 0;
        uint LO = 0;

        protected override void OnTick()
        {
            uint tmp = 0;
            ulong tmp2 = unchecked((ulong)-1L);

            switch (op.code)
            {
                // Second operand of >> must be int......
                case ALUOps.sr:
                    tmp = inB.data >> (int)inA.data; break;
                case ALUOps.sl:
                    tmp = inB.data << (int)inA.data; break;
                case ALUOps.sra:
                    tmp = (uint)((int)inA.data << (int)inB.data); break;
                case ALUOps.add:
                    tmp = (uint)((int)inA.data + (int)inB.data); break;
                case ALUOps.addu:
                    tmp = inA.data + inB.data; break;
                case ALUOps.sub:
                    tmp = (uint)((int)inA.data - (int)inB.data); break;
                case ALUOps.subu:
                    tmp = inA.data - inB.data; break;
                case ALUOps.mult:
                    tmp2 = (ulong)((int)inA.data * (int)inB.data);
                    HI = (uint)(tmp2 >> 32);
                    LO = (uint)tmp2;
                    break;
                case ALUOps.multu:
                    tmp2 = inA.data * inB.data;
                    HI = (uint)(tmp2 >> 32);
                    LO = (uint)tmp2;
                    break;
                case ALUOps.div: // Remember divide by 0...
                    HI = (uint)((int)inA.data % (int)inB.data);
                    LO = (uint)((int)inA.data / (int)inB.data);
                    break;
                case ALUOps.divu: // Remember divide by 0...
                    HI = inA.data % inB.data;
                    LO = inA.data / inB.data;
                    break;
                case ALUOps.and:
                    tmp = inA.data & inB.data; break;
                case ALUOps.or:
                    tmp = inA.data | inB.data; break;
                case ALUOps.xor:
                    tmp = inA.data ^ inB.data; break;
                case ALUOps.nor:
                    tmp = ~(inA.data | inB.data); break;
                case ALUOps.slt:
                    tmp = (int)inA.data < (int)inB.data ? 1u : 0u; break;
                case ALUOps.sltu:
                    tmp = inA.data < inB.data ? 1u : 0u; break;
                case ALUOps.mtlo:
                    LO = inA.data; break;
                case ALUOps.mthi:
                    HI = inA.data; break;
                case ALUOps.mflo:
                    tmp = LO; break;
                case ALUOps.mfhi:
                    tmp = HI; break;
                default: // Catch unknown
                         //Console.WriteLine("Should not be!");
                    tmp = unchecked((uint)-1);
                    break;
            }
            result.data = tmp;
            zero.flg = tmp == 0;
            tmp = (uint)tmp2; // To remove scoping error - i.e. nop line
        }
    }

    public class EX_JalMux : SimpleProcess
    {
        [InputBus]
        ID_Pipe_WriteDst writeAddr;
        [InputBus]
        ID_Pipe_JAL jal;

        [OutputBus]
        EX_RegWriteAddr output;

        protected override void OnTick()
        {
            output.addr = jal.flg ? (byte)31 : writeAddr.addr;
        }
    }

    public class EX_JalUnit : SimpleProcess
    {
        [InputBus]
        ID_Pipe_JAL jal;
        [InputBus]
        ID_Pipe_IncrementerOut pc;
        [InputBus]
        EX_ALUResult alu;

        [OutputBus]
        EX_JALOut output;

        protected override void OnTick()
        {
            output.val = jal.flg ? pc.addr : alu.data;
        }
    }

    [ClockedProcess]
    public class EX_Pipe : SimpleProcess
    {
        [InputBus]
        ID_Pipe_Branch branchi;
        [InputBus]
        EX_BranchAddress baddri;
        [InputBus]
        ID_Pipe_BranchNot bnei;
        [InputBus]
        EX_JALOut jouti;
        [InputBus]
        ID_Pipe_Jmp jmpi;
        [InputBus]
        EX_JumpAddress jaddri;
        [InputBus]
        EX_JumpReg jmpregi;
        [InputBus]
        ID_Pipe_MemRead memreadi;
        [InputBus]
        ID_Pipe_MemToReg memtoregi;
        [InputBus]
        ID_Pipe_MemWrite memwritei;
        [InputBus]
        EX_ForwardB outputbi;
        [InputBus]
        ID_Pipe_RegWrite regwritei;
        [InputBus]
        EX_RegWriteAddr regaddri;
        [InputBus]
        EX_Zero zeroi;

        [InputBus]
        ID_Haz_Flush flush;
        bool branchtmp = false;
        uint baddrtmp = 0;
        bool bnetmp = false;
        uint jouttmp = 0;
        bool jmptmp = false;
        uint jaddrtmp = 0;
        bool jmpregtmp = false;
        bool memreadtmp = false;
        bool memtoregtmp = false;
        bool memwritetmp = false;
        uint outputbtmp = 0;
        bool regwritetmp = false;
        byte regaddrtmp = 0;
        bool zerotmp = false;

        [OutputBus]
        EX_Pipe_Branch brancho;
        [OutputBus]
        EX_Pipe_BranchAddress baddro;
        [OutputBus]
        EX_Pipe_BranchNot bneo;
        [OutputBus]
        EX_Pipe_JALOut jouto;
        [OutputBus]
        EX_Pipe_Jmp jmpo;
        [OutputBus]
        EX_Pipe_JumpAddress jaddro;
        [OutputBus]
        EX_Pipe_JumpReg jmprego;
        [OutputBus]
        EX_Pipe_MemRead memreado;
        [OutputBus]
        EX_Pipe_MemToReg memtorego;
        [OutputBus]
        EX_Pipe_MemWrite memwriteo;
        [OutputBus]
        EX_Pipe_OutputB outputbo;
        [OutputBus]
        EX_Pipe_RegWrite regwriteo;
        [OutputBus]
        EX_Pipe_RegWriteAddr regaddro;
        [OutputBus]
        EX_Pipe_Zero zeroo;

        protected override void OnTick()
        {
            if (flush.flg)
            {
                branchtmp = false;
                baddrtmp = 0;
                bnetmp = false;
                jouttmp = 0;
                jmptmp = false;
                jaddrtmp = 0;
                jmpregtmp = false;
                memreadtmp = false;
                memtoregtmp = false;
                memwritetmp = false;
                outputbtmp = 0;
                regwritetmp = false;
                regaddrtmp = 0;
                zerotmp = false;
            }
            else
            {
                branchtmp = branchi.flg;
                baddrtmp = baddri.addr;
                bnetmp = bnei.flg;
                jouttmp = jouti.val;
                jmptmp = jmpi.flg;
                jaddrtmp = jaddri.addr;
                jmpregtmp = jmpregi.flg;
                memreadtmp = memreadi.flg;
                memtoregtmp = memtoregi.flg;
                memwritetmp = memwritei.flg;
                outputbtmp = outputbi.data;
                regwritetmp = regwritei.flg;
                regaddrtmp = regaddri.addr;
                zerotmp = zeroi.flg;
            }

            //Console.WriteLine(memreadtmp + " " + jouttmp);

            brancho.flg = branchtmp;
            baddro.addr = baddrtmp;
            bneo.flg = bnetmp;
            jouto.val = jouttmp;
            jmpo.flg = jmptmp;
            jaddro.addr = jaddrtmp;
            jmprego.flg = jmpregtmp;
            memreado.flg = memreadtmp;
            memtorego.flg = memtoregtmp;
            memwriteo.flg = memwritetmp;
            outputbo.data = outputbtmp;
            regwriteo.flg = regwritetmp;
            regaddro.addr = regaddrtmp;
            zeroo.flg = zerotmp;
        }
    }

    public class EX_ForwardingUnit : SimpleProcess
    {
        [InputBus]
        EX_Pipe_RegWriteAddr memrd;
        [InputBus]
        MEM_Pipe_RegWriteAddr wbrd;
        [InputBus]
        EX_Pipe_RegWrite memrw;
        [InputBus]
        MEM_Pipe_RegWrite wbrw;
        [InputBus]
        ID_Pipe_ReadA rs;
        [InputBus]
        ID_Pipe_ReadB rt;

        [OutputBus]
        EX_Forw_ForwardA outa;
        [OutputBus]
        EX_Forw_ForwardB outb;

        protected override void OnTick()
        {
            //Console.WriteLine(string.Format("{0} {1} {2} {3} {4} {5}", rs.addr, rt.addr, memrd.addr, memrw.flg, wbrd.addr, wbrw.flg));
            if (rs.addr == memrd.addr && memrw.flg)
                outa.selection = ForwardSelection.mem;
            else if (rs.addr == wbrd.addr && wbrw.flg)
                outa.selection = ForwardSelection.wb;
            else
                outa.selection = ForwardSelection.original;

            if (rt.addr == memrd.addr && memrw.flg)
                outb.selection = ForwardSelection.mem;
            else if (rt.addr == wbrd.addr && wbrw.flg)
                outb.selection = ForwardSelection.wb;
            else
                outb.selection = ForwardSelection.original;
        }
    }
}
