using System;
using System.Linq;
using SME;

namespace Register
{
	//[ClockedProcess]	
	public class Register : SimpleProcess
	{
		[InputBus]
		ReadA readA;
		[InputBus]
		ReadB readB;
		[InputBus]
		Write write;

		[OutputBus]
		OutputA outputA;
		[OutputBus]
		OutputB outputB;

		//int[] data = new int[32];
		int[] data = Enumerable.Repeat(0, 32).ToArray();

		protected override void OnTick()
		{
			if (write.enabled && write.addr > 0)
			{
				data[write.addr] = write.data;
			}
			outputA.data = data[readA.addr];
			outputB.data = data[readB.addr];

			/* Print the register file
			Console.Write("[");
			for (int i = 0; i < 4; i++)
			{
				Console.Write("\t");
				for (int j = 0; j < 7; j++)
				{
					Console.Write(data[i * 8 + j] + ",\t");
				}
				Console.WriteLine(data[i * 8 + 7] + (i == 3 ? "\t]" : ","));
			}*/
		}
	}
}
