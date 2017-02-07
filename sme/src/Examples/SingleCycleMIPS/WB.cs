using System;
using SME;

namespace SingleCycleMIPS
{
	[InitializedBus]
	public interface MemToReg : IBus
	{
		bool flg { get; set; }
	}
}
