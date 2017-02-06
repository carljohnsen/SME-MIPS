using System;
using SME;

namespace Register
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			new Simulation()
				.BuildCSVFile()
				.BuildGraph()
				//.BuildVHDL()
				.Run(typeof(MainClass).Assembly);
		}
	}
}
