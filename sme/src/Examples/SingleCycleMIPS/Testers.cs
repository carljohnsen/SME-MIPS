using System;
using SME;

namespace SingleCycleMIPS
{
	// http://www.kurtm.net/mipsasm/
	// https://www.eg.bucknell.edu/~csci320/mips_web/
	public class Instructions
	{
		public static int add_r1_r2_r3 = 0x00221820;
		public static int add_r0_r3_r1 = 0x00030820;
		public static int add_r0_r3_r2 = 0x00031020;
		public static int sub_r3_r1_r4 = 0x00612022;
		public static int sub_r2_r2_r7 = 0x00423822;
		public static int sub_r1_r3_r7 = 0x00233822;
		public static int and_r2_r2_r5 = 0x00422824;
		public static int and_r1_r1_r5 = 0x00212824;
		public static int or_r1_r2_r6  = 0x00223025;
		public static int nor_r7_r7_r8 = 0x00E74027;
		public static int slt_r1_r3_r7 = 0x0023382A;
		public static int slt_r3_r1_r7 = 0x0061382A;
		public static uint sw_r1_08_r2 = 0xAC410008;
		public static uint lw_r1_08_r1 = 0x8C210008;
		public static int beq_r1_r2_10 = 0x10220010;
	}

	/*[ClockedProcess]
	public class IDTester : Process
	{
		[InputBus]
		ID.OutputA outA;
		[InputBus]
		ID.OutputB outB;
		[InputBus]
		RegDst regdst;
		[InputBus]
		Branch branch;
		[InputBus]
		MemRead memread;
		[InputBus]
		MemToReg memtoreg;
		[InputBus]
		ALUOp aluop;
		[InputBus]
		MemWrite memwrite;
		[InputBus]
		ALUSrc alusrc;
		[InputBus]
		RegWrite regwrite;


		[OutputBus]
		IF.Instruction inst;
		[OutputBus]
		ID.WriteData write;



		public void printAll()
		{
			Console.WriteLine("OutputA " + outA.data);
			Console.WriteLine("OutputB " + outB.data);
			Console.WriteLine("RegDst " + regdst.flg);
			Console.WriteLine("Branch " + branch.flg);
			Console.WriteLine("MemRead " + memread.flg);
			Console.WriteLine("MemToReg " + memtoreg.flg);
			Console.WriteLine("ALUOp0 " + aluop.op0);
			Console.WriteLine("ALUOp1 " + aluop.op1);
			Console.WriteLine("MemWrite " + memwrite.flg);
			Console.WriteLine("ALUSrc " + alusrc.flg);
			Console.WriteLine("RegWrite " + regwrite.flg);
		}

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();

			write.data = 5;
			inst.instruction = Instructions.add_r0_r3_r1;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			write.data = 22;
			inst.instruction = Instructions.add_r0_r3_r2;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			inst.instruction = Instructions.add_r1_r2_r3;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			printAll();
		}
	}*/

	/*[ClockedProcess]
	public class ALUTester : Process
	{
		[InputBus]
		EX.ALUResult result;
		[InputBus]
		EX.Zero zero;

		[OutputBus]
		ID.BufIn write;
		[OutputBus]
		IF.Instruction input;

		// 1010 1100 0100 0001 0000 0000 0000 1000
		// AC410008

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			int[] program = {
				Instructions.add_r1_r2_r3,
				Instructions.sub_r3_r1_r4,
				Instructions.and_r1_r1_r5,
				Instructions.or_r1_r2_r6,
				Instructions.slt_r1_r3_r7,
				Instructions.slt_r3_r1_r7,
				(int) Instructions.sw_r1_08_r2,
				(int) Instructions.lw_r1_08_r1,
				Instructions.beq_r1_r2_10,
			};

			//foreach (int instruction in program)
			{
				//input.instruction = instruction;
				await ClockAsync();
				Console.WriteLine("\nClock!\n" + result.data + " " + zero.flg);
				await ClockAsync();
			}
		}
	}*/

	[ClockedProcess]
	public class Tester : Process
	{
		[InputBus]
		IF.DEBUG_SHUTDOWN cpu;

		public async override System.Threading.Tasks.Task Run()
		{
			while (cpu.running)
			{
				await ClockAsync();
			}
		}
	}
}
