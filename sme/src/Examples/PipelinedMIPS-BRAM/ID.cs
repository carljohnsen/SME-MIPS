using System;
using System.Linq;
using SME;

namespace PipelinedMIPS
{
    public class ID_Splitter : SimpleProcess
    {
        [InputBus]
        IF_Pipe_Instruction instr;

        [OutputBus]
        ID_ReadA readA;
        [OutputBus]
        ID_ReadB readB;
        [OutputBus]
        ID_SignExtIn signExt;
        [OutputBus]
        ID_ControlIn control;
        [OutputBus]
        ID_RegDstMuxInput mux;
        [OutputBus]
        ID_ALUFunct aluFunct;
        [OutputBus]
        ID_Jump jump;
        [OutputBus]
        ID_Shamt shmt;

        protected override void OnTick()
        {
            uint  tmp    = instr.instruction;
            byte  opcode = (byte) ((tmp >> 26) & 0x3F);
            byte  rs     = (byte) ((tmp >> 21) & 0x1F);
            byte  rt     = (byte) ((tmp >> 16) & 0x1F);
            byte  rd     = (byte) ((tmp >> 11) & 0x1F);
            byte  shamt  = (byte) ((tmp >> 6)  & 0x1F);
            Funcs funct  = (Funcs) (tmp        & 0x3F);
            uint  addr   = (uint) ( tmp        & 0x03FFFFFF); // Last 25 bit
            short ext    = (short)( tmp        & 0xFFFF); // Last 16 bit

            shmt.amount = shamt;
            readA.addr = rs;
            readB.addr = rt;
            mux.rd = rd;
            mux.rt = rt;
            control.opcode = (Opcodes) opcode; // TODO vhdl failer her
            signExt.data = ext; 
            aluFunct.val = funct;
            jump.addr = addr;
        }
    }

    public class ID_RegDstMux : SimpleProcess
    {
        [InputBus]
        ID_RegDst regdst;
        [InputBus]
        ID_RegDstMuxInput input;

        [OutputBus]
        ID_WriteDst write;

        protected override void OnTick()
        {
            write.addr = regdst.flg ? input.rd : input.rt;
        }
    }

    public class ID_SignExtend : SimpleProcess
    {
        [InputBus]
        ID_SignExtIn input;
        [InputBus]
        ID_LogicalImmediate logIm;

        [OutputBus]
        ID_SignExtOut output;

        protected override void OnTick()
        {
            if (logIm.flg)
                output.data = (uint) (0 | input.data);
            else
                output.data = (uint) input.data;
        }
    }

    public class ID_Control : SimpleProcess
    {
        [InputBus]
        ID_ControlIn input;

        [OutputBus]
        ID_RegDst regdst;
        [OutputBus]
        ID_Branch branch;
        [OutputBus]
        ID_MemRead memread;
        [OutputBus]
        ID_MemToReg memtoreg;
        [OutputBus]
        ID_ALUOp aluop;
        [OutputBus]
        ID_MemWrite memwrite;
        [OutputBus]
        ID_ALUSrc alusrc;
        [OutputBus]
        ID_RegWrite regwrite;
        [OutputBus]
        ID_Jmp jump;
        [OutputBus]
        ID_JAL jal;
        [OutputBus]
        ID_LogicalImmediate logIm;
        [OutputBus]
        ID_BranchNot bne;

        protected override void OnTick()
        {
            // flag format = [BranchNot, Logical immediate, JAL, Jmp, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch]
            short flags = 0; // nop
            ALUOpcodes alu = 0; // nop
            Opcodes code = input.opcode; // TODO og vhdl failer her

            if (code == Opcodes.Rformat) { flags = 0x048; alu = ALUOpcodes.RFormat; }
            else if (code == Opcodes.lw) { flags = 0x03C; alu = ALUOpcodes.add; }
            else if (code == Opcodes.sw) { flags = 0x022; alu = ALUOpcodes.add; }
            else if (code == Opcodes.beq) { flags = 0x001; alu = ALUOpcodes.sub; }
            else if (code == Opcodes.addi) { flags = 0x028; alu = ALUOpcodes.add; }
            else if (code == Opcodes.addiu) { flags = 0x028; alu = ALUOpcodes.addu; }
            else if (code == Opcodes.j) { flags = 0x080; alu = ALUOpcodes.or; }
            else if (code == Opcodes.andi) { flags = 0x228; alu = ALUOpcodes.and; }
            else if (code == Opcodes.ori) { flags = 0x228; alu = ALUOpcodes.or; }
            else if (code == Opcodes.slti) { flags = 0x228; alu = ALUOpcodes.slt; }
            else if (code == Opcodes.xori) { flags = 0x228; alu = ALUOpcodes.xor; }
            else if (code == Opcodes.sltiu) { flags = 0x228; alu = ALUOpcodes.sltu; }
            else if (code == Opcodes.jal) { flags = 0x188; alu = ALUOpcodes.or; }
            else if (code == Opcodes.bne) { flags = 0x401; alu = ALUOpcodes.sub; }
            else { flags = 0; alu = (ALUOpcodes)0; }

            /*switch ((Opcodes)input.opcode)
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
            }*/
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
            aluop.code   = alu;
        }
    }

    public class ID_HazardUnit : SimpleProcess
    {
        [InputBus]
        ID_Pipe_WriteDst writeaddr;
        [InputBus]
        ID_Pipe_MemRead memread;
        [InputBus]
        ID_ReadA reada;
        [InputBus]
        ID_ReadB readb;
        [InputBus]
        JumpUnit_PCSrc branchOrJump;

        [OutputBus]
        ID_Haz_Flush flush;
        [OutputBus]
        ID_Haz_Stall stall;

        protected override void OnTick()
        { // TODO fix
            bool a = (memread.flg &&
                ((reada.addr == writeaddr.addr) ||
                    (readb.addr == writeaddr.addr)));
            //Console.WriteLine(a);
            stall.flg = a;
            bool b = branchOrJump.flg;
            //b = false;
            flush.flg = b;
        }
    }

    public class ID_Register : SimpleProcess
    {
        [InputBus]
        ID_ReadA readA;
        [InputBus]
        ID_ReadB readB;
        [InputBus]
        MEM_Pipe_RegWrite regWrite;
        [InputBus]
        MEM_Pipe_RegWriteAddr writeAddr;
        [InputBus]
        WB_WriteData writeData;

        [OutputBus]
        ID_OutputA outputA;
        [OutputBus]
        ID_OutputB outputB;

        uint[] data = new uint[32];

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

    [ClockedProcess]
    public class ID_Pipe : SimpleProcess
    {
        [InputBus]
        ID_OutputA outai;
        [InputBus]
        ID_OutputB outbi;
        [InputBus]
        ID_SignExtOut signi;
        [InputBus]
        IF_Pipe_IncrementerOut inci;
        [InputBus]
        ID_Jump jumpi;
        [InputBus]
        ID_Shamt shmti;
        [InputBus]
        ID_WriteDst dsti;
        [InputBus]
        ID_ALUFunct functi;
        [InputBus]
        ID_RegWrite regwritei;
        [InputBus]
        ID_ALUOp aluopi;
        [InputBus]
        ID_ALUSrc alusrci;
        [InputBus]
        ID_Branch branchi;
        [InputBus]
        ID_Jmp jmpi;
        [InputBus]
        ID_JAL jali;
        [InputBus]
        ID_BranchNot bnei;
        [InputBus]
        ID_MemRead memreadi;
        [InputBus]
        ID_MemWrite memwritei;
        [InputBus]
        ID_MemToReg memtoregi;
        [InputBus]
        ID_ReadA readai;
        [InputBus]
        ID_ReadB readbi;

        [InputBus]
        ID_Haz_Stall stall;
        [InputBus]
        ID_Haz_Flush flush;
        uint outatmp = 0;
        uint outbtmp = 0;
        uint signtmp = 0;
        uint inctmp = 0;
        uint jumptmp = 0;
        byte shmttmp = 0;
        byte dsttmp = 0;
        Funcs functtmp = 0;
        bool regwritetmp = false;
        ALUOpcodes aluoptmp = 0;
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
        ID_Pipe_OutputA outao;
        [OutputBus]
        ID_Pipe_OutputB outbo;
        [OutputBus]
        ID_Pipe_SignExtOut signo;
        [OutputBus]
        ID_Pipe_IncrementerOut inco;
        [OutputBus]
        ID_Pipe_Jump jumpo;
        [OutputBus]
        ID_Pipe_Shamt shmto;
        [OutputBus]
        ID_Pipe_WriteDst dsto;
        [OutputBus]
        ID_Pipe_ALUFunct functo;
        [OutputBus]
        ID_Pipe_RegWrite regwriteo;
        [OutputBus]
        ID_Pipe_ALUOp aluopo;
        [OutputBus]
        ID_Pipe_ALUSrc alusrco;
        [OutputBus]
        ID_Pipe_Branch brancho;
        [OutputBus]
        ID_Pipe_Jmp jmpo;
        [OutputBus]
        ID_Pipe_JAL jalo;
        [OutputBus]
        ID_Pipe_BranchNot bneo;
        [OutputBus]
        ID_Pipe_MemRead memreado;
        [OutputBus]
        ID_Pipe_MemWrite memwriteo;
        [OutputBus]
        ID_Pipe_MemToReg memtorego;
        [OutputBus]
        ID_Pipe_ReadA readao;
        [OutputBus]
        ID_Pipe_ReadB readbo;

        protected override void OnTick()
        {
            if (flush.flg || stall.flg)
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