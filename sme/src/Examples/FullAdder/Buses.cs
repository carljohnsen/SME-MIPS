using System;
using SME;

namespace FullAdder
{
	[InitializedBus]
	public interface Input : IBus
	{
		int BitA { get; set; }
		int BitB { get; set; }
		int BitC { get; set; }
	}

	[InitializedBus]
	public interface Output : IBus
	{
		int Sum { get; set; }
		int Carry { get; set; }
	}
}
