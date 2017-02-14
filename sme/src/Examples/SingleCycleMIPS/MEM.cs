using System;
using SME;

namespace SingleCycleMIPS
{
    [InitializedBus]
    public interface MemRead : IBus
    {
        bool flg { get; set; }
    }

    [InitializedBus]
    public interface MemWrite : IBus
    {
        bool flg { get; set; }
    }
}
