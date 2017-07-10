using System;
using SME;

namespace ALU
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
	};

	public class ALUU : SimpleProcess
	{
		[InputBus]
		InputA inA;
		[InputBus]
		InputB inB;
		[InputBus]
		ALUOp op;

		[OutputBus]
		Zero zero;
		[OutputBus]
		Output output;

		// TODO fortæl kenneth om den her! 
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
			output.data = tmp;
			zero.val = tmp == 0;
			tmp = (uint) tmp2; // To remove scoping error - i.e. nop line
		}
	}
}
