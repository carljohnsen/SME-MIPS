using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace PinTest
{
    public class Forw1 : SimpleProcess
    {
        [InputBus] BitIn1 input;
        [OutputBus] BitOut1 output;

        protected override void OnTick()
        {
            output.flg = input.flg;
        }
    }

    public class Forw2 : SimpleProcess
    {
        [InputBus] BitIn2 input;
        [OutputBus] BitOut2 output;

        protected override void OnTick()
        {
            output.flg = input.flg;
        }
    }

    public class Forw3 : SimpleProcess
    {
        [InputBus] BitIn3 input;
        [OutputBus] BitOut3 output;

        protected override void OnTick()
        {
            output.flg = input.flg;
        }
    }

    public class Forw4 : SimpleProcess
    {
        [InputBus] BitIn4 input;
        [OutputBus] BitOut4 output;

        protected override void OnTick()
        {
            output.flg = input.flg;
        }
    }

    public class Tester : SimulationProcess
    {
        [InputBus] BitOut1 output1;
        [InputBus] BitOut2 output2;
        [InputBus] BitOut3 output3;
        [InputBus] BitOut4 output4;

        [OutputBus] BitIn1 input1;
        [OutputBus] BitIn2 input2;
        [OutputBus] BitIn3 input3;
        [OutputBus] BitIn4 input4;

        public async override Task Run()
        {
            await ClockAsync();

            input1.flg = true;
            input2.flg = true;
            input3.flg = true;
            input4.flg = true;

            await ClockAsync();

            System.Diagnostics.Debug.Assert(output1.flg == true);
            System.Diagnostics.Debug.Assert(output2.flg == true);
            System.Diagnostics.Debug.Assert(output3.flg == true);
            System.Diagnostics.Debug.Assert(output4.flg == true);
            input1.flg = false;
            input2.flg = false;
            input3.flg = false;
            input4.flg = false;

            await ClockAsync();

            System.Diagnostics.Debug.Assert(output1.flg == false);
            System.Diagnostics.Debug.Assert(output2.flg == false);
            System.Diagnostics.Debug.Assert(output3.flg == false);
            System.Diagnostics.Debug.Assert(output4.flg == false);
        }
    }
}
