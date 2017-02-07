using System;
using SME;

namespace SingleCycleMIPS
{
	[ClockedProcess]
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

		// 000000 00001 00010 00011 00000 100000
		// 0000 0000 0010 0010 0001 1000 0010 0000 
		int add_r1_r2_r3 = 0x00221820;
		// 000000 00000 00011 00001 00000 100000
		// 0000 0000 0000 0011 0000 1000 0010 0000
		int add_r0_r3_r1 = 0x00030820;
		// 000000 00000 00011 00010 00000 100000
		// 0000 0000 0000 0011 0001 0000 0010 0000
		int add_r0_r3_r2 = 0x00031020;

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
			inst.instruction = add_r0_r3_r1;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			write.data = 22;
			inst.instruction = add_r0_r3_r2;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			inst.instruction = add_r1_r2_r3;
			await ClockAsync();
			Console.WriteLine("\nClock!\n");

			printAll();
		}
	}
}
