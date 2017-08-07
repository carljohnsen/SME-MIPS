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


entity EX_Pipe is
  port(
    -- Input bus ID_Pipe_Branch signals
    ID_Pipe_Branch_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_BranchAddress signals
    EX_BranchAddress_addr: in T_SYSTEM_UINT32;
    -- Input bus ID_Pipe_BranchNot signals
    ID_Pipe_BranchNot_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_JALOut signals
    EX_JALOut_val: in T_SYSTEM_UINT32;
    -- Input bus ID_Pipe_Jmp signals
    ID_Pipe_Jmp_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_JumpAddress signals
    EX_JumpAddress_addr: in T_SYSTEM_UINT32;
    -- Input bus EX_JumpReg signals
    EX_JumpReg_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Pipe_MemRead signals
    ID_Pipe_MemRead_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Pipe_MemToReg signals
    ID_Pipe_MemToReg_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Pipe_MemWrite signals
    ID_Pipe_MemWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_ForwardB signals
    EX_ForwardB_data: in T_SYSTEM_UINT32;
    -- Input bus ID_Pipe_RegWrite signals
    ID_Pipe_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus EX_RegWriteAddr signals
    EX_RegWriteAddr_addr: in T_SYSTEM_UINT8;
    -- Input bus EX_Zero signals
    EX_Zero_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: in T_SYSTEM_BOOL;

    -- Output bus EX_Pipe_Branch signals
    EX_Pipe_Branch_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_BranchAddress signals
    EX_Pipe_BranchAddress_addr: out T_SYSTEM_UINT32;
    -- Output bus EX_Pipe_BranchNot signals
    EX_Pipe_BranchNot_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_JALOut signals
    EX_Pipe_JALOut_val: out T_SYSTEM_UINT32;
    -- Output bus EX_Pipe_Jmp signals
    EX_Pipe_Jmp_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_JumpAddress signals
    EX_Pipe_JumpAddress_addr: out T_SYSTEM_UINT32;
    -- Output bus EX_Pipe_JumpReg signals
    EX_Pipe_JumpReg_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_MemRead signals
    EX_Pipe_MemRead_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_MemToReg signals
    EX_Pipe_MemToReg_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_MemWrite signals
    EX_Pipe_MemWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_OutputB signals
    EX_Pipe_OutputB_data: out T_SYSTEM_UINT32;
    -- Output bus EX_Pipe_RegWrite signals
    EX_Pipe_RegWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Pipe_RegWriteAddr signals
    EX_Pipe_RegWriteAddr_addr: out T_SYSTEM_UINT8;
    -- Output bus EX_Pipe_Zero signals
    EX_Pipe_Zero_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end EX_Pipe;

architecture RTL of EX_Pipe is






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
    variable branchtmp : T_SYSTEM_BOOL;
    variable baddrtmp : T_SYSTEM_UINT32;
    variable bnetmp : T_SYSTEM_BOOL;
    variable jouttmp : T_SYSTEM_UINT32;
    variable jmptmp : T_SYSTEM_BOOL;
    variable jaddrtmp : T_SYSTEM_UINT32;
    variable jmpregtmp : T_SYSTEM_BOOL;
    variable memreadtmp : T_SYSTEM_BOOL;
    variable memtoregtmp : T_SYSTEM_BOOL;
    variable memwritetmp : T_SYSTEM_BOOL;
    variable outputbtmp : T_SYSTEM_UINT32;
    variable regwritetmp : T_SYSTEM_BOOL;
    variable regaddrtmp : T_SYSTEM_UINT8;
    variable zerotmp : T_SYSTEM_BOOL;
    variable flg : T_SYSTEM_BOOL;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            EX_Pipe_Branch_flg <= '0';
            EX_Pipe_BranchAddress_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            EX_Pipe_BranchNot_flg <= '0';
            EX_Pipe_JALOut_val <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            EX_Pipe_Jmp_flg <= '0';
            EX_Pipe_JumpAddress_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            EX_Pipe_JumpReg_flg <= '0';
            EX_Pipe_MemRead_flg <= '0';
            EX_Pipe_MemToReg_flg <= '0';
            EX_Pipe_MemWrite_flg <= '0';
            EX_Pipe_OutputB_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            EX_Pipe_RegWrite_flg <= '0';
            EX_Pipe_RegWriteAddr_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            EX_Pipe_Zero_flg <= '0';
            branchtmp := '0';
            baddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            bnetmp := '0';
            jouttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            jmptmp := '0';
            jaddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            jmpregtmp := '0';
            memreadtmp := '0';
            memtoregtmp := '0';
            memwritetmp := '0';
            outputbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            regwritetmp := '0';
            regaddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            zerotmp := '0';
            flg := '0';

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            flg := ID_Haz_Flush_flg;
            if flg = '1' then
                branchtmp := '0';
                baddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                bnetmp := '0';
                jouttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                jmptmp := '0';
                jaddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                jmpregtmp := '0';
                memreadtmp := '0';
                memtoregtmp := '0';
                memwritetmp := '0';
                outputbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                regwritetmp := '0';
                regaddrtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
                zerotmp := '0';
            else
                branchtmp := ID_Pipe_Branch_flg;
                baddrtmp := EX_BranchAddress_addr;
                bnetmp := ID_Pipe_BranchNot_flg;
                jouttmp := EX_JALOut_val;
                jmptmp := ID_Pipe_Jmp_flg;
                jaddrtmp := EX_JumpAddress_addr;
                jmpregtmp := EX_JumpReg_flg;
                memreadtmp := ID_Pipe_MemRead_flg;
                memtoregtmp := ID_Pipe_MemToReg_flg;
                memwritetmp := ID_Pipe_MemWrite_flg;
                outputbtmp := EX_ForwardB_data;
                regwritetmp := ID_Pipe_RegWrite_flg;
                regaddrtmp := EX_RegWriteAddr_addr;
                zerotmp := EX_Zero_flg;
            end if;
            EX_Pipe_Branch_flg <= branchtmp;
            EX_Pipe_BranchAddress_addr <= baddrtmp;
            EX_Pipe_BranchNot_flg <= bnetmp;
            EX_Pipe_JALOut_val <= jouttmp;
            EX_Pipe_Jmp_flg <= jmptmp;
            EX_Pipe_JumpAddress_addr <= jaddrtmp;
            EX_Pipe_JumpReg_flg <= jmpregtmp;
            EX_Pipe_MemRead_flg <= memreadtmp;
            EX_Pipe_MemToReg_flg <= memtoregtmp;
            EX_Pipe_MemWrite_flg <= memwritetmp;
            EX_Pipe_OutputB_data <= outputbtmp;
            EX_Pipe_RegWrite_flg <= regwritetmp;
            EX_Pipe_RegWriteAddr_addr <= regaddrtmp;
            EX_Pipe_Zero_flg <= zerotmp;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
