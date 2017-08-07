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

entity LogicGates is
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
end LogicGates;

architecture RTL of LogicGates is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

  -- Internal wiring signals for clocked processes

begin


    -- Entity  AndGate signals
    AndGate: entity work.AndGate
    port map (
        -- Input bus Input
        Input_bit1 => Input_bit1,
        Input_bit2 => Input_bit2,


        -- Output bus Output
        Output_And => Output_And,


        RST => RST,
        CLK => CLK
    );


    -- Entity  OrGate signals
    OrGate: entity work.OrGate
    port map (
        -- Input bus Input
        Input_bit1 => Input_bit1,
        Input_bit2 => Input_bit2,


        -- Output bus Output
        Output_Or => Output_Or,


        RST => RST,
        CLK => CLK
    );


    -- Entity  NotGate signals
    NotGate: entity work.NotGate
    port map (
        -- Input bus Input
        Input_bit1 => Input_bit1,
        Input_bit2 => Input_bit2,


        -- Output bus Output
        Output_Not => Output_Not,


        RST => RST,
        CLK => CLK
    );


    -- Entity  XorGate signals
    XorGate: entity work.XorGate
    port map (
        -- Input bus Input
        Input_bit1 => Input_bit1,
        Input_bit2 => Input_bit2,


        -- Output bus Output
        Output_Xor => Output_Xor,


        RST => RST,
        CLK => CLK
    );


    -- Propagate all feedback signals immediately

    -- Propagate all clocked and feedback signals
    process(
        CLK,
        RST)
    begin
        if RST = '1' then
        elsif rising_edge(CLK) then


        end if;
    end process;

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;