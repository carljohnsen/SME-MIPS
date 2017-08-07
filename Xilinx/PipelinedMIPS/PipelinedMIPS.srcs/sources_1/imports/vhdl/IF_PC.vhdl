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


entity IF_PC is
  port(
    -- Input bus IF_PCIn signals
    IF_PCIn_newAddress: in T_SYSTEM_UINT32;
    -- Input bus ID_Haz_Stall signals
    ID_Haz_Stall_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: in T_SYSTEM_BOOL;

    -- Output bus IF_Address signals
    IF_Address_address: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end IF_PC;

architecture RTL of IF_PC is






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
    variable addr : T_SYSTEM_UINT32;
    variable flag : T_SYSTEM_BOOL;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            IF_Address_address <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            addr := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            flag := '0';

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            if (not (ID_Haz_Stall_flg = '1')) or (ID_Haz_Flush_flg = '1') then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                addr := IF_PCIn_newAddress;
            end if;
            IF_Address_address <= addr;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
