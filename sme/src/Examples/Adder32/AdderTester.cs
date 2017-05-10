﻿using System;
using SME;

namespace Adder32 {

	public class AdderTester : SimulationProcess
	{
		public void InputNumbers(int num1, int num2)
		{
			inputa0.Bit = ((num1 >> 0) & 1) == 1;
			inputb0.Bit = ((num2 >> 0) & 1) == 1;
			inputa1.Bit = ((num1 >> 1) & 1) == 1;
			inputb1.Bit = ((num2 >> 1) & 1) == 1;
			inputa2.Bit = ((num1 >> 2) & 1) == 1;
			inputb2.Bit = ((num2 >> 2) & 1) == 1;
			inputa3.Bit = ((num1 >> 3) & 1) == 1;
			inputb3.Bit = ((num2 >> 3) & 1) == 1;
			inputa4.Bit = ((num1 >> 4) & 1) == 1;
			inputb4.Bit = ((num2 >> 4) & 1) == 1;
			inputa5.Bit = ((num1 >> 5) & 1) == 1;
			inputb5.Bit = ((num2 >> 5) & 1) == 1;
			inputa6.Bit = ((num1 >> 6) & 1) == 1;
			inputb6.Bit = ((num2 >> 6) & 1) == 1;
			inputa7.Bit = ((num1 >> 7) & 1) == 1;
			inputb7.Bit = ((num2 >> 7) & 1) == 1;
			inputa8.Bit = ((num1 >> 8) & 1) == 1;
			inputb8.Bit = ((num2 >> 8) & 1) == 1;
			inputa9.Bit = ((num1 >> 9) & 1) == 1;
			inputb9.Bit = ((num2 >> 9) & 1) == 1;
			inputa10.Bit = ((num1 >> 10) & 1) == 1;
			inputb10.Bit = ((num2 >> 10) & 1) == 1;
			inputa11.Bit = ((num1 >> 11) & 1) == 1;
			inputb11.Bit = ((num2 >> 11) & 1) == 1;
			inputa12.Bit = ((num1 >> 12) & 1) == 1;
			inputb12.Bit = ((num2 >> 12) & 1) == 1;
			inputa13.Bit = ((num1 >> 13) & 1) == 1;
			inputb13.Bit = ((num2 >> 13) & 1) == 1;
			inputa14.Bit = ((num1 >> 14) & 1) == 1;
			inputb14.Bit = ((num2 >> 14) & 1) == 1;
			inputa15.Bit = ((num1 >> 15) & 1) == 1;
			inputb15.Bit = ((num2 >> 15) & 1) == 1;
			inputa16.Bit = ((num1 >> 16) & 1) == 1;
			inputb16.Bit = ((num2 >> 16) & 1) == 1;
			inputa17.Bit = ((num1 >> 17) & 1) == 1;
			inputb17.Bit = ((num2 >> 17) & 1) == 1;
			inputa18.Bit = ((num1 >> 18) & 1) == 1;
			inputb18.Bit = ((num2 >> 18) & 1) == 1;
			inputa19.Bit = ((num1 >> 19) & 1) == 1;
			inputb19.Bit = ((num2 >> 19) & 1) == 1;
			inputa20.Bit = ((num1 >> 20) & 1) == 1;
			inputb20.Bit = ((num2 >> 20) & 1) == 1;
			inputa21.Bit = ((num1 >> 21) & 1) == 1;
			inputb21.Bit = ((num2 >> 21) & 1) == 1;
			inputa22.Bit = ((num1 >> 22) & 1) == 1;
			inputb22.Bit = ((num2 >> 22) & 1) == 1;
			inputa23.Bit = ((num1 >> 23) & 1) == 1;
			inputb23.Bit = ((num2 >> 23) & 1) == 1;
			inputa24.Bit = ((num1 >> 24) & 1) == 1;
			inputb24.Bit = ((num2 >> 24) & 1) == 1;
			inputa25.Bit = ((num1 >> 25) & 1) == 1;
			inputb25.Bit = ((num2 >> 25) & 1) == 1;
			inputa26.Bit = ((num1 >> 26) & 1) == 1;
			inputb26.Bit = ((num2 >> 26) & 1) == 1;
			inputa27.Bit = ((num1 >> 27) & 1) == 1;
			inputb27.Bit = ((num2 >> 27) & 1) == 1;
			inputa28.Bit = ((num1 >> 28) & 1) == 1;
			inputb28.Bit = ((num2 >> 28) & 1) == 1;
			inputa29.Bit = ((num1 >> 29) & 1) == 1;
			inputb29.Bit = ((num2 >> 29) & 1) == 1;
			inputa30.Bit = ((num1 >> 30) & 1) == 1;
			inputb30.Bit = ((num2 >> 30) & 1) == 1;
			inputa31.Bit = ((num1 >> 31) & 1) == 1;
			inputb31.Bit = ((num2 >> 31) & 1) == 1;
		}

		public int GetOutput()
		{
			int result = 0;
			result |= (output0.Bit ? 1 : 0) << 0;
			result |= (output1.Bit ? 1 : 0) << 1;
			result |= (output2.Bit ? 1 : 0) << 2;
			result |= (output3.Bit ? 1 : 0) << 3;
			result |= (output4.Bit ? 1 : 0) << 4;
			result |= (output5.Bit ? 1 : 0) << 5;
			result |= (output6.Bit ? 1 : 0) << 6;
			result |= (output7.Bit ? 1 : 0) << 7;
			result |= (output8.Bit ? 1 : 0) << 8;
			result |= (output9.Bit ? 1 : 0) << 9;
			result |= (output10.Bit ? 1 : 0) << 10;
			result |= (output11.Bit ? 1 : 0) << 11;
			result |= (output12.Bit ? 1 : 0) << 12;
			result |= (output13.Bit ? 1 : 0) << 13;
			result |= (output14.Bit ? 1 : 0) << 14;
			result |= (output15.Bit ? 1 : 0) << 15;
			result |= (output16.Bit ? 1 : 0) << 16;
			result |= (output17.Bit ? 1 : 0) << 17;
			result |= (output18.Bit ? 1 : 0) << 18;
			result |= (output19.Bit ? 1 : 0) << 19;
			result |= (output20.Bit ? 1 : 0) << 20;
			result |= (output21.Bit ? 1 : 0) << 21;
			result |= (output22.Bit ? 1 : 0) << 22;
			result |= (output23.Bit ? 1 : 0) << 23;
			result |= (output24.Bit ? 1 : 0) << 24;
			result |= (output25.Bit ? 1 : 0) << 25;
			result |= (output26.Bit ? 1 : 0) << 26;
			result |= (output27.Bit ? 1 : 0) << 27;
			result |= (output28.Bit ? 1 : 0) << 28;
			result |= (output29.Bit ? 1 : 0) << 29;
			result |= (output30.Bit ? 1 : 0) << 30;
			result |= (output31.Bit ? 1 : 0) << 31;
			return result;
		}

		[InputBus] Output0 output0;
		[InputBus] Output1 output1;
		[InputBus] Output2 output2;
		[InputBus] Output3 output3;
		[InputBus] Output4 output4;
		[InputBus] Output5 output5;
		[InputBus] Output6 output6;
		[InputBus] Output7 output7;
		[InputBus] Output8 output8;
		[InputBus] Output9 output9;
		[InputBus] Output10 output10;
		[InputBus] Output11 output11;
		[InputBus] Output12 output12;
		[InputBus] Output13 output13;
		[InputBus] Output14 output14;
		[InputBus] Output15 output15;
		[InputBus] Output16 output16;
		[InputBus] Output17 output17;
		[InputBus] Output18 output18;
		[InputBus] Output19 output19;
		[InputBus] Output20 output20;
		[InputBus] Output21 output21;
		[InputBus] Output22 output22;
		[InputBus] Output23 output23;
		[InputBus] Output24 output24;
		[InputBus] Output25 output25;
		[InputBus] Output26 output26;
		[InputBus] Output27 output27;
		[InputBus] Output28 output28;
		[InputBus] Output29 output29;
		[InputBus] Output30 output30;
		[InputBus] Output31 output31;

		[InputBus] Carry31 overflow;

		[OutputBus] InputA0 inputa0;
		[OutputBus] InputA1 inputa1;
		[OutputBus] InputA2 inputa2;
		[OutputBus] InputA3 inputa3;
		[OutputBus] InputA4 inputa4;
		[OutputBus] InputA5 inputa5;
		[OutputBus] InputA6 inputa6;
		[OutputBus] InputA7 inputa7;
		[OutputBus] InputA8 inputa8;
		[OutputBus] InputA9 inputa9;
		[OutputBus] InputA10 inputa10;
		[OutputBus] InputA11 inputa11;
		[OutputBus] InputA12 inputa12;
		[OutputBus] InputA13 inputa13;
		[OutputBus] InputA14 inputa14;
		[OutputBus] InputA15 inputa15;
		[OutputBus] InputA16 inputa16;
		[OutputBus] InputA17 inputa17;
		[OutputBus] InputA18 inputa18;
		[OutputBus] InputA19 inputa19;
		[OutputBus] InputA20 inputa20;
		[OutputBus] InputA21 inputa21;
		[OutputBus] InputA22 inputa22;
		[OutputBus] InputA23 inputa23;
		[OutputBus] InputA24 inputa24;
		[OutputBus] InputA25 inputa25;
		[OutputBus] InputA26 inputa26;
		[OutputBus] InputA27 inputa27;
		[OutputBus] InputA28 inputa28;
		[OutputBus] InputA29 inputa29;
		[OutputBus] InputA30 inputa30;
		[OutputBus] InputA31 inputa31;

		[OutputBus] InputB0 inputb0;
		[OutputBus] InputB1 inputb1;
		[OutputBus] InputB2 inputb2;
		[OutputBus] InputB3 inputb3;
		[OutputBus] InputB4 inputb4;
		[OutputBus] InputB5 inputb5;
		[OutputBus] InputB6 inputb6;
		[OutputBus] InputB7 inputb7;
		[OutputBus] InputB8 inputb8;
		[OutputBus] InputB9 inputb9;
		[OutputBus] InputB10 inputb10;
		[OutputBus] InputB11 inputb11;
		[OutputBus] InputB12 inputb12;
		[OutputBus] InputB13 inputb13;
		[OutputBus] InputB14 inputb14;
		[OutputBus] InputB15 inputb15;
		[OutputBus] InputB16 inputb16;
		[OutputBus] InputB17 inputb17;
		[OutputBus] InputB18 inputb18;
		[OutputBus] InputB19 inputb19;
		[OutputBus] InputB20 inputb20;
		[OutputBus] InputB21 inputb21;
		[OutputBus] InputB22 inputb22;
		[OutputBus] InputB23 inputb23;
		[OutputBus] InputB24 inputb24;
		[OutputBus] InputB25 inputb25;
		[OutputBus] InputB26 inputb26;
		[OutputBus] InputB27 inputb27;
		[OutputBus] InputB28 inputb28;
		[OutputBus] InputB29 inputb29;
		[OutputBus] InputB30 inputb30;
		[OutputBus] InputB31 inputb31;

		public async override System.Threading.Tasks.Task Run()
		{
			await ClockAsync();

			// Test basic addition
			InputNumbers(2, 2);
			await ClockAsync();
			System.Diagnostics.Debug.Assert(GetOutput() == 4, "2+2");

			// Test Overflow
			InputNumbers(-2147483648, -2147483648);
			await ClockAsync();
			System.Diagnostics.Debug.Assert(GetOutput() == 0, "Overflow output");
			System.Diagnostics.Debug.Assert(overflow.Bit, "Overflow bit");

			// A bunch of random tests
			Random rnd = new Random();
			for (int i = 0; i < 1000; i++)
			{
				Console.Write("\rAdditions: " + i);
				int tmp1 = rnd.Next();
				int tmp2 = rnd.Next();
				InputNumbers(tmp1, tmp2);
				await ClockAsync();
				System.Diagnostics.Debug.Assert(GetOutput() == tmp1 + tmp2, "Random test " + i);
			}

		}
	}

}
