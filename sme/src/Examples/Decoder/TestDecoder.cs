using System;
using SME;

namespace Decoder
{
	[ClockedProcess]
	public class TestDecoder : Process
	{
		[InputBus]
		Output output;

		[OutputBus]
		Input input;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing...");
			await ClockAsync();

			input.Bit0 = false;
			input.Bit1 = false;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output.Bit0);
			System.Diagnostics.Debug.Assert(!output.Bit1);
			System.Diagnostics.Debug.Assert(!output.Bit2);
			System.Diagnostics.Debug.Assert(!output.Bit3);
			input.Bit0 = true;
			input.Bit1 = false;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output.Bit0);
			System.Diagnostics.Debug.Assert(output.Bit1);
			System.Diagnostics.Debug.Assert(!output.Bit2);
			System.Diagnostics.Debug.Assert(!output.Bit3);
			input.Bit0 = false;
			input.Bit1 = true;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output.Bit0);
			System.Diagnostics.Debug.Assert(!output.Bit1);
			System.Diagnostics.Debug.Assert(output.Bit2);
			System.Diagnostics.Debug.Assert(!output.Bit3);
			input.Bit0 = true;
			input.Bit1 = true;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output.Bit0);
			System.Diagnostics.Debug.Assert(!output.Bit1);
			System.Diagnostics.Debug.Assert(!output.Bit2);
			System.Diagnostics.Debug.Assert(output.Bit3);
			await ClockAsync();
			Console.WriteLine("Testing done");
		}
	}
}
