using System;
using SME;

namespace Register
{
	[TopLevelInputBus]
	public interface ReadA : IBus
	{
		short addr { get; set;}
	}

	[TopLevelInputBus]
	public interface ReadB : IBus
	{
		short addr { get; set; }
	}

	[TopLevelInputBus]
	public interface Write : IBus
	{
		short addr { get; set; }
		int data { get; set; }
		bool enabled { get; set; }
	}

	[TopLevelOutputBus]
	public interface OutputA : IBus
	{
		int data { get; set; }
	}

	[TopLevelOutputBus]
	public interface OutputB : IBus
	{
		int data { get; set; }
	}
}
