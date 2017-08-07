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

entity PipelinedMIPS_export is
  port(

    -- Top-level bus EXTERNAL_Instruction signals
    EXTERNAL_Instruction_instruction: in std_logic_vector(31 downto 0);

    -- Top-level bus EXTERNAL_Address signals
    EXTERNAL_Address_address: out std_logic_vector(31 downto 0);

    -- Top-level bus DEBUG_SHUTDOWN signals
    DEBUG_SHUTDOWN_running: out std_logic;

    -- Top-level bus EXTERNAL_MEM_ReadData signals
    EXTERNAL_MEM_ReadData_data: in std_logic_vector(31 downto 0);

    -- Top-level bus EXTERNAL_MEM_Write signals
    EXTERNAL_MEM_Write_flg: out std_logic;

    -- Top-level bus EXTERNAL_MEM_Read signals
    EXTERNAL_MEM_Read_flg: out std_logic;

    -- Top-level bus EXTERNAL_MEM_Addr signals
    EXTERNAL_MEM_Addr_addr: out std_logic_vector(31 downto 0);

    -- Top-level bus EXTERNAL_MEM_WriteData signals
    EXTERNAL_MEM_WriteData_data: out std_logic_vector(31 downto 0);
    
    ID_ReadA_addr: inout std_logic_vector(7 downto 0);
    ID_ReadB_addr: inout std_logic_vector(7 downto 0);
    ID_OutputA_data: inout std_logic_vector(31 downto 0);
    ID_OutputB_data: inout std_logic_vector(31 downto 0);
    IF_Pipe_Instruction_instruction: inout std_logic_vector(31 downto 0);
    IF_Instruction_instruction: inout std_logic_vector(31 downto 0);
    IF_Address_address: inout std_logic_vector(31 downto 0);


    -- User defined signals here
    -- #### USER-DATA-ENTITYSIGNALS-START
    -- #### USER-DATA-ENTITYSIGNALS-END

	-- Reset signal
    RST : in Std_logic;

	-- Clock signal
	CLK : in Std_logic
  );
end PipelinedMIPS_export;

architecture RTL of PipelinedMIPS_export is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- Entity PipelinedMIPS signals
    PipelinedMIPS: entity work.PipelinedMIPS
    port map (
        -- Input bus EXTERNAL_Instruction
        EXTERNAL_Instruction_instruction => EXTERNAL_Instruction_instruction,

        -- Output bus EXTERNAL_Address
        EXTERNAL_Address_address => EXTERNAL_Address_address,

        -- Output bus DEBUG_SHUTDOWN
        DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,

        -- Input bus EXTERNAL_MEM_ReadData
        EXTERNAL_MEM_ReadData_data => EXTERNAL_MEM_ReadData_data,

        -- Output bus EXTERNAL_MEM_Write
        EXTERNAL_MEM_Write_flg => EXTERNAL_MEM_Write_flg,

        -- Output bus EXTERNAL_MEM_Read
        EXTERNAL_MEM_Read_flg => EXTERNAL_MEM_Read_flg,

        -- Output bus EXTERNAL_MEM_Addr
        EXTERNAL_MEM_Addr_addr => EXTERNAL_MEM_Addr_addr,

        -- Output bus EXTERNAL_MEM_WriteData
        EXTERNAL_MEM_WriteData_data => EXTERNAL_MEM_WriteData_data,
        
        ID_ReadA_addr => ID_ReadA_addr,
        ID_ReadB_addr => ID_ReadB_addr,
        ID_OutputA_data => ID_OutputA_data,
        ID_OutputB_data => ID_OutputB_data,
        IF_Pipe_Instruction_instruction => IF_Pipe_Instruction_instruction,
        IF_Instruction_instruction => IF_Instruction_instruction,
        IF_Address_address => IF_Address_address,

        RST => RST,
        CLK => CLK
    );

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;