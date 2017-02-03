using System;
using SME;

namespace SimpleTest
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");
			new Simulation()
				.BuildCSVFile()
				.BuildGraph()
				.BuildVHDL()
				.Run(typeof(MainClass).Assembly);
		}
	}
}
