using System;
using SME;

namespace Register
{
	[InitializedBus]
	public interface ReadA : IBus
	{
		short addr { get; set;}
	}

	[InitializedBus]
	public interface ReadB : IBus
	{
		short addr { get; set; }
	}

	[InitializedBus]
	public interface Write : IBus
	{
		short addr { get; set; }
		int data { get; set; }
		bool enabled { get; set; }
	}

	[InitializedBus]
	public interface OutputA : IBus
	{
		int data { get; set; }
	}

	[InitializedBus]
	public interface OutputB : IBus
	{
		int data { get; set; }
	}
}
