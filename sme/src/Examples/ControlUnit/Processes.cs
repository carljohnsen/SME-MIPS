using System;
using SME;

namespace ControlUnit
{
	public enum Opcodes
	{
		Rformat,
		j = 2,
		jal,
		beq,
		bne,
		//blez,
		//bgtz,
		addi = 8,
		addiu,
		slti,
		sltiu,
		andi,
		ori,
		xori,
		//lui,
		//floating=17,
		//lb=32,
		//lh,
		//lwl,
		lw = 35,
		//lbu,
		//lhu,
		//lwr,
		//sb=40,
		//sh,
		//swl,
		sw = 43,
		//swr=46,
		//cache,
		//ll,
		//lwc1,
		//lwc2,
		//pref,
		//ldc1=53,
		//ldc2,
		//sc=56,
		//swc1,
		//swc2,
		//sdc1=61,
		//sdc2=62,
	}

	public enum ALUOpcodes
	{
		RFormat,
		sub,
		add,
		addu,
		and,
		or,
		slt,
		sltu,
		xor,
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
		[OutputBus]
		BranchNot bne;

		protected override void OnTick()
		{
			// flag format = [BranchNot, Jump reg, Logical immediate, JAL, Jump, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch]
			short flags = 0; // nop
			ALUOpcodes alu = 0; // nop
			Opcodes code = input.opcode;

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
			/*switch (input.opcode)
			{ // The comments are the flags, X is dont care
				case Opcodes.Rformat: flags = 0x048; alu = ALUOpcodes.RFormat; break; // 000 0100 1000
				case Opcodes.lw: flags = 0x03C; alu = ALUOpcodes.add; break; // 000 0011 1100
				case Opcodes.sw: flags = 0x022; alu = ALUOpcodes.add; break; // 000 001X 0010
				case Opcodes.beq: flags = 0x001; alu = ALUOpcodes.sub; break; // 000 0X0X 0001
				case Opcodes.addi: flags = 0x028; alu = ALUOpcodes.add; break; // 000 0010 1000
				case Opcodes.addiu: flags = 0x028; alu = ALUOpcodes.addu; break; // 000 0010 1000
				case Opcodes.j: flags = 0x080; alu = ALUOpcodes.or; break; // 0X0 1XXX 000X
				case Opcodes.andi: flags = 0x228; alu = ALUOpcodes.and; break; // 010 0010 1000
				case Opcodes.ori: flags = 0x228; alu = ALUOpcodes.or; break; // 010 0010 1000
				case Opcodes.slti: flags = 0x228; alu = ALUOpcodes.slt; break; // 010 0010 1000
				case Opcodes.xori: flags = 0x228; alu = ALUOpcodes.xor; break;
				case Opcodes.sltiu: flags = 0x228; alu = ALUOpcodes.sltu; break; // 010 0010 1000
				case Opcodes.jal: flags = 0x188; alu = ALUOpcodes.or; break; // 0X1 1XXX 100X
				case Opcodes.bne: flags = 0x401; alu = ALUOpcodes.sub; break; // 100 0X0X 0001
				//default: flags = 0; alu = 0; break;
			}*/


			bne.flg = ((flags >> 10) & 1) == 1;
			logIm.flg = ((flags >> 9) & 1) == 1;
			jal.flg = ((flags >> 8) & 1) == 1;
			jump.flg = ((flags >> 7) & 1) == 1;
			regdst.flg = ((flags >> 6) & 1) == 1;
			alusrc.flg = ((flags >> 5) & 1) == 1;
			memtoreg.flg = ((flags >> 4) & 1) == 1;
			regwrite.flg = ((flags >> 3) & 1) == 1;
			memread.flg = ((flags >> 2) & 1) == 1;
			memwrite.flg = ((flags >> 1) & 1) == 1;
			branch.flg = (flags & 1) == 1;
			aluop.code = alu;
		}
	}

	public class Tester : SimulationProcess
	{
		[OutputBus]
		ControlIn input;

		[InputBus]
		RegDst regdst;
		[InputBus]
		Branch branch;
		[InputBus]
		MemRead memread;
		[InputBus]
		MemToReg memtoreg;
		[InputBus]
		ALUOp aluop;
		[InputBus]
		MemWrite memwrite;
		[InputBus]
		ALUSrc alusrc;
		[InputBus]
		RegWrite regwrite;
		[InputBus]
		Jump jump;
		[InputBus]
		JAL jal;
		[InputBus]
		LogicalImmediate logIm;
		[InputBus]
		BranchNot bne;

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();
			input.opcode = Opcodes.Rformat;
			await ClockAsync();
		}
	}
}
