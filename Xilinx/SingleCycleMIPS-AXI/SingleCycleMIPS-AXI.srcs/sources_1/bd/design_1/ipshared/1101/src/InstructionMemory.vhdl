library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.SYSTEM_TYPES.ALL;
use work.CUSTOM_TYPES.ALL;

entity InstructionMemory is
    port(
        -- Inter MIPS communication
        Address_address: in T_SYSTEM_UINT32;
        Instruction_instruction: out T_SYSTEM_UINT32;
        
        -- Outside MIPS communication
        EXT_RUNNING: out T_SYSTEM_BOOL;
        EXT_CLOCKS: out std_logic_vector(31 downto 0);
        EXT_ADDR: out std_logic_vector(31 downto 0);
        EXT_INSTRUCTION: in std_logic_vector(31 downto 0);
        EXT_COUNT: in std_logic_vector(31 downto 0);
    
        RST : in Std_logic;
        CLK : in Std_logic
    );
end InstructionMemory;

architecture RTL of InstructionMemory is
    begin
        process(
            Address_address,
            EXT_INSTRUCTION,
            EXT_COUNT,
            CLK,
            RST
        )
        variable clocks : std_logic_vector(31 downto 0);
        variable running : std_logic;
        begin
            if RST = '1' then
                Instruction_instruction <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                EXT_RUNNING <= '0';
                EXT_CLOCKS <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32));
                EXT_ADDR <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32));
                clocks := STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32));
                running := '0';
            else
                if UNSIGNED(Address_address) >= TO_UNSIGNED(0, 32) and UNSIGNED(Address_address) < UNSIGNED(EXT_COUNT) then 
                    EXT_ADDR(29 downto 0) <= Address_address(31 downto 2);
                    EXT_ADDR(31 downto 30) <= b"00"; 
                    Instruction_instruction <= EXT_INSTRUCTION;
                    running := '1';
                else
                    Instruction_instruction <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                    running := '0';
                end if;
                EXT_CLOCKS <= STD_LOGIC_VECTOR(clocks);
                EXT_RUNNING <= running;
                                
                if rising_edge(CLK) and running = '1' then
                    clocks := STD_LOGIC_VECTOR(UNSIGNED(clocks) + 1);
                end if;
            end if;
        end process;
end RTL;