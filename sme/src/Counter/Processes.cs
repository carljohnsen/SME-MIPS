using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace Counter
{
    public class Incrementer : SimpleProcess
    {
        [InputBus]
        Inc inc;

        [OutputBus]
        LEDs led;

        byte current = 0;

        protected override void OnTick()
        {
            if (inc.flg)
                current += 1;
            led.val = current;
        }
    }

    public class Tester : SimulationProcess
    {
        [InputBus]
        LEDs led;

        [OutputBus]
        Inc inc;

        public async override Task Run()
        {
            Console.WriteLine("Started testing");
            inc.flg = false;
            await ClockAsync();

            for (int i = 0; i < 10; i++)
            {
                inc.flg = true;
                await ClockAsync();
                System.Diagnostics.Debug.Assert(led.val == (i + 1) % 256);
                Console.WriteLine("{0} {1}", i, led.val);
                inc.flg = false;
                await ClockAsync();
                System.Diagnostics.Debug.Assert(led.val == (i + 1) % 256);
            }

            Console.WriteLine("Testing done!");
        }
    }
}
