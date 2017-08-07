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


entity ID_Splitter is
  port(
    -- Input bus IF_Pipe_Instruction signals
    IF_Pipe_Instruction_instruction: in T_SYSTEM_UINT32;

    -- Output bus ID_ReadA signals
    ID_ReadA_addr: out T_SYSTEM_UINT8;
    -- Output bus ID_ReadB signals
    ID_ReadB_addr: out T_SYSTEM_UINT8;
    -- Output bus ID_SignExtIn signals
    ID_SignExtIn_data: out T_SYSTEM_INT16;
    -- Output bus ID_ControlIn signals
    ID_ControlIn_opcode: out PipelinedMIPS_Opcodes;
    -- Output bus ID_RegDstMuxInput signals
    ID_RegDstMuxInput_rd: out T_SYSTEM_UINT8;
    ID_RegDstMuxInput_rt: out T_SYSTEM_UINT8;
    -- Output bus ID_ALUFunct signals
    ID_ALUFunct_val: out PipelinedMIPS_Funcs;
    -- Output bus ID_Jump signals
    ID_Jump_addr: out T_SYSTEM_UINT32;
    -- Output bus ID_Shamt signals
    ID_Shamt_amount: out T_SYSTEM_UINT8;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_Splitter;

architecture RTL of ID_Splitter is






  -- User defined signals, procedures and components here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- #### USER-DATA-PROCESSES-START
    -- #### USER-DATA-PROCESSES-END


    process(
        CLK,
        RST
    )


    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END



            -- #### USER-DATA-ONRISE-START
            -- #### USER-DATA-ONRISE-END

        end if;
    end process;


    process(
        -- #### USER-DATA-SENSITIVITY-START
        -- #### USER-DATA-SENSITIVITY-END
        IF_Pipe_Instruction_instruction,
        CLK,
        RST
    )
    -- Internal variables
    variable instruction : T_SYSTEM_UINT32;
    variable opcode : T_SYSTEM_UINT8;
    variable addr : T_SYSTEM_UINT8;
    variable b : T_SYSTEM_UINT8;
    variable rd : T_SYSTEM_UINT8;
    variable amount : T_SYSTEM_UINT8;
    variable val : PipelinedMIPS_Funcs;
    variable addr2 : T_SYSTEM_UINT32;
    variable data : T_SYSTEM_INT16;
    variable local_var_0 : T_SYSTEM_UINT32;
    variable local_var_1 : T_SYSTEM_UINT32;
    variable local_var_2 : T_SYSTEM_UINT32;
    variable local_var_3 : T_SYSTEM_UINT32;
    variable local_var_4 : T_SYSTEM_UINT32;
    variable local_var_5 : T_SYSTEM_UINT32;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_ReadA_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_ReadB_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_SignExtIn_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
            ID_ControlIn_opcode <= PipelinedMIPS_Opcodes_Rformat;
            ID_RegDstMuxInput_rd <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_RegDstMuxInput_rt <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_ALUFunct_val <= PipelinedMIPS_Funcs_sll;
            ID_Jump_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Shamt_amount <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            instruction := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            opcode := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            addr := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            b := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            rd := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            amount := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            --val := ???;
            addr2 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            data := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
            local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_1 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_2 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_3 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_4 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            local_var_5 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            instruction := IF_Pipe_Instruction_instruction;
            --local_var_0 := STD_LOGIC_VECTOR((shift_right(UNSIGNED(instruction), 26))) and STD_LOGIC_VECTOR(TO_UNSIGNED(63, T_SYSTEM_UINT32'length));
            --opcode := local_var_0(7 downto 0);
            --local_var_1 := STD_LOGIC_VECTOR((shift_right(UNSIGNED(instruction), 21))) and STD_LOGIC_VECTOR(TO_UNSIGNED(31, T_SYSTEM_UINT32'length));
            --addr := local_var_1(7 downto 0);
            --local_var_2 := STD_LOGIC_VECTOR((shift_right(UNSIGNED(instruction), 16))) and STD_LOGIC_VECTOR(TO_UNSIGNED(31, T_SYSTEM_UINT32'length));
            --b := local_var_2(7 downto 0);
            --local_var_3 := STD_LOGIC_VECTOR((shift_right(UNSIGNED(instruction), 11))) and STD_LOGIC_VECTOR(TO_UNSIGNED(31, T_SYSTEM_UINT32'length));
            --rd := local_var_3(7 downto 0);
            --local_var_4 := STD_LOGIC_VECTOR((shift_right(UNSIGNED(instruction), 6))) and STD_LOGIC_VECTOR(TO_UNSIGNED(31, T_SYSTEM_UINT32'length));
            --amount := local_var_4(7 downto 0);
            --val := PipelinedMIPS.Funcs'VAL(T_SYSTEM_UINT32);
            --addr2 := instruction and STD_LOGIC_VECTOR(TO_UNSIGNED(67108863, T_SYSTEM_UINT32'length));
            --local_var_5 := instruction and STD_LOGIC_VECTOR(TO_UNSIGNED(65535, T_SYSTEM_UINT32'length));
            --data := local_var_5(15 downto 0);
            --ID_Shamt_amount <= amount;
            --ID_ReadA_addr <= addr;
            --ID_ReadB_addr <= b;
            --ID_RegDstMuxInput_rd <= rd;
            --ID_RegDstMuxInput_rt <= b;
            --ID_ControlIn_opcode <= PipelinedMIPS.Opcodes'VAL(T_SYSTEM_UINT8;
            --ID_SignExtIn_data <= data;
            --ID_ALUFunct_val <= val;
            --ID_Jump_addr <= addr2;
            ID_Shamt_amount(4 downto 0) <= instruction(10 downto 6);
            ID_ReadA_addr(4 downto 0) <= instruction(25 downto 21);
            ID_ReadB_addr(4 downto 0) <= instruction(20 downto 16);
            ID_RegDstMuxInput_rd(4 downto 0) <= instruction(15 downto 11);
            ID_RegDstMuxInput_rt(4 downto 0) <= instruction(20 downto 16);
            ID_ControlIn_opcode <= PipelinedMIPS_Opcodes'VAL(TO_INTEGER(UNSIGNED(instruction(31 downto 26))));
            ID_SignExtIn_data(15 downto 0) <= instruction(15 downto 0);
            ID_ALUFunct_val <= PipelinedMIPS_Funcs'VAL(TO_INTEGER(UNSIGNED(instruction(5 downto 0))));
            ID_Jump_addr(25 downto 0) <= instruction(25 downto 0);

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
