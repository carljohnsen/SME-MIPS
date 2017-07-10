using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace Counter
{
    [TopLevelInputBus]
    public interface Inc : IBus
    {
        [Signal]
        bool flg { get; set; }
    }

    [TopLevelOutputBus]
    public interface LEDs : IBus
    {
        byte val { get; set; }
    }
}
