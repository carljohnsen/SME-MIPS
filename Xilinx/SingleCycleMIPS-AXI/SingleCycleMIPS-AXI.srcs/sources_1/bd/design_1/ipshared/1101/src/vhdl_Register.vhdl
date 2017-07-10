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


entity vhdl_Register is
  port(
    -- Input bus ReadA signals
    ReadA_addr: in T_SYSTEM_UINT8;
    -- Input bus ReadB signals
    ReadB_addr: in T_SYSTEM_UINT8;
    -- Input bus WriteEnabled signals
    WriteEnabled_flg: in T_SYSTEM_BOOL;
    -- Input bus WriteAddr signals
    WriteAddr_val: in T_SYSTEM_UINT8;
    -- Input bus WriteData signals
    WriteData_data: in T_SYSTEM_UINT32;

    -- Output bus OutputA signals
    OutputA_data: out T_SYSTEM_UINT32;
    -- Output bus OutputB signals
    OutputB_data: out T_SYSTEM_UINT32;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end vhdl_Register;

architecture RTL of vhdl_Register is

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
        ReadA_addr,
        ReadB_addr,
        WriteEnabled_flg,
        WriteAddr_val,
        WriteData_data,
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
            OutputA_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            OutputB_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            data := (others => (others => '0'));
            flag := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        elsif CLK = '1' then


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END

            OutputA_data <= data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(ReadA_addr), T_SYSTEM_INT32'length)))));
        OutputB_data <= data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(ReadB_addr), T_SYSTEM_INT32'length)))));
           

        else 
        if (WriteEnabled_flg = '1') and (UNSIGNED(WriteAddr_val) > TO_UNSIGNED(0, 8)) then
                        data(TO_INTEGER(SIGNED(STD_LOGIC_VECTOR(resize(UNSIGNED(WriteAddr_val), T_SYSTEM_INT32'length))))) := WriteData_data;
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
