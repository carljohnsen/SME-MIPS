using System;
using SME;

namespace ALU
{
	[InitializedBus]
	public interface InputA : IBus
	{
		int data { get; set; }
	}

	[InitializedBus]
	public interface InputB : IBus
	{
		int data { get; set; } 
	}

	[InitializedBus]
	public interface ALUOp : IBus
	{
		opcodes code { get; set; }
	}

	[InitializedBus]
	public interface Zero : IBus
	{
		bool val { get; set; }
	}

	[InitializedBus]
	public interface Output : IBus
	{
		int data { get; set; }
	}
}
