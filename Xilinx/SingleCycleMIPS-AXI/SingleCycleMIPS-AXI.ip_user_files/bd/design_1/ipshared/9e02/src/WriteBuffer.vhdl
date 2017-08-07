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


entity WriteBuffer is
  port(
    -- Input bus RegWriteAddr signals
    RegWriteAddr_addr: in T_SYSTEM_UINT8;
    -- Input bus MemOut signals
    MemOut_data: in T_SYSTEM_UINT32;
    -- Input bus RegWrite signals
    RegWrite_flg: in T_SYSTEM_BOOL;

    -- Output bus WriteAddr signals
    WriteAddr_val: out T_SYSTEM_UINT8;
    -- Output bus WriteData signals
    WriteData_data: out T_SYSTEM_UINT32;
    -- Output bus WriteEnabled signals
    WriteEnabled_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end WriteBuffer;

architecture RTL of WriteBuffer is






  -- User defined signals, procedures and components here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- #### USER-DATA-PROCESSES-START
    -- #### USER-DATA-PROCESSES-END


    process(
        -- #### USER-DATA-SENSITIVITY-START
        -- #### USER-DATA-SENSITIVITY-END
        RegWriteAddr_addr,
        MemOut_data,
        RegWrite_flg,
--        CLK, 
        RST
    )


    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            WriteAddr_val <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            WriteData_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            WriteEnabled_flg <= '0';

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        else

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            WriteAddr_val <= RegWriteAddr_addr;
            WriteData_data <= MemOut_data;
            WriteEnabled_flg <= RegWrite_flg;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
