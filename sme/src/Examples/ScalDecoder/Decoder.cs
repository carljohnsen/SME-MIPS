﻿using System;
using SME;

namespace ScalDecoder 
{
	public class Decoder 
	{
		[InitializedBus] public interface InputN0 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface InputN1 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface InputN2 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface InputN3 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface InputN4 : IBus { int Bit { get; set; } }
		[InitializedBus] public interface InputN5 : IBus { int Bit { get; set; } }

		public class NOT0 : SimpleProcess
		{
			[InputBus] Input0 input;
			[OutputBus] InputN0 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}
		public class NOT1 : SimpleProcess
		{
			[InputBus] Input1 input;
			[OutputBus] InputN1 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}
		public class NOT2 : SimpleProcess
		{
			[InputBus] Input2 input;
			[OutputBus] InputN2 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}
		public class NOT3 : SimpleProcess
		{
			[InputBus] Input3 input;
			[OutputBus] InputN3 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}
		public class NOT4 : SimpleProcess
		{
			[InputBus] Input4 input;
			[OutputBus] InputN4 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}
		public class NOT5 : SimpleProcess
		{
			[InputBus] Input5 input;
			[OutputBus] InputN5 output;

			protected override void OnTick()
			{
				output.Bit = ~input.Bit & 1;
			}
		}

		public class AND0 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output0 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND1 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output1 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND2 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output2 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND3 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output3 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND4 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output4 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND5 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output5 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND6 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output6 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND7 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output7 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND8 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output8 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND9 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output9 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND10 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output10 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND11 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output11 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND12 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output12 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND13 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output13 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND14 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output14 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND15 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output15 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND16 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output16 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND17 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output17 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND18 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output18 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND19 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output19 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND20 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output20 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND21 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output21 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND22 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output22 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND23 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output23 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND24 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output24 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND25 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output25 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND26 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output26 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND27 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output27 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND28 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output28 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND29 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output29 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND30 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output30 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND31 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] InputN5 input5;
			[OutputBus] Output31 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND32 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output32 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND33 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output33 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND34 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output34 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND35 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output35 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND36 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output36 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND37 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output37 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND38 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output38 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND39 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output39 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND40 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output40 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND41 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output41 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND42 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output42 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND43 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output43 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND44 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output44 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND45 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output45 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND46 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output46 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND47 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] InputN4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output47 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND48 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output48 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND49 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output49 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND50 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output50 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND51 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output51 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND52 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output52 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND53 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output53 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND54 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output54 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND55 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] InputN3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output55 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND56 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output56 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND57 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output57 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND58 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output58 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND59 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] InputN2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output59 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND60 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output60 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND61 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] InputN1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output61 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND62 : SimpleProcess
		{
			[InputBus] InputN0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output62 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}
		public class AND63 : SimpleProcess
		{
			[InputBus] Input0 input0;
			[InputBus] Input1 input1;
			[InputBus] Input2 input2;
			[InputBus] Input3 input3;
			[InputBus] Input4 input4;
			[InputBus] Input5 input5;
			[OutputBus] Output63 output;

			protected override void OnTick()
			{
				output.Bit = input0.Bit
						   & input1.Bit
						   & input2.Bit
						   & input3.Bit
						   & input4.Bit
						   & input5.Bit
;
			}
		}

	}

}
