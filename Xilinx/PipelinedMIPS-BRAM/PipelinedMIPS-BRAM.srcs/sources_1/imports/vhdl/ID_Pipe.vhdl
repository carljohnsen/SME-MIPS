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


entity ID_Pipe is
  port(
    -- Input bus ID_OutputA signals
    ID_OutputA_data: in T_SYSTEM_UINT32;
    -- Input bus ID_OutputB signals
    ID_OutputB_data: in T_SYSTEM_UINT32;
    -- Input bus ID_SignExtOut signals
    ID_SignExtOut_data: in T_SYSTEM_UINT32;
    -- Input bus IF_Pipe_IncrementerOut signals
    IF_Pipe_IncrementerOut_addr: in T_SYSTEM_UINT32;
    -- Input bus ID_Jump signals
    ID_Jump_addr: in T_SYSTEM_UINT32;
    -- Input bus ID_Shamt signals
    ID_Shamt_amount: in T_SYSTEM_UINT8;
    -- Input bus ID_WriteDst signals
    ID_WriteDst_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_ALUFunct signals
    ID_ALUFunct_val: in PipelinedMIPS_Funcs;
    -- Input bus ID_RegWrite signals
    ID_RegWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_ALUOp signals
    ID_ALUOp_code: in PipelinedMIPS_ALUOpcodes;
    -- Input bus ID_ALUSrc signals
    ID_ALUSrc_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Branch signals
    ID_Branch_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Jmp signals
    ID_Jmp_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_JAL signals
    ID_JAL_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_BranchNot signals
    ID_BranchNot_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_MemRead signals
    ID_MemRead_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_MemWrite signals
    ID_MemWrite_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_MemToReg signals
    ID_MemToReg_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_ReadA signals
    ID_ReadA_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_ReadB signals
    ID_ReadB_addr: in T_SYSTEM_UINT8;
    -- Input bus ID_Haz_Stall signals
    ID_Haz_Stall_flg: in T_SYSTEM_BOOL;
    -- Input bus ID_Haz_Flush signals
    ID_Haz_Flush_flg: in T_SYSTEM_BOOL;

    -- Output bus ID_Pipe_OutputA signals
    ID_Pipe_OutputA_data: out T_SYSTEM_UINT32;
    -- Output bus ID_Pipe_OutputB signals
    ID_Pipe_OutputB_data: out T_SYSTEM_UINT32;
    -- Output bus ID_Pipe_SignExtOut signals
    ID_Pipe_SignExtOut_data: out T_SYSTEM_UINT32;
    -- Output bus ID_Pipe_IncrementerOut signals
    ID_Pipe_IncrementerOut_addr: out T_SYSTEM_UINT32;
    -- Output bus ID_Pipe_Jump signals
    ID_Pipe_Jump_addr: out T_SYSTEM_UINT32;
    -- Output bus ID_Pipe_Shamt signals
    ID_Pipe_Shamt_amount: out T_SYSTEM_UINT8;
    -- Output bus ID_Pipe_WriteDst signals
    ID_Pipe_WriteDst_addr: out T_SYSTEM_UINT8;
    -- Output bus ID_Pipe_ALUFunct signals
    ID_Pipe_ALUFunct_val: out PipelinedMIPS_Funcs;
    -- Output bus ID_Pipe_RegWrite signals
    ID_Pipe_RegWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_ALUOp signals
    ID_Pipe_ALUOp_code: out PipelinedMIPS_ALUOpcodes;
    -- Output bus ID_Pipe_ALUSrc signals
    ID_Pipe_ALUSrc_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_Branch signals
    ID_Pipe_Branch_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_Jmp signals
    ID_Pipe_Jmp_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_JAL signals
    ID_Pipe_JAL_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_BranchNot signals
    ID_Pipe_BranchNot_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_MemRead signals
    ID_Pipe_MemRead_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_MemWrite signals
    ID_Pipe_MemWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_MemToReg signals
    ID_Pipe_MemToReg_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Pipe_ReadA signals
    ID_Pipe_ReadA_addr: out T_SYSTEM_UINT8;
    -- Output bus ID_Pipe_ReadB signals
    ID_Pipe_ReadB_addr: out T_SYSTEM_UINT8;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_Pipe;

architecture RTL of ID_Pipe is






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
    variable outatmp : T_SYSTEM_UINT32;
    variable outbtmp : T_SYSTEM_UINT32;
    variable signtmp : T_SYSTEM_UINT32;
    variable inctmp : T_SYSTEM_UINT32;
    variable jumptmp : T_SYSTEM_UINT32;
    variable shmttmp : T_SYSTEM_UINT8;
    variable dsttmp : T_SYSTEM_UINT8;
    variable functtmp : PipelinedMIPS_Funcs;
    variable regwritetmp : T_SYSTEM_BOOL;
    variable aluoptmp : PipelinedMIPS_ALUOpcodes;
    variable alusrctmp : T_SYSTEM_BOOL;
    variable branchtmp : T_SYSTEM_BOOL;
    variable jmptmp : T_SYSTEM_BOOL;
    variable jaltmp : T_SYSTEM_BOOL;
    variable bnetmp : T_SYSTEM_BOOL;
    variable memreadtmp : T_SYSTEM_BOOL;
    variable memwritetmp : T_SYSTEM_BOOL;
    variable memtoregtmp : T_SYSTEM_BOOL;
    variable readatmp : T_SYSTEM_UINT8;
    variable readbtmp : T_SYSTEM_UINT8;
    variable flag : T_SYSTEM_BOOL;

    -- #### USER-DATA-CLOCKEDVARIABLES-START
    -- #### USER-DATA-CLOCKEDVARIABLES-END
    begin

        -- Shared initialize code here
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-CLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_Pipe_OutputA_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Pipe_OutputB_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Pipe_SignExtOut_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Pipe_IncrementerOut_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Pipe_Jump_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            ID_Pipe_Shamt_amount <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_Pipe_WriteDst_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_Pipe_ALUFunct_val <= PipelinedMIPS_Funcs_sll;
            ID_Pipe_RegWrite_flg <= '0';
            ID_Pipe_ALUOp_code <= PipelinedMIPS_ALUOpcodes_RFormat;
            ID_Pipe_ALUSrc_flg <= '0';
            ID_Pipe_Branch_flg <= '0';
            ID_Pipe_Jmp_flg <= '0';
            ID_Pipe_JAL_flg <= '0';
            ID_Pipe_BranchNot_flg <= '0';
            ID_Pipe_MemRead_flg <= '0';
            ID_Pipe_MemWrite_flg <= '0';
            ID_Pipe_MemToReg_flg <= '0';
            ID_Pipe_ReadA_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            ID_Pipe_ReadB_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            outatmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            outbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            signtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            inctmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            jumptmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
            shmttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            dsttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            --functtmp := ???;
            regwritetmp := '0';
            --aluoptmp := ???;
            alusrctmp := '0';
            branchtmp := '0';
            jmptmp := '0';
            jaltmp := '0';
            bnetmp := '0';
            memreadtmp := '0';
            memwritetmp := '0';
            memtoregtmp := '0';
            readatmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            readbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            flag := '0';

            -- Reset code here
            -- #### USER-DATA-RESETCODE-START
            -- #### USER-DATA-RESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-CLOCKEDINITIALIZECODE-END


            -- Failed to parse constructor statement: this.functtmp = Funcs.sll
            -- Failed to parse constructor statement: this.aluoptmp = ALUOpcodes.RFormat
            if (ID_Haz_Flush_flg = '1') or (ID_Haz_Stall_flg = '1') then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                outatmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                outbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                signtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                inctmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                jumptmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT32'length));
                shmttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
                dsttmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
                functtmp := PipelinedMIPS_Funcs_sll;
                regwritetmp := '0';
                aluoptmp := PipelinedMIPS_ALUOpcodes_RFormat;
                alusrctmp := '0';
                branchtmp := '0';
                jmptmp := '0';
                jaltmp := '0';
                bnetmp := '0';
                memreadtmp := '0';
                memwritetmp := '0';
                memtoregtmp := '0';
                readatmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
                readbtmp := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_UINT8'length));
            else
                outatmp := ID_OutputA_data;
                outbtmp := ID_OutputB_data;
                signtmp := ID_SignExtOut_data;
                inctmp := IF_Pipe_IncrementerOut_addr;
                jumptmp := ID_Jump_addr;
                shmttmp := ID_Shamt_amount;
                dsttmp := ID_WriteDst_addr;
                functtmp := ID_ALUFunct_val;
                regwritetmp := ID_RegWrite_flg;
                aluoptmp := ID_ALUOp_code;
                alusrctmp := ID_ALUSrc_flg;
                branchtmp := ID_Branch_flg;
                jmptmp := ID_Jmp_flg;
                jaltmp := ID_JAL_flg;
                bnetmp := ID_BranchNot_flg;
                memreadtmp := ID_MemRead_flg;
                memwritetmp := ID_MemWrite_flg;
                memtoregtmp := ID_MemToReg_flg;
                readatmp := ID_ReadA_addr;
                readbtmp := ID_ReadB_addr;
            end if;
            ID_Pipe_OutputA_data <= outatmp;
            ID_Pipe_OutputB_data <= outbtmp;
            ID_Pipe_SignExtOut_data <= signtmp;
            ID_Pipe_IncrementerOut_addr <= inctmp;
            ID_Pipe_Jump_addr <= jumptmp;
            ID_Pipe_Shamt_amount <= shmttmp;
            ID_Pipe_WriteDst_addr <= dsttmp;
            ID_Pipe_ALUFunct_val <= functtmp;
            ID_Pipe_RegWrite_flg <= regwritetmp;
            ID_Pipe_ALUOp_code <= aluoptmp;
            ID_Pipe_ALUSrc_flg <= alusrctmp;
            ID_Pipe_Branch_flg <= branchtmp;
            ID_Pipe_Jmp_flg <= jmptmp;
            ID_Pipe_JAL_flg <= jaltmp;
            ID_Pipe_BranchNot_flg <= bnetmp;
            ID_Pipe_MemRead_flg <= memreadtmp;
            ID_Pipe_MemWrite_flg <= memwritetmp;
            ID_Pipe_MemToReg_flg <= memtoregtmp;
            ID_Pipe_ReadA_addr <= readatmp;
            ID_Pipe_ReadB_addr <= readbtmp;

            -- #### USER-DATA-CODE-START
            -- #### USER-DATA-CODE-END

        end if;
    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
