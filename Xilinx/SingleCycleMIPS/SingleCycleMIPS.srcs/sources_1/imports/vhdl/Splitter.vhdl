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


entity Splitter is
  port(
    -- Input bus Instruction signals
    Instruction_instruction: in T_SYSTEM_UINT32;

    -- Output bus ReadA signals
    ReadA_addr: out T_SYSTEM_UINT8;
    -- Output bus ReadB signals
    ReadB_addr: out T_SYSTEM_UINT8;
    -- Output bus SignExtIn signals
    SignExtIn_data: out T_SYSTEM_INT16;
    -- Output bus ControlIn signals
    ControlIn_opcode: out SingleCycleMIPS_Opcodes;
    -- Output bus MuxInput signals
    MuxInput_rd: out T_SYSTEM_UINT8;
    MuxInput_rt: out T_SYSTEM_UINT8;
    -- Output bus ALUFunct signals
    ALUFunct_val: out SingleCycleMIPS_Funcs;
    -- Output bus JumpInstruction signals
    JumpInstruction_addr: out T_SYSTEM_UINT32;
    -- Output bus Shamt signals
    Shamt_amount: out T_SYSTEM_UINT8;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end Splitter;

architecture RTL of Splitter is






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
        Instruction_instruction,
        CLK,
        RST
    )
    -- Internal variables
    variable instruction : T_SYSTEM_UINT32;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ReadA_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ReadB_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            SignExtIn_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
            ControlIn_opcode <= SingleCycleMIPS_Opcodes_Rformat;
            MuxInput_rd <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            MuxInput_rt <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ALUFunct_val <= SingleCycleMIPS_Funcs_sll;
            JumpInstruction_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            Shamt_amount <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            instruction := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            instruction := Instruction_instruction;
            Shamt_amount(4 downto 0) <= instruction(10 downto 6);
            ReadA_addr(4 downto 0) <= instruction(25 downto 21);
            ReadB_addr(4 downto 0) <= instruction(20 downto 16);
            MuxInput_rd(4 downto 0) <= instruction(15 downto 11);
            MuxInput_rt(4 downto 0) <= instruction(20 downto 16);
            ControlIn_opcode <= SingleCycleMIPS_Opcodes'VAL(TO_INTEGER(UNSIGNED(instruction(31 downto 26))));
            SignExtIn_data(15 downto 0) <= instruction(15 downto 0);
            ALUFunct_val <= SingleCycleMIPS_Funcs'VAL(TO_INTEGER(UNSIGNED(instruction(5 downto 0))));
            JumpInstruction_addr(25 downto 0) <= instruction(25 downto 0);

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
