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


entity MEM_Pipe is
  port(
    -- Input bus EX_Pipe_JALOut signals
    EX_Pipe_JALOut_val: in T_SYSTEM_UINT32;
    -- Input bus EX_Pipe_MemToReg signals
    EX_Pipe_MemToReg_flg: in T_SYSTEM_BOOL;
    -- Input bus MEM_ReadData signals
    MEM_ReadData_data: in T_SYSTEM_UINT32;
    -- Input bus EX_Pipe_RegWrite signals
    EX_Pipe_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_Pipe_RegWriteAddr signals
    EX_Pipe_RegWriteAddr_addr: in T_SYSTEM_UINT8;

    -- Output bus MEM_Pipe_JALOut signals
    MEM_Pipe_JALOut_val: out T_SYSTEM_UINT32;
    -- Output bus MEM_Pipe_MemToReg signals
    MEM_Pipe_MemToReg_flg: out T_SYSTEM_BOOL;
    -- Output bus MEM_Pipe_ReadData signals
    MEM_Pipe_ReadData_data: out T_SYSTEM_UINT32;
    -- Output bus MEM_Pipe_RegWrite signals
    MEM_Pipe_RegWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus MEM_Pipe_RegWriteAddr signals
    MEM_Pipe_RegWriteAddr_addr: out T_SYSTEM_UINT8;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end MEM_Pipe;

architecture RTL of MEM_Pipe is






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
    variable jouttmp : T_SYSTEM_UINT32;
    variable memtoregtmp : T_SYSTEM_BOOL;
    variable readdatatmp : T_SYSTEM_UINT32;
    variable regwritetmp : T_SYSTEM_BOOL;
    variable regaddrtmp : T_SYSTEM_UINT8;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            MEM_Pipe_JALOut_val <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            MEM_Pipe_MemToReg_flg <= '0';
            MEM_Pipe_ReadData_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            MEM_Pipe_RegWrite_flg <= '0';
            MEM_Pipe_RegWriteAddr_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            jouttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            memtoregtmp := '0';
            readdatatmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            regwritetmp := '0';
            regaddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            jouttmp := EX_Pipe_JALOut_val;
            memtoregtmp := EX_Pipe_MemToReg_flg;
            readdatatmp := MEM_ReadData_data;
            regwritetmp := EX_Pipe_RegWrite_flg;
            regaddrtmp := EX_Pipe_RegWriteAddr_addr;
            MEM_Pipe_JALOut_val <= jouttmp;
            MEM_Pipe_MemToReg_flg <= memtoregtmp;
            MEM_Pipe_ReadData_data <= readdatatmp;
            MEM_Pipe_RegWrite_flg <= regwritetmp;
            MEM_Pipe_RegWriteAddr_addr <= regaddrtmp;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
