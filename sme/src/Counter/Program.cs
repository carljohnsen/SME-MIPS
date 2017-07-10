using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SME;

namespace Counter
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
}
