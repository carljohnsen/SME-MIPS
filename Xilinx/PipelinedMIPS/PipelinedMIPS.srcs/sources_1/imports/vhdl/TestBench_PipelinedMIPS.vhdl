
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

entity PipelinedMIPS_tb is
end;

architecture TestBench of PipelinedMIPS_tb is

  signal CLOCK : Std_logic;
  signal StopClock : BOOLEAN;
  signal RESET : Std_logic;

  signal ID_Pipe_OutputA_data : T_SYSTEM_UINT32;
  signal EX_Pipe_JALOut_val : T_SYSTEM_UINT32;
  signal WB_WriteData_data : T_SYSTEM_UINT32;
  signal EX_Forw_ForwardA_selection : PipelinedMIPS_ForwardSelection;
  signal EX_ForwardA_data : T_SYSTEM_UINT32;
  signal ID_Pipe_OutputB_data : T_SYSTEM_UINT32;
  signal EX_Forw_ForwardB_selection : PipelinedMIPS_ForwardSelection;
  signal EX_ForwardB_data : T_SYSTEM_UINT32;
  signal ID_Pipe_ALUSrc_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_SignExtOut_data : T_SYSTEM_UINT32;
  signal EX_ImmMuxOut_data : T_SYSTEM_UINT32;
  signal EX_JumpPacked_addr : T_SYSTEM_UINT32;
  signal EX_JumpReg_flg : T_SYSTEM_BOOL;
  signal EX_JumpAddress_addr : T_SYSTEM_UINT32;
  signal EX_ShiftJump_addr : T_SYSTEM_UINT32;
  signal ID_Pipe_IncrementerOut_addr : T_SYSTEM_UINT32;
  signal ID_Pipe_Jump_addr : T_SYSTEM_UINT32;
  signal ID_Pipe_Shamt_amount : T_SYSTEM_UINT8;
  signal EX_Shift_flg : T_SYSTEM_BOOL;
  signal EX_ShmtMuxOut_data : T_SYSTEM_UINT32;
  signal EX_ShiftBranch_addr : T_SYSTEM_UINT32;
  signal EX_BranchAddress_addr : T_SYSTEM_UINT32;
  signal ID_Pipe_ALUOp_code : PipelinedMIPS_ALUOpcodes;
  signal ID_Pipe_ALUFunct_val : PipelinedMIPS_Funcs;
  signal EX_ALUOperation_code : PipelinedMIPS_ALUOps;
  signal EX_Zero_flg : T_SYSTEM_BOOL;
  signal EX_ALUResult_data : T_SYSTEM_UINT32;
  signal ID_Pipe_WriteDst_addr : T_SYSTEM_UINT8;
  signal ID_Pipe_JAL_flg : T_SYSTEM_BOOL;
  signal EX_RegWriteAddr_addr : T_SYSTEM_UINT8;
  signal EX_JALOut_val : T_SYSTEM_UINT32;
  signal ID_Pipe_Branch_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_BranchNot_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_Jmp_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_MemRead_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_MemToReg_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_MemWrite_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_RegWrite_flg : T_SYSTEM_BOOL;
  signal ID_Haz_Flush_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_Branch_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_BranchAddress_addr : T_SYSTEM_UINT32;
  signal EX_Pipe_BranchNot_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_Jmp_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_JumpAddress_addr : T_SYSTEM_UINT32;
  signal EX_Pipe_JumpReg_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_MemRead_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_MemToReg_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_MemWrite_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_OutputB_data : T_SYSTEM_UINT32;
  signal EX_Pipe_RegWrite_flg : T_SYSTEM_BOOL;
  signal EX_Pipe_RegWriteAddr_addr : T_SYSTEM_UINT8;
  signal EX_Pipe_Zero_flg : T_SYSTEM_BOOL;
  signal MEM_Pipe_RegWriteAddr_addr : T_SYSTEM_UINT8;
  signal MEM_Pipe_RegWrite_flg : T_SYSTEM_BOOL;
  signal ID_Pipe_ReadA_addr : T_SYSTEM_UINT8;
  signal ID_Pipe_ReadB_addr : T_SYSTEM_UINT8;
  signal IF_Pipe_Instruction_instruction : T_SYSTEM_UINT32;
  signal ID_ReadA_addr : T_SYSTEM_UINT8;
  signal ID_ReadB_addr : T_SYSTEM_UINT8;
  signal ID_SignExtIn_data : T_SYSTEM_INT16;
  signal ID_ControlIn_opcode : PipelinedMIPS_Opcodes;
  signal ID_RegDstMuxInput_rt : T_SYSTEM_UINT8;
  signal ID_RegDstMuxInput_rd : T_SYSTEM_UINT8;
  signal ID_ALUFunct_val : PipelinedMIPS_Funcs;
  signal ID_Jump_addr : T_SYSTEM_UINT32;
  signal ID_Shamt_amount : T_SYSTEM_UINT8;
  signal ID_RegDst_flg : T_SYSTEM_BOOL;
  signal ID_WriteDst_addr : T_SYSTEM_UINT8;
  signal ID_LogicalImmediate_flg : T_SYSTEM_BOOL;
  signal ID_SignExtOut_data : T_SYSTEM_UINT32;
  signal ID_Branch_flg : T_SYSTEM_BOOL;
  signal ID_MemRead_flg : T_SYSTEM_BOOL;
  signal ID_MemToReg_flg : T_SYSTEM_BOOL;
  signal ID_ALUOp_code : PipelinedMIPS_ALUOpcodes;
  signal ID_MemWrite_flg : T_SYSTEM_BOOL;
  signal ID_ALUSrc_flg : T_SYSTEM_BOOL;
  signal ID_RegWrite_flg : T_SYSTEM_BOOL;
  signal ID_Jmp_flg : T_SYSTEM_BOOL;
  signal ID_JAL_flg : T_SYSTEM_BOOL;
  signal ID_BranchNot_flg : T_SYSTEM_BOOL;
  signal JumpUnit_PCSrc_flg : T_SYSTEM_BOOL;
  signal ID_Haz_Stall_flg : T_SYSTEM_BOOL;
  signal ID_OutputA_data : T_SYSTEM_UINT32;
  signal ID_OutputB_data : T_SYSTEM_UINT32;
  signal IF_Pipe_IncrementerOut_addr : T_SYSTEM_UINT32;
  signal IF_PCIn_newAddress : T_SYSTEM_UINT32;
  signal IF_Address_address : T_SYSTEM_UINT32;
  signal IF_IncrementerOut_address : T_SYSTEM_UINT32;
  signal IF_MuxIn_addr : T_SYSTEM_UINT32;
  signal IF_Instruction_instruction : T_SYSTEM_UINT32;
  signal DEBUG_SHUTDOWN_running : T_SYSTEM_BOOL;
  signal MEM_ReadData_data : T_SYSTEM_UINT32;
  signal MEM_Pipe_JALOut_val : T_SYSTEM_UINT32;
  signal MEM_Pipe_MemToReg_flg : T_SYSTEM_BOOL;
  signal MEM_Pipe_ReadData_data : T_SYSTEM_UINT32;
  signal JumpUnit_AndOut_flg : T_SYSTEM_BOOL;
  signal JumpUnit_BranchCondition_flg : T_SYSTEM_BOOL;

begin

  uut: entity work.PipelinedMIPS
  port map (

    ID_Pipe_OutputA_data => ID_Pipe_OutputA_data,
    EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,
    WB_WriteData_data => WB_WriteData_data,
    EX_Forw_ForwardA_selection => EX_Forw_ForwardA_selection,
    EX_ForwardA_data => EX_ForwardA_data,
    ID_Pipe_OutputB_data => ID_Pipe_OutputB_data,
    EX_Forw_ForwardB_selection => EX_Forw_ForwardB_selection,
    EX_ForwardB_data => EX_ForwardB_data,
    ID_Pipe_ALUSrc_flg => ID_Pipe_ALUSrc_flg,
    ID_Pipe_SignExtOut_data => ID_Pipe_SignExtOut_data,
    EX_ImmMuxOut_data => EX_ImmMuxOut_data,
    EX_JumpPacked_addr => EX_JumpPacked_addr,
    EX_JumpReg_flg => EX_JumpReg_flg,
    EX_JumpAddress_addr => EX_JumpAddress_addr,
    EX_ShiftJump_addr => EX_ShiftJump_addr,
    ID_Pipe_IncrementerOut_addr => ID_Pipe_IncrementerOut_addr,
    ID_Pipe_Jump_addr => ID_Pipe_Jump_addr,
    ID_Pipe_Shamt_amount => ID_Pipe_Shamt_amount,
    EX_Shift_flg => EX_Shift_flg,
    EX_ShmtMuxOut_data => EX_ShmtMuxOut_data,
    EX_ShiftBranch_addr => EX_ShiftBranch_addr,
    EX_BranchAddress_addr => EX_BranchAddress_addr,
    ID_Pipe_ALUOp_code => ID_Pipe_ALUOp_code,
    ID_Pipe_ALUFunct_val => ID_Pipe_ALUFunct_val,
    EX_ALUOperation_code => EX_ALUOperation_code,
    EX_Zero_flg => EX_Zero_flg,
    EX_ALUResult_data => EX_ALUResult_data,
    ID_Pipe_WriteDst_addr => ID_Pipe_WriteDst_addr,
    ID_Pipe_JAL_flg => ID_Pipe_JAL_flg,
    EX_RegWriteAddr_addr => EX_RegWriteAddr_addr,
    EX_JALOut_val => EX_JALOut_val,
    ID_Pipe_Branch_flg => ID_Pipe_Branch_flg,
    ID_Pipe_BranchNot_flg => ID_Pipe_BranchNot_flg,
    ID_Pipe_Jmp_flg => ID_Pipe_Jmp_flg,
    ID_Pipe_MemRead_flg => ID_Pipe_MemRead_flg,
    ID_Pipe_MemToReg_flg => ID_Pipe_MemToReg_flg,
    ID_Pipe_MemWrite_flg => ID_Pipe_MemWrite_flg,
    ID_Pipe_RegWrite_flg => ID_Pipe_RegWrite_flg,
    ID_Haz_Flush_flg => ID_Haz_Flush_flg,
    EX_Pipe_Branch_flg => EX_Pipe_Branch_flg,
    EX_Pipe_BranchAddress_addr => EX_Pipe_BranchAddress_addr,
    EX_Pipe_BranchNot_flg => EX_Pipe_BranchNot_flg,
    EX_Pipe_Jmp_flg => EX_Pipe_Jmp_flg,
    EX_Pipe_JumpAddress_addr => EX_Pipe_JumpAddress_addr,
    EX_Pipe_JumpReg_flg => EX_Pipe_JumpReg_flg,
    EX_Pipe_MemRead_flg => EX_Pipe_MemRead_flg,
    EX_Pipe_MemToReg_flg => EX_Pipe_MemToReg_flg,
    EX_Pipe_MemWrite_flg => EX_Pipe_MemWrite_flg,
    EX_Pipe_OutputB_data => EX_Pipe_OutputB_data,
    EX_Pipe_RegWrite_flg => EX_Pipe_RegWrite_flg,
    EX_Pipe_RegWriteAddr_addr => EX_Pipe_RegWriteAddr_addr,
    EX_Pipe_Zero_flg => EX_Pipe_Zero_flg,
    MEM_Pipe_RegWriteAddr_addr => MEM_Pipe_RegWriteAddr_addr,
    MEM_Pipe_RegWrite_flg => MEM_Pipe_RegWrite_flg,
    ID_Pipe_ReadA_addr => ID_Pipe_ReadA_addr,
    ID_Pipe_ReadB_addr => ID_Pipe_ReadB_addr,
    IF_Pipe_Instruction_instruction => IF_Pipe_Instruction_instruction,
    ID_ReadA_addr => ID_ReadA_addr,
    ID_ReadB_addr => ID_ReadB_addr,
    ID_SignExtIn_data => ID_SignExtIn_data,
    ID_ControlIn_opcode => ID_ControlIn_opcode,
    ID_RegDstMuxInput_rt => ID_RegDstMuxInput_rt,
    ID_RegDstMuxInput_rd => ID_RegDstMuxInput_rd,
    ID_ALUFunct_val => ID_ALUFunct_val,
    ID_Jump_addr => ID_Jump_addr,
    ID_Shamt_amount => ID_Shamt_amount,
    ID_RegDst_flg => ID_RegDst_flg,
    ID_WriteDst_addr => ID_WriteDst_addr,
    ID_LogicalImmediate_flg => ID_LogicalImmediate_flg,
    ID_SignExtOut_data => ID_SignExtOut_data,
    ID_Branch_flg => ID_Branch_flg,
    ID_MemRead_flg => ID_MemRead_flg,
    ID_MemToReg_flg => ID_MemToReg_flg,
    ID_ALUOp_code => ID_ALUOp_code,
    ID_MemWrite_flg => ID_MemWrite_flg,
    ID_ALUSrc_flg => ID_ALUSrc_flg,
    ID_RegWrite_flg => ID_RegWrite_flg,
    ID_Jmp_flg => ID_Jmp_flg,
    ID_JAL_flg => ID_JAL_flg,
    ID_BranchNot_flg => ID_BranchNot_flg,
    JumpUnit_PCSrc_flg => JumpUnit_PCSrc_flg,
    ID_Haz_Stall_flg => ID_Haz_Stall_flg,
    ID_OutputA_data => ID_OutputA_data,
    ID_OutputB_data => ID_OutputB_data,
    IF_Pipe_IncrementerOut_addr => IF_Pipe_IncrementerOut_addr,
    IF_PCIn_newAddress => IF_PCIn_newAddress,
    IF_Address_address => IF_Address_address,
    IF_IncrementerOut_address => IF_IncrementerOut_address,
    IF_MuxIn_addr => IF_MuxIn_addr,
    IF_Instruction_instruction => IF_Instruction_instruction,
    DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,
    MEM_ReadData_data => MEM_ReadData_data,
    MEM_Pipe_JALOut_val => MEM_Pipe_JALOut_val,
    MEM_Pipe_MemToReg_flg => MEM_Pipe_MemToReg_flg,
    MEM_Pipe_ReadData_data => MEM_Pipe_ReadData_data,
    JumpUnit_AndOut_flg => JumpUnit_AndOut_flg,
    JumpUnit_BranchCondition_flg => JumpUnit_BranchCondition_flg,

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
    constant filename : string := "/home/carljohnsen/sme/src/Examples/PipelinedMIPS/bin/Debug/output/trace.csv";
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
        assert are_strings_equal(tmp, "DEBUG_SHUTDOWN.running") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected DEBUG_SHUTDOWN.running" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ALUOperation.code") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ALUOperation.code" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ALUResult.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ALUResult.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_BranchAddress.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_BranchAddress.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Forw_ForwardA.selection") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Forw_ForwardA.selection" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Forw_ForwardB.selection") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Forw_ForwardB.selection" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ForwardA.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ForwardA.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ForwardB.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ForwardB.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ImmMuxOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ImmMuxOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_JALOut.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_JALOut.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_JumpAddress.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_JumpAddress.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_JumpPacked.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_JumpPacked.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_JumpReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_JumpReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_Branch.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_Branch.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_BranchAddress.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_BranchAddress.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_BranchNot.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_BranchNot.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_JALOut.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_JALOut.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_Jmp.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_Jmp.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_JumpAddress.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_JumpAddress.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_JumpReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_JumpReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_MemRead.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_MemRead.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_MemToReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_MemToReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_MemWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_MemWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_OutputB.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_OutputB.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_RegWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_RegWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_RegWriteAddr.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_RegWriteAddr.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Pipe_Zero.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Pipe_Zero.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_RegWriteAddr.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_RegWriteAddr.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Shift.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Shift.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ShiftBranch.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ShiftBranch.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ShiftJump.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ShiftJump.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_ShmtMuxOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_ShmtMuxOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "EX_Zero.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected EX_Zero.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ALUFunct.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ALUFunct.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ALUOp.code") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ALUOp.code" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ALUSrc.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ALUSrc.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Branch.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Branch.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_BranchNot.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_BranchNot.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ControlIn.opcode") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ControlIn.opcode" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Haz_Flush.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Haz_Flush.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Haz_Stall.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Haz_Stall.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_JAL.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_JAL.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Jmp.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Jmp.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Jump.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Jump.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_LogicalImmediate.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_LogicalImmediate.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_MemRead.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_MemRead.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_MemToReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_MemToReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_MemWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_MemWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_OutputA.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_OutputA.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_OutputB.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_OutputB.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_ALUFunct.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_ALUFunct.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_ALUOp.code") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_ALUOp.code" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_ALUSrc.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_ALUSrc.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_Branch.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_Branch.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_BranchNot.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_BranchNot.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_IncrementerOut.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_IncrementerOut.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_JAL.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_JAL.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_Jmp.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_Jmp.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_Jump.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_Jump.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_MemRead.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_MemRead.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_MemToReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_MemToReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_MemWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_MemWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_OutputA.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_OutputA.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_OutputB.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_OutputB.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_ReadA.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_ReadA.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_ReadB.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_ReadB.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_RegWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_RegWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_Shamt.amount") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_Shamt.amount" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_SignExtOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_SignExtOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Pipe_WriteDst.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Pipe_WriteDst.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ReadA.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ReadA.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_ReadB.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_ReadB.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_RegDst.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_RegDst.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_RegDstMuxInput.rd") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_RegDstMuxInput.rd" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_RegDstMuxInput.rt") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_RegDstMuxInput.rt" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_RegWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_RegWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_Shamt.amount") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_Shamt.amount" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_SignExtIn.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_SignExtIn.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_SignExtOut.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_SignExtOut.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "ID_WriteDst.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected ID_WriteDst.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_Address.address") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_Address.address" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_IncrementerOut.address") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_IncrementerOut.address" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_Instruction.instruction") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_Instruction.instruction" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_MuxIn.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_MuxIn.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_PCIn.newAddress") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_PCIn.newAddress" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_Pipe_IncrementerOut.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_Pipe_IncrementerOut.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "IF_Pipe_Instruction.instruction") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected IF_Pipe_Instruction.instruction" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpUnit_AndOut.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpUnit_AndOut.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpUnit_BranchCondition.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpUnit_BranchCondition.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "JumpUnit_PCSrc.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected JumpUnit_PCSrc.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_Pipe_JALOut.val") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_Pipe_JALOut.val" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_Pipe_MemToReg.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_Pipe_MemToReg.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_Pipe_ReadData.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_Pipe_ReadData.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_Pipe_RegWrite.flg") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_Pipe_RegWrite.flg" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_Pipe_RegWriteAddr.addr") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_Pipe_RegWriteAddr.addr" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "MEM_ReadData.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected MEM_ReadData.data" severity Failure;
        fieldno := fieldno + 1;
        read_csv_field(L, tmp);
        assert are_strings_equal(tmp, "WB_WriteData.data") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected WB_WriteData.data" severity Failure;
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
            	assert are_strings_equal(str(DEBUG_SHUTDOWN_running), tmp) report "Value for DEBUG_SHUTDOWN_running in cycle " & integer'image(clockcycle) & " was: " & str(DEBUG_SHUTDOWN_running) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_ALUOps'image(EX_ALUOperation_code), to_safe_name(tmp)) report "Value for EX_ALUOperation_code in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_ALUOps'image(EX_ALUOperation_code) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ALUResult_data), tmp) report "Value for EX_ALUResult_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_ALUResult_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_BranchAddress_addr), tmp) report "Value for EX_BranchAddress_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_BranchAddress_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_ForwardSelection'image(EX_Forw_ForwardA_selection), to_safe_name(tmp)) report "Value for EX_Forw_ForwardA_selection in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_ForwardSelection'image(EX_Forw_ForwardA_selection) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_ForwardSelection'image(EX_Forw_ForwardB_selection), to_safe_name(tmp)) report "Value for EX_Forw_ForwardB_selection in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_ForwardSelection'image(EX_Forw_ForwardB_selection) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ForwardA_data), tmp) report "Value for EX_ForwardA_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_ForwardA_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ForwardB_data), tmp) report "Value for EX_ForwardB_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_ForwardB_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ImmMuxOut_data), tmp) report "Value for EX_ImmMuxOut_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_ImmMuxOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_JALOut_val), tmp) report "Value for EX_JALOut_val in cycle " & integer'image(clockcycle) & " was: " & str(EX_JALOut_val) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_JumpAddress_addr), tmp) report "Value for EX_JumpAddress_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_JumpAddress_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_JumpPacked_addr), tmp) report "Value for EX_JumpPacked_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_JumpPacked_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_JumpReg_flg), tmp) report "Value for EX_JumpReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_JumpReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_Branch_flg), tmp) report "Value for EX_Pipe_Branch_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_Branch_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_BranchAddress_addr), tmp) report "Value for EX_Pipe_BranchAddress_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_BranchAddress_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_BranchNot_flg), tmp) report "Value for EX_Pipe_BranchNot_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_BranchNot_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_JALOut_val), tmp) report "Value for EX_Pipe_JALOut_val in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_JALOut_val) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_Jmp_flg), tmp) report "Value for EX_Pipe_Jmp_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_Jmp_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_JumpAddress_addr), tmp) report "Value for EX_Pipe_JumpAddress_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_JumpAddress_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_JumpReg_flg), tmp) report "Value for EX_Pipe_JumpReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_JumpReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_MemRead_flg), tmp) report "Value for EX_Pipe_MemRead_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_MemRead_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_MemToReg_flg), tmp) report "Value for EX_Pipe_MemToReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_MemToReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_MemWrite_flg), tmp) report "Value for EX_Pipe_MemWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_MemWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_OutputB_data), tmp) report "Value for EX_Pipe_OutputB_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_OutputB_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_RegWrite_flg), tmp) report "Value for EX_Pipe_RegWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_RegWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_RegWriteAddr_addr), tmp) report "Value for EX_Pipe_RegWriteAddr_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_RegWriteAddr_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Pipe_Zero_flg), tmp) report "Value for EX_Pipe_Zero_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Pipe_Zero_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_RegWriteAddr_addr), tmp) report "Value for EX_RegWriteAddr_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_RegWriteAddr_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Shift_flg), tmp) report "Value for EX_Shift_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Shift_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ShiftBranch_addr), tmp) report "Value for EX_ShiftBranch_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_ShiftBranch_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ShiftJump_addr), tmp) report "Value for EX_ShiftJump_addr in cycle " & integer'image(clockcycle) & " was: " & str(EX_ShiftJump_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_ShmtMuxOut_data), tmp) report "Value for EX_ShmtMuxOut_data in cycle " & integer'image(clockcycle) & " was: " & str(EX_ShmtMuxOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(EX_Zero_flg), tmp) report "Value for EX_Zero_flg in cycle " & integer'image(clockcycle) & " was: " & str(EX_Zero_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_Funcs'image(ID_ALUFunct_val), to_safe_name(tmp)) report "Value for ID_ALUFunct_val in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_Funcs'image(ID_ALUFunct_val) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_ALUOpcodes'image(ID_ALUOp_code), to_safe_name(tmp)) report "Value for ID_ALUOp_code in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_ALUOpcodes'image(ID_ALUOp_code) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_ALUSrc_flg), tmp) report "Value for ID_ALUSrc_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_ALUSrc_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Branch_flg), tmp) report "Value for ID_Branch_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Branch_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_BranchNot_flg), tmp) report "Value for ID_BranchNot_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_BranchNot_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_Opcodes'image(ID_ControlIn_opcode), to_safe_name(tmp)) report "Value for ID_ControlIn_opcode in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_Opcodes'image(ID_ControlIn_opcode) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Haz_Flush_flg), tmp) report "Value for ID_Haz_Flush_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Haz_Flush_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Haz_Stall_flg), tmp) report "Value for ID_Haz_Stall_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Haz_Stall_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_JAL_flg), tmp) report "Value for ID_JAL_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_JAL_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Jmp_flg), tmp) report "Value for ID_Jmp_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Jmp_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Jump_addr), tmp) report "Value for ID_Jump_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Jump_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_LogicalImmediate_flg), tmp) report "Value for ID_LogicalImmediate_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_LogicalImmediate_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_MemRead_flg), tmp) report "Value for ID_MemRead_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_MemRead_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_MemToReg_flg), tmp) report "Value for ID_MemToReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_MemToReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_MemWrite_flg), tmp) report "Value for ID_MemWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_MemWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_OutputA_data), tmp) report "Value for ID_OutputA_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_OutputA_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_OutputB_data), tmp) report "Value for ID_OutputB_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_OutputB_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_Funcs'image(ID_Pipe_ALUFunct_val), to_safe_name(tmp)) report "Value for ID_Pipe_ALUFunct_val in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_Funcs'image(ID_Pipe_ALUFunct_val) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(PipelinedMIPS_ALUOpcodes'image(ID_Pipe_ALUOp_code), to_safe_name(tmp)) report "Value for ID_Pipe_ALUOp_code in cycle " & integer'image(clockcycle) & " was: " & PipelinedMIPS_ALUOpcodes'image(ID_Pipe_ALUOp_code) & " but should have been: " & to_safe_name(truncate(tmp)) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_ALUSrc_flg), tmp) report "Value for ID_Pipe_ALUSrc_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_ALUSrc_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_Branch_flg), tmp) report "Value for ID_Pipe_Branch_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_Branch_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_BranchNot_flg), tmp) report "Value for ID_Pipe_BranchNot_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_BranchNot_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_IncrementerOut_addr), tmp) report "Value for ID_Pipe_IncrementerOut_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_IncrementerOut_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_JAL_flg), tmp) report "Value for ID_Pipe_JAL_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_JAL_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_Jmp_flg), tmp) report "Value for ID_Pipe_Jmp_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_Jmp_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_Jump_addr), tmp) report "Value for ID_Pipe_Jump_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_Jump_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_MemRead_flg), tmp) report "Value for ID_Pipe_MemRead_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_MemRead_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_MemToReg_flg), tmp) report "Value for ID_Pipe_MemToReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_MemToReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_MemWrite_flg), tmp) report "Value for ID_Pipe_MemWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_MemWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_OutputA_data), tmp) report "Value for ID_Pipe_OutputA_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_OutputA_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_OutputB_data), tmp) report "Value for ID_Pipe_OutputB_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_OutputB_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_ReadA_addr), tmp) report "Value for ID_Pipe_ReadA_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_ReadA_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_ReadB_addr), tmp) report "Value for ID_Pipe_ReadB_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_ReadB_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_RegWrite_flg), tmp) report "Value for ID_Pipe_RegWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_RegWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_Shamt_amount), tmp) report "Value for ID_Pipe_Shamt_amount in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_Shamt_amount) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_SignExtOut_data), tmp) report "Value for ID_Pipe_SignExtOut_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_SignExtOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Pipe_WriteDst_addr), tmp) report "Value for ID_Pipe_WriteDst_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_Pipe_WriteDst_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_ReadA_addr), tmp) report "Value for ID_ReadA_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_ReadA_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_ReadB_addr), tmp) report "Value for ID_ReadB_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_ReadB_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_RegDst_flg), tmp) report "Value for ID_RegDst_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_RegDst_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_RegDstMuxInput_rd), tmp) report "Value for ID_RegDstMuxInput_rd in cycle " & integer'image(clockcycle) & " was: " & str(ID_RegDstMuxInput_rd) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_RegDstMuxInput_rt), tmp) report "Value for ID_RegDstMuxInput_rt in cycle " & integer'image(clockcycle) & " was: " & str(ID_RegDstMuxInput_rt) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_RegWrite_flg), tmp) report "Value for ID_RegWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(ID_RegWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_Shamt_amount), tmp) report "Value for ID_Shamt_amount in cycle " & integer'image(clockcycle) & " was: " & str(ID_Shamt_amount) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_SignExtIn_data), tmp) report "Value for ID_SignExtIn_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_SignExtIn_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_SignExtOut_data), tmp) report "Value for ID_SignExtOut_data in cycle " & integer'image(clockcycle) & " was: " & str(ID_SignExtOut_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(ID_WriteDst_addr), tmp) report "Value for ID_WriteDst_addr in cycle " & integer'image(clockcycle) & " was: " & str(ID_WriteDst_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_Address_address), tmp) report "Value for IF_Address_address in cycle " & integer'image(clockcycle) & " was: " & str(IF_Address_address) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_IncrementerOut_address), tmp) report "Value for IF_IncrementerOut_address in cycle " & integer'image(clockcycle) & " was: " & str(IF_IncrementerOut_address) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_Instruction_instruction), tmp) report "Value for IF_Instruction_instruction in cycle " & integer'image(clockcycle) & " was: " & str(IF_Instruction_instruction) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_MuxIn_addr), tmp) report "Value for IF_MuxIn_addr in cycle " & integer'image(clockcycle) & " was: " & str(IF_MuxIn_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_PCIn_newAddress), tmp) report "Value for IF_PCIn_newAddress in cycle " & integer'image(clockcycle) & " was: " & str(IF_PCIn_newAddress) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_Pipe_IncrementerOut_addr), tmp) report "Value for IF_Pipe_IncrementerOut_addr in cycle " & integer'image(clockcycle) & " was: " & str(IF_Pipe_IncrementerOut_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(IF_Pipe_Instruction_instruction), tmp) report "Value for IF_Pipe_Instruction_instruction in cycle " & integer'image(clockcycle) & " was: " & str(IF_Pipe_Instruction_instruction) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpUnit_AndOut_flg), tmp) report "Value for JumpUnit_AndOut_flg in cycle " & integer'image(clockcycle) & " was: " & str(JumpUnit_AndOut_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpUnit_BranchCondition_flg), tmp) report "Value for JumpUnit_BranchCondition_flg in cycle " & integer'image(clockcycle) & " was: " & str(JumpUnit_BranchCondition_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(JumpUnit_PCSrc_flg), tmp) report "Value for JumpUnit_PCSrc_flg in cycle " & integer'image(clockcycle) & " was: " & str(JumpUnit_PCSrc_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_Pipe_JALOut_val), tmp) report "Value for MEM_Pipe_JALOut_val in cycle " & integer'image(clockcycle) & " was: " & str(MEM_Pipe_JALOut_val) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_Pipe_MemToReg_flg), tmp) report "Value for MEM_Pipe_MemToReg_flg in cycle " & integer'image(clockcycle) & " was: " & str(MEM_Pipe_MemToReg_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_Pipe_ReadData_data), tmp) report "Value for MEM_Pipe_ReadData_data in cycle " & integer'image(clockcycle) & " was: " & str(MEM_Pipe_ReadData_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_Pipe_RegWrite_flg), tmp) report "Value for MEM_Pipe_RegWrite_flg in cycle " & integer'image(clockcycle) & " was: " & str(MEM_Pipe_RegWrite_flg) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_Pipe_RegWriteAddr_addr), tmp) report "Value for MEM_Pipe_RegWriteAddr_addr in cycle " & integer'image(clockcycle) & " was: " & str(MEM_Pipe_RegWriteAddr_addr) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(MEM_ReadData_data), tmp) report "Value for MEM_ReadData_data in cycle " & integer'image(clockcycle) & " was: " & str(MEM_ReadData_data) & " but should have been: " & truncate(tmp) severity Error;
            end if;
            fieldno := fieldno + 1;

	        read_csv_field(L, tmp);
	        if not are_strings_equal(tmp, "U") then
            	assert are_strings_equal(str(WB_WriteData_data), tmp) report "Value for WB_WriteData_data in cycle " & integer'image(clockcycle) & " was: " & str(WB_WriteData_data) & " but should have been: " & truncate(tmp) severity Error;
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