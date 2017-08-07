library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

-- library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

entity PipelinedMIPS is
  port(


    -- Top-level bus ID_Pipe_OutputA signals
    ID_Pipe_OutputA_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Pipe_JALOut signals
    EX_Pipe_JALOut_val: inout T_SYSTEM_UINT32;

    -- Top-level bus WB_WriteData signals
    WB_WriteData_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Forw_ForwardA signals
    EX_Forw_ForwardA_selection: inout PipelinedMIPS_ForwardSelection;

    -- Top-level bus EX_ForwardA signals
    EX_ForwardA_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_OutputB signals
    ID_Pipe_OutputB_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Forw_ForwardB signals
    EX_Forw_ForwardB_selection: inout PipelinedMIPS_ForwardSelection;

    -- Top-level bus EX_ForwardB signals
    EX_ForwardB_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_ALUSrc signals
    ID_Pipe_ALUSrc_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_SignExtOut signals
    ID_Pipe_SignExtOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_ImmMuxOut signals
    EX_ImmMuxOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_JumpPacked signals
    EX_JumpPacked_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_JumpReg signals
    EX_JumpReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_JumpAddress signals
    EX_JumpAddress_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_ShiftJump signals
    EX_ShiftJump_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_IncrementerOut signals
    ID_Pipe_IncrementerOut_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_Jump signals
    ID_Pipe_Jump_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_Shamt signals
    ID_Pipe_Shamt_amount: inout T_SYSTEM_UINT8;

    -- Top-level bus EX_Shift signals
    EX_Shift_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_ShmtMuxOut signals
    EX_ShmtMuxOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_ShiftBranch signals
    EX_ShiftBranch_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_BranchAddress signals
    EX_BranchAddress_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_ALUOp signals
    ID_Pipe_ALUOp_code: inout PipelinedMIPS_ALUOpcodes;

    -- Top-level bus ID_Pipe_ALUFunct signals
    ID_Pipe_ALUFunct_val: inout PipelinedMIPS_Funcs;

    -- Top-level bus EX_ALUOperation signals
    EX_ALUOperation_code: inout PipelinedMIPS_ALUOps;

    -- Top-level bus EX_Zero signals
    EX_Zero_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_ALUResult signals
    EX_ALUResult_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_WriteDst signals
    ID_Pipe_WriteDst_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_Pipe_JAL signals
    ID_Pipe_JAL_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_RegWriteAddr signals
    EX_RegWriteAddr_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus EX_JALOut signals
    EX_JALOut_val: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Pipe_Branch signals
    ID_Pipe_Branch_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_BranchNot signals
    ID_Pipe_BranchNot_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_Jmp signals
    ID_Pipe_Jmp_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_MemRead signals
    ID_Pipe_MemRead_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_MemToReg signals
    ID_Pipe_MemToReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_MemWrite signals
    ID_Pipe_MemWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_RegWrite signals
    ID_Pipe_RegWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_Branch signals
    EX_Pipe_Branch_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_BranchAddress signals
    EX_Pipe_BranchAddress_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Pipe_BranchNot signals
    EX_Pipe_BranchNot_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_Jmp signals
    EX_Pipe_Jmp_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_JumpAddress signals
    EX_Pipe_JumpAddress_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Pipe_JumpReg signals
    EX_Pipe_JumpReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_MemRead signals
    EX_Pipe_MemRead_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_MemToReg signals
    EX_Pipe_MemToReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_MemWrite signals
    EX_Pipe_MemWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_OutputB signals
    EX_Pipe_OutputB_data: inout T_SYSTEM_UINT32;

    -- Top-level bus EX_Pipe_RegWrite signals
    EX_Pipe_RegWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus EX_Pipe_RegWriteAddr signals
    EX_Pipe_RegWriteAddr_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus EX_Pipe_Zero signals
    EX_Pipe_Zero_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus MEM_Pipe_RegWriteAddr signals
    MEM_Pipe_RegWriteAddr_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus MEM_Pipe_RegWrite signals
    MEM_Pipe_RegWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Pipe_ReadA signals
    ID_Pipe_ReadA_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_Pipe_ReadB signals
    ID_Pipe_ReadB_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus IF_Pipe_Instruction signals
    IF_Pipe_Instruction_instruction: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_ReadA signals
    ID_ReadA_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_ReadB signals
    ID_ReadB_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_SignExtIn signals
    ID_SignExtIn_data: inout T_SYSTEM_INT16;

    -- Top-level bus ID_ControlIn signals
    ID_ControlIn_opcode: inout PipelinedMIPS_Opcodes;

    -- Top-level bus ID_RegDstMuxInput signals
    ID_RegDstMuxInput_rt: inout T_SYSTEM_UINT8;
    ID_RegDstMuxInput_rd: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_ALUFunct signals
    ID_ALUFunct_val: inout PipelinedMIPS_Funcs;

    -- Top-level bus ID_Jump signals
    ID_Jump_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Shamt signals
    ID_Shamt_amount: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_RegDst signals
    ID_RegDst_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_WriteDst signals
    ID_WriteDst_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ID_LogicalImmediate signals
    ID_LogicalImmediate_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_SignExtOut signals
    ID_SignExtOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_Branch signals
    ID_Branch_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_MemRead signals
    ID_MemRead_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_MemToReg signals
    ID_MemToReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_ALUOp signals
    ID_ALUOp_code: inout PipelinedMIPS_ALUOpcodes;

    -- Top-level bus ID_MemWrite signals
    ID_MemWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_ALUSrc signals
    ID_ALUSrc_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_RegWrite signals
    ID_RegWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Jmp signals
    ID_Jmp_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_JAL signals
    ID_JAL_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_BranchNot signals
    ID_BranchNot_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus JumpUnit_PCSrc signals
    JumpUnit_PCSrc_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_Haz_Stall signals
    ID_Haz_Stall_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ID_OutputA signals
    ID_OutputA_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ID_OutputB signals
    ID_OutputB_data: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_Pipe_IncrementerOut signals
    IF_Pipe_IncrementerOut_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_PCIn signals
    IF_PCIn_newAddress: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_Address signals
    IF_Address_address: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_IncrementerOut signals
    IF_IncrementerOut_address: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_MuxIn signals
    IF_MuxIn_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus IF_Instruction signals
    IF_Instruction_instruction: inout T_SYSTEM_UINT32;

    -- Top-level bus DEBUG_SHUTDOWN signals
    DEBUG_SHUTDOWN_running: out T_SYSTEM_BOOL;

    -- Top-level bus MEM_ReadData signals
    MEM_ReadData_data: inout T_SYSTEM_UINT32;

    -- Top-level bus MEM_Pipe_JALOut signals
    MEM_Pipe_JALOut_val: inout T_SYSTEM_UINT32;

    -- Top-level bus MEM_Pipe_MemToReg signals
    MEM_Pipe_MemToReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus MEM_Pipe_ReadData signals
    MEM_Pipe_ReadData_data: inout T_SYSTEM_UINT32;

    -- Top-level bus JumpUnit_AndOut signals
    JumpUnit_AndOut_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus JumpUnit_BranchCondition signals
    JumpUnit_BranchCondition_flg: inout T_SYSTEM_BOOL;


    -- User defined signals here
    -- #### USER-DATA-ENTITYSIGNALS-START
    -- #### USER-DATA-ENTITYSIGNALS-END

	-- Reset signal
    RST : in Std_logic;

	-- Clock signal
	CLK : in Std_logic
  );
end PipelinedMIPS;

architecture RTL of PipelinedMIPS is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

  -- Internal wiring signals for clocked processes

begin


    -- Entity  EX_ForwardAMux signals
    EX_ForwardAMux: entity work.EX_ForwardAMux
    port map (
        -- Input bus ID_Pipe_OutputA
        ID_Pipe_OutputA_data => ID_Pipe_OutputA_data,


        -- Input bus EX_Pipe_JALOut
        EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,


        -- Input bus WB_WriteData
        WB_WriteData_data => WB_WriteData_data,


        -- Input bus EX_Forw_ForwardA
        EX_Forw_ForwardA_selection => EX_Forw_ForwardA_selection,


        -- Output bus EX_ForwardA
        EX_ForwardA_data => EX_ForwardA_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ForwardBMux signals
    EX_ForwardBMux: entity work.EX_ForwardBMux
    port map (
        -- Input bus ID_Pipe_OutputB
        ID_Pipe_OutputB_data => ID_Pipe_OutputB_data,


        -- Input bus EX_Pipe_JALOut
        EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,


        -- Input bus WB_WriteData
        WB_WriteData_data => WB_WriteData_data,


        -- Input bus EX_Forw_ForwardB
        EX_Forw_ForwardB_selection => EX_Forw_ForwardB_selection,


        -- Output bus EX_ForwardB
        EX_ForwardB_data => EX_ForwardB_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ImmMux signals
    EX_ImmMux: entity work.EX_ImmMux
    port map (
        -- Input bus ID_Pipe_ALUSrc
        ID_Pipe_ALUSrc_flg => ID_Pipe_ALUSrc_flg,


        -- Input bus EX_ForwardB
        EX_ForwardB_data => EX_ForwardB_data,


        -- Input bus ID_Pipe_SignExtOut
        ID_Pipe_SignExtOut_data => ID_Pipe_SignExtOut_data,


        -- Output bus EX_ImmMuxOut
        EX_ImmMuxOut_data => EX_ImmMuxOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_JumpJrMux signals
    EX_JumpJrMux: entity work.EX_JumpJrMux
    port map (
        -- Input bus EX_ForwardA
        EX_ForwardA_data => EX_ForwardA_data,


        -- Input bus EX_JumpPacked
        EX_JumpPacked_addr => EX_JumpPacked_addr,


        -- Input bus EX_JumpReg
        EX_JumpReg_flg => EX_JumpReg_flg,


        -- Output bus EX_JumpAddress
        EX_JumpAddress_addr => EX_JumpAddress_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_JumpPacker signals
    EX_JumpPacker: entity work.EX_JumpPacker
    port map (
        -- Input bus EX_ShiftJump
        EX_ShiftJump_addr => EX_ShiftJump_addr,


        -- Input bus ID_Pipe_IncrementerOut
        ID_Pipe_IncrementerOut_addr => ID_Pipe_IncrementerOut_addr,


        -- Output bus EX_JumpPacked
        EX_JumpPacked_addr => EX_JumpPacked_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_JumpShift signals
    EX_JumpShift: entity work.EX_JumpShift
    port map (
        -- Input bus ID_Pipe_Jump
        ID_Pipe_Jump_addr => ID_Pipe_Jump_addr,


        -- Output bus EX_ShiftJump
        EX_ShiftJump_addr => EX_ShiftJump_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ShmtMux signals
    EX_ShmtMux: entity work.EX_ShmtMux
    port map (
        -- Input bus ID_Pipe_Shamt
        ID_Pipe_Shamt_amount => ID_Pipe_Shamt_amount,


        -- Input bus EX_ForwardA
        EX_ForwardA_data => EX_ForwardA_data,


        -- Input bus EX_Shift
        EX_Shift_flg => EX_Shift_flg,


        -- Output bus EX_ShmtMuxOut
        EX_ShmtMuxOut_data => EX_ShmtMuxOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_BranchAdder signals
    EX_BranchAdder: entity work.EX_BranchAdder
    port map (
        -- Input bus EX_ShiftBranch
        EX_ShiftBranch_addr => EX_ShiftBranch_addr,


        -- Input bus ID_Pipe_IncrementerOut
        ID_Pipe_IncrementerOut_addr => ID_Pipe_IncrementerOut_addr,


        -- Output bus EX_BranchAddress
        EX_BranchAddress_addr => EX_BranchAddress_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_BranchShift signals
    EX_BranchShift: entity work.EX_BranchShift
    port map (
        -- Input bus ID_Pipe_SignExtOut
        ID_Pipe_SignExtOut_data => ID_Pipe_SignExtOut_data,


        -- Output bus EX_ShiftBranch
        EX_ShiftBranch_addr => EX_ShiftBranch_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ALUControl signals
    EX_ALUControl: entity work.EX_ALUControl
    port map (
        -- Input bus ID_Pipe_ALUOp
        ID_Pipe_ALUOp_code => ID_Pipe_ALUOp_code,


        -- Input bus ID_Pipe_ALUFunct
        ID_Pipe_ALUFunct_val => ID_Pipe_ALUFunct_val,


        -- Output bus EX_ALUOperation
        EX_ALUOperation_code => EX_ALUOperation_code,


        -- Output bus EX_JumpReg
        EX_JumpReg_flg => EX_JumpReg_flg,


        -- Output bus EX_Shift
        EX_Shift_flg => EX_Shift_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ALU signals
    EX_ALU: entity work.EX_ALU
    port map (
        -- Input bus EX_ShmtMuxOut
        EX_ShmtMuxOut_data => EX_ShmtMuxOut_data,


        -- Input bus EX_ImmMuxOut
        EX_ImmMuxOut_data => EX_ImmMuxOut_data,


        -- Input bus EX_ALUOperation
        EX_ALUOperation_code => EX_ALUOperation_code,


        -- Output bus EX_Zero
        EX_Zero_flg => EX_Zero_flg,


        -- Output bus EX_ALUResult
        EX_ALUResult_data => EX_ALUResult_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_JalMux signals
    EX_JalMux: entity work.EX_JalMux
    port map (
        -- Input bus ID_Pipe_WriteDst
        ID_Pipe_WriteDst_addr => ID_Pipe_WriteDst_addr,


        -- Input bus ID_Pipe_JAL
        ID_Pipe_JAL_flg => ID_Pipe_JAL_flg,


        -- Output bus EX_RegWriteAddr
        EX_RegWriteAddr_addr => EX_RegWriteAddr_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_JalUnit signals
    EX_JalUnit: entity work.EX_JalUnit
    port map (
        -- Input bus ID_Pipe_JAL
        ID_Pipe_JAL_flg => ID_Pipe_JAL_flg,


        -- Input bus ID_Pipe_IncrementerOut
        ID_Pipe_IncrementerOut_addr => ID_Pipe_IncrementerOut_addr,


        -- Input bus EX_ALUResult
        EX_ALUResult_data => EX_ALUResult_data,


        -- Output bus EX_JALOut
        EX_JALOut_val => EX_JALOut_val,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_Pipe signals
    EX_Pipe: entity work.EX_Pipe
    port map (
        -- Input bus ID_Pipe_Branch
        ID_Pipe_Branch_flg => ID_Pipe_Branch_flg,


        -- Input bus EX_BranchAddress
        EX_BranchAddress_addr => EX_BranchAddress_addr,


        -- Input bus ID_Pipe_BranchNot
        ID_Pipe_BranchNot_flg => ID_Pipe_BranchNot_flg,


        -- Input bus EX_JALOut
        EX_JALOut_val => EX_JALOut_val,


        -- Input bus ID_Pipe_Jmp
        ID_Pipe_Jmp_flg => ID_Pipe_Jmp_flg,


        -- Input bus EX_JumpAddress
        EX_JumpAddress_addr => EX_JumpAddress_addr,


        -- Input bus EX_JumpReg
        EX_JumpReg_flg => EX_JumpReg_flg,


        -- Input bus ID_Pipe_MemRead
        ID_Pipe_MemRead_flg => ID_Pipe_MemRead_flg,


        -- Input bus ID_Pipe_MemToReg
        ID_Pipe_MemToReg_flg => ID_Pipe_MemToReg_flg,


        -- Input bus ID_Pipe_MemWrite
        ID_Pipe_MemWrite_flg => ID_Pipe_MemWrite_flg,


        -- Input bus EX_ForwardB
        EX_ForwardB_data => EX_ForwardB_data,


        -- Input bus ID_Pipe_RegWrite
        ID_Pipe_RegWrite_flg => ID_Pipe_RegWrite_flg,


        -- Input bus EX_RegWriteAddr
        EX_RegWriteAddr_addr => EX_RegWriteAddr_addr,


        -- Input bus EX_Zero
        EX_Zero_flg => EX_Zero_flg,


        -- Input bus ID_Haz_Flush
        ID_Haz_Flush_flg => ID_Haz_Flush_flg,


        -- Output bus EX_Pipe_Branch
        EX_Pipe_Branch_flg => EX_Pipe_Branch_flg,


        -- Output bus EX_Pipe_BranchAddress
        EX_Pipe_BranchAddress_addr => EX_Pipe_BranchAddress_addr,


        -- Output bus EX_Pipe_BranchNot
        EX_Pipe_BranchNot_flg => EX_Pipe_BranchNot_flg,


        -- Output bus EX_Pipe_JALOut
        EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,


        -- Output bus EX_Pipe_Jmp
        EX_Pipe_Jmp_flg => EX_Pipe_Jmp_flg,


        -- Output bus EX_Pipe_JumpAddress
        EX_Pipe_JumpAddress_addr => EX_Pipe_JumpAddress_addr,


        -- Output bus EX_Pipe_JumpReg
        EX_Pipe_JumpReg_flg => EX_Pipe_JumpReg_flg,


        -- Output bus EX_Pipe_MemRead
        EX_Pipe_MemRead_flg => EX_Pipe_MemRead_flg,


        -- Output bus EX_Pipe_MemToReg
        EX_Pipe_MemToReg_flg => EX_Pipe_MemToReg_flg,


        -- Output bus EX_Pipe_MemWrite
        EX_Pipe_MemWrite_flg => EX_Pipe_MemWrite_flg,


        -- Output bus EX_Pipe_OutputB
        EX_Pipe_OutputB_data => EX_Pipe_OutputB_data,


        -- Output bus EX_Pipe_RegWrite
        EX_Pipe_RegWrite_flg => EX_Pipe_RegWrite_flg,


        -- Output bus EX_Pipe_RegWriteAddr
        EX_Pipe_RegWriteAddr_addr => EX_Pipe_RegWriteAddr_addr,


        -- Output bus EX_Pipe_Zero
        EX_Pipe_Zero_flg => EX_Pipe_Zero_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  EX_ForwardingUnit signals
    EX_ForwardingUnit: entity work.EX_ForwardingUnit
    port map (
        -- Input bus EX_Pipe_RegWriteAddr
        EX_Pipe_RegWriteAddr_addr => EX_Pipe_RegWriteAddr_addr,


        -- Input bus MEM_Pipe_RegWriteAddr
        MEM_Pipe_RegWriteAddr_addr => MEM_Pipe_RegWriteAddr_addr,


        -- Input bus EX_Pipe_RegWrite
        EX_Pipe_RegWrite_flg => EX_Pipe_RegWrite_flg,


        -- Input bus MEM_Pipe_RegWrite
        MEM_Pipe_RegWrite_flg => MEM_Pipe_RegWrite_flg,


        -- Input bus ID_Pipe_ReadA
        ID_Pipe_ReadA_addr => ID_Pipe_ReadA_addr,


        -- Input bus ID_Pipe_ReadB
        ID_Pipe_ReadB_addr => ID_Pipe_ReadB_addr,


        -- Output bus EX_Forw_ForwardA
        EX_Forw_ForwardA_selection => EX_Forw_ForwardA_selection,


        -- Output bus EX_Forw_ForwardB
        EX_Forw_ForwardB_selection => EX_Forw_ForwardB_selection,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_Splitter signals
    ID_Splitter: entity work.ID_Splitter
    port map (
        -- Input bus IF_Pipe_Instruction
        IF_Pipe_Instruction_instruction => IF_Pipe_Instruction_instruction,


        -- Output bus ID_ReadA
        ID_ReadA_addr => ID_ReadA_addr,


        -- Output bus ID_ReadB
        ID_ReadB_addr => ID_ReadB_addr,


        -- Output bus ID_SignExtIn
        ID_SignExtIn_data => ID_SignExtIn_data,


        -- Output bus ID_ControlIn
        ID_ControlIn_opcode => ID_ControlIn_opcode,


        -- Output bus ID_RegDstMuxInput
        ID_RegDstMuxInput_rd => ID_RegDstMuxInput_rd,
        ID_RegDstMuxInput_rt => ID_RegDstMuxInput_rt,


        -- Output bus ID_ALUFunct
        ID_ALUFunct_val => ID_ALUFunct_val,


        -- Output bus ID_Jump
        ID_Jump_addr => ID_Jump_addr,


        -- Output bus ID_Shamt
        ID_Shamt_amount => ID_Shamt_amount,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_RegDstMux signals
    ID_RegDstMux: entity work.ID_RegDstMux
    port map (
        -- Input bus ID_RegDst
        ID_RegDst_flg => ID_RegDst_flg,


        -- Input bus ID_RegDstMuxInput
        ID_RegDstMuxInput_rt => ID_RegDstMuxInput_rt,
        ID_RegDstMuxInput_rd => ID_RegDstMuxInput_rd,


        -- Output bus ID_WriteDst
        ID_WriteDst_addr => ID_WriteDst_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_SignExtend signals
    ID_SignExtend: entity work.ID_SignExtend
    port map (
        -- Input bus ID_SignExtIn
        ID_SignExtIn_data => ID_SignExtIn_data,


        -- Input bus ID_LogicalImmediate
        ID_LogicalImmediate_flg => ID_LogicalImmediate_flg,


        -- Output bus ID_SignExtOut
        ID_SignExtOut_data => ID_SignExtOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_Control signals
    ID_Control: entity work.ID_Control
    port map (
        -- Input bus ID_ControlIn
        ID_ControlIn_opcode => ID_ControlIn_opcode,


        -- Output bus ID_RegDst
        ID_RegDst_flg => ID_RegDst_flg,


        -- Output bus ID_Branch
        ID_Branch_flg => ID_Branch_flg,


        -- Output bus ID_MemRead
        ID_MemRead_flg => ID_MemRead_flg,


        -- Output bus ID_MemToReg
        ID_MemToReg_flg => ID_MemToReg_flg,


        -- Output bus ID_ALUOp
        ID_ALUOp_code => ID_ALUOp_code,


        -- Output bus ID_MemWrite
        ID_MemWrite_flg => ID_MemWrite_flg,


        -- Output bus ID_ALUSrc
        ID_ALUSrc_flg => ID_ALUSrc_flg,


        -- Output bus ID_RegWrite
        ID_RegWrite_flg => ID_RegWrite_flg,


        -- Output bus ID_Jmp
        ID_Jmp_flg => ID_Jmp_flg,


        -- Output bus ID_JAL
        ID_JAL_flg => ID_JAL_flg,


        -- Output bus ID_LogicalImmediate
        ID_LogicalImmediate_flg => ID_LogicalImmediate_flg,


        -- Output bus ID_BranchNot
        ID_BranchNot_flg => ID_BranchNot_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_HazardUnit signals
    ID_HazardUnit: entity work.ID_HazardUnit
    port map (
        -- Input bus ID_Pipe_WriteDst
        ID_Pipe_WriteDst_addr => ID_Pipe_WriteDst_addr,


        -- Input bus ID_Pipe_MemRead
        ID_Pipe_MemRead_flg => ID_Pipe_MemRead_flg,


        -- Input bus ID_ReadA
        ID_ReadA_addr => ID_ReadA_addr,


        -- Input bus ID_ReadB
        ID_ReadB_addr => ID_ReadB_addr,


        -- Input bus JumpUnit_PCSrc
        JumpUnit_PCSrc_flg => JumpUnit_PCSrc_flg,


        -- Output bus ID_Haz_Flush
        ID_Haz_Flush_flg => ID_Haz_Flush_flg,


        -- Output bus ID_Haz_Stall
        ID_Haz_Stall_flg => ID_Haz_Stall_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_Register signals
    ID_Register: entity work.ID_Register
    port map (
        -- Input bus ID_ReadA
        ID_ReadA_addr => ID_ReadA_addr,


        -- Input bus ID_ReadB
        ID_ReadB_addr => ID_ReadB_addr,


        -- Input bus MEM_Pipe_RegWrite
        MEM_Pipe_RegWrite_flg => MEM_Pipe_RegWrite_flg,


        -- Input bus MEM_Pipe_RegWriteAddr
        MEM_Pipe_RegWriteAddr_addr => MEM_Pipe_RegWriteAddr_addr,


        -- Input bus WB_WriteData
        WB_WriteData_data => WB_WriteData_data,


        -- Output bus ID_OutputA
        ID_OutputA_data => ID_OutputA_data,


        -- Output bus ID_OutputB
        ID_OutputB_data => ID_OutputB_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ID_Pipe signals
    ID_Pipe: entity work.ID_Pipe
    port map (
        -- Input bus ID_OutputA
        ID_OutputA_data => ID_OutputA_data,


        -- Input bus ID_OutputB
        ID_OutputB_data => ID_OutputB_data,


        -- Input bus ID_SignExtOut
        ID_SignExtOut_data => ID_SignExtOut_data,


        -- Input bus IF_Pipe_IncrementerOut
        IF_Pipe_IncrementerOut_addr => IF_Pipe_IncrementerOut_addr,


        -- Input bus ID_Jump
        ID_Jump_addr => ID_Jump_addr,


        -- Input bus ID_Shamt
        ID_Shamt_amount => ID_Shamt_amount,


        -- Input bus ID_WriteDst
        ID_WriteDst_addr => ID_WriteDst_addr,


        -- Input bus ID_ALUFunct
        ID_ALUFunct_val => ID_ALUFunct_val,


        -- Input bus ID_RegWrite
        ID_RegWrite_flg => ID_RegWrite_flg,


        -- Input bus ID_ALUOp
        ID_ALUOp_code => ID_ALUOp_code,


        -- Input bus ID_ALUSrc
        ID_ALUSrc_flg => ID_ALUSrc_flg,


        -- Input bus ID_Branch
        ID_Branch_flg => ID_Branch_flg,


        -- Input bus ID_Jmp
        ID_Jmp_flg => ID_Jmp_flg,


        -- Input bus ID_JAL
        ID_JAL_flg => ID_JAL_flg,


        -- Input bus ID_BranchNot
        ID_BranchNot_flg => ID_BranchNot_flg,


        -- Input bus ID_MemRead
        ID_MemRead_flg => ID_MemRead_flg,


        -- Input bus ID_MemWrite
        ID_MemWrite_flg => ID_MemWrite_flg,


        -- Input bus ID_MemToReg
        ID_MemToReg_flg => ID_MemToReg_flg,


        -- Input bus ID_ReadA
        ID_ReadA_addr => ID_ReadA_addr,


        -- Input bus ID_ReadB
        ID_ReadB_addr => ID_ReadB_addr,


        -- Input bus ID_Haz_Stall
        ID_Haz_Stall_flg => ID_Haz_Stall_flg,


        -- Input bus ID_Haz_Flush
        ID_Haz_Flush_flg => ID_Haz_Flush_flg,


        -- Output bus ID_Pipe_OutputA
        ID_Pipe_OutputA_data => ID_Pipe_OutputA_data,


        -- Output bus ID_Pipe_OutputB
        ID_Pipe_OutputB_data => ID_Pipe_OutputB_data,


        -- Output bus ID_Pipe_SignExtOut
        ID_Pipe_SignExtOut_data => ID_Pipe_SignExtOut_data,


        -- Output bus ID_Pipe_IncrementerOut
        ID_Pipe_IncrementerOut_addr => ID_Pipe_IncrementerOut_addr,


        -- Output bus ID_Pipe_Jump
        ID_Pipe_Jump_addr => ID_Pipe_Jump_addr,


        -- Output bus ID_Pipe_Shamt
        ID_Pipe_Shamt_amount => ID_Pipe_Shamt_amount,


        -- Output bus ID_Pipe_WriteDst
        ID_Pipe_WriteDst_addr => ID_Pipe_WriteDst_addr,


        -- Output bus ID_Pipe_ALUFunct
        ID_Pipe_ALUFunct_val => ID_Pipe_ALUFunct_val,


        -- Output bus ID_Pipe_RegWrite
        ID_Pipe_RegWrite_flg => ID_Pipe_RegWrite_flg,


        -- Output bus ID_Pipe_ALUOp
        ID_Pipe_ALUOp_code => ID_Pipe_ALUOp_code,


        -- Output bus ID_Pipe_ALUSrc
        ID_Pipe_ALUSrc_flg => ID_Pipe_ALUSrc_flg,


        -- Output bus ID_Pipe_Branch
        ID_Pipe_Branch_flg => ID_Pipe_Branch_flg,


        -- Output bus ID_Pipe_Jmp
        ID_Pipe_Jmp_flg => ID_Pipe_Jmp_flg,


        -- Output bus ID_Pipe_JAL
        ID_Pipe_JAL_flg => ID_Pipe_JAL_flg,


        -- Output bus ID_Pipe_BranchNot
        ID_Pipe_BranchNot_flg => ID_Pipe_BranchNot_flg,


        -- Output bus ID_Pipe_MemRead
        ID_Pipe_MemRead_flg => ID_Pipe_MemRead_flg,


        -- Output bus ID_Pipe_MemWrite
        ID_Pipe_MemWrite_flg => ID_Pipe_MemWrite_flg,


        -- Output bus ID_Pipe_MemToReg
        ID_Pipe_MemToReg_flg => ID_Pipe_MemToReg_flg,


        -- Output bus ID_Pipe_ReadA
        ID_Pipe_ReadA_addr => ID_Pipe_ReadA_addr,


        -- Output bus ID_Pipe_ReadB
        ID_Pipe_ReadB_addr => ID_Pipe_ReadB_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  IF_PC signals
    IF_PC: entity work.IF_PC
    port map (
        -- Input bus IF_PCIn
        IF_PCIn_newAddress => IF_PCIn_newAddress,


        -- Input bus ID_Haz_Stall
        ID_Haz_Stall_flg => ID_Haz_Stall_flg,


        -- Input bus ID_Haz_Flush
        ID_Haz_Flush_flg => ID_Haz_Flush_flg,


        -- Output bus IF_Address
        IF_Address_address => IF_Address_address,


        RST => RST,
        CLK => CLK
    );


    -- Entity  IF_PCSrcMux signals
    IF_PCSrcMux: entity work.IF_PCSrcMux
    port map (
        -- Input bus IF_IncrementerOut
        IF_IncrementerOut_address => IF_IncrementerOut_address,


        -- Input bus IF_MuxIn
        IF_MuxIn_addr => IF_MuxIn_addr,


        -- Input bus JumpUnit_PCSrc
        JumpUnit_PCSrc_flg => JumpUnit_PCSrc_flg,


        -- Output bus IF_PCIn
        IF_PCIn_newAddress => IF_PCIn_newAddress,


        RST => RST,
        CLK => CLK
    );


    -- Entity  IF_Incrementer signals
    IF_Incrementer: entity work.IF_Incrementer
    port map (
        -- Input bus IF_Address
        IF_Address_address => IF_Address_address,


        -- Output bus IF_IncrementerOut
        IF_IncrementerOut_address => IF_IncrementerOut_address,


        RST => RST,
        CLK => CLK
    );


    -- Entity  IF_InstructionMemory signals
    IF_InstructionMemory: entity work.IF_InstructionMemory
    port map (
        -- Input bus IF_Address
        IF_Address_address => IF_Address_address,


        -- Output bus IF_Instruction
        IF_Instruction_instruction => IF_Instruction_instruction,


        -- Output bus DEBUG_SHUTDOWN
        DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,


        RST => RST,
        CLK => CLK
    );


    -- Entity  IF_Pipe signals
    IF_Pipe: entity work.IF_Pipe
    port map (
        -- Input bus IF_IncrementerOut
        IF_IncrementerOut_address => IF_IncrementerOut_address,


        -- Input bus IF_Instruction
        IF_Instruction_instruction => IF_Instruction_instruction,


        -- Input bus ID_Haz_Stall
        ID_Haz_Stall_flg => ID_Haz_Stall_flg,


        -- Input bus ID_Haz_Flush
        ID_Haz_Flush_flg => ID_Haz_Flush_flg,


        -- Output bus IF_Pipe_IncrementerOut
        IF_Pipe_IncrementerOut_addr => IF_Pipe_IncrementerOut_addr,


        -- Output bus IF_Pipe_Instruction
        IF_Pipe_Instruction_instruction => IF_Pipe_Instruction_instruction,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_Memory signals
    MEM_Memory: entity work.MEM_Memory
    port map (
        -- Input bus EX_Pipe_MemWrite
        EX_Pipe_MemWrite_flg => EX_Pipe_MemWrite_flg,


        -- Input bus EX_Pipe_MemRead
        EX_Pipe_MemRead_flg => EX_Pipe_MemRead_flg,


        -- Input bus EX_Pipe_JALOut
        EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,


        -- Input bus EX_Pipe_OutputB
        EX_Pipe_OutputB_data => EX_Pipe_OutputB_data,


        -- Output bus MEM_ReadData
        MEM_ReadData_data => MEM_ReadData_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_Pipe signals
    MEM_Pipe: entity work.MEM_Pipe
    port map (
        -- Input bus EX_Pipe_JALOut
        EX_Pipe_JALOut_val => EX_Pipe_JALOut_val,


        -- Input bus EX_Pipe_MemToReg
        EX_Pipe_MemToReg_flg => EX_Pipe_MemToReg_flg,


        -- Input bus MEM_ReadData
        MEM_ReadData_data => MEM_ReadData_data,


        -- Input bus EX_Pipe_RegWrite
        EX_Pipe_RegWrite_flg => EX_Pipe_RegWrite_flg,


        -- Input bus EX_Pipe_RegWriteAddr
        EX_Pipe_RegWriteAddr_addr => EX_Pipe_RegWriteAddr_addr,


        -- Output bus MEM_Pipe_JALOut
        MEM_Pipe_JALOut_val => MEM_Pipe_JALOut_val,


        -- Output bus MEM_Pipe_MemToReg
        MEM_Pipe_MemToReg_flg => MEM_Pipe_MemToReg_flg,


        -- Output bus MEM_Pipe_ReadData
        MEM_Pipe_ReadData_data => MEM_Pipe_ReadData_data,


        -- Output bus MEM_Pipe_RegWrite
        MEM_Pipe_RegWrite_flg => MEM_Pipe_RegWrite_flg,


        -- Output bus MEM_Pipe_RegWriteAddr
        MEM_Pipe_RegWriteAddr_addr => MEM_Pipe_RegWriteAddr_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_BranchOrJumpMux signals
    MEM_BranchOrJumpMux: entity work.MEM_BranchOrJumpMux
    port map (
        -- Input bus EX_Pipe_JumpAddress
        EX_Pipe_JumpAddress_addr => EX_Pipe_JumpAddress_addr,


        -- Input bus EX_Pipe_BranchAddress
        EX_Pipe_BranchAddress_addr => EX_Pipe_BranchAddress_addr,


        -- Input bus JumpUnit_AndOut
        JumpUnit_AndOut_flg => JumpUnit_AndOut_flg,


        -- Output bus IF_MuxIn
        IF_MuxIn_addr => IF_MuxIn_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_Jump_Or signals
    MEM_Jump_Or: entity work.MEM_Jump_Or
    port map (
        -- Input bus EX_Pipe_Jmp
        EX_Pipe_Jmp_flg => EX_Pipe_Jmp_flg,


        -- Input bus EX_Pipe_JumpReg
        EX_Pipe_JumpReg_flg => EX_Pipe_JumpReg_flg,


        -- Input bus JumpUnit_AndOut
        JumpUnit_AndOut_flg => JumpUnit_AndOut_flg,


        -- Output bus JumpUnit_PCSrc
        JumpUnit_PCSrc_flg => JumpUnit_PCSrc_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_Jump_Condition signals
    MEM_Jump_Condition: entity work.MEM_Jump_Condition
    port map (
        -- Input bus EX_Pipe_Zero
        EX_Pipe_Zero_flg => EX_Pipe_Zero_flg,


        -- Input bus EX_Pipe_BranchNot
        EX_Pipe_BranchNot_flg => EX_Pipe_BranchNot_flg,


        -- Output bus JumpUnit_BranchCondition
        JumpUnit_BranchCondition_flg => JumpUnit_BranchCondition_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MEM_Jump_And signals
    MEM_Jump_And: entity work.MEM_Jump_And
    port map (
        -- Input bus EX_Pipe_Branch
        EX_Pipe_Branch_flg => EX_Pipe_Branch_flg,


        -- Input bus JumpUnit_BranchCondition
        JumpUnit_BranchCondition_flg => JumpUnit_BranchCondition_flg,


        -- Output bus JumpUnit_AndOut
        JumpUnit_AndOut_flg => JumpUnit_AndOut_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  WB_MemMux signals
    WB_MemMux: entity work.WB_MemMux
    port map (
        -- Input bus MEM_Pipe_ReadData
        MEM_Pipe_ReadData_data => MEM_Pipe_ReadData_data,


        -- Input bus MEM_Pipe_JALOut
        MEM_Pipe_JALOut_val => MEM_Pipe_JALOut_val,


        -- Input bus MEM_Pipe_MemToReg
        MEM_Pipe_MemToReg_flg => MEM_Pipe_MemToReg_flg,


        -- Output bus WB_WriteData
        WB_WriteData_data => WB_WriteData_data,


        RST => RST,
        CLK => CLK
    );


    -- Propagate all feedback signals immediately

    -- Propagate all clocked and feedback signals
    process(
        CLK,
        RST)
    begin
        if RST = '1' then
        elsif rising_edge(CLK) then


        end if;
    end process;

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;