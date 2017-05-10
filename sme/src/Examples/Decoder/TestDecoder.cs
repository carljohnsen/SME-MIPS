using System;
using SME;

namespace Decoder
{
	public class TestDecoder : SimulationProcess
	{
		[InputBus]
		Output0 output0;
		[InputBus]
		Output1 output1;
		[InputBus]
		Output2 output2;
		[InputBus]
		Output3 output3;

		[OutputBus]
		Input0 input0;
		[OutputBus]
		Input1 input1;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing...");
			await ClockAsync();

			input0.Bit = false;
			input1.Bit = false;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(output0.Bit);
			System.Diagnostics.Debug.Assert(!output1.Bit);
			System.Diagnostics.Debug.Assert(!output2.Bit);
			System.Diagnostics.Debug.Assert(!output3.Bit);
			input0.Bit = true;
			input1.Bit = false;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output0.Bit);
			System.Diagnostics.Debug.Assert(output1.Bit);
			System.Diagnostics.Debug.Assert(!output2.Bit);
			System.Diagnostics.Debug.Assert(!output3.Bit);
			input0.Bit = false;
			input1.Bit = true;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output0.Bit);
			System.Diagnostics.Debug.Assert(!output1.Bit);
			System.Diagnostics.Debug.Assert(output2.Bit);
			System.Diagnostics.Debug.Assert(!output3.Bit);
			input0.Bit = true;
			input1.Bit = true;
			await ClockAsync();

			System.Diagnostics.Debug.Assert(!output0.Bit);
			System.Diagnostics.Debug.Assert(!output1.Bit);
			System.Diagnostics.Debug.Assert(!output2.Bit);
			System.Diagnostics.Debug.Assert(output3.Bit);
			await ClockAsync();
			Console.WriteLine("Testing done");
		}
	}
}
