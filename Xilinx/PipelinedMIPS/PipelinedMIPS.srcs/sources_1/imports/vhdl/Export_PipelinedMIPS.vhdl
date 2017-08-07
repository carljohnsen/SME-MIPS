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

    -- Top-level bus DEBUG_SHUTDOWN signals
    DEBUG_SHUTDOWN_running: out T_SYSTEM_BOOL;
--    MEM_Write : inout T_SYSTEM_BOOL;
--    MEM_Data : inout T_SYSTEM_UINT32;

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
        -- Output bus DEBUG_SHUTDOWN
        DEBUG_SHUTDOWN_running => DEBUG_SHUTDOWN_running,
--        EX_Pipe_MemWrite_flg => MEM_Write,
--        EX_Pipe_OutputB_data => MEM_Data, 
        

        RST => RST,
        CLK => CLK
    );

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;