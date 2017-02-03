using System;
using SME;

namespace LogicGates
{
	// Tests the logic circuits
	[ClockedProcess]
	public class GateTester : Process
	{
		// Names are kind of reversed, as it is input for the gate, and not the producer
		[OutputBus]
		Input input;

		[InputBus]
		Output output;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Starting test!");
			await ClockAsync();

			input.Bit1 = 0;
			input.Bit2 = 0;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.And == 0, "26");
			System.Diagnostics.Debug.Assert(output.Or  == 0, "27");
			System.Diagnostics.Debug.Assert(output.Not == 1, "28");
			System.Diagnostics.Debug.Assert(output.Xor == 0, "29");

			input.Bit1 = 0;
			input.Bit2 = 1;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.And == 0);
			System.Diagnostics.Debug.Assert(output.Or == 1);
			System.Diagnostics.Debug.Assert(output.Not == 1);
			System.Diagnostics.Debug.Assert(output.Xor == 1);

			input.Bit1 = 1;
			input.Bit2 = 0;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.And == 0);
			System.Diagnostics.Debug.Assert(output.Or == 1);
			System.Diagnostics.Debug.Assert(output.Not == 0);
			System.Diagnostics.Debug.Assert(output.Xor == 1);

			input.Bit1 = 1;
			input.Bit2 = 1;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.And == 1);
			System.Diagnostics.Debug.Assert(output.Or == 1);
			System.Diagnostics.Debug.Assert(output.Not == 0);
			System.Diagnostics.Debug.Assert(output.Xor == 0);

			await ClockAsync();
			Console.WriteLine("Done testing!");
		}
	}
}
