using System;
using SME;

namespace FullAdder
{
	[TopLevelInputBus]
	public interface Input : IBus
	{
		bool BitA { get; set; }
		bool BitB { get; set; }
		bool BitC { get; set; }
	}

	[TopLevelOutputBus]
	public interface Output : IBus
	{
		bool Sum { get; set; }
		bool Carry { get; set; }
	}
}
