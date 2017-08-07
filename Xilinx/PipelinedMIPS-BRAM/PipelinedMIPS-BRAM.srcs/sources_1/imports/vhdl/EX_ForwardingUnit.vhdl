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


entity EX_ForwardingUnit is
  port(
    -- Input bus EX_Pipe_RegWriteAddr signals
    EX_Pipe_RegWriteAddr_addr: in T_SYSTEM_UINT8;
    -- Input bus MEM_Pipe_RegWriteAddr signals
    MEM_Pipe_RegWriteAddr_addr: in T_SYSTEM_UINT8;
    -- Input bus EX_Pipe_RegWrite signals
    EX_Pipe_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus MEM_Pipe_RegWrite signals
    MEM_Pipe_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Pipe_ReadA signals
    ID_Pipe_ReadA_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_Pipe_ReadB signals
    ID_Pipe_ReadB_addr: in T_SYSTEM_UINT8;

    -- Output bus EX_Forw_ForwardA signals
    EX_Forw_ForwardA_selection: out PipelinedMIPS_ForwardSelection;
    -- Output bus EX_Forw_ForwardB signals
    EX_Forw_ForwardB_selection: out PipelinedMIPS_ForwardSelection;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end EX_ForwardingUnit;

architecture RTL of EX_ForwardingUnit is






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
        EX_Pipe_RegWriteAddr_addr,
        MEM_Pipe_RegWriteAddr_addr,
        EX_Pipe_RegWrite_flg,
        MEM_Pipe_RegWrite_flg,
        ID_Pipe_ReadA_addr,
        ID_Pipe_ReadB_addr,
        CLK,
        RST
    )
    -- Internal variables
    variable flag : T_SYSTEM_BOOL;
    variable flag2 : T_SYSTEM_BOOL;
    variable flag3 : T_SYSTEM_BOOL;
    variable flag4 : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            EX_Forw_ForwardA_selection <= PipelinedMIPS_ForwardSelection_original;
            EX_Forw_ForwardB_selection <= PipelinedMIPS_ForwardSelection_original;
            flag := '0';
            flag2 := '0';
            flag3 := '0';
            flag4 := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            if (UNSIGNED(ID_Pipe_ReadA_addr) = UNSIGNED(EX_Pipe_RegWriteAddr_addr)) and (EX_Pipe_RegWrite_flg = '1') then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                EX_Forw_ForwardA_selection <= PipelinedMIPS_ForwardSelection_mem;
            else
                if (UNSIGNED(ID_Pipe_ReadA_addr) = UNSIGNED(MEM_Pipe_RegWriteAddr_addr)) and (MEM_Pipe_RegWrite_flg = '1') then
                    flag2 := '1';
                else
                    flag2 := '0';
                end if;
                if flag2 = '1' then
                    EX_Forw_ForwardA_selection <= PipelinedMIPS_ForwardSelection_wb;
                else
                    EX_Forw_ForwardA_selection <= PipelinedMIPS_ForwardSelection_original;
                end if;
            end if;
            if (UNSIGNED(ID_Pipe_ReadB_addr) = UNSIGNED(EX_Pipe_RegWriteAddr_addr)) and (EX_Pipe_RegWrite_flg = '1') then
                flag3 := '1';
            else
                flag3 := '0';
            end if;
            if flag3 = '1' then
                EX_Forw_ForwardB_selection <= PipelinedMIPS_ForwardSelection_mem;
            else
                if (UNSIGNED(ID_Pipe_ReadB_addr) = UNSIGNED(MEM_Pipe_RegWriteAddr_addr)) and (MEM_Pipe_RegWrite_flg = '1') then
                    flag4 := '1';
                else
                    flag4 := '0';
                end if;
                if flag4 = '1' then
                    EX_Forw_ForwardB_selection <= PipelinedMIPS_ForwardSelection_wb;
                else
                    EX_Forw_ForwardB_selection <= PipelinedMIPS_ForwardSelection_original;
                end if;
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
