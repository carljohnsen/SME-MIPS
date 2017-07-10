using System;
using SME;

namespace SingleCycleMIPS
{
	// Values taken from MIPS reference data card from the book
	public enum Funcs
	{
		sll,
        ignore_1,
		srl = 2,
		sra,
		sllv,
        ignore_5,
		srlv = 6,
		srav,
		jr,
		jalr,
		movz,
		movn,
		syscall,
		bbreak, // break is a keyword
        ignore_14,
		sync = 15,
		mfhi,
		mthi,
		mflo,
		mtlo,
        ignore_20,
        ignore_21,
        ignore_22,
        ignore_23,
        mult = 24,
		multu,
		div,
		divu,
        ignore_28,
        ignore_29,
        ignore_30,
        ignore_31,
        add = 32,
		addu,
		sub,
		subu,
		and,
		or,
		xor,
		nor,
        ignore_40,
        ignore_41,
        slt = 42,
		sltu,
        ignore_44,
        ignore_45,
        ignore_46,
        ignore_47,
        tge = 48,
		tgeu,
		tlt,
		tltu,
		teq,
        ignore_53,
        tne = 54,
        ignore_55,
        ignore_56,
        ignore_57,
        ignore_58,
        ignore_59,
        ignore_60,
        ignore_61,
        ignore_62,
        ignore_63,
    };

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

	[InitializedBus]
	public interface ALUOp : IBus
	{
		ALUOpcodes code { get; set; }
	}

	[InitializedBus]
	public interface ALUFunct : IBus
	{
		Funcs val { get; set; }
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


	[InitializedBus]
	public interface ALUOperation : IBus
	{
		ALUOps code { get; set; }
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
		OutputB register;
		[InputBus]
		SignExtOut immediate;

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
		Shamt shmt;
		[InputBus]
		OutputA reada;
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

	[InitializedBus]
	public interface RegWriteAddr : IBus
	{
		byte addr { get; set; }
	}

	public class JalMux : SimpleProcess
	{
		[InputBus]
		MuxOutput writeAddr;
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
		IncrementerOut pc;
		[InputBus]
		ALUResult alu;

		[OutputBus]
		JALOut output;

		protected override void OnTick()
		{
			output.val = jal.flg ? pc.address : alu.data;
		}
	}


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
	public interface JumpInstruction : IBus
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
		IncrementerOut pc;

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
		IncrementerOut oldPc;
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
		PCIn pc;

		protected override void OnTick()
		{
			pc.newAddress = jump.flg || jr.flg ? jumpAddr.addr : branch.addr;
		}
	}

	public class Mux2 : SimpleProcess
	{
		[InputBus]
		OutputA outa;
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
		SignExtOut immediate;

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
		JumpInstruction inst;

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
		IncrementerOut pc;

		[OutputBus]
		JumpAddr output;

		protected override void OnTick()
		{
			output.addr = (pc.address & 0x3C000000) | mux.addr;
		}
	}

	public class AndGate : SimpleProcess
	{
		[InputBus]
		Branch branch;
		[InputBus]
		Zero zero;
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

