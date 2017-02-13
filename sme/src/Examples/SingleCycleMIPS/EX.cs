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
	public interface ALUOp : IBus
	{
		short code { get; set; }
		/*bool op0 { get; set; }
		bool op1 { get; set; }*/
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
		// Not enough, create new!
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
				if (op.code == 0) // R format
				{
					switch (funct.val)
					{
						case (short)Funcs.add: output.val = (short)ALUOps.add; break;
						case (short)Funcs.sub: output.val = (short)ALUOps.sub; break;
						case (short)Funcs.and: output.val = (short)ALUOps.and; break;
						case (short)Funcs.or : output.val = (short)ALUOps.or;  break;
						case (short)Funcs.slt: output.val = (short)ALUOps.slt; break;
					}
				}
				else
				{
					switch (op.code) // hacked solution...
					{
						case 2: output.val = (short)ALUOps.add; break;
						case 1: output.val = (short)ALUOps.sub; break;
					}
				}
				/*
				// TODO kig på at få lavet en PLA, og derfra få den reduceret. Det tror jeg vil være det nemmeste.
				short tmp = funct.val;
				short funct0 = (short) (tmp & 1);
				short funct1 = (short) ((tmp >> 1) & 1);
				short funct2 = (short)((tmp >> 2) & 1);
				short funct3 = (short)((tmp >> 3) & 1);
				short funct4 = (short)((tmp >> 4) & 1);
				short funct5 = (short)((tmp >> 5) & 1);

				int op0 = (funct0 | funct3) & (op.op1 ? 1 : 0);
				int op1 = (~funct2 & 1) | (!op.op1 ? 1 : 0);
				int op2 = (funct1 & (op.op1 ? 1 : 0)) | (op.op0 ? 1 : 0);
				//bool op4 = 0;

				output.val = (short) (op0 | (op1 << 1) | (op2 << 2));*/
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
			//ALUResult result;
			WB.BufIn result;

			protected override void OnTick()
			{
				int tmp = -1;
				//bool z = false;
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
					case ALUOps.multu:
						tmp = (int)(((uint)inA.data) * ((uint)inB.data));
						break;
					case ALUOps.div:
						tmp = inA.data / inB.data;
						break;
					case ALUOps.divu:
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
}
