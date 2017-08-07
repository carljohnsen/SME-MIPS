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


entity ID_Register is
  port(
    -- Input bus ID_ReadA signals
    ID_ReadA_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_ReadB signals
    ID_ReadB_addr: in T_SYSTEM_UINT8;
    -- Input bus MEM_Pipe_RegWrite signals
    MEM_Pipe_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus MEM_Pipe_RegWriteAddr signals
    MEM_Pipe_RegWriteAddr_addr: in T_SYSTEM_UINT8;
    -- Input bus WB_WriteData signals
    WB_WriteData_data: in T_SYSTEM_UINT32;

    -- Output bus ID_OutputA signals
    ID_OutputA_data: out T_SYSTEM_UINT32;
    -- Output bus ID_OutputB signals
    ID_OutputB_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_Register;

architecture RTL of ID_Register is

   -- Type definitions
  subtype data_type is T_SYSTEM_UINT32_ARRAY(0 to 31);






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
        ID_ReadA_addr,
        ID_ReadB_addr,
        MEM_Pipe_RegWrite_flg,
        MEM_Pipe_RegWriteAddr_addr,
        WB_WriteData_data,
        CLK,
        RST
    )
    -- Internal variables
    variable data : data_type;
    variable flag : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_OutputA_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_OutputB_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            data := (others => (others => '0'));
            flag := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        elsif falling_edge(CLK) then 
            if (MEM_Pipe_RegWrite_flg = '1') and (UNSIGNED(MEM_Pipe_RegWriteAddr_addr) > TO_UNSIGNED(0, 8)) then
                data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(MEM_Pipe_RegWriteAddr_addr), T_SYSTEM_INT32'length))))) := WB_WriteData_data;
            end if;
            ID_OutputA_data <= data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(ID_ReadA_addr), T_SYSTEM_INT32'length)))));
            ID_OutputB_data <= data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(ID_ReadB_addr), T_SYSTEM_INT32'length)))));
        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
