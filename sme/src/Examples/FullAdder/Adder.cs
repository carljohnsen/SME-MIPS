using System;
using SME;

namespace FullAdder
{
	public class FullAdder
	{
		[InitializedBus]
		public interface Internal0 : IBus
		{
			int Bit { get; set; }
		}
		[InitializedBus]
		public interface Internal1 : IBus
		{
			int Bit { get; set; }
		}
		[InitializedBus]
		public interface Internal2 : IBus
		{
			int Bit { get; set; }
		}

		public class XOR0 : SimpleProcess
		{
			[InputBus]
			Input input;

			[OutputBus]
			Internal0 output;

			protected override void OnTick()
			{
				output.Bit = input.BitA ^ input.BitB;
			}
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus]
			Input input0;
			[InputBus]
			Internal0 input1;

			[OutputBus]
			Output output;

			protected override void OnTick()
			{
				output.Sum = input0.BitC ^ input1.Bit;
			}
		}

		public class AND0 : SimpleProcess
		{
			[InputBus]
			Input input;

			[OutputBus]
			Internal2 output;

			protected override void OnTick()
			{
				output.Bit = input.BitA & input.BitB;
			}
		}

		public class AND1 : SimpleProcess
		{
			[InputBus]
			Input input0;
			[InputBus]
			Internal0 input1;

			[OutputBus]
			Internal1 output;

			protected override void OnTick()
			{
				output.Bit = input0.BitC & input1.Bit;
			}
		}

		public class OR : SimpleProcess
		{
			[InputBus]
			Internal1 input0;
			[InputBus]
			Internal2 input1;

			[OutputBus]
			Output output;

			protected override void OnTick()
			{
				output.Carry = input0.Bit | input1.Bit;
			}
		}
	}

	[ClockedProcess]
	public class AdderTester : Process
	{
		[InputBus]
		Output output;

		[OutputBus]
		Input input;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing");
			await ClockAsync();

			input.BitA = 0;
			input.BitB = 0;
			input.BitC = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.BitA = 1;
			input.BitB = 0;
			input.BitC = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.BitA = 0;
			input.BitB = 1;
			input.BitC = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.BitA = 0;
			input.BitB = 0;
			input.BitC = 1;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.BitA = 1;
			input.BitB = 1;
			input.BitC = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 1);

			input.BitA = 1;
			input.BitB = 0;
			input.BitC = 1;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 1);

			input.BitA = 0;
			input.BitB = 1;
			input.BitC = 1;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 1);

			input.BitA = 1;
			input.BitB = 1;
			input.BitC = 1;

			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 1);
			Console.WriteLine("Done testing");
		}
	}
}
