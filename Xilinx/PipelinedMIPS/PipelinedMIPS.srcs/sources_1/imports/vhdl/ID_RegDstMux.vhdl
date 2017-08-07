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


entity ID_RegDstMux is
  port(
    -- Input bus ID_RegDst signals
    ID_RegDst_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_RegDstMuxInput signals
    ID_RegDstMuxInput_rt: in T_SYSTEM_UINT8;
    ID_RegDstMuxInput_rd: in T_SYSTEM_UINT8;

    -- Output bus ID_WriteDst signals
    ID_WriteDst_addr: out T_SYSTEM_UINT8;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_RegDstMux;

architecture RTL of ID_RegDstMux is






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
        ID_RegDst_flg,
        ID_RegDstMuxInput_rt,
        ID_RegDstMuxInput_rd,
        CLK,
        RST
    )
    -- Internal variables
    variable local_var_0 : T_SYSTEM_UINT8;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_WriteDst_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            local_var_0 := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            if ID_RegDst_flg = '1' then
                local_var_0 := ID_RegDstMuxInput_rd;
            else
                local_var_0 := ID_RegDstMuxInput_rt;
            end if;
            ID_WriteDst_addr <= local_var_0;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
