using System;
using SME;

namespace Adder
{
	public class AdderTester : SimulationProcess
	{
		[InputBus]
		Output output;

		[OutputBus]
		Input input;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing");
			await ClockAsync();

			input.Bit0 = true;
            input.Bit1 = false;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum);
			System.Diagnostics.Debug.Assert(!output.Carry);

            input.Bit0 = false;
			input.Bit1 = true;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Sum);
			System.Diagnostics.Debug.Assert(!output.Carry);

			input.Bit0 = true;
			input.Bit1 = true;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output.Sum);
			System.Diagnostics.Debug.Assert(output.Carry);
			Console.WriteLine("Done testing");
		}
	}
}
