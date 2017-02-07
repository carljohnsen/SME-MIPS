using System;
using System.Linq;
using SME;

namespace SingleCycleMIPS
{
	[InitializedBus]
	public interface RegDst : IBus
	{
		bool flg { get; set; }
	}

	[InitializedBus]
	public interface RegWrite : IBus
	{
		bool flg { get; set; }
	}

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
		public interface WriteAddr : IBus
		{
			short val { get; set; }
		}

		[InitializedBus]
		public interface WriteData : IBus
		{
			int data { get; set; }
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
			SignExtIn signExt;
			[OutputBus]
			ControlIn control;
			[OutputBus]
			MuxInput mux;
			[OutputBus]
			ALUFunct aluFunct;

			protected override void OnTick()
			{
				int tmp = instr.instruction;
				short opcode = (short) (tmp >> 26);
				short rs = (short) ((tmp >> 21) & 0x1F);
				short rt = (short) ((tmp >> 16) & 0x1F);
				short rd = (short) ((tmp >> 11) & 0x1F);
				short funct = (short) (tmp & 0x3F);

				Console.WriteLine("Splitter : Opcode " + opcode);
				Console.WriteLine("Splitter : rs " + rs);
				Console.WriteLine("Splitter : rt " + rt);
				Console.WriteLine("Splitter : rd " + rd);
				Console.WriteLine("Splitter : funct " + funct);

				readA.addr = rs;
				readB.addr = rt;
				mux.rd = rd;
				mux.rt = rt;
				control.opcode = opcode;
				signExt.data = (short) (tmp & 0xFFFF); // Last 16 bit
				aluFunct.val = funct;
			}
		}

		public class Mux : SimpleProcess
		{
			[InputBus]
			RegDst regdst;
			[InputBus]
			MuxInput input;

			[OutputBus]
			WriteAddr write;

			protected override void OnTick()
			{
				if (regdst.flg)
					write.val = input.rd;
				else
					write.val = input.rt;
			}
		}

		// TODO register + control + sign extend
		public class SignExtend : SimpleProcess
		{
			[InputBus]
			SignExtIn input;

			[OutputBus]
			SignExtOut output;

			protected override void OnTick()
			{
				output.data = input.data;
			}
		}

		public class Control : SimpleProcess
		{
			[InputBus]
			ControlIn input;

			[OutputBus]
			RegDst regdst;
			[OutputBus]
			Branch branch;
			[OutputBus]
			MemRead memread;
			[OutputBus]
			MemToReg memtoreg;
			[OutputBus]
			ALUOp aluop;
			[OutputBus]
			MemWrite memwrite;
			[OutputBus]
			ALUSrc alusrc;
			[OutputBus]
			RegWrite regwrite;

			protected override void OnTick()
			{
				short tmp = input.opcode;
				bool op0 = (tmp & 1) == 1;
				bool op1 = ((tmp >> 1) & 1) == 1;
				bool op2 = ((tmp >> 2) & 1) == 1;
				bool op3 = ((tmp >> 3) & 1) == 1;
				bool op4 = ((tmp >> 4) & 1) == 1;
				bool op5 = ((tmp >> 5) & 1) == 1;

				bool rFormat = !op0 && !op1 && !op2 && !op3 && !op4 && !op5;
				bool lw = op0 && op1 && !op2 && !op3 && !op4 && op5;
				bool sw = op0 && op1 && !op2 && op3 && !op4 && op5;
				bool beq = !op0 && !op1 && op2 && !op3 && !op4 && !op5;

				regdst.flg = rFormat;
				alusrc.flg = lw || sw;
				memtoreg.flg = lw;
				regwrite.flg = rFormat || lw;
				memread.flg = lw;
				memwrite.flg = sw;
				branch.flg = beq;
				aluop.op0 = beq;
				aluop.op1 = rFormat;
			}
		}

		public class Register : SimpleProcess
		{
			[InputBus]
			ReadA readA;
			[InputBus]
			ReadB readB;
			[InputBus]
			RegWrite regWrite;
			[InputBus]
			WriteAddr writeAddr;
			[InputBus]
			WriteData writeData;

			[OutputBus]
			OutputA outputA;
			[OutputBus]
			OutputB outputB;

			//int[] data = new int[32];
			int[] data = Enumerable.Repeat(0, 32).ToArray();

			protected override void OnTick()
			{
				if (regWrite.flg && writeAddr.val > 0)
				{
					Console.WriteLine("Writing " + writeData.data + " to " + writeAddr.val);
					data[writeAddr.val] = writeData.data;
				}
				Console.WriteLine("Reading from " + readA.addr + " " + readB.addr);
				outputA.data = data[readA.addr];
				outputB.data = data[readB.addr];

				/* Print the register file
				Console.Write("[");
				for (int i = 0; i < 4; i++)
				{
					Console.Write("\t");
					for (int j = 0; j < 7; j++)
					{
						Console.Write(data[i * 8 + j] + ",\t");
					}
					Console.WriteLine(data[i * 8 + 7] + (i == 3 ? "\t]" : ","));
				}*/
			}
		}
	}
}
