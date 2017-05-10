using System;
using SME;

namespace Register
{
	public class Tester : SimulationProcess
	{
		[InputBus]
		OutputA outputA;
		[InputBus]
		OutputB outputB;

		[OutputBus]
		ReadA inputA;
		[OutputBus]
		ReadB inputB;
		[OutputBus]
		Write write;

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();

			// Check that initial values are 0, by reading some registers
			inputA.addr = 0;
			inputB.addr = 1;
			write.enabled = false;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(outputA.data == 0);
			System.Diagnostics.Debug.Assert(outputB.data == 0);

			// Try to write to a register
			write.addr = 5;
			write.data = 42;
			write.enabled = true;
			inputA.addr = 5;
			inputB.addr = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(outputA.data == 42);
			System.Diagnostics.Debug.Assert(outputB.data == 0);

			// Try to write to register 0, should not change register 0
			write.addr = 0;
			write.data = 32;
			write.enabled = true;
			inputA.addr = 0;
			inputB.addr = 0;

			await ClockAsync();

			System.Diagnostics.Debug.Assert(outputA.data == 0);
			System.Diagnostics.Debug.Assert(outputB.data == 0);

			// Try to write to all registers - ignoring 0
			for (short i = 1; i < 32; i++)
			{
				write.addr = i;
				write.data = 100 + i;
				write.enabled = true;
				inputA.addr = i;
				inputB.addr = i;

				await ClockAsync();

				System.Diagnostics.Debug.Assert(outputA.data == 100 + i);
				System.Diagnostics.Debug.Assert(outputB.data == 100 + i);
			}
		}
	}
}
