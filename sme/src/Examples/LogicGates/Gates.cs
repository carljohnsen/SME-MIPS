using System;
using SME;

namespace LogicGates
{

    //[ClockedProcess]
    public class AND : SimpleProcess
    {
        [InputBus]
        Input input;

        [OutputBus]
        Output output;

        protected override void OnTick()
        {
            output.And = input.bit1 && input.bit2;
        }
    }

    //[ClockedProcess]
    public class OR : SimpleProcess
    {
        [InputBus]
        Input input;

        [OutputBus]
        Output output;

        protected override void OnTick()
        {
            output.Or = input.bit1 || input.bit2;
        }
    }

    //[ClockedProcess]
    public class NOT : SimpleProcess
    {
        [InputBus]
        Input input;

        [OutputBus]
        Output output;

        protected override void OnTick()
        {
            output.Not = !input.bit1;
        }
    }

    //[ClockedProcess]
    public class XOR : SimpleProcess
    {
        [InputBus]
        Input input;

        [OutputBus]
        Output output;

        protected override void OnTick()
        {
            output.Xor = input.bit1 ^ input.bit2;
        }
    }
}
