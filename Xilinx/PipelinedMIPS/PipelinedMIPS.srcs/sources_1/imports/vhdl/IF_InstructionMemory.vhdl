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


entity IF_InstructionMemory is
  port(
    -- Input bus IF_Address signals
    IF_Address_address: in T_SYSTEM_UINT32;

    -- Output bus IF_Instruction signals
    IF_Instruction_instruction: out T_SYSTEM_UINT32;
    -- Output bus DEBUG_SHUTDOWN signals
    DEBUG_SHUTDOWN_running: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end IF_InstructionMemory;

architecture RTL of IF_InstructionMemory is

   -- Type definitions
  subtype program_type is T_SYSTEM_UINT8_ARRAY(0 to 99);






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
        IF_Address_address,
        CLK,
        RST
    )
    -- Internal variables
    variable program : program_type;
    variable address : T_SYSTEM_UINT32;
    variable flag : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            IF_Instruction_instruction <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            DEBUG_SHUTDOWN_running <= '1';
            program := (STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(8, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(52, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(9, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(52, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(4, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(52, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(10, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(12, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(52, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(136, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(4, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(132, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(32, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(137, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(4, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(132, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(32, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(252, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(255, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(136, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(140, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(248, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(255, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(137, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(140, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(32, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(80, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(9, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(138, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(4, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(132, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(32, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(255, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(255, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(140, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(33, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(249, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(255, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(128, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(21, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(20, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(8, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(10, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(4, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(10, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(8, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(10, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(12, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(10, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(172, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)), STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length)));
            address := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            flag := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            address := IF_Address_address;
            if (UNSIGNED(address) >= TO_UNSIGNED(0, 32)) and (UNSIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(address), T_SYSTEM_UINT64'length))) < UNSIGNED((STD_LOGIC_VECTOR(TO_UNSIGNED(program_type'LENGTH, T_SYSTEM_INT64'length))))) then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                IF_Instruction_instruction <= (((STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT32'length)) or STD_LOGIC_VECTOR(resize(UNSIGNED(program(TO_INTEGER(SIGNED(address)))), T_SYSTEM_INT32'length))) or STD_LOGIC_VECTOR((shift_left(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(program(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR((UNSIGNED(address) + TO_UNSIGNED(1, 32))))))), T_SYSTEM_INT32'length))), 8)))) or STD_LOGIC_VECTOR((shift_left(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(program(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR((UNSIGNED(address) + TO_UNSIGNED(2, 32))))))), T_SYSTEM_INT32'length))), 16)))) or STD_LOGIC_VECTOR((shift_left(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(program(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR((UNSIGNED(address) + TO_UNSIGNED(3, 32))))))), T_SYSTEM_INT32'length))), 24)));
                DEBUG_SHUTDOWN_running <= '1';
            else
                IF_Instruction_instruction <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                DEBUG_SHUTDOWN_running <= '0';
            end if;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
