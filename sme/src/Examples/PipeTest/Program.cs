using SME;
using System;

namespace PipeTest
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            new Simulation()
                .Run(typeof(MainClass).Assembly);
        }
    }
}
