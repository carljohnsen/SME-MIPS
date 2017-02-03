using System;
using SME;

namespace SimpleTest
{
	[InitializedBus]
	public interface Inp : IBus
	{
		int Val { get; set; }
	}

	[InitializedBus]
	public interface Out : IBus
	{
		int Val { get; set; }
	}

	[ClockedProcess]
	public class Printer : SimpleProcess
	{
		[InputBus]
		Inp input;

		[OutputBus]
		Out output;

		protected override void OnTick()
		{
			int tmp = input.Val;
			Console.WriteLine(tmp);
			output.Val = tmp;
		}
	}

	public class Tester : Process
	{
		[InputBus]
		Out output;

		[OutputBus]
		Inp input;

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();
			for (int i = 0; i < 10; i++)
			{
				input.Val = i;
				await ClockAsync();
			}
			System.Diagnostics.Debug.Assert(output.Val == 10);
			input.Val = -1;
		}
	}
}
