using System;
using SME;

namespace SingleCycleMIPS
{
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
}
