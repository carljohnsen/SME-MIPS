using System;
using System.Linq;
using SME;

namespace PipelinedMIPS
{
    public partial class ID
    {
        public class Splitter : SimpleProcess
        {
            [InputBus]
            IF.Pipe.Instruction instr;

            [OutputBus]
            ReadA readA;
            [OutputBus]
            ReadB readB;
            [OutputBus]
            SignExtIn signExt;
            [OutputBus]
            ControlIn control;
            [OutputBus]
            RegDstMuxInput mux;
            [OutputBus]
            ALUFunct aluFunct;
            [OutputBus]
            Jump jump;
            [OutputBus]
            Shamt shmt;

            protected override void OnTick()
            {
                uint  tmp    = instr.instruction;
                byte  opcode = (byte) ((tmp >> 26) & 0x3F);
                byte  rs     = (byte) ((tmp >> 21) & 0x1F);
                byte  rt     = (byte) ((tmp >> 16) & 0x1F);
                byte  rd     = (byte) ((tmp >> 11) & 0x1F);
                byte  shamt  = (byte) ((tmp >> 6)  & 0x1F);
                byte  funct  = (byte) ( tmp        & 0x3F);
                uint  addr   = (uint) ( tmp        & 0x03FFFFFF); // Last 25 bit
                short ext    = (short)( tmp        & 0xFFFF); // Last 16 bit

                shmt.amount = shamt;
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

        public class RegDstMux : SimpleProcess
        {
            [InputBus]
            RegDst regdst;
            [InputBus]
            RegDstMuxInput input;

            [OutputBus]
            WriteDst write;

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
                    output.data = (uint) (0 | input.data);
                else
                    output.data = (uint) input.data;
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
            Jmp jump;
            [OutputBus]
            JAL jal;
            [OutputBus]
            LogicalImmediate logIm;
            [OutputBus]
            BranchNot bne;

            protected override void OnTick()
            {
                // flag format = [BranchNot, Jump reg, Logical immediate, JAL, Jmp, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch]
                short flags = 0; // nop
                ALUOpcodes alu = 0; // nop
                switch ((Opcodes)input.opcode)
                { // The comments are the flags, X is dont care
                    case Opcodes.Rformat: flags = 0x048;                        break; // 000 0100 1000
                    case Opcodes.lw:      flags = 0x03C; alu = ALUOpcodes.add;  break; // 000 0011 1100
                    case Opcodes.sw:      flags = 0x022; alu = ALUOpcodes.add;  break; // 000 001X 0010
                    case Opcodes.beq:     flags = 0x001; alu = ALUOpcodes.sub;  break; // 000 0X0X 0001
                    case Opcodes.addi:    flags = 0x028; alu = ALUOpcodes.add;  break; // 000 0010 1000
                    case Opcodes.addiu:   flags = 0x028; alu = ALUOpcodes.addu; break; // 000 0010 1000    
                    case Opcodes.j:       flags = 0x080; alu = ALUOpcodes.or;   break; // 0X0 1XXX 000X
                    case Opcodes.andi:    flags = 0x228; alu = ALUOpcodes.and;  break; // 010 0010 1000    
                    case Opcodes.ori:     flags = 0x228; alu = ALUOpcodes.or;   break; // 010 0010 1000
                    case Opcodes.slti:    flags = 0x228; alu = ALUOpcodes.slt;  break; // 010 0010 1000    
                    case Opcodes.sltiu:   flags = 0x228; alu = ALUOpcodes.sltu; break; // 010 0010 1000
                    case Opcodes.jal:     flags = 0x188; alu = ALUOpcodes.or;   break; // 0X1 1XXX 100X
                    case Opcodes.bne:     flags = 0x401; alu = ALUOpcodes.sub;  break; // 100 0X0X 0001
                        // TODO jalr
                    // default: flags = 0; alu = 0; break;
                }
                bne.flg      = ((flags >> 10) & 1) == 1;
                logIm.flg    = ((flags >>  9) & 1) == 1;
                jal.flg      = ((flags >>  8) & 1) == 1;
                jump.flg     = ((flags >>  7) & 1) == 1;
                regdst.flg   = ((flags >>  6) & 1) == 1;
                alusrc.flg   = ((flags >>  5) & 1) == 1;
                memtoreg.flg = ((flags >>  4) & 1) == 1;
                regwrite.flg = ((flags >>  3) & 1) == 1;
                memread.flg  = ((flags >>  2) & 1) == 1;
                memwrite.flg = ((flags >>  1) & 1) == 1;
                branch.flg   = ( flags        & 1) == 1;
                aluop.code   = (byte)alu;
            }
        }

        public partial class HazardDetection
        {
            public class Unit : SimpleProcess
            {
                [InputBus]
                ID.Pipe.WriteDst writeaddr;
                [InputBus]
                ID.Pipe.MemRead memread;
                [InputBus]
                ReadA reada;
                [InputBus]
                ReadB readb;

                [OutputBus]
                Stall stall;

                protected override void OnTick()
                { // TODO fix
                    bool a = (memread.flg &&
                        ((reada.addr == writeaddr.addr) ||
                         (readb.addr == writeaddr.addr)));
                    //Console.WriteLine(a);
                    stall.flg = a;
                }
            }
        }

        public class Register : SimpleProcess
        {
            [InputBus]
            ReadA readA;
            [InputBus]
            ReadB readB;
            [InputBus]
            MEM.Pipe.RegWrite regWrite;
            [InputBus]
            MEM.Pipe.RegWriteAddr writeAddr;
            [InputBus]
            WB.WriteData writeData;

            [OutputBus]
            OutputA outputA;
            [OutputBus]
            OutputB outputB;

            uint[] data = Enumerable.Repeat((uint) 0, 32).ToArray();

            protected override void OnTick()
            {
                if (regWrite.flg && writeAddr.addr > 0)
                {
                    data[writeAddr.addr] = writeData.data;
                }
                outputA.data = data[readA.addr];
                outputB.data = data[readB.addr];
                /* Print the register file */
                /*
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
                */
            }
        }

        public partial class Pipe
        {
            [ClockedProcess]
            public class Reg : SimpleProcess
            {
                [InputBus]
                ID.OutputA outai;
                [InputBus]
                ID.OutputB outbi;
                [InputBus]
                ID.SignExtOut signi;
                [InputBus]
                IF.Pipe.IncrementerOut inci;
                [InputBus]
                ID.Jump jumpi;
                [InputBus]
                ID.Shamt shmti;
                [InputBus]
                ID.WriteDst dsti;
                [InputBus]
                ID.ALUFunct functi;
                [InputBus]
                ID.RegWrite regwritei;
                [InputBus]
                ID.ALUOp aluopi;
                [InputBus]
                ID.ALUSrc alusrci;
                [InputBus]
                ID.Branch branchi;
                [InputBus]
                ID.Jmp jmpi;
                [InputBus]
                ID.JAL jali;
                [InputBus]
                ID.BranchNot bnei;
                [InputBus]
                ID.MemRead memreadi;
                [InputBus]
                ID.MemWrite memwritei;
                [InputBus]
                ID.MemToReg memtoregi;
                [InputBus]
                ID.ReadA readai;
                [InputBus]
                ID.ReadB readbi;

                [InputBus]
                ID.HazardDetection.Stall flush;
                uint outatmp = 0;
                uint outbtmp = 0;
                uint signtmp = 0;
                uint inctmp = 0;
                uint jumptmp = 0;
                byte shmttmp = 0;
                byte dsttmp = 0;
                byte functtmp = 0;
                bool regwritetmp = false;
                byte aluoptmp = 0;
                bool alusrctmp = false;
                bool branchtmp = false;
                bool jmptmp = false;
                bool jaltmp = false;
                bool bnetmp = false;
                bool memreadtmp = false;
                bool memwritetmp = false;
                bool memtoregtmp = false;
                byte readatmp = 0;
                byte readbtmp = 0;

                [OutputBus]
                OutputA outao;
                [OutputBus]
                OutputB outbo;
                [OutputBus]
                SignExtOut signo;
                [OutputBus]
                IncrementerOut inco;
                [OutputBus]
                Jump jumpo;
                [OutputBus]
                Shamt shmto;
                [OutputBus]
                WriteDst dsto;
                [OutputBus]
                ALUFunct functo;
                [OutputBus]
                RegWrite regwriteo;
                [OutputBus]
                ALUOp aluopo;
                [OutputBus]
                ALUSrc alusrco;
                [OutputBus]
                Branch brancho;
                [OutputBus]
                Jmp jmpo;
                [OutputBus]
                JAL jalo;
                [OutputBus]
                BranchNot bneo;
                [OutputBus]
                MemRead memreado;
                [OutputBus]
                MemWrite memwriteo;
                [OutputBus]
                MemToReg memtorego;
                [OutputBus]
                ReadA readao;
                [OutputBus]
                ReadB readbo;

                protected override void OnTick()
                {
                    if (flush.flg)
                    {
                        outatmp = 0;
                        outbtmp = 0;
                        signtmp = 0;
                        inctmp = 0;
                        jumptmp = 0;
                        shmttmp = 0;
                        dsttmp = 0;
                        functtmp = 0;
                        regwritetmp = false;
                        aluoptmp = 0;
                        alusrctmp = false;
                        branchtmp = false;
                        jmptmp = false;
                        jaltmp = false;
                        bnetmp = false;
                        memreadtmp = false;
                        memwritetmp = false;
                        memtoregtmp = false;
                        readatmp = 0;
                        readbtmp = 0;
                    }
                    else
                    {
                        outatmp = outai.data;
                        outbtmp = outbi.data;
                        signtmp = signi.data;
                        inctmp = inci.addr;
                        jumptmp = jumpi.addr;
                        shmttmp = shmti.amount;
                        dsttmp = dsti.addr;
                        functtmp = functi.val;
                        regwritetmp = regwritei.flg;
                        aluoptmp = aluopi.code;
                        alusrctmp = alusrci.flg;
                        branchtmp = branchi.flg;
                        jmptmp = jmpi.flg;
                        jaltmp = jali.flg;
                        bnetmp = bnei.flg;
                        memreadtmp = memreadi.flg;
                        memwritetmp = memwritei.flg;
                        memtoregtmp = memtoregi.flg;
                        readatmp = readai.addr;
                        readbtmp = readbi.addr;
                    }

                    //Console.WriteLine((ALUOpcodes)aluoptmp + " " + readatmp + " " + readbtmp + " " + dsttmp);

                    outao.data = outatmp;
                    outbo.data = outbtmp;
                    signo.data = signtmp;
                    inco.addr = inctmp;
                    jumpo.addr = jumptmp;
                    shmto.amount = shmttmp;
                    dsto.addr = dsttmp;
                    functo.val = functtmp;
                    regwriteo.flg = regwritetmp;
                    aluopo.code = aluoptmp;
                    alusrco.flg = alusrctmp;
                    brancho.flg = branchtmp;
                    jmpo.flg = jmptmp;
                    jalo.flg = jaltmp;
                    bneo.flg = bnetmp;
                    memreado.flg = memreadtmp;
                    memwriteo.flg = memwritetmp;
                    memtorego.flg = memtoregtmp;
                    readao.addr = readatmp;
                    readbo.addr = readbtmp;
                }
            }
        }
    }
}