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
		Input0 input;

		[OutputBus]
		Internal0 output;

		protected override void OnTick()
		{
			output.Bit = !input.Bit;
		}
	}

	//[ClockedProcess]
	public class Not1 : SimpleProcess
	{
		[InputBus]
		Input1 input;

		[OutputBus]
		Internal1 output;

		protected override void OnTick()
		{
			output.Bit = !input.Bit;
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
		Output0 output;

		protected override void OnTick()
		{
			output.Bit = input0.Bit && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And1 : SimpleProcess
	{
		[InputBus]
		Input0 input0;

		[InputBus]
		Internal1 input1;

		[OutputBus]
		Output1 output;

		protected override void OnTick()
		{
			output.Bit = input0.Bit && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And2 : SimpleProcess
	{
		[InputBus]
		Input1 input0;

		[InputBus]
		Internal0 input1;

		[OutputBus]
		Output2 output;

		protected override void OnTick()
		{
			output.Bit = input0.Bit && input1.Bit;
		}
	}

	//[ClockedProcess]
	public class And3 : SimpleProcess
	{
		[InputBus]
		Input0 input0;
		[InputBus]
		Input1 input1;

		[OutputBus]
		Output3 output;

		protected override void OnTick()
		{
			output.Bit = input0.Bit && input1.Bit;
		}
	}
}
