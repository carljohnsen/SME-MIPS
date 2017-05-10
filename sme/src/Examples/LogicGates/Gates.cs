using System;
using SME;

namespace LogicGates
{
	
    public class AndGate : SimpleProcess
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

    public class OrGate : SimpleProcess
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

    public class NotGate : SimpleProcess
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

    public class XorGate : SimpleProcess
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
