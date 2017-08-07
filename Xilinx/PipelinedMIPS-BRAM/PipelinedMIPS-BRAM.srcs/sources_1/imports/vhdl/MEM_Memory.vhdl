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


entity MEM_Memory is
  port(
    -- Input bus EX_Pipe_MemWrite signals
    EX_Pipe_MemWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_Pipe_MemRead signals
    EX_Pipe_MemRead_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_Pipe_JALOut signals
    EX_Pipe_JALOut_val: in T_SYSTEM_UINT32;
    -- Input bus EX_Pipe_OutputB signals
    EX_Pipe_OutputB_data: in T_SYSTEM_UINT32;
    -- Input bus EXTERNAL_MEM_ReadData signals
    EXTERNAL_MEM_ReadData_data: in T_SYSTEM_UINT32;

    -- Output bus EXTERNAL_MEM_Write signals
    EXTERNAL_MEM_Write_flg: out T_SYSTEM_BOOL;
    -- Output bus EXTERNAL_MEM_Read signals
    EXTERNAL_MEM_Read_flg: out T_SYSTEM_BOOL;
    -- Output bus EXTERNAL_MEM_Addr signals
    EXTERNAL_MEM_Addr_addr: out T_SYSTEM_UINT32;
    -- Output bus EXTERNAL_MEM_WriteData signals
    EXTERNAL_MEM_WriteData_data: out T_SYSTEM_UINT32;
    -- Output bus MEM_ReadData signals
    MEM_ReadData_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end MEM_Memory;

architecture RTL of MEM_Memory is

   -- Type definitions
  subtype mem_type is T_SYSTEM_UINT8_ARRAY(0 to 511);






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
    variable mem : mem_type;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            EXTERNAL_MEM_Write_flg <= '0';
            EXTERNAL_MEM_Read_flg <= '0';
            EXTERNAL_MEM_Addr_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            EXTERNAL_MEM_WriteData_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            MEM_ReadData_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            mem := (others => (others => '0'));

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        else

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            EXTERNAL_MEM_Write_flg <= EX_Pipe_MemWrite_flg;
            EXTERNAL_MEM_Read_flg <= EX_Pipe_MemRead_flg;
            EXTERNAL_MEM_Addr_addr <= EX_Pipe_JALOut_val;
            EXTERNAL_MEM_WriteData_data <= EX_Pipe_OutputB_data;
            MEM_ReadData_data <= EXTERNAL_MEM_ReadData_data;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
