using System;
using SME;

namespace FullAdder
{
	[InitializedBus]
	public interface Input : IBus
	{
		bool BitA { get; set; }
		bool BitB { get; set; }
		bool BitC { get; set; }
	}

	[InitializedBus]
	public interface Output : IBus
	{
		bool Sum { get; set; }
		bool Carry { get; set; }
	}
}
