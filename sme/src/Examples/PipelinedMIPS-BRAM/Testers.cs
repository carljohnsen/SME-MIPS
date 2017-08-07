using System;
using SME;

namespace PipelinedMIPS
{
    [ClockedProcess]
    public class Tester : Process
    {
        [InputBus]
        DEBUG_SHUTDOWN cpu;

        public async override System.Threading.Tasks.Task Run()
        {
            int clocks = 0;
            var begin = DateTime.Now;
            while (cpu.running)
            {
                await ClockAsync();
                clocks++;
            }
            var end = DateTime.Now;
            var ms = Math.Floor((end - begin).TotalMilliseconds);
            Console.WriteLine(clocks + " clock ticks took " + ms + " ms (~" +
                              Math.Floor(1000/(ms/clocks)) + " hz)");
        }
    }
}
