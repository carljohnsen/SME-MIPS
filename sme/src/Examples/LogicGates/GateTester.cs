using System;
using SME;

namespace LogicGates
{
    // Tests the logic circuits
    [ClockedProcess]
    public class GateTester : Process
    {
        // Names are kind of reversed, as it is input for the gate, and not the producer
        [OutputBus]
        Input input;

        [InputBus]
        Output output;

        public async override System.Threading.Tasks.Task Run()
        {
            Console.WriteLine("Starting test!");
            await ClockAsync();

            input.bit1 = false;
            input.bit2 = false;
            await ClockAsync();

            System.Diagnostics.Debug.Assert(!output.And);
            System.Diagnostics.Debug.Assert(!output.Or);
            System.Diagnostics.Debug.Assert(output.Not);
            System.Diagnostics.Debug.Assert(!output.Xor);

            input.bit1 = false;
            input.bit2 = true;
            await ClockAsync();

            System.Diagnostics.Debug.Assert(!output.And);
            System.Diagnostics.Debug.Assert(output.Or);
            System.Diagnostics.Debug.Assert(output.Not);
            System.Diagnostics.Debug.Assert(output.Xor);

            input.bit1 = true;
            input.bit2 = false;
            await ClockAsync();

            System.Diagnostics.Debug.Assert(!output.And);
            System.Diagnostics.Debug.Assert(output.Or);
            System.Diagnostics.Debug.Assert(!output.Not);
            System.Diagnostics.Debug.Assert(output.Xor);

            input.bit1 = true;
            input.bit2 = true;
            await ClockAsync();

            System.Diagnostics.Debug.Assert(output.And);
            System.Diagnostics.Debug.Assert(output.Or);
            System.Diagnostics.Debug.Assert(!output.Not);
            System.Diagnostics.Debug.Assert(!output.Xor);

            await ClockAsync();
            Console.WriteLine("Done testing!");
        }
    }
}
