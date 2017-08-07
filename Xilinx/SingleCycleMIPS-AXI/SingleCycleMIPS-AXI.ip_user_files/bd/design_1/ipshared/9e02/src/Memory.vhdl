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


entity Memory is
  port(
    -- Input bus MemWrite signals
    MemWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus MemRead signals
    MemRead_flg: in T_SYSTEM_BOOL;
    -- Input bus JALOut signals
    JALOut_val: in T_SYSTEM_UINT32;
    -- Input bus OutputB signals
    OutputB_data: in T_SYSTEM_UINT32;

    -- Output bus ReadData signals
    ReadData_data: out T_SYSTEM_UINT32;

    EXT_MEM_READ : out std_logic;
    EXT_MEM_WRITE : out std_logic;
    EXT_MEM_ADDR : out std_logic_vector(31 downto 0);
    EXT_MEM_IN : in std_logic_vector(31 downto 0);
    EXT_MEM_OUT : out std_logic_vector(31 downto 0);

    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end Memory;

architecture RTL of Memory is

   -- Type definitions
  subtype mem_type is T_SYSTEM_UINT32_ARRAY(0 to 63);






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
        MemWrite_flg,
        MemRead_flg,
        JALOut_val,
        OutputB_data,
        EXT_MEM_IN,
        RST
    )
    -- Internal variables
    variable mem : mem_type := (others => (others => '0'));
    variable num : T_SYSTEM_UINT32;
    variable flg : T_SYSTEM_BOOL;
    variable flg2 : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ReadData_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            mem := (others => (others => '0'));
            num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            flg := '0';
            flg2 := '0';

            EXT_MEM_READ <= '0';
            EXT_MEM_WRITE <= '0';
            EXT_MEM_ADDR <= std_logic_vector(to_unsigned(0, 32));
            EXT_MEM_OUT <= std_logic_vector(to_unsigned(0, 32));
            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END
            EXT_MEM_READ <= MemRead_flg;
            EXT_MEM_WRITE <= MemWrite_flg;
            num := STD_LOGIC_VECTOR(shift_right(UNSIGNED(JALOut_val), 2));
            EXT_MEM_ADDR <= num;
            EXT_MEM_OUT <= OutputB_data;
            ReadData_data <= EXT_MEM_IN;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
