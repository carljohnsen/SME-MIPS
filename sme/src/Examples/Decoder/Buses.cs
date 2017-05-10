using System;
using SME;

namespace Decoder
{
	/*public interface Input : IBus
	{
		bool Bit0 { get; set; }
		bool Bit1 { get; set; }
	}*/

	[TopLevelInputBus]
	public interface Input0 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus]
	public interface Input1 : IBus { bool Bit { get; set; } }

	[TopLevelOutputBus]
	public interface Output0 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus]
	public interface Output1 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus]
	public interface Output2 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus]
	public interface Output3 : IBus { bool Bit { get; set; } }

	/*public interface Output : IBus
	{
		bool Bit0 { get; set; }
		bool Bit1 { get; set; }
		bool Bit2 { get; set; }
		bool Bit3 { get; set; }
	}*/
}
