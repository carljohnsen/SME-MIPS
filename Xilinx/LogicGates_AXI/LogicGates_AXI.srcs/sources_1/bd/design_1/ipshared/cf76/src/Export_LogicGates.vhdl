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

entity LogicGates_export is
  port(

    -- Top-level bus Input signals
    Input_bit1: in T_SYSTEM_BOOL;
    Input_bit2: in T_SYSTEM_BOOL;

    -- Top-level bus Output signals
    Output_And: out T_SYSTEM_BOOL;
    Output_Or: out T_SYSTEM_BOOL;
    Output_Not: out T_SYSTEM_BOOL;
    Output_Xor: out T_SYSTEM_BOOL;


    -- User defined signals here
    -- #### USER-DATA-ENTITYSIGNALS-START
    -- #### USER-DATA-ENTITYSIGNALS-END

	-- Reset signal
    RST : in Std_logic;

	-- Clock signal
	CLK : in Std_logic
  );
end LogicGates_export;

architecture RTL of LogicGates_export is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- Entity LogicGates signals
    LogicGates: entity work.LogicGates
    port map (
        -- Input bus Input
        Input_bit1 => Input_bit1,
        Input_bit2 => Input_bit2,

        -- Output bus Output
        Output_And => Output_And,
        Output_Or => Output_Or,
        Output_Not => Output_Not,
        Output_Xor => Output_Xor,

        RST => RST,
        CLK => CLK
    );

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;