using System;
using SME;

namespace ALU
{
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

		protected override void OnTick()
		{
			switch (op.code)
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
			}
		}
	}
}
