using System;
using SME;

namespace ALU
{
	public class Tester : SimulationProcess
	{
		[InputBus]
		Output output;
		[InputBus]
		Zero zero;

		[OutputBus]
		InputA inputA;
		[OutputBus]
		InputB inputB;
		[OutputBus]
		ALUOp op;

		public async override System.Threading.Tasks.Task Run()
		{
			Console.WriteLine("Started testing");
			await ClockAsync();

			op.code =  ALUOps.add; // add
			inputA.data = 2;
			inputB.data = 2;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 4);
			System.Diagnostics.Debug.Assert(zero.val == false);

			op.code =  ALUOps.sub; // sub
			inputA.data = 2;
			inputB.data = 2;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 0);
			System.Diagnostics.Debug.Assert(zero.val == true);

			op.code =  ALUOps.and; // and
			inputA.data = 1;
			inputB.data = 1;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 1);
			System.Diagnostics.Debug.Assert(zero.val == false);

			op.code =  ALUOps.or; // or
			inputA.data = 2;
			inputB.data = 1;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 3);
			System.Diagnostics.Debug.Assert(zero.val == false);
			await ClockAsync();
			Console.WriteLine("Done testing");

			/*op.code = 0x2A; // slt
			inputA.data = 1;
			inputB.data = 2;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 1);
			System.Diagnostics.Debug.Assert(zero.val == false);

			op.code = 0x2A; // slt
			inputA.data = 3;
			inputB.data = 2;
			await ClockAsync();
			System.Diagnostics.Debug.Assert(output.data == 0);
			System.Diagnostics.Debug.Assert(zero.val == true);*/
		}
	}
}
