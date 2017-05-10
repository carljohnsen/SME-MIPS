using System;
using SME;

namespace ALU
{
	public delegate int f(int a, int b);

	public enum opcodes
	{
		add,
		sub,
		and,
		or,
	};

	//[ClockedProcess]
	public class ALU : SimpleProcess
	{
		[InputBus]
		InputA inputA;
		[InputBus]
		InputB inputB;
		[InputBus]
		ALUOp op;

		[OutputBus]
		Zero zero;
		[OutputBus]
		Output output;

		f[] funs = new f[] {
			(a, b) => a + b,
			(a, b) => a - b,
			(a, b) => a & b,
			(a, b) => a | b,
		};

		protected override void OnTick()
		{
			/*switch (op.code)
			{
				case 0x20: // add
					int tmp = inputA.data + inputB.data;
					output.data = tmp;
					zero.val = tmp == 0;
					break;
				case 0x22: //sub
					tmp = inputA.data - inputB.data;
					output.data = tmp;
					zero.val = tmp == 0;
					break;
				case 0x24: //and
					tmp = inputA.data & inputB.data;
					output.data = tmp;
					zero.val = tmp == 0;
					break;
				case 0x25: //or
					tmp = inputA.data | inputB.data;
					output.data = tmp;
					zero.val = tmp == 0;
					break;
				case 0x2A: //slt
					tmp = inputA.data < inputB.data ? 1 : 0;
					output.data = tmp;
					zero.val = tmp == 0;
					break;
			}*/

			int res = funs[(int) op.code](inputA.data, inputB.data);
			output.data = res;
			zero.val = res == 0;
		}
	}
}
