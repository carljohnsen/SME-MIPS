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


entity EX_ForwardBMux is
  port(
    -- Input bus ID_Pipe_OutputB signals
    ID_Pipe_OutputB_data: in T_SYSTEM_UINT32;
    -- Input bus EX_Pipe_JALOut signals
    EX_Pipe_JALOut_val: in T_SYSTEM_UINT32;
    -- Input bus WB_WriteData signals
    WB_WriteData_data: in T_SYSTEM_UINT32;
    -- Input bus EX_Forw_ForwardB signals
    EX_Forw_ForwardB_selection: in PipelinedMIPS_ForwardSelection;

    -- Output bus EX_ForwardB signals
    EX_ForwardB_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end EX_ForwardBMux;

architecture RTL of EX_ForwardBMux is






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
        ID_Pipe_OutputB_data,
        EX_Pipe_JALOut_val,
        WB_WriteData_data,
        EX_Forw_ForwardB_selection,
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
            EX_ForwardB_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            case EX_Forw_ForwardB_selection is
                when PipelinedMIPS_ForwardSelection_original =>
                    EX_ForwardB_data <= ID_Pipe_OutputB_data;
                when PipelinedMIPS_ForwardSelection_mem =>
                    EX_ForwardB_data <= EX_Pipe_JALOut_val;
                when PipelinedMIPS_ForwardSelection_wb =>
                    EX_ForwardB_data <= WB_WriteData_data;
                when others =>
            end case;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
