using System;
using SME;

namespace Adder
{
	[TopLevelInputBus]
	public interface Input : IBus
	{
		bool Bit0 { get; set; }
		bool Bit1 { get; set; }
	}

	[TopLevelOutputBus]
	public interface Output : IBus
	{
		bool Sum { get; set; }
		bool Carry { get; set; }
	}
}
