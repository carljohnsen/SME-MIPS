using System;
using SME;

namespace SingleCycleMIPS
{
	public class IF
	{
		[InitializedBus]
		public interface Instruction
		{
			int instruction { get; set; }
		}
	}
}
