using System;
using SME;

namespace ControlUnit
{
	public interface ControlIn : IBus
	{
		Opcodes opcode { get; set; }
	}

	public interface RegDst : IBus
	{
		bool flg { get; set; }
	}

	public interface Branch : IBus
	{
		bool flg { get; set; }
	}

	public interface MemRead : IBus
	{
		bool flg { get; set; }
	}

	public interface MemWrite : IBus
	{
		bool flg { get; set; }
	}

	public interface MemToReg : IBus
	{
		bool flg { get; set;}
	}

	public interface ALUOp : IBus
	{
		ALUOpcodes code { get; set; }
	}

	public interface ALUSrc : IBus
	{
		bool flg { get; set; }
	}

	public interface RegWrite : IBus
	{
		bool flg { get; set; }
	}

	public interface Jump : IBus
	{
		bool flg { get; set; }
	}

	public interface JAL : IBus
	{
		bool flg { get; set; }
	}

	public interface LogicalImmediate : IBus
	{
		bool flg { get; set; }
	}

	public interface BranchNot : IBus
	{
		bool flg { get; set; }
	}
}
