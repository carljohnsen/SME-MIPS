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


entity ID_HazardUnit is
  port(
    -- Input bus ID_Pipe_WriteDst signals
    ID_Pipe_WriteDst_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_Pipe_MemRead signals
    ID_Pipe_MemRead_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_ReadA signals
    ID_ReadA_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_ReadB signals
    ID_ReadB_addr: in T_SYSTEM_UINT8;
    -- Input bus JumpUnit_PCSrc signals
    JumpUnit_PCSrc_flg: in T_SYSTEM_BOOL;

    -- Output bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Haz_Stall signals
    ID_Haz_Stall_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_HazardUnit;

architecture RTL of ID_HazardUnit is






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
        ID_Pipe_WriteDst_addr,
        ID_Pipe_MemRead_flg,
        ID_ReadA_addr,
        ID_ReadB_addr,
        JumpUnit_PCSrc_flg,
        CLK,
        RST
    )
    -- Internal variables
    variable flg : T_SYSTEM_BOOL;
    variable flg2 : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_Haz_Flush_flg <= '0';
            ID_Haz_Stall_flg <= '0';
            flg := '0';
            flg2 := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            if (ID_Pipe_MemRead_flg = '1') and ((UNSIGNED(ID_ReadA_addr) = UNSIGNED(ID_Pipe_WriteDst_addr)) or (UNSIGNED(ID_ReadB_addr) = UNSIGNED(ID_Pipe_WriteDst_addr))) then
                flg := '1';
            else
                flg := '0';
            end if;
            ID_Haz_Stall_flg <= flg;
            flg2 := JumpUnit_PCSrc_flg;
            ID_Haz_Flush_flg <= flg2;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
