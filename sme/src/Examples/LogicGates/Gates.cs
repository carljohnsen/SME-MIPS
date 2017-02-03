using System;
using SME;

namespace LogicGates
{
	
	//[ClockedProcess]
	public class AND : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.And = input.Bit1 & input.Bit2;
		}
	}

	//[ClockedProcess]
	public class OR : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Or = input.Bit1 | input.Bit2;
		}
	}

	//[ClockedProcess]
	public class NOT : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Not = ~input.Bit1 & 1;
		}
	}

	//[ClockedProcess]
	public class XOR : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Xor = input.Bit1 ^ input.Bit2;
		}
	}
}
