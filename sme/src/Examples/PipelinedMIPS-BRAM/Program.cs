using System;
using SME;

namespace PipelinedMIPS
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            new Simulation()
                .BuildCSVFile()
                .BuildVHDL()
                .Run(typeof(MainClass).Assembly);
        }
    }
}
