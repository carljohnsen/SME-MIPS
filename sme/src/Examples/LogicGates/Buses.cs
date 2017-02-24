using System;
using SME;

namespace LogicGates
{
    [TopLevelInputBus, InitializedBus]
    public interface Input : IBus
    {
        bool bit1 { get; set; }
        bool bit2 { get; set; }
    }

    [TopLevelOutputBus, InitializedBus]
    public interface Output : IBus
    {
        bool And { get; set; }
        bool Or  { get; set; }
        bool Not { get; set; }
        bool Xor { get; set; }
    }
}
