using System;
using SME;

namespace SingleCycleMIPS
{
	public class IF
	{
		// Assumes all are > 0
		public int makeRFormatInstruction(int rs, int rt, int rd, int shamt, int funct)
		{
			int result = 0;
			result |= rs << 21;
			result |= rt << 16;
			result |= rd << 11;
			result |= shamt << 6;
			result |= funct;
			return result;
		}

		public int makeIFormatInstruction(int opcode, int rs, int rt, int immediate)
		{
			int result = 0;
			result |= opcode << 26;
			result |= rs << 21;
			result |= rt << 16;
			result |= immediate;
			return result;
		}

		public int makeJFormatInstruction(int opcode, int address)
		{
			int result = 0;
			result |= opcode << 26;
			result |= address;
			return result;
		}

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
				output.newAddress = input.address + 1;// + 4; traditionally, however, we are working in C#
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

			int[] program = { // TODO spørg kenneth (eller læs din dovne skid) hvordan man lavede filer med memory
				0x00221820, // add r3 r1 r2
				0x00232020, // add r4 r1 r3
				0x00842820, // add r5 r4 r4
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
