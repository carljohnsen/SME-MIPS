using System;
using SME;

namespace Adder
{
	public class XOR : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Sum = input.Bit0 ^ input.Bit1;
		}
	}

	public class AND : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Carry = input.Bit0 && input.Bit1;
		}
	}
}
