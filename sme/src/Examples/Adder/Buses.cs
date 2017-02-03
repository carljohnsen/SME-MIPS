using System;
using SME;

namespace Adder
{
	[InitializedBus]
	public interface Input : IBus
	{
		int Bit0 { get; set; }
		int Bit1 { get; set; }
	}

	[InitializedBus]
	public interface Output : IBus
	{
		int Sum { get; set; }
		int Carry { get; set; }
	}
}
