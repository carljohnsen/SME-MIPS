using System;
using SME;

namespace ALU
{
	[TopLevelInputBus]
	public interface InputA : IBus
	{
		uint data { get; set; }
	}

	[TopLevelInputBus]
	public interface InputB : IBus
	{
		uint data { get; set; } 
	}

	[TopLevelInputBus]
	public interface ALUOp : IBus
	{
		ALUOps code { get; set; }
	}

	[TopLevelOutputBus]
	public interface Zero : IBus
	{
		bool val { get; set; }
	}

	[TopLevelOutputBus]
	public interface Output : IBus
	{
		uint data { get; set; }
	}
}
