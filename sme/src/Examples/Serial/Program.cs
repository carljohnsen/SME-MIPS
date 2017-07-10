using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace Serial
{
    class MainClass
    {
        static void Main(string[] args)
        {
            new Simulation()
                .BuildCSVFile()
                .BuildGraph()
                .BuildVHDL()
                .Run(typeof(MainClass).Assembly);
        }
    }

    [TopLevelOutputBus]
    public interface Data : IBus
    {
        bool active { get; set; }
        [InitialValue(true)] // Hold nu kæft ghdl
        bool serial { get; set; }
        bool done { get; set; }
    }

    [TopLevelInputBus, InitializedBus]
    public interface Start : IBus
    {
        [InitialValue(false)]
        bool flg { get; set; }
    }

    public enum state
    {
        idle,
        start_bit,
        data_bits,
        stop,
        cleanup
    };

    [ClockedProcess]
    public class Transmitter : SimpleProcess
    {
        [InputBus]
        Start start;

        [OutputBus]
        Data output;

        // hz / serial rate (ie 1000000/9600 = 104,1667)
        const int clocks_per_bit = 105;
        int clock_count = 0;
        int bit_index = 0;
        byte data = (byte) 'A';
        bool done = false;

        state current_state = state.idle;

        protected override void OnTick()
        {
            switch (current_state)
            {
                case state.idle:
                    output.active = false;
                    output.serial = true;
                    clock_count = 0;
                    bit_index = 0;

                    if (start.flg)
                        current_state = state.start_bit;
                    else
                        current_state = state.idle;
                    break;

                case state.start_bit:
                    output.active = true;
                    output.serial = false;

                    if (clock_count < clocks_per_bit - 1)
                    {
                        clock_count += 1;
                        current_state = state.start_bit;
                    }
                    else
                    {
                        clock_count = 0;
                        current_state = state.data_bits;
                    }
                    break;

                case state.data_bits:
                    output.active = true;
                    output.serial = ((data >> bit_index) & 0x1) == 1;
                    if (clock_count < clocks_per_bit - 1)
                    {
                        clock_count += 1;
                        current_state = state.data_bits;
                    }
                    else
                    {
                        clock_count = 0;
                        if (bit_index < 7)
                        {
                            bit_index += 1;
                            current_state = state.data_bits;
                        }
                        else
                        {
                            bit_index = 0;
                            current_state = state.stop;
                        }
                    }
                    break;

                case state.stop:
                    output.active = true;
                    output.serial = true;

                    if (clock_count < clocks_per_bit - 1)
                    {
                        clock_count += 1;
                        current_state = state.stop;
                    }
                    else
                    {
                        clock_count = 0;
                        current_state = state.cleanup;
                    }
                    break;

                case state.cleanup:
                    output.active = false;
                    output.serial = false;
                    done = true;
                    current_state = state.idle;
                    break;

                default:
                    output.active = false;
                    output.serial = false;
                    current_state = state.idle;
                    break;
            }
            output.done = done;
        }
    }

    [Ignore]
    public class Tester : Process
    {
        [InputBus]
        Data data;

        [OutputBus]
        Start start;

        const int clocks_per_bit = 105;

        public async override Task Run()
        {
            start.flg = false;
            await ClockAsync();
            start.flg = true;
            await ClockAsync();
            System.Diagnostics.Debug.Assert(!data.active);
            System.Diagnostics.Debug.Assert(data.serial);
            start.flg = false;

            for (int i = 0; i < clocks_per_bit; i++)
            {
                await ClockAsync();
                start.flg = false;
                System.Diagnostics.Debug.Assert(data.active);
                System.Diagnostics.Debug.Assert(!data.serial);
                System.Diagnostics.Debug.Assert(!data.done);
            }

            bool[] tmp = new bool[8];
            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < clocks_per_bit; j++)
                {
                    await ClockAsync();
                    start.flg = false;
                    System.Diagnostics.Debug.Assert(data.active);
                    tmp[i] = data.serial;
                    System.Diagnostics.Debug.Assert(!data.done);
                }
            }

            byte tmp2 = 0;
            for (int i = 0; i < 8; i++)
            {
                byte tmp3 = (byte) (tmp[i] ? 1 : 0);
                tmp2 |= (byte) (tmp3 << i);
            }
            Console.WriteLine("Received: " + ((char)tmp2));

            int x = 0;
            for (int i = 0; i < clocks_per_bit; i++)
            {
                await ClockAsync();
                start.flg = false;
                System.Diagnostics.Debug.Assert(data.active, i + "");
                System.Diagnostics.Debug.Assert(data.serial, i + "");
                System.Diagnostics.Debug.Assert(!data.done);
                x = i;
            }

            await ClockAsync();
            start.flg = false;
            System.Diagnostics.Debug.Assert(data.done);
            await ClockAsync();
            start.flg = false;
        }
    }
}
