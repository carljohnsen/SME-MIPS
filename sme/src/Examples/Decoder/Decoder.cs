using System;
using SME;

namespace Decoder
{
	[InitializedBus]
	public interface Internal0 : IBus
	{
		bool Bit { get; set; }
	}

	[InitializedBus]
	public interface Internal1 : IBus
	{
		bool Bit { get; set; }
	}

	// The gates should not be clocked, as they are part of a combinatorial circuit
	//[ClockedProcess]
	public class Not0 : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Internal0 output;

		protected override void OnTick()
		{
			output.Bit = !input.Bit0;
		}
	}

	//[ClockedProcess]
	public class Not1 : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Internal1 output;

		protected override void OnTick()
		{
			output.Bit = !input.Bit1;
		}
	}

	//[ClockedProcess]
	public class And0 : SimpleProcess
	{
		[InputBus]
		Internal0 input0;

		[InputBus]
		Internal1 input1;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Bit0 = input0.Bit && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And1 : SimpleProcess
	{
		[InputBus]
		Input input0;

		[InputBus]
		Internal1 input1;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Bit1 = input0.Bit0 && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And2 : SimpleProcess
	{
		[InputBus]
		Input input0;

		[InputBus]
		Internal0 input1;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Bit2 = input0.Bit1 && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And3 : SimpleProcess
	{
		[InputBus]
		Input input;

		[OutputBus]
		Output output;

		protected override void OnTick()
		{
			output.Bit3 = input.Bit0 && input.Bit1;
		}
	}
}
