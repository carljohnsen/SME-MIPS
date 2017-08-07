
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;

--library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

--library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

use work.csv_util.all;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

entity SingleCycleMIPS_tb is
end;

architecture TestBench of SingleCycleMIPS_tb is

  signal CLOCK : Std_logic;
  signal StopClock : BOOLEAN;
  signal RESET : Std_logic;

  signal Instruction_instruction : T_SYSTEM_UINT32;
  signal ReadA_addr : T_SYSTEM_UINT8;
  signal ReadB_addr : T_SYSTEM_UINT8;
  signal SignExtIn_data : T_SYSTEM_INT16;
  signal ControlIn_opcode : SingleCycleMIPS_Opcodes;
  signal MuxInput_rt : T_SYSTEM_UINT8;
  signal MuxInput_rd : T_SYSTEM_UINT8;
  signal ALUFunct_val : SingleCycleMIPS_Funcs;
  signal JumpInstruction_addr : T_SYSTEM_UINT32;
  signal Shamt_amount : T_SYSTEM_UINT8;
  signal RegDst_flg : T_SYSTEM_BOOL;
  signal MuxOutput_addr : T_SYSTEM_UINT8;
  signal LogicalImmediate_flg : T_SYSTEM_BOOL;
  signal SignExtOut_data : T_SYSTEM_UINT32;
  signal Branch_flg : T_SYSTEM_BOOL;
  signal MemRead_flg : T_SYSTEM_BOOL;
  signal MemToReg_flg : T_SYSTEM_BOOL;
  signal ALUOp_code : SingleCycleMIPS_ALUOpcodes;
  signal MemWrite_flg : T_SYSTEM_BOOL;
  signal ALUSrc_flg : T_SYSTEM_BOOL;
  signal RegWrite_flg : T_SYSTEM_BOOL;
  signal Jump_flg : T_SYSTEM_BOOL;
  signal JAL_flg : T_SYSTEM_BOOL;
  signal BranchNot_flg : T_SYSTEM_BOOL;
  signal WriteEnabled_flg : T_SYSTEM_BOOL;
  signal WriteAddr_val : T_SYSTEM_UINT8;
  signal WriteData_data : T_SYSTEM_UINT32;
  signal OutputA_data : T_SYSTEM_UINT32;
  signal OutputB_data : T_SYSTEM_UINT32;
  signal PCIn_newAddress : T_SYSTEM_UINT32;
  signal Address_address : T_SYSTEM_UINT32;
  signal IncrementerOut_address : T_SYSTEM_UINT32;
  signal DEBUG_SHUTDOWN_running : T_SYSTEM_BOOL;
  signal JALOut_val : T_SYSTEM_UINT32;
  signal ReadData_data : T_SYSTEM_UINT32;
  signal MemOut_data : T_SYSTEM_UINT32;
  signal ImmMuxOut_data : T_SYSTEM_UINT32;
  signal Shift_flg : T_SYSTEM_BOOL;
  signal ShmtMuxOut_data : T_SYSTEM_UINT32;
  signal ALUOperation_code : SingleCycleMIPS_ALUOps;
  signal JumpReg_flg : T_SYSTEM_BOOL;
  signal Zero_flg : T_SYSTEM_BOOL;
  signal ALUResult_data : T_SYSTEM_UINT32;
  signal RegWriteAddr_addr : T_SYSTEM_UINT8;
  signal ShiftBranch_addr : T_SYSTEM_UINT32;
  signal AdderOut_address : T_SYSTEM_UINT32;
  signal AndOut_flg : T_SYSTEM_BOOL;
  signal Mux0Out_addr : T_SYSTEM_UINT32;
  signal JumpAddr_addr : T_SYSTEM_UINT32;
  signal ShiftJump_addr : T_SYSTEM_UINT32;
  signal Mux2Out_addr : T_SYSTEM_UINT32;

begin

  uut: entity work.SingleCycleMIPS
  port map (

    Instruction_instruction => Instruction_instruction,
    ReadA_addr => ReadA_addr,
    ReadB_addr => ReadB_addr,
    SignExtIn_data => SignExtIn_data,
    ControlIn_opcode => ControlIn_opcode,
    MuxInput_rt => MuxInput_rt,
    MuxInput_rd => MuxInput_rd,
    ALUFunct_val => ALUFunct_val,
    JumpInstruction_addr => JumpInstruction_addr,
    Shamt_amount => Shamt_amount,
    RegDst_flg => RegDst_flg,
    MuxOutput_addr => MuxOutput_addr,
    LogicalImmediate_flg => LogicalImmediate_flg,
    SignExtOut_data => SignExtOut_data,
    Branch_flg => Branch_flg,
    MemRead_flg => MemRead_flg,
    MemToReg_flg => MemToReg_flg,
    ALUOp_code => ALUOp_code,
    MemWrite_flg => MemWrite_flg,
    ALUSrc_flg => ALUSrc_flg,
    RegWrite_flg => RegWrite_flg,
    Jump_flg => Jump_flg,
    JAL_flg => JAL_flg,
    BranchNot_flg => BranchNot_flg,
    WriteEnabled_flg => WriteEnabled_flg,
    WriteAddr_val => WriteAddr_val,
    WriteData_data => WriteData_data,
    OutputA_data => OutputA_data,
    OutputB_data => OutputB_data,
    PCIn_newAddress => PCIn_newAddress,
    Address_address => Address_address,
    IncrementerOut_address => IncrementerOut_address,
    DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,
    JALOut_val => JALOut_val,
    ReadData_data => ReadData_data,
    MemOut_data => MemOut_data,
    ImmMuxOut_data => ImmMuxOut_data,
    Shift_flg => Shift_flg,
    ShmtMuxOut_data => ShmtMuxOut_data,
    ALUOperation_code => ALUOperation_code,
    JumpReg_flg => JumpReg_flg,
    Zero_flg => Zero_flg,
    ALUResult_data => ALUResult_data,
    RegWriteAddr_addr => RegWriteAddr_addr,
    ShiftBranch_addr => ShiftBranch_addr,
    AdderOut_address => AdderOut_address,
    AndOut_flg => AndOut_flg,
    Mux0Out_addr => Mux0Out_addr,
    JumpAddr_addr => JumpAddr_addr,
    ShiftJump_addr => ShiftJump_addr,
    Mux2Out_addr => Mux2Out_addr,

    RST => RESET,
    CLK => CLOCK
  );

  Clk: process
  begin
    while not StopClock loop
      CLOCK <= '1';
      wait for 5 NS;
      CLOCK <= '0';
      wait for 5 NS;
    end loop;
    wait;
  end process;


TraceFileTester: process
    file F: TEXT;
    variable L: LINE;
    variable Status: FILE_OPEN_STATUS;
    constant filename : string := "/home/carljohnsen/vivado/SingleCycleMIPS2/trace.csv";
    variable clockcycle : integer := 0;
    variable tmp : CSV_LINE_T;
    variable readOK : boolean;
    variable fieldno : integer := 0;

begin

    -- #### USER-DATA-CONDITONING-START
    -- #### USER-DATA-CONDITONING-END

    FILE_OPEN(Status, F, filename, READ_MODE);
    if Status /= OPEN_OK then
        report "Failed to open CSV trace file" severity Failure;
    else
        -- Verify the headers
        READLINE(F, L);

        fieldno := 0;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "AdderOut.address") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected AdderOut.address" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Address.address") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Address.address" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ALUFunct.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ALUFunct.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ALUOp.code") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ALUOp.code" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ALUOperation.code") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ALUOperation.code" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ALUResult.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ALUResult.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ALUSrc.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ALUSrc.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "AndOut.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected AndOut.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Branch.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Branch.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "BranchNot.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected BranchNot.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ControlIn.opcode") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ControlIn.opcode" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "DEBUG_SHUTDOWN.running") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected DEBUG_SHUTDOWN.running" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ImmMuxOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ImmMuxOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IncrementerOut.address") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IncrementerOut.address" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Instruction.instruction") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Instruction.instruction" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JAL.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JAL.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JALOut.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JALOut.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Jump.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Jump.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpAddr.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpAddr.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpInstruction.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpInstruction.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "LogicalImmediate.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected LogicalImmediate.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MemOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MemOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MemRead.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MemRead.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MemToReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MemToReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MemWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MemWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Mux0Out.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Mux0Out.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Mux2Out.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Mux2Out.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MuxInput.rd") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MuxInput.rd" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MuxInput.rt") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MuxInput.rt" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MuxOutput.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MuxOutput.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "OutputA.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OutputA.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "OutputB.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OutputB.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "PCIn.newAddress") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected PCIn.newAddress" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ReadA.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ReadA.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ReadB.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ReadB.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ReadData.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ReadData.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "RegDst.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected RegDst.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "RegWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected RegWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "RegWriteAddr.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected RegWriteAddr.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Shamt.amount") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Shamt.amount" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Shift.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Shift.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ShiftBranch.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ShiftBranch.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ShiftJump.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ShiftJump.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ShmtMuxOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ShmtMuxOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "SignExtIn.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected SignExtIn.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "SignExtOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected SignExtOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "WriteAddr.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected WriteAddr.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "WriteData.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected WriteData.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "WriteEnabled.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected WriteEnabled.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "Zero.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Zero.flg" severity Failure;
        fieldno := fieldno + 1;

		RESET <= '1';
        wait for 5 NS;
        RESET <= '0';

        -- Read a line each clock
        while not ENDFILE(F) loop
            READLINE(F, L);

            fieldno := 0;

            -- Write all driver signals out

            wait until Rising_edge(CLOCK);

            -- Compare each signal with the value in the CSV file
	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(AdderOut_address), tmp) report "Value for AdderOut_address in cycle " & integer'image(clockcycle) & " was: " & str(AdderOut_address) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Address_address), tmp) report "Value for Address_address in cycle " & integer'image(clockcycle) & " was: " & str(Address_address) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(SingleCycleMIPS_Funcs'image(ALUFunct_val), to_safe_name(tmp)) report "Value for ALUFunct_val in cycle " & integer'image(clockcycle) & " was: " & SingleCycleMIPS_Funcs'image(ALUFunct_val) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(SingleCycleMIPS_ALUOpcodes'image(ALUOp_code), to_safe_name(tmp)) report "Value for ALUOp_code in cycle " & integer'image(clockcycle) & " was: " & SingleCycleMIPS_ALUOpcodes'image(ALUOp_code) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(SingleCycleMIPS_ALUOps'image(ALUOperation_code), to_safe_name(tmp)) report "Value for ALUOperation_code in cycle " & integer'image(clockcycle) & " was: " & SingleCycleMIPS_ALUOps'image(ALUOperation_code) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ALUResult_data), tmp) report "Value for ALUResult_data in cycle " & integer'image(clockcycle) & " was: " & str(ALUResult_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ALUSrc_flg), tmp) report "Value for ALUSrc_flg in cycle " & integer'image(clockcycle) & " was: " & str(ALUSrc_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(AndOut_flg), tmp) report "Value for AndOut_flg in cycle " & integer'image(clockcycle) & " was: " & str(AndOut_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Branch_flg), tmp) report "Value for Branch_flg in cycle " & integer'image(clockcycle) & " was: " & str(Branch_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(BranchNot_flg), tmp) report "Value for BranchNot_flg in cycle " & integer'image(clockcycle) & " was: " & str(BranchNot_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(SingleCycleMIPS_Opcodes'image(ControlIn_opcode), to_safe_name(tmp)) report "Value for ControlIn_opcode in cycle " & integer'image(clockcycle) & " was: " & SingleCycleMIPS_Opcodes'image(ControlIn_opcode) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(DEBUG_SHUTDOWN_running), tmp) report "Value for DEBUG_SHUTDOWN_running in cycle " & integer'image(clockcycle) & " was: " & str(DEBUG_SHUTDOWN_running) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ImmMuxOut_data), tmp) report "Value for ImmMuxOut_data in cycle " & integer'image(clockcycle) & " was: " & str(ImmMuxOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IncrementerOut_address), tmp) report "Value for IncrementerOut_address in cycle " & integer'image(clockcycle) & " was: " & str(IncrementerOut_address) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Instruction_instruction), tmp) report "Value for Instruction_instruction in cycle " & integer'image(clockcycle) & " was: " & str(Instruction_instruction) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JAL_flg), tmp) report "Value for JAL_flg in cycle " & integer'image(clockcycle) & " was: " & str(JAL_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JALOut_val), tmp) report "Value for JALOut_val in cycle " & integer'image(clockcycle) & " was: " & str(JALOut_val) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Jump_flg), tmp) report "Value for Jump_flg in cycle " & integer'image(clockcycle) & " was: " & str(Jump_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpAddr_addr), tmp) report "Value for JumpAddr_addr in cycle " & integer'image(clockcycle) & " was: " & str(JumpAddr_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpInstruction_addr), tmp) report "Value for JumpInstruction_addr in cycle " & integer'image(clockcycle) & " was: " & str(JumpInstruction_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpReg_flg), tmp) report "Value for JumpReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(JumpReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(LogicalImmediate_flg), tmp) report "Value for LogicalImmediate_flg in cycle " & integer'image(clockcycle) & " was: " & str(LogicalImmediate_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MemOut_data), tmp) report "Value for MemOut_data in cycle " & integer'image(clockcycle) & " was: " & str(MemOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MemRead_flg), tmp) report "Value for MemRead_flg in cycle " & integer'image(clockcycle) & " was: " & str(MemRead_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MemToReg_flg), tmp) report "Value for MemToReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(MemToReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MemWrite_flg), tmp) report "Value for MemWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(MemWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Mux0Out_addr), tmp) report "Value for Mux0Out_addr in cycle " & integer'image(clockcycle) & " was: " & str(Mux0Out_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Mux2Out_addr), tmp) report "Value for Mux2Out_addr in cycle " & integer'image(clockcycle) & " was: " & str(Mux2Out_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MuxInput_rd), tmp) report "Value for MuxInput_rd in cycle " & integer'image(clockcycle) & " was: " & str(MuxInput_rd) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MuxInput_rt), tmp) report "Value for MuxInput_rt in cycle " & integer'image(clockcycle) & " was: " & str(MuxInput_rt) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MuxOutput_addr), tmp) report "Value for MuxOutput_addr in cycle " & integer'image(clockcycle) & " was: " & str(MuxOutput_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(OutputA_data), tmp) report "Value for OutputA_data in cycle " & integer'image(clockcycle) & " was: " & str(OutputA_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(OutputB_data), tmp) report "Value for OutputB_data in cycle " & integer'image(clockcycle) & " was: " & str(OutputB_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(PCIn_newAddress), tmp) report "Value for PCIn_newAddress in cycle " & integer'image(clockcycle) & " was: " & str(PCIn_newAddress) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ReadA_addr), tmp) report "Value for ReadA_addr in cycle " & integer'image(clockcycle) & " was: " & str(ReadA_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ReadB_addr), tmp) report "Value for ReadB_addr in cycle " & integer'image(clockcycle) & " was: " & str(ReadB_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ReadData_data), tmp) report "Value for ReadData_data in cycle " & integer'image(clockcycle) & " was: " & str(ReadData_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(RegDst_flg), tmp) report "Value for RegDst_flg in cycle " & integer'image(clockcycle) & " was: " & str(RegDst_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(RegWrite_flg), tmp) report "Value for RegWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(RegWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(RegWriteAddr_addr), tmp) report "Value for RegWriteAddr_addr in cycle " & integer'image(clockcycle) & " was: " & str(RegWriteAddr_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Shamt_amount), tmp) report "Value for Shamt_amount in cycle " & integer'image(clockcycle) & " was: " & str(Shamt_amount) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Shift_flg), tmp) report "Value for Shift_flg in cycle " & integer'image(clockcycle) & " was: " & str(Shift_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ShiftBranch_addr), tmp) report "Value for ShiftBranch_addr in cycle " & integer'image(clockcycle) & " was: " & str(ShiftBranch_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ShiftJump_addr), tmp) report "Value for ShiftJump_addr in cycle " & integer'image(clockcycle) & " was: " & str(ShiftJump_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ShmtMuxOut_data), tmp) report "Value for ShmtMuxOut_data in cycle " & integer'image(clockcycle) & " was: " & str(ShmtMuxOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(SignExtIn_data), tmp) report "Value for SignExtIn_data in cycle " & integer'image(clockcycle) & " was: " & str(SignExtIn_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(SignExtOut_data), tmp) report "Value for SignExtOut_data in cycle " & integer'image(clockcycle) & " was: " & str(SignExtOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(WriteAddr_val), tmp) report "Value for WriteAddr_val in cycle " & integer'image(clockcycle) & " was: " & str(WriteAddr_val) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(WriteData_data), tmp) report "Value for WriteData_data in cycle " & integer'image(clockcycle) & " was: " & str(WriteData_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(WriteEnabled_flg), tmp) report "Value for WriteEnabled_flg in cycle " & integer'image(clockcycle) & " was: " & str(WriteEnabled_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(Zero_flg), tmp) report "Value for Zero_flg in cycle " & integer'image(clockcycle) & " was: " & str(Zero_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;


            clockcycle := clockcycle + 1;
        end loop;

        FILE_CLOSE(F);
    end if;

	report "completed after " & integer'image(clockcycle) & " clockcycles";
    StopClock <= true;

    wait;
end process;
end architecture TestBench;