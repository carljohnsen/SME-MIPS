using SME;
using System;

namespace PipeTest
{
    [ClockedProcess]
    public class Tester : Process
    {
        [InputBus]
        Bus100 output;

        [OutputBus]
        Bus0 input;

        int clocks = 0;

        public async override System.Threading.Tasks.Task Run()
        {
            var begin = DateTime.Now;
            await ClockAsync();
            clocks++;

            for (int i = 1; i < 10; i++)
            {
                input.value = i;

                while (output.value != i)
                {
                    await ClockAsync();
                    clocks++;
                }
            }
            var end = DateTime.Now;
            var ms = Math.Floor((end - begin).TotalMilliseconds);
            Console.WriteLine(clocks + " clock ticks took " + ms + " ms (~" +
                              Math.Floor(1000 / (ms / clocks)) + " hz)");
        }
    }
}
