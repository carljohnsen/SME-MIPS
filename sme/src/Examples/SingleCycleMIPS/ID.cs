using System;
using SME;

namespace SingleCycleMIPS
{
	public class ID
	{
		// TODO get data from IF

		[InitializedBus]
		public interface ReadA : IBus
		{
			short addr { get; set; }
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
		public interface SignExtIn : IBus
		{
			short data { get; set; }
		}

		[InitializedBus]
		public interface SignExtOut : IBus
		{
			int data { get; set; }
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

		[InitializedBus]
		public interface ControlIn : IBus
		{
			short opcode { get; set; }
		}

		[InitializedBus]
		public interface MuxControl : IBus
		{
			bool control { get; set; }
		}

		[InitializedBus]
		public interface MuxInput : IBus
		{
			short rt { get; set; }
			short rd { get; set; }
		}

		public class Splitter : SimpleProcess
		{
			[InputBus]
			IF.Instruction instr;

			[OutputBus]
			ReadA readA;
			[OutputBus]
			ReadB readB;
			[OutputBus]
			Write write;
			[OutputBus]
			SignExtIn signExt;
			[OutputBus]
			ControlIn control;
			[OutputBus]
			MuxInput mux;

			protected override void OnTick()
			{
				int tmp = instr.instruction;
				short opcode = (short) (tmp >> 25);
				short rs = (short) ((tmp >> 20) & 0x1F);
				short rt = (short) ((tmp >> 15) & 0x1F);
				short rd = (short) ((tmp >> 10) & 0x1F);
				short funct = (short) (tmp & 0x3F);

				readA.addr = rs;
				readB.addr = rt;
				mux.rd = rd;
				mux.rt = rt;
				control.opcode = opcode;
				signExt.data = (short) ((tmp >> 16) & 0xFFFF);
			}
		}

		public class Mux : SimpleProcess
		{
			[InputBus]
			MuxControl control;
			[InputBus]
			MuxInput input;

			[OutputBus]
			Write write;

			protected override void OnTick()
			{
				if (control.control)
					write.addr = input.rt;
				else
					write.addr = input.rd;
			}
		}

		// TODO register + control + sign extend
	}
}
