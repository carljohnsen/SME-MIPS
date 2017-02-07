using System;
using SME;

namespace SingleCycleMIPS
{
	public class IF
	{
		[InitializedBus]
		public interface Instruction : IBus
		{
			int instruction { get; set; }
		}
	}
}
