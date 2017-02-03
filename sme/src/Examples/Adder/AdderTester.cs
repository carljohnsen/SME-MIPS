using System;
using SME;

namespace Adder
{
	[ClockedProcess]
	public class AdderTester : Process
	{
		[InputBus]
		readonly Output output;

		[OutputBus]
		readonly Input input;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing");
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.Bit0 = 1;
			input.Bit1 = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.Bit0 = 0;
			input.Bit1 = 1;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 1);
			System.Diagnostics.Debug.Assert(output.Carry == 0);

			input.Bit0 = 1;
			input.Bit1 = 1;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum == 0);
			System.Diagnostics.Debug.Assert(output.Carry == 1);
			Console.WriteLine("Done testing");
		}
	}
}
