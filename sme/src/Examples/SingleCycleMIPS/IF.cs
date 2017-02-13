using System;
using SME;

namespace SingleCycleMIPS
{
	public class IF
	{
		[InitializedBus]
		public interface Instruction : IBus
		{
			int instruction { get; set; }
		}

		[InitializedBus]
		public interface Address : IBus
		{
			int address { get; set; }
		}

		[InitializedBus]
		public interface PCIn : IBus
		{
			int newAddress { get; set; }
		}

		[ClockedProcess]
		public class PC : SimpleProcess
		{
			[InputBus]
			PCIn input;

			[OutputBus]
			Address output;

			protected override void OnTick()
			{
				output.address = input.newAddress;
			}
		}

		public class Incrementer : SimpleProcess
		{
			[InputBus]
			Address input;

			[OutputBus] // TODO should feed into jump unit, not PC
			PCIn output;

			protected override void OnTick()
			{
				output.newAddress = input.address + 1;// + 4; traditionally, however, we are working with an int array
			}
		}

		public interface DEBUG_SHUTDOWN : IBus
		{
			[InitialValue(true)]
			bool running { get; set; }
		}

		public class InstructionMemory : SimpleProcess
		{
			[InputBus]
			Address addr;

			[OutputBus]
			Instruction instr;
			[OutputBus]
			DEBUG_SHUTDOWN shut;

			// https://www.eg.bucknell.edu/~csci320/mips_web/
			int[] program = { 
				0x20010005, // addi r1 r0 0x5 - 5
				0x20020002, // addi r2 r0 0x2 - 2
				0x00221820, // add r3 r1 r2 - 7
				0x00232020, // add r4 r1 r3 - 12
				0x00842820, // add r5 r4 r4 - 24
				0x00A13022, // sub r6 r5 r1 - 19
				0x00233824, // and r7 r1 r3 - 5
				0x00234025, // or  r8 r1 r3 - 7
				0x0023482A, // slt r9 r1 r3 - 1
				0x0061502A, // slt r10 r3 r1 - 0
				unchecked((int)0xAD2B0008), // sw r11 0x8 r9 - 9 -- should not write to register
				unchecked((int)0x8D2B0008), // lw r11 0x8 r9 - 9
				0x10270010, // beq r1 r7 0x10 - 0 -- should not write to register
				0x200C0003, // addi r12 r0 0x3 - 3
			};

			protected override void OnTick()
			{
				int i = addr.address;
				if (i >= 0 && i < program.Length)
				{
					instr.instruction = program[i];
					shut.running = true;
				}
				else
				{
					instr.instruction = 0x0; // nop
					shut.running = false;
				}
			}
		}
	}
}
