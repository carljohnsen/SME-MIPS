// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Tue Jul 25 11:21:52 2017
// Host        : L10-0002 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/ihicajo/Documents/Xilinx/LogicGates/LogicGates.sim/sim_1/impl/timing/LogicGates_tb_time_impl.v
// Design      : LogicGates_export
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module AndGate
   (Output_And_OBUF,
    RST_IBUF,
    Input_bit2_IBUF,
    Input_bit1_IBUF);
  output Output_And_OBUF;
  input RST_IBUF;
  input Input_bit2_IBUF;
  input Input_bit1_IBUF;

  wire Input_bit1_IBUF;
  wire Input_bit2_IBUF;
  wire Output_And_OBUF;
  wire RST_IBUF;

  LUT3 #(
    .INIT(8'h40)) 
    \/i_ 
       (.I0(RST_IBUF),
        .I1(Input_bit2_IBUF),
        .I2(Input_bit1_IBUF),
        .O(Output_And_OBUF));
endmodule

module LogicGates
   (Output_And_OBUF,
    Output_Or_OBUF,
    RST_IBUF,
    Input_bit2_IBUF,
    Input_bit1_IBUF);
  output Output_And_OBUF;
  output Output_Or_OBUF;
  input RST_IBUF;
  input Input_bit2_IBUF;
  input Input_bit1_IBUF;

  wire Input_bit1_IBUF;
  wire Input_bit2_IBUF;
  wire Output_And_OBUF;
  wire Output_Or_OBUF;
  wire RST_IBUF;

  AndGate AndGate
       (.Input_bit1_IBUF(Input_bit1_IBUF),
        .Input_bit2_IBUF(Input_bit2_IBUF),
        .Output_And_OBUF(Output_And_OBUF),
        .RST_IBUF(RST_IBUF));
  OrGate OrGate
       (.Input_bit1_IBUF(Input_bit1_IBUF),
        .Input_bit2_IBUF(Input_bit2_IBUF),
        .Output_Or_OBUF(Output_Or_OBUF),
        .RST_IBUF(RST_IBUF));
endmodule

(* ECO_CHECKSUM = "aa469243" *) 
(* NotValidForBitStream *)
module LogicGates_export
   (Input_bit1,
    Input_bit2,
    Output_And,
    Output_Or,
    Output_Not,
    Output_Xor,
    RST,
    CLK);
  input Input_bit1;
  input Input_bit2;
  output Output_And;
  output Output_Or;
  output Output_Not;
  output Output_Xor;
  input RST;
  input CLK;

  wire Input_bit1;
  wire Input_bit1_IBUF;
  wire Input_bit2;
  wire Input_bit2_IBUF;
  wire Output_And;
  wire Output_And_OBUF;
  wire Output_Not;
  wire Output_Not_OBUF;
  wire Output_Or;
  wire Output_Or_OBUF;
  wire Output_Xor;
  wire Output_Xor_OBUF;
  wire RST;
  wire RST_IBUF;

initial begin
 $sdf_annotate("LogicGates_tb_time_impl.sdf",,,,"tool_control");
end
  IBUF Input_bit1_IBUF_inst
       (.I(Input_bit1),
        .O(Input_bit1_IBUF));
  IBUF Input_bit2_IBUF_inst
       (.I(Input_bit2),
        .O(Input_bit2_IBUF));
  LogicGates LogicGates
       (.Input_bit1_IBUF(Input_bit1_IBUF),
        .Input_bit2_IBUF(Input_bit2_IBUF),
        .Output_And_OBUF(Output_And_OBUF),
        .Output_Or_OBUF(Output_Or_OBUF),
        .RST_IBUF(RST_IBUF));
  OBUF Output_And_OBUF_inst
       (.I(Output_And_OBUF),
        .O(Output_And));
  OBUF Output_Not_OBUF_inst
       (.I(Output_Not_OBUF),
        .O(Output_Not));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    Output_Not_OBUF_inst_i_1
       (.I0(RST_IBUF),
        .I1(Input_bit1_IBUF),
        .O(Output_Not_OBUF));
  OBUF Output_Or_OBUF_inst
       (.I(Output_Or_OBUF),
        .O(Output_Or));
  OBUF Output_Xor_OBUF_inst
       (.I(Output_Xor_OBUF),
        .O(Output_Xor));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h06)) 
    Output_Xor_OBUF_inst_i_1
       (.I0(Input_bit2_IBUF),
        .I1(Input_bit1_IBUF),
        .I2(RST_IBUF),
        .O(Output_Xor_OBUF));
  IBUF RST_IBUF_inst
       (.I(RST),
        .O(RST_IBUF));
endmodule

module OrGate
   (Output_Or_OBUF,
    RST_IBUF,
    Input_bit2_IBUF,
    Input_bit1_IBUF);
  output Output_Or_OBUF;
  input RST_IBUF;
  input Input_bit2_IBUF;
  input Input_bit1_IBUF;

  wire Input_bit1_IBUF;
  wire Input_bit2_IBUF;
  wire Output_Or_OBUF;
  wire RST_IBUF;

  LUT3 #(
    .INIT(8'h54)) 
    \/i_ 
       (.I0(RST_IBUF),
        .I1(Input_bit2_IBUF),
        .I2(Input_bit1_IBUF),
        .O(Output_Or_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
