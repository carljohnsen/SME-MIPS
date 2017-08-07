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


entity ID_Control is
  port(
    -- Input bus ID_ControlIn signals
    ID_ControlIn_opcode: in PipelinedMIPS_Opcodes;

    -- Output bus ID_RegDst signals
    ID_RegDst_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Branch signals
    ID_Branch_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_MemRead signals
    ID_MemRead_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_MemToReg signals
    ID_MemToReg_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_ALUOp signals
    ID_ALUOp_code: out PipelinedMIPS_ALUOpcodes;
    -- Output bus ID_MemWrite signals
    ID_MemWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_ALUSrc signals
    ID_ALUSrc_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_RegWrite signals
    ID_RegWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_Jmp signals
    ID_Jmp_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_JAL signals
    ID_JAL_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_LogicalImmediate signals
    ID_LogicalImmediate_flg: out T_SYSTEM_BOOL;
    -- Output bus ID_BranchNot signals
    ID_BranchNot_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ID_Control;

architecture RTL of ID_Control is






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
        ID_ControlIn_opcode,
        CLK,
        RST
    )
    -- Internal variables
    variable opcode : PipelinedMIPS_Opcodes;
    variable flag : T_SYSTEM_BOOL;
    variable num : T_SYSTEM_INT16;
    variable code : PipelinedMIPS_ALUOpcodes;
    variable flag2 : T_SYSTEM_BOOL;
    variable flag3 : T_SYSTEM_BOOL;
    variable flag4 : T_SYSTEM_BOOL;
    variable flag5 : T_SYSTEM_BOOL;
    variable flag6 : T_SYSTEM_BOOL;
    variable flag7 : T_SYSTEM_BOOL;
    variable flag8 : T_SYSTEM_BOOL;
    variable flag9 : T_SYSTEM_BOOL;
    variable flag10 : T_SYSTEM_BOOL;
    variable flag11 : T_SYSTEM_BOOL;
    variable flag12 : T_SYSTEM_BOOL;
    variable flag13 : T_SYSTEM_BOOL;
    variable flag14 : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            ID_RegDst_flg <= '0';
            ID_Branch_flg <= '0';
            ID_MemRead_flg <= '0';
            ID_MemToReg_flg <= '0';
            ID_ALUOp_code <= PipelinedMIPS_ALUOpcodes_RFormat;
            ID_MemWrite_flg <= '0';
            ID_ALUSrc_flg <= '0';
            ID_RegWrite_flg <= '0';
            ID_Jmp_flg <= '0';
            ID_JAL_flg <= '0';
            ID_LogicalImmediate_flg <= '0';
            ID_BranchNot_flg <= '0';
            --opcode := ???;
            flag := '0';
            num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
            --code := ???;
            flag2 := '0';
            flag3 := '0';
            flag4 := '0';
            flag5 := '0';
            flag6 := '0';
            flag7 := '0';
            flag8 := '0';
            flag9 := '0';
            flag10 := '0';
            flag11 := '0';
            flag12 := '0';
            flag13 := '0';
            flag14 := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            opcode := ID_ControlIn_opcode;
            if opcode = PipelinedMIPS_Opcodes_Rformat then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(72, T_SYSTEM_INT16'length));
                code := PipelinedMIPS_ALUOpcodes_RFormat;
            else
                if opcode = PipelinedMIPS_Opcodes_lw then
                    flag2 := '1';
                else
                    flag2 := '0';
                end if;
                if flag2 = '1' then
                    num := STD_LOGIC_VECTOR(TO_UNSIGNED(60, T_SYSTEM_INT16'length));
                    code := PipelinedMIPS_ALUOpcodes_add;
                else
                    if opcode = PipelinedMIPS_Opcodes_sw then
                        flag3 := '1';
                    else
                        flag3 := '0';
                    end if;
                    if flag3 = '1' then
                        num := STD_LOGIC_VECTOR(TO_UNSIGNED(34, T_SYSTEM_INT16'length));
                        code := PipelinedMIPS_ALUOpcodes_add;
                    else
                        if opcode = PipelinedMIPS_Opcodes_beq then
                            flag4 := '1';
                        else
                            flag4 := '0';
                        end if;
                        if flag4 = '1' then
                            num := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length));
                            code := PipelinedMIPS_ALUOpcodes_sub;
                        else
                            if opcode = PipelinedMIPS_Opcodes_addi then
                                flag5 := '1';
                            else
                                flag5 := '0';
                            end if;
                            if flag5 = '1' then
                                num := STD_LOGIC_VECTOR(TO_UNSIGNED(40, T_SYSTEM_INT16'length));
                                code := PipelinedMIPS_ALUOpcodes_add;
                            else
                                if opcode = PipelinedMIPS_Opcodes_addiu then
                                    flag6 := '1';
                                else
                                    flag6 := '0';
                                end if;
                                if flag6 = '1' then
                                    num := STD_LOGIC_VECTOR(TO_UNSIGNED(40, T_SYSTEM_INT16'length));
                                    code := PipelinedMIPS_ALUOpcodes_addu;
                                else
                                    if opcode = PipelinedMIPS_Opcodes_j then
                                        flag7 := '1';
                                    else
                                        flag7 := '0';
                                    end if;
                                    if flag7 = '1' then
                                        num := STD_LOGIC_VECTOR(TO_UNSIGNED(128, T_SYSTEM_INT16'length));
                                        code := PipelinedMIPS_ALUOpcodes_or;
                                    else
                                        if opcode = PipelinedMIPS_Opcodes_andi then
                                            flag8 := '1';
                                        else
                                            flag8 := '0';
                                        end if;
                                        if flag8 = '1' then
                                            num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                                            code := PipelinedMIPS_ALUOpcodes_and;
                                        else
                                            if opcode = PipelinedMIPS_Opcodes_ori then
                                                flag9 := '1';
                                            else
                                                flag9 := '0';
                                            end if;
                                            if flag9 = '1' then
                                                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                                                code := PipelinedMIPS_ALUOpcodes_or;
                                            else
                                                if opcode = PipelinedMIPS_Opcodes_slti then
                                                    flag10 := '1';
                                                else
                                                    flag10 := '0';
                                                end if;
                                                if flag10 = '1' then
                                                    num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                                                    code := PipelinedMIPS_ALUOpcodes_slt;
                                                else
                                                    if opcode = PipelinedMIPS_Opcodes_xori then
                                                        flag11 := '1';
                                                    else
                                                        flag11 := '0';
                                                    end if;
                                                    if flag11 = '1' then
                                                        num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                                                        code := PipelinedMIPS_ALUOpcodes_xor;
                                                    else
                                                        if opcode = PipelinedMIPS_Opcodes_sltiu then
                                                            flag12 := '1';
                                                        else
                                                            flag12 := '0';
                                                        end if;
                                                        if flag12 = '1' then
                                                            num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                                                            code := PipelinedMIPS_ALUOpcodes_sltu;
                                                        else
                                                            if opcode = PipelinedMIPS_Opcodes_jal then
                                                                flag13 := '1';
                                                            else
                                                                flag13 := '0';
                                                            end if;
                                                            if flag13 = '1' then
                                                                num := STD_LOGIC_VECTOR(TO_UNSIGNED(392, T_SYSTEM_INT16'length));
                                                                code := PipelinedMIPS_ALUOpcodes_or;
                                                            else
                                                                if opcode = PipelinedMIPS_Opcodes_bne then
                                                                    flag14 := '1';
                                                                else
                                                                    flag14 := '0';
                                                                end if;
                                                                if flag14 = '1' then
                                                                    num := STD_LOGIC_VECTOR(TO_UNSIGNED(1025, T_SYSTEM_INT16'length));
                                                                    code := PipelinedMIPS_ALUOpcodes_sub;
                                                                else
                                                                    num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
                                                                    code := PipelinedMIPS_ALUOpcodes_RFormat;
                                                                end if;
                                                            end if;
                                                        end if;
                                                    end if;
                                                end if;
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 10))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_BranchNot_flg <= '1';
            else
                ID_BranchNot_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 9))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_LogicalImmediate_flg <= '1';
            else
                ID_LogicalImmediate_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 8))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_JAL_flg <= '1';
            else
                ID_JAL_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 7))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_Jmp_flg <= '1';
            else
                ID_Jmp_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 6))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_RegDst_flg <= '1';
            else
                ID_RegDst_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 5))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_ALUSrc_flg <= '1';
            else
                ID_ALUSrc_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 4))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_MemToReg_flg <= '1';
            else
                ID_MemToReg_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 3))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_RegWrite_flg <= '1';
            else
                ID_RegWrite_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 2))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_MemRead_flg <= '1';
            else
                ID_MemRead_flg <= '0';
            end if;
            if SIGNED((STD_LOGIC_VECTOR((shift_right(SIGNED(num), 1))) and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_MemWrite_flg <= '1';
            else
                ID_MemWrite_flg <= '0';
            end if;
            if SIGNED((num and STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length)))) = TO_SIGNED(1, 16) then
                ID_Branch_flg <= '1';
            else
                ID_Branch_flg <= '0';
            end if;
            ID_ALUOp_code <= code;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
