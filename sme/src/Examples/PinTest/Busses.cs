using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace PinTest
{
    [TopLevelInputBus] public interface BitIn1 : IBus { bool flg { get; set; } }
    [TopLevelInputBus] public interface BitIn2 : IBus { bool flg { get; set; } }
    [TopLevelInputBus] public interface BitIn3 : IBus { bool flg { get; set; } }
    [TopLevelInputBus] public interface BitIn4 : IBus { bool flg { get; set; } }

    [TopLevelOutputBus] public interface BitOut1 : IBus { bool flg { get; set; } }
    [TopLevelOutputBus] public interface BitOut2 : IBus { bool flg { get; set; } }
    [TopLevelOutputBus] public interface BitOut3 : IBus { bool flg { get; set; } }
    [TopLevelOutputBus] public interface BitOut4 : IBus { bool flg { get; set; } }
}
