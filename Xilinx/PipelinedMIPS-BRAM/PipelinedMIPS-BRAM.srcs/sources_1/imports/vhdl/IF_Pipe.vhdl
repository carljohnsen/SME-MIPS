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


entity IF_Pipe is
  port(
    -- Input bus IF_IncrementerOut signals
    IF_IncrementerOut_address: in T_SYSTEM_UINT32;
    -- Input bus ID_Haz_Stall signals
    ID_Haz_Stall_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: in T_SYSTEM_BOOL;

    -- Output bus IF_Pipe_IncrementerOut signals
    IF_Pipe_IncrementerOut_addr: out T_SYSTEM_UINT32;
    -- Output bus IF_Pipe_Stall signals
    IF_Pipe_Stall_flg: out T_SYSTEM_BOOL;
    -- Output bus IF_Pipe_Flush signals
    IF_Pipe_Flush_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end IF_Pipe;

architecture RTL of IF_Pipe is






  -- User defined signals, procedures and components here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- #### USER-DATA-PROCESSES-START
    -- #### USER-DATA-PROCESSES-END


    process(
        -- #### USER-DATA-SENSITIVITY-START
        -- #### USER-DATA-SENSITIVITY-END
        CLK, 
        RST
    )

    -- Internal variables
    variable inctmp : T_SYSTEM_UINT32;
    variable insttmp : T_SYSTEM_UINT32;
    variable flg : T_SYSTEM_BOOL;
    variable flag : T_SYSTEM_BOOL;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            IF_Pipe_IncrementerOut_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            IF_Pipe_Stall_flg <= '0';
            IF_Pipe_Flush_flg <= '0';
            inctmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            insttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            flg := '0';
            flag := '0';

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            flg := ID_Haz_Flush_flg;
            if flg = '1' then
                inctmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            else
                if not (ID_Haz_Stall_flg = '1') then
                    flag := '1';
                else
                    flag := '0';
                end if;
                if flag = '1' then
                    inctmp := IF_IncrementerOut_address;
                end if;
            end if;
            IF_Pipe_IncrementerOut_addr <= inctmp;
            IF_Pipe_Stall_flg <= ID_Haz_Stall_flg;
            IF_Pipe_Flush_flg <= ID_Haz_Flush_flg;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
