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


entity EX_ALUControl is
  port(
    -- Input bus ID_Pipe_ALUOp signals
    ID_Pipe_ALUOp_code: in PipelinedMIPS_ALUOpcodes;
    -- Input bus ID_Pipe_ALUFunct signals
    ID_Pipe_ALUFunct_val: in PipelinedMIPS_Funcs;

    -- Output bus EX_ALUOperation signals
    EX_ALUOperation_code: out PipelinedMIPS_ALUOps;
    -- Output bus EX_JumpReg signals
    EX_JumpReg_flg: out T_SYSTEM_BOOL;
    -- Output bus EX_Shift signals
    EX_Shift_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end EX_ALUControl;

architecture RTL of EX_ALUControl is






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
        ID_Pipe_ALUOp_code,
        ID_Pipe_ALUFunct_val,
        CLK,
        RST
    )
    -- Internal variables
    variable flag : T_SYSTEM_BOOL;
    variable val : PipelinedMIPS_Funcs;
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
    variable flag15 : T_SYSTEM_BOOL;
    variable flag16 : T_SYSTEM_BOOL;
    variable flag17 : T_SYSTEM_BOOL;
    variable flag18 : T_SYSTEM_BOOL;
    variable flag19 : T_SYSTEM_BOOL;
    variable flag20 : T_SYSTEM_BOOL;
    variable flag21 : T_SYSTEM_BOOL;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_and;
            EX_JumpReg_flg <= '0';
            EX_Shift_flg <= '0';
            flag := '0';
            --val := ???;
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
            flag15 := '0';
            flag16 := '0';
            flag17 := '0';
            flag18 := '0';
            flag19 := '0';
            flag20 := '0';
            flag21 := '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            if ID_Pipe_ALUOp_code = PipelinedMIPS_ALUOpcodes_RFormat then
                flag := '1';
            else
                flag := '0';
            end if;
            if flag = '1' then
                val := ID_Pipe_ALUFunct_val;
                if val = PipelinedMIPS_Funcs_add then
                    flag2 := '1';
                else
                    flag2 := '0';
                end if;
                if flag2 = '1' then
                    EX_ALUOperation_code <= PipelinedMIPS_ALUOps_add;
                    EX_JumpReg_flg <= '0';
                    EX_Shift_flg <= '0';
                else
                    if val = PipelinedMIPS_Funcs_addu then
                        flag3 := '1';
                    else
                        flag3 := '0';
                    end if;
                    if flag3 = '1' then
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_addu;
                        EX_JumpReg_flg <= '0';
                        EX_Shift_flg <= '0';
                    else
                        if val = PipelinedMIPS_Funcs_sub then
                            flag4 := '1';
                        else
                            flag4 := '0';
                        end if;
                        if flag4 = '1' then
                            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sub;
                            EX_JumpReg_flg <= '0';
                            EX_Shift_flg <= '0';
                        else
                            if val = PipelinedMIPS_Funcs_subu then
                                flag5 := '1';
                            else
                                flag5 := '0';
                            end if;
                            if flag5 = '1' then
                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_subu;
                                EX_JumpReg_flg <= '0';
                                EX_Shift_flg <= '0';
                            else
                                if val = PipelinedMIPS_Funcs_and then
                                    flag6 := '1';
                                else
                                    flag6 := '0';
                                end if;
                                if flag6 = '1' then
                                    EX_ALUOperation_code <= PipelinedMIPS_ALUOps_and;
                                    EX_JumpReg_flg <= '0';
                                    EX_Shift_flg <= '0';
                                else
                                    if val = PipelinedMIPS_Funcs_or then
                                        flag7 := '1';
                                    else
                                        flag7 := '0';
                                    end if;
                                    if flag7 = '1' then
                                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_or;
                                        EX_JumpReg_flg <= '0';
                                        EX_Shift_flg <= '0';
                                    else
                                        if val = PipelinedMIPS_Funcs_nor then
                                            flag8 := '1';
                                        else
                                            flag8 := '0';
                                        end if;
                                        if flag8 = '1' then
                                            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_nor;
                                            EX_JumpReg_flg <= '0';
                                            EX_Shift_flg <= '0';
                                        else
                                            if val = PipelinedMIPS_Funcs_slt then
                                                flag9 := '1';
                                            else
                                                flag9 := '0';
                                            end if;
                                            if flag9 = '1' then
                                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_slt;
                                                EX_JumpReg_flg <= '0';
                                                EX_Shift_flg <= '0';
                                            else
                                                if val = PipelinedMIPS_Funcs_sltu then
                                                    flag10 := '1';
                                                else
                                                    flag10 := '0';
                                                end if;
                                                if flag10 = '1' then
                                                    EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sltu;
                                                    EX_JumpReg_flg <= '0';
                                                    EX_Shift_flg <= '0';
                                                else
                                                    if val = PipelinedMIPS_Funcs_jr then
                                                        flag11 := '1';
                                                    else
                                                        flag11 := '0';
                                                    end if;
                                                    if flag11 = '1' then
                                                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_or;
                                                        EX_JumpReg_flg <= '1';
                                                        EX_Shift_flg <= '0';
                                                    else
                                                        if val = PipelinedMIPS_Funcs_srl then
                                                            flag12 := '1';
                                                        else
                                                            flag12 := '0';
                                                        end if;
                                                        if flag12 = '1' then
                                                            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sr;
                                                            EX_JumpReg_flg <= '0';
                                                            EX_Shift_flg <= '1';
                                                        else
                                                            if val = PipelinedMIPS_Funcs_sll then
                                                                flag13 := '1';
                                                            else
                                                                flag13 := '0';
                                                            end if;
                                                            if flag13 = '1' then
                                                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sl;
                                                                EX_JumpReg_flg <= '0';
                                                                EX_Shift_flg <= '1';
                                                            else
                                                                if val = PipelinedMIPS_Funcs_mtlo then
                                                                    flag14 := '1';
                                                                else
                                                                    flag14 := '0';
                                                                end if;
                                                                if flag14 = '1' then
                                                                    EX_ALUOperation_code <= PipelinedMIPS_ALUOps_mtlo;
                                                                    EX_JumpReg_flg <= '0';
                                                                    EX_Shift_flg <= '0';
                                                                else
                                                                    if val = PipelinedMIPS_Funcs_mthi then
                                                                        flag15 := '1';
                                                                    else
                                                                        flag15 := '0';
                                                                    end if;
                                                                    if flag15 = '1' then
                                                                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_mthi;
                                                                        EX_JumpReg_flg <= '0';
                                                                        EX_Shift_flg <= '0';
                                                                    else
                                                                        if val = PipelinedMIPS_Funcs_mflo then
                                                                            flag16 := '1';
                                                                        else
                                                                            flag16 := '0';
                                                                        end if;
                                                                        if flag16 = '1' then
                                                                            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_mflo;
                                                                            EX_JumpReg_flg <= '0';
                                                                            EX_Shift_flg <= '0';
                                                                        else
                                                                            if val = PipelinedMIPS_Funcs_mfhi then
                                                                                flag17 := '1';
                                                                            else
                                                                                flag17 := '0';
                                                                            end if;
                                                                            if flag17 = '1' then
                                                                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_mfhi;
                                                                                EX_JumpReg_flg <= '0';
                                                                                EX_Shift_flg <= '0';
                                                                            else
                                                                                if val = PipelinedMIPS_Funcs_mult then
                                                                                    flag18 := '1';
                                                                                else
                                                                                    flag18 := '0';
                                                                                end if;
                                                                                if flag18 = '1' then
                                                                                    EX_ALUOperation_code <= PipelinedMIPS_ALUOps_mult;
                                                                                    EX_JumpReg_flg <= '0';
                                                                                    EX_Shift_flg <= '0';
                                                                                else
                                                                                    if val = PipelinedMIPS_Funcs_multu then
                                                                                        flag19 := '1';
                                                                                    else
                                                                                        flag19 := '0';
                                                                                    end if;
                                                                                    if flag19 = '1' then
                                                                                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_multu;
                                                                                        EX_JumpReg_flg <= '0';
                                                                                        EX_Shift_flg <= '0';
                                                                                    else
                                                                                        if val = PipelinedMIPS_Funcs_div then
                                                                                            flag20 := '1';
                                                                                        else
                                                                                            flag20 := '0';
                                                                                        end if;
                                                                                        if flag20 = '1' then
                                                                                            EX_ALUOperation_code <= PipelinedMIPS_ALUOps_div;
                                                                                            EX_JumpReg_flg <= '0';
                                                                                            EX_Shift_flg <= '0';
                                                                                        else
                                                                                            if val = PipelinedMIPS_Funcs_divu then
                                                                                                flag21 := '1';
                                                                                            else
                                                                                                flag21 := '0';
                                                                                            end if;
                                                                                            if flag21 = '1' then
                                                                                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_divu;
                                                                                                EX_JumpReg_flg <= '0';
                                                                                                EX_Shift_flg <= '0';
                                                                                            else
                                                                                                EX_ALUOperation_code <= PipelinedMIPS_ALUOps_and;
                                                                                                EX_JumpReg_flg <= '0';
                                                                                                EX_Shift_flg <= '0';
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
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            else
                case ID_Pipe_ALUOp_code is
                    when PipelinedMIPS_ALUOpcodes_sub =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sub;
                    when PipelinedMIPS_ALUOpcodes_add =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_add;
                    when PipelinedMIPS_ALUOpcodes_addu =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_addu;
                    when PipelinedMIPS_ALUOpcodes_and =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_and;
                    when PipelinedMIPS_ALUOpcodes_or =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_or;
                    when PipelinedMIPS_ALUOpcodes_xor =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_xor;
                    when PipelinedMIPS_ALUOpcodes_slt =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_slt;
                    when PipelinedMIPS_ALUOpcodes_sltu =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_sltu;
                    when others =>
                        EX_ALUOperation_code <= PipelinedMIPS_ALUOps_and;
                end case;
                EX_JumpReg_flg <= '0';
                EX_Shift_flg <= '0';
            end if;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
