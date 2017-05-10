using System;
using SME;

namespace ALU
{
	public enum opcodes
	{
		add,
		sub,
		and,
		or,
	};

	public class ALUU : SimpleProcess
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
			uint tmp = 0;

			switch (op.code)
			{
				case opcodes.add:
					tmp = inputA.data + inputB.data; break;
				case opcodes.sub:
					tmp = inputA.data - inputB.data; break;
				case opcodes.and:
					tmp = inputA.data & inputB.data; break;
				case opcodes.or: 
					tmp = inputA.data | inputB.data; break;
				default: tmp = 1000000; break;
			}

			output.data = tmp;
			zero.val = tmp == 0;
		}
	}
}
