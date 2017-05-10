using System;
using SME;

namespace LogicGates
{
    [TopLevelInputBus]
    public interface Input : IBus
    {
        bool bit1 { get; set; }
        bool bit2 { get; set; }
    }

    [TopLevelOutputBus]
    public interface Output : IBus
    {
        bool And { get; set; }
        bool Or  { get; set; }
        bool Not { get; set; }
        bool Xor { get; set; }
    }
}
