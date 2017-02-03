using System;
using SME;

namespace Decoder
{
	public interface Input : IBus
	{
		bool Bit0 { get; set; }
		bool Bit1 { get; set; }
	}

	public interface Output : IBus
	{
		bool Bit0 { get; set; }
		bool Bit1 { get; set; }
		bool Bit2 { get; set; }
		bool Bit3 { get; set; }
	}

	public interface BitBus : IBus
	{
		bool Bit { get; set; }
	}
}
