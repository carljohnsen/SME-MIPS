﻿using System;
using SME;

namespace Adder32 
{

	[TopLevelInputBus] public interface InputA0 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA1 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA2 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA3 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA4 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA5 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA6 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA7 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA8 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA9 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA10 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA11 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA12 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA13 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA14 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA15 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA16 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA17 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA18 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA19 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA20 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA21 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA22 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA23 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA24 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA25 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA26 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA27 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA28 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA29 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA30 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputA31 : IBus { bool Bit { get; set; } }
	
	[TopLevelInputBus] public interface InputB0 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB1 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB2 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB3 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB4 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB5 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB6 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB7 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB8 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB9 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB10 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB11 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB12 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB13 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB14 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB15 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB16 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB17 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB18 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB19 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB20 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB21 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB22 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB23 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB24 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB25 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB26 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB27 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB28 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB29 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB30 : IBus { bool Bit { get; set; } }
	[TopLevelInputBus] public interface InputB31 : IBus { bool Bit { get; set; } }
	
	[TopLevelOutputBus] public interface Output0 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output1 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output2 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output3 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output4 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output5 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output6 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output7 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output8 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output9 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output10 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output11 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output12 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output13 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output14 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output15 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output16 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output17 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output18 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output19 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output20 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output21 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output22 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output23 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output24 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output25 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output26 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output27 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output28 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output29 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output30 : IBus { bool Bit { get; set; } }
	[TopLevelOutputBus] public interface Output31 : IBus { bool Bit { get; set; } }
	
	public interface Carry0 : IBus { bool Bit { get; set; } }
	public interface Carry1 : IBus { bool Bit { get; set; } }
	public interface Carry2 : IBus { bool Bit { get; set; } }
	public interface Carry3 : IBus { bool Bit { get; set; } }
	public interface Carry4 : IBus { bool Bit { get; set; } }
	public interface Carry5 : IBus { bool Bit { get; set; } }
	public interface Carry6 : IBus { bool Bit { get; set; } }
	public interface Carry7 : IBus { bool Bit { get; set; } }
	public interface Carry8 : IBus { bool Bit { get; set; } }
	public interface Carry9 : IBus { bool Bit { get; set; } }
	public interface Carry10 : IBus { bool Bit { get; set; } }
	public interface Carry11 : IBus { bool Bit { get; set; } }
	public interface Carry12 : IBus { bool Bit { get; set; } }
	public interface Carry13 : IBus { bool Bit { get; set; } }
	public interface Carry14 : IBus { bool Bit { get; set; } }
	public interface Carry15 : IBus { bool Bit { get; set; } }
	public interface Carry16 : IBus { bool Bit { get; set; } }
	public interface Carry17 : IBus { bool Bit { get; set; } }
	public interface Carry18 : IBus { bool Bit { get; set; } }
	public interface Carry19 : IBus { bool Bit { get; set; } }
	public interface Carry20 : IBus { bool Bit { get; set; } }
	public interface Carry21 : IBus { bool Bit { get; set; } }
	public interface Carry22 : IBus { bool Bit { get; set; } }
	public interface Carry23 : IBus { bool Bit { get; set; } }
	public interface Carry24 : IBus { bool Bit { get; set; } }
	public interface Carry25 : IBus { bool Bit { get; set; } }
	public interface Carry26 : IBus { bool Bit { get; set; } }
	public interface Carry27 : IBus { bool Bit { get; set; } }
	public interface Carry28 : IBus { bool Bit { get; set; } }
	public interface Carry29 : IBus { bool Bit { get; set; } }
	public interface Carry30 : IBus { bool Bit { get; set; } }
		[TopLevelOutputBus] public interface Carry31 : IBus { bool Bit { get; set; } }

}