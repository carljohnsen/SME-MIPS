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
		bool op0 { get; set; }
		bool op1 { get; set; }
	}

	[InitializedBus]
	public interface ALUFunct : IBus
	{
		short val { get; set; }
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

	public class EX
	{
		[InitializedBus]
		public interface ALUOperation : IBus
		{
			short val { get; set; }
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

		// Appendix D - Figure D.2.3
		// https://www.cise.ufl.edu/~mssz/CompOrg/Table4.2-MIPSdatapath-ALUcontrol.gif
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
				short tmp = funct.val;
				bool funct0 = (tmp & 1) == 1;
				bool funct1 = ((tmp >> 1) & 1) == 1;
				bool funct2 = ((tmp >> 2) & 1) == 1;
				bool funct3 = ((tmp >> 3) & 1) == 1;
				bool funct4 = ((tmp >> 4) & 1) == 1;
				bool funct5 = ((tmp >> 5) & 1) == 1;

				bool op0 = (funct0 || funct3) && op.op1;
				bool op1 = !funct2 || !op.op1;
				bool op2 = (funct1 && op.op1) || op.op0;
				//bool op4 = 0;

				output.val = (short) (0 & (op0 ? 1 : 0) | ((op1 ? 1 : 0) << 1) | ((op2 ? 1 : 0) << 2));
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

			protected override void OnTick()
			{
				int tmp = -1;
				bool z = false;
				switch ((Funcs) op.val)
				{
					case Funcs.and:
						tmp = inA.data & inB.data;
						break;
					case Funcs.or:
						tmp = inA.data | inB.data;
						break;
					case Funcs.add:
						tmp = inA.data + inB.data;
						break;
					case Funcs.mult:
						tmp = inA.data * inB.data;
						break;
					case Funcs.sub:
						tmp = inA.data - inB.data;
						break;
					case Funcs.slt:
						tmp = (inA.data < inB.data) ? 1 : 0;
						break;
					default: // Catch unknown
						tmp = -1;
						break;
				}
				result.data = tmp;
				zero.flg = z;
			}
		}
	}
}
