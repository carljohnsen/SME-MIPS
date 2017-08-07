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

entity SingleCycleMIPS is
  port(


    -- Top-level bus Instruction signals
    Instruction_instruction: inout T_SYSTEM_UINT32;

    -- Top-level bus ReadA signals
    ReadA_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ReadB signals
    ReadB_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus SignExtIn signals
    SignExtIn_data: inout T_SYSTEM_INT16;

    -- Top-level bus ControlIn signals
    ControlIn_opcode: inout SingleCycleMIPS_Opcodes;

    -- Top-level bus MuxInput signals
    MuxInput_rt: inout T_SYSTEM_UINT8;
    MuxInput_rd: inout T_SYSTEM_UINT8;

    -- Top-level bus ALUFunct signals
    ALUFunct_val: inout SingleCycleMIPS_Funcs;

    -- Top-level bus JumpInstruction signals
    JumpInstruction_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus Shamt signals
    Shamt_amount: inout T_SYSTEM_UINT8;

    -- Top-level bus RegDst signals
    RegDst_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus MuxOutput signals
    MuxOutput_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus LogicalImmediate signals
    LogicalImmediate_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus SignExtOut signals
    SignExtOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus Branch signals
    Branch_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus MemRead signals
    MemRead_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus MemToReg signals
    MemToReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ALUOp signals
    ALUOp_code: inout SingleCycleMIPS_ALUOpcodes;

    -- Top-level bus MemWrite signals
    MemWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ALUSrc signals
    ALUSrc_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus RegWrite signals
    RegWrite_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus Jump signals
    Jump_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus JAL signals
    JAL_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus BranchNot signals
    BranchNot_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus WriteEnabled signals
    WriteEnabled_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus WriteAddr signals
    WriteAddr_val: inout T_SYSTEM_UINT8;

    -- Top-level bus WriteData signals
    WriteData_data: inout T_SYSTEM_UINT32;

    -- Top-level bus OutputA signals
    OutputA_data: inout T_SYSTEM_UINT32;

    -- Top-level bus OutputB signals
    OutputB_data: inout T_SYSTEM_UINT32;

    -- Top-level bus PCIn signals
    PCIn_newAddress: inout T_SYSTEM_UINT32;

    -- Top-level bus Address signals
    Address_address: inout T_SYSTEM_UINT32;

    -- Top-level bus IncrementerOut signals
    IncrementerOut_address: inout T_SYSTEM_UINT32;

    -- Top-level bus DEBUG_SHUTDOWN signals
    DEBUG_SHUTDOWN_running: out T_SYSTEM_BOOL;

    -- Top-level bus JALOut signals
    JALOut_val: inout T_SYSTEM_UINT32;

    -- Top-level bus ReadData signals
    ReadData_data: inout T_SYSTEM_UINT32;

    -- Top-level bus MemOut signals
    MemOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ImmMuxOut signals
    ImmMuxOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus Shift signals
    Shift_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ShmtMuxOut signals
    ShmtMuxOut_data: inout T_SYSTEM_UINT32;

    -- Top-level bus ALUOperation signals
    ALUOperation_code: inout SingleCycleMIPS_ALUOps;

    -- Top-level bus JumpReg signals
    JumpReg_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus Zero signals
    Zero_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus ALUResult signals
    ALUResult_data: inout T_SYSTEM_UINT32;

    -- Top-level bus RegWriteAddr signals
    RegWriteAddr_addr: inout T_SYSTEM_UINT8;

    -- Top-level bus ShiftBranch signals
    ShiftBranch_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus AdderOut signals
    AdderOut_address: inout T_SYSTEM_UINT32;

    -- Top-level bus AndOut signals
    AndOut_flg: inout T_SYSTEM_BOOL;

    -- Top-level bus Mux0Out signals
    Mux0Out_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus JumpAddr signals
    JumpAddr_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus ShiftJump signals
    ShiftJump_addr: inout T_SYSTEM_UINT32;

    -- Top-level bus Mux2Out signals
    Mux2Out_addr: inout T_SYSTEM_UINT32;


    -- User defined signals here
    -- #### USER-DATA-ENTITYSIGNALS-START
    -- #### USER-DATA-ENTITYSIGNALS-END

	-- Reset signal
    RST : in Std_logic;

	-- Clock signal
	CLK : in Std_logic
  );
end SingleCycleMIPS;

architecture RTL of SingleCycleMIPS is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

  -- Internal wiring signals for clocked processes

begin


    -- Entity  Splitter signals
    Splitter: entity work.Splitter
    port map (
        -- Input bus Instruction
        Instruction_instruction => Instruction_instruction,


        -- Output bus ReadA
        ReadA_addr => ReadA_addr,


        -- Output bus ReadB
        ReadB_addr => ReadB_addr,


        -- Output bus SignExtIn
        SignExtIn_data => SignExtIn_data,


        -- Output bus ControlIn
        ControlIn_opcode => ControlIn_opcode,


        -- Output bus MuxInput
        MuxInput_rd => MuxInput_rd,
        MuxInput_rt => MuxInput_rt,


        -- Output bus ALUFunct
        ALUFunct_val => ALUFunct_val,


        -- Output bus JumpInstruction
        JumpInstruction_addr => JumpInstruction_addr,


        -- Output bus Shamt
        Shamt_amount => Shamt_amount,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Mux signals
    Mux: entity work.Mux
    port map (
        -- Input bus RegDst
        RegDst_flg => RegDst_flg,


        -- Input bus MuxInput
        MuxInput_rt => MuxInput_rt,
        MuxInput_rd => MuxInput_rd,


        -- Output bus MuxOutput
        MuxOutput_addr => MuxOutput_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  SignExtend signals
    SignExtend: entity work.SignExtend
    port map (
        -- Input bus SignExtIn
        SignExtIn_data => SignExtIn_data,


        -- Input bus LogicalImmediate
        LogicalImmediate_flg => LogicalImmediate_flg,


        -- Output bus SignExtOut
        SignExtOut_data => SignExtOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Control signals
    Control: entity work.Control
    port map (
        -- Input bus ControlIn
        ControlIn_opcode => ControlIn_opcode,


        -- Output bus RegDst
        RegDst_flg => RegDst_flg,


        -- Output bus Branch
        Branch_flg => Branch_flg,


        -- Output bus MemRead
        MemRead_flg => MemRead_flg,


        -- Output bus MemToReg
        MemToReg_flg => MemToReg_flg,


        -- Output bus ALUOp
        ALUOp_code => ALUOp_code,


        -- Output bus MemWrite
        MemWrite_flg => MemWrite_flg,


        -- Output bus ALUSrc
        ALUSrc_flg => ALUSrc_flg,


        -- Output bus RegWrite
        RegWrite_flg => RegWrite_flg,


        -- Output bus Jump
        Jump_flg => Jump_flg,


        -- Output bus JAL
        JAL_flg => JAL_flg,


        -- Output bus LogicalImmediate
        LogicalImmediate_flg => LogicalImmediate_flg,


        -- Output bus BranchNot
        BranchNot_flg => BranchNot_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  vhdl_Register signals
    vhdl_Register: entity work.vhdl_Register
    port map (
        -- Input bus ReadA
        ReadA_addr => ReadA_addr,


        -- Input bus ReadB
        ReadB_addr => ReadB_addr,


        -- Input bus WriteEnabled
        WriteEnabled_flg => WriteEnabled_flg,


        -- Input bus WriteAddr
        WriteAddr_val => WriteAddr_val,


        -- Input bus WriteData
        WriteData_data => WriteData_data,


        -- Output bus OutputA
        OutputA_data => OutputA_data,


        -- Output bus OutputB
        OutputB_data => OutputB_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  PC signals
    PC: entity work.PC
    port map (
        -- Input bus PCIn
        PCIn_newAddress => PCIn_newAddress,


        -- Output bus Address
        Address_address => Address_address,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Incrementer signals
    Incrementer: entity work.Incrementer
    port map (
        -- Input bus Address
        Address_address => Address_address,


        -- Output bus IncrementerOut
        IncrementerOut_address => IncrementerOut_address,


        RST => RST,
        CLK => CLK
    );


    -- Entity  InstructionMemory signals
    InstructionMemory: entity work.InstructionMemory
    port map (
        -- Input bus Address
        Address_address => Address_address,


        -- Output bus Instruction
        Instruction_instruction => Instruction_instruction,


        -- Output bus DEBUG_SHUTDOWN
        DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Memory signals
    Memory: entity work.Memory
    port map (
        -- Input bus MemWrite
        MemWrite_flg => MemWrite_flg,


        -- Input bus MemRead
        MemRead_flg => MemRead_flg,


        -- Input bus JALOut
        JALOut_val => JALOut_val,


        -- Input bus OutputB
        OutputB_data => OutputB_data,


        -- Output bus ReadData
        ReadData_data => ReadData_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  MemMux signals
    MemMux: entity work.MemMux
    port map (
        -- Input bus ReadData
        ReadData_data => ReadData_data,


        -- Input bus JALOut
        JALOut_val => JALOut_val,


        -- Input bus MemToReg
        MemToReg_flg => MemToReg_flg,


        -- Output bus MemOut
        MemOut_data => MemOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ImmMux signals
    ImmMux: entity work.ImmMux
    port map (
        -- Input bus ALUSrc
        ALUSrc_flg => ALUSrc_flg,


        -- Input bus OutputB
        OutputB_data => OutputB_data,


        -- Input bus SignExtOut
        SignExtOut_data => SignExtOut_data,


        -- Output bus ImmMuxOut
        ImmMuxOut_data => ImmMuxOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ShmtMux signals
    ShmtMux: entity work.ShmtMux
    port map (
        -- Input bus Shamt
        Shamt_amount => Shamt_amount,


        -- Input bus OutputA
        OutputA_data => OutputA_data,


        -- Input bus Shift
        Shift_flg => Shift_flg,


        -- Output bus ShmtMuxOut
        ShmtMuxOut_data => ShmtMuxOut_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ALUControl signals
    ALUControl: entity work.ALUControl
    port map (
        -- Input bus ALUOp
        ALUOp_code => ALUOp_code,


        -- Input bus ALUFunct
        ALUFunct_val => ALUFunct_val,


        -- Output bus ALUOperation
        ALUOperation_code => ALUOperation_code,


        -- Output bus JumpReg
        JumpReg_flg => JumpReg_flg,


        -- Output bus Shift
        Shift_flg => Shift_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ALU signals
    ALU: entity work.ALU
    port map (
        -- Input bus ShmtMuxOut
        ShmtMuxOut_data => ShmtMuxOut_data,


        -- Input bus ImmMuxOut
        ImmMuxOut_data => ImmMuxOut_data,


        -- Input bus ALUOperation
        ALUOperation_code => ALUOperation_code,


        -- Output bus Zero
        Zero_flg => Zero_flg,


        -- Output bus ALUResult
        ALUResult_data => ALUResult_data,


        RST => RST,
        CLK => CLK
    );


    -- Entity  JalMux signals
    JalMux: entity work.JalMux
    port map (
        -- Input bus MuxOutput
        MuxOutput_addr => MuxOutput_addr,


        -- Input bus JAL
        JAL_flg => JAL_flg,


        -- Output bus RegWriteAddr
        RegWriteAddr_addr => RegWriteAddr_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  JalUnit signals
    JalUnit: entity work.JalUnit
    port map (
        -- Input bus JAL
        JAL_flg => JAL_flg,


        -- Input bus IncrementerOut
        IncrementerOut_address => IncrementerOut_address,


        -- Input bus ALUResult
        ALUResult_data => ALUResult_data,


        -- Output bus JALOut
        JALOut_val => JALOut_val,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Adder signals
    Adder: entity work.Adder
    port map (
        -- Input bus ShiftBranch
        ShiftBranch_addr => ShiftBranch_addr,


        -- Input bus IncrementerOut
        IncrementerOut_address => IncrementerOut_address,


        -- Output bus AdderOut
        AdderOut_address => AdderOut_address,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Mux0 signals
    Mux0: entity work.Mux0
    port map (
        -- Input bus AdderOut
        AdderOut_address => AdderOut_address,


        -- Input bus IncrementerOut
        IncrementerOut_address => IncrementerOut_address,


        -- Input bus AndOut
        AndOut_flg => AndOut_flg,


        -- Output bus Mux0Out
        Mux0Out_addr => Mux0Out_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Mux1 signals
    Mux1: entity work.Mux1
    port map (
        -- Input bus JumpAddr
        JumpAddr_addr => JumpAddr_addr,


        -- Input bus Mux0Out
        Mux0Out_addr => Mux0Out_addr,


        -- Input bus Jump
        Jump_flg => Jump_flg,


        -- Input bus JumpReg
        JumpReg_flg => JumpReg_flg,


        -- Output bus PCIn
        PCIn_newAddress => PCIn_newAddress,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Mux2 signals
    Mux2: entity work.Mux2
    port map (
        -- Input bus OutputA
        OutputA_data => OutputA_data,


        -- Input bus ShiftJump
        ShiftJump_addr => ShiftJump_addr,


        -- Input bus JumpReg
        JumpReg_flg => JumpReg_flg,


        -- Output bus Mux2Out
        Mux2Out_addr => Mux2Out_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  ShiftB signals
    ShiftB: entity work.ShiftB
    port map (
        -- Input bus SignExtOut
        SignExtOut_data => SignExtOut_data,


        -- Output bus ShiftBranch
        ShiftBranch_addr => ShiftBranch_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  shiftJ signals
    shiftJ: entity work.shiftJ
    port map (
        -- Input bus JumpInstruction
        JumpInstruction_addr => JumpInstruction_addr,


        -- Output bus ShiftJump
        ShiftJump_addr => ShiftJump_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  Packer signals
    Packer: entity work.Packer
    port map (
        -- Input bus Mux2Out
        Mux2Out_addr => Mux2Out_addr,


        -- Input bus IncrementerOut
        IncrementerOut_address => IncrementerOut_address,


        -- Output bus JumpAddr
        JumpAddr_addr => JumpAddr_addr,


        RST => RST,
        CLK => CLK
    );


    -- Entity  AndGate signals
    AndGate: entity work.AndGate
    port map (
        -- Input bus Branch
        Branch_flg => Branch_flg,


        -- Input bus Zero
        Zero_flg => Zero_flg,


        -- Input bus BranchNot
        BranchNot_flg => BranchNot_flg,


        -- Output bus AndOut
        AndOut_flg => AndOut_flg,


        RST => RST,
        CLK => CLK
    );


    -- Entity  WriteBuffer signals
    WriteBuffer: entity work.WriteBuffer
    port map (
        -- Input bus RegWriteAddr
        RegWriteAddr_addr => RegWriteAddr_addr,


        -- Input bus MemOut
        MemOut_data => MemOut_data,


        -- Input bus RegWrite
        RegWrite_flg => RegWrite_flg,


        -- Output bus WriteAddr
        WriteAddr_val => WriteAddr_val,


        -- Output bus WriteData
        WriteData_data => WriteData_data,


        -- Output bus WriteEnabled
        WriteEnabled_flg => WriteEnabled_flg,


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