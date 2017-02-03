﻿using System;
using SME;

namespace Adder32 {
	public class HalfAdder0
	{
		public class XOR : SimpleProcess
		{
			[InputBus] InputA0 input0;
			[InputBus] InputB0 input1;
			[OutputBus] Output0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND : SimpleProcess
		{
			[InputBus] InputA0 input0;
			[InputBus] InputB0 input1;
			[OutputBus] Carry0 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}
	}

	public class FullAdder1
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA1 input0;
			[InputBus] InputB1 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry0 input1;
			[OutputBus] Output1 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA1 input0;
			[InputBus] InputB1 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry0 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry1 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder2
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA2 input0;
			[InputBus] InputB2 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry1 input1;
			[OutputBus] Output2 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA2 input0;
			[InputBus] InputB2 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry1 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry2 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder3
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA3 input0;
			[InputBus] InputB3 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry2 input1;
			[OutputBus] Output3 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA3 input0;
			[InputBus] InputB3 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry2 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry3 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder4
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA4 input0;
			[InputBus] InputB4 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry3 input1;
			[OutputBus] Output4 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA4 input0;
			[InputBus] InputB4 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry3 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry4 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder5
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA5 input0;
			[InputBus] InputB5 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry4 input1;
			[OutputBus] Output5 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA5 input0;
			[InputBus] InputB5 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry4 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry5 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder6
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA6 input0;
			[InputBus] InputB6 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry5 input1;
			[OutputBus] Output6 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA6 input0;
			[InputBus] InputB6 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry5 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry6 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder7
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA7 input0;
			[InputBus] InputB7 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry6 input1;
			[OutputBus] Output7 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA7 input0;
			[InputBus] InputB7 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry6 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry7 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder8
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA8 input0;
			[InputBus] InputB8 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry7 input1;
			[OutputBus] Output8 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA8 input0;
			[InputBus] InputB8 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry7 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry8 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder9
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA9 input0;
			[InputBus] InputB9 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry8 input1;
			[OutputBus] Output9 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA9 input0;
			[InputBus] InputB9 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry8 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry9 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder10
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA10 input0;
			[InputBus] InputB10 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry9 input1;
			[OutputBus] Output10 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA10 input0;
			[InputBus] InputB10 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry9 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry10 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder11
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA11 input0;
			[InputBus] InputB11 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry10 input1;
			[OutputBus] Output11 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA11 input0;
			[InputBus] InputB11 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry10 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry11 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder12
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA12 input0;
			[InputBus] InputB12 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry11 input1;
			[OutputBus] Output12 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA12 input0;
			[InputBus] InputB12 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry11 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry12 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder13
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA13 input0;
			[InputBus] InputB13 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry12 input1;
			[OutputBus] Output13 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA13 input0;
			[InputBus] InputB13 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry12 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry13 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder14
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA14 input0;
			[InputBus] InputB14 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry13 input1;
			[OutputBus] Output14 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA14 input0;
			[InputBus] InputB14 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry13 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry14 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder15
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA15 input0;
			[InputBus] InputB15 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry14 input1;
			[OutputBus] Output15 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA15 input0;
			[InputBus] InputB15 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry14 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry15 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder16
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA16 input0;
			[InputBus] InputB16 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry15 input1;
			[OutputBus] Output16 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA16 input0;
			[InputBus] InputB16 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry15 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry16 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder17
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA17 input0;
			[InputBus] InputB17 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry16 input1;
			[OutputBus] Output17 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA17 input0;
			[InputBus] InputB17 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry16 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry17 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder18
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA18 input0;
			[InputBus] InputB18 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry17 input1;
			[OutputBus] Output18 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA18 input0;
			[InputBus] InputB18 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry17 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry18 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder19
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA19 input0;
			[InputBus] InputB19 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry18 input1;
			[OutputBus] Output19 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA19 input0;
			[InputBus] InputB19 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry18 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry19 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder20
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA20 input0;
			[InputBus] InputB20 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry19 input1;
			[OutputBus] Output20 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA20 input0;
			[InputBus] InputB20 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry19 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry20 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder21
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA21 input0;
			[InputBus] InputB21 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry20 input1;
			[OutputBus] Output21 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA21 input0;
			[InputBus] InputB21 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry20 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry21 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder22
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA22 input0;
			[InputBus] InputB22 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry21 input1;
			[OutputBus] Output22 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA22 input0;
			[InputBus] InputB22 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry21 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry22 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder23
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA23 input0;
			[InputBus] InputB23 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry22 input1;
			[OutputBus] Output23 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA23 input0;
			[InputBus] InputB23 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry22 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry23 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder24
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA24 input0;
			[InputBus] InputB24 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry23 input1;
			[OutputBus] Output24 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA24 input0;
			[InputBus] InputB24 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry23 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry24 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder25
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA25 input0;
			[InputBus] InputB25 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry24 input1;
			[OutputBus] Output25 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA25 input0;
			[InputBus] InputB25 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry24 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry25 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder26
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA26 input0;
			[InputBus] InputB26 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry25 input1;
			[OutputBus] Output26 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA26 input0;
			[InputBus] InputB26 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry25 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry26 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder27
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA27 input0;
			[InputBus] InputB27 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry26 input1;
			[OutputBus] Output27 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA27 input0;
			[InputBus] InputB27 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry26 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry27 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder28
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA28 input0;
			[InputBus] InputB28 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry27 input1;
			[OutputBus] Output28 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA28 input0;
			[InputBus] InputB28 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry27 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry28 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder29
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA29 input0;
			[InputBus] InputB29 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry28 input1;
			[OutputBus] Output29 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA29 input0;
			[InputBus] InputB29 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry28 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry29 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder30
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA30 input0;
			[InputBus] InputB30 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry29 input1;
			[OutputBus] Output30 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA30 input0;
			[InputBus] InputB30 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry29 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry30 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

	public class FullAdder31
	{
		[InitializedBus] public interface Internal0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface Internal2 : IBus { int Bit { get; set; } }

		public class XOR0 : SimpleProcess
		{
			[InputBus] InputA31 input0;
			[InputBus] InputB31 input1;
			[OutputBus] Internal0 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class XOR1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry30 input1;
			[OutputBus] Output31 output;

			protected override void OnTick() { output.Bit = input0.Bit ^ input1.Bit; }
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputA31 input0;
			[InputBus] InputB31 input1;
			[OutputBus] Internal2 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class AND1 : SimpleProcess
		{
			[InputBus] Internal0 input0;
			[InputBus] Carry30 input1;
			[OutputBus] Internal1 output;

			protected override void OnTick() { output.Bit = input0.Bit & input1.Bit; }
		}

		public class OR : SimpleProcess
		{
			[InputBus] Internal1 input0;
			[InputBus] Internal2 input1;
			[OutputBus] Carry31 output;

			protected override void OnTick() { output.Bit = input0.Bit | input1.Bit; }
		}
	}

}