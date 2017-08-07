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

entity SingleCycleMIPS_export is
  port(

    -- Top-level bus DEBUG_SHUTDOWN signals
    EXT_RUNNING: out std_logic;
    EXT_CLOCKS: out std_logic_vector(31 downto 0);
    EXT_COUNT: in std_logic_vector(31 downto 0);
    EXT_ADDR: out std_logic_vector(31 downto 0);
    EXT_INSTRUCTION: in std_logic_vector(31 downto 0);

    EXT_MEM_READ : out std_logic;
    EXT_MEM_WRITE : out std_logic;
    EXT_MEM_ADDR : out std_logic_vector(31 downto 0);
    EXT_MEM_IN : in std_logic_vector(31 downto 0);
    EXT_MEM_OUT : out std_logic_vector(31 downto 0);
--    OutputA_data: inout T_SYSTEM_UINT32;
--    OutputB_data: inout T_SYSTEM_UINT32;
--    Instruction_instruction: inout T_SYSTEM_UINT32;
--    PCIn_newAddress: inout T_SYSTEM_UINT32;
--    ReadA_addr: inout T_SYSTEM_UINT8;
--    ReadB_addr: inout T_SYSTEM_UINT8;
    
--    WriteEnabled_flg: inout T_SYSTEM_BOOL;
--    WriteAddr_val: inout T_SYSTEM_UINT8;
--    WriteData_data: inout T_SYSTEM_UINT32;
    
--    MemToReg_flg: inout T_SYSTEM_BOOL;
--    ReadData_data: inout T_SYSTEM_UINT32;
--    JALOut_val: inout T_SYSTEM_UINT32;


    -- User defined signals here
    -- #### USER-DATA-ENTITYSIGNALS-START
    -- #### USER-DATA-ENTITYSIGNALS-END

	-- Reset signal
    RST : in Std_logic;

	-- Clock signal
	CLK : in Std_logic
  );
end SingleCycleMIPS_export;

architecture RTL of SingleCycleMIPS_export is  
  -- User defined signals here
  -- #### USER-DATA-SIGNALS-START
  -- #### USER-DATA-SIGNALS-END

begin

    -- Entity SingleCycleMIPS signals
    SingleCycleMIPS: entity work.SingleCycleMIPS
    port map (
        -- Output bus DEBUG_SHUTDOWN
        EXT_RUNNING => EXT_RUNNING,
        EXT_CLOCKS => EXT_CLOCKS,
        EXT_COUNT => EXT_COUNT,
        EXT_ADDR => EXT_ADDR,
        EXT_INSTRUCTION => EXT_INSTRUCTION,
        
        EXT_MEM_READ => EXT_MEM_READ,
        EXT_MEM_WRITE => EXT_MEM_WRITE,
        EXT_MEM_ADDR => EXT_MEM_ADDR,
        EXT_MEM_IN => EXT_MEM_IN,
        EXT_MEM_OUT => EXT_MEM_OUT,
--        OutputA_data => OutputA_data,
--        OutputB_data => OutputB_data,
--        Instruction_instruction => Instruction_instruction,
--        PCIn_newAddress => PCIn_newAddress,
--        ReadA_addr => ReadA_addr,
--        ReadB_addr => ReadB_addr,
        
--        WriteEnabled_flg => WriteEnabled_flg,
--        WriteAddr_val => WriteAddr_val,
--        WriteData_data => WriteData_data,

--        MemToReg_flg => MemToReg_flg,
--        ReadData_data => ReadData_data,
--        JALOut_val => JALOut_val,

        RST => RST,
        CLK => CLK
    );

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;