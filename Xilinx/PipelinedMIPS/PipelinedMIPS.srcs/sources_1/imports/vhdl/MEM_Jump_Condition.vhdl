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


entity MEM_Jump_Condition is
  port(
    -- Input bus EX_Pipe_Zero signals
    EX_Pipe_Zero_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_Pipe_BranchNot signals
    EX_Pipe_BranchNot_flg: in T_SYSTEM_BOOL;

    -- Output bus JumpUnit_BranchCondition signals
    JumpUnit_BranchCondition_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end MEM_Jump_Condition;

architecture RTL of MEM_Jump_Condition is






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
        EX_Pipe_Zero_flg,
        EX_Pipe_BranchNot_flg,
        CLK,
        RST
    )

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            JumpUnit_BranchCondition_flg <= '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            if EX_Pipe_BranchNot_flg = '1' then
                if not (EX_Pipe_Zero_flg = '1') then
                    JumpUnit_BranchCondition_flg <= '1';
                else
                    JumpUnit_BranchCondition_flg <= '0';
                end if;
            else
                JumpUnit_BranchCondition_flg <= EX_Pipe_Zero_flg;
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
