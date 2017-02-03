using System;
using SME;

namespace LogicGates
{
	[TopLevelInputBus, InitializedBus]
	public interface Input : IBus
	{
		int Bit1 { get; set; }
		int Bit2 { get; set; }
	}

	[TopLevelOutputBus, InitializedBus]
	public interface Output : IBus
	{
		int And { get; set; }
		int Or { get; set; }
		int Not { get; set; }
		int Xor { get; set; }
	}
}
