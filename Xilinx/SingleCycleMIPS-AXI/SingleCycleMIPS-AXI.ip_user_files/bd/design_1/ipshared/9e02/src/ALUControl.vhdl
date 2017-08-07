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


entity ALUControl is
  port(
    -- Input bus ALUOp signals
    ALUOp_code: in SingleCycleMIPS_ALUOpcodes;
    -- Input bus ALUFunct signals
    ALUFunct_val: in SingleCycleMIPS_Funcs;

    -- Output bus ALUOperation signals
    ALUOperation_code: out SingleCycleMIPS_ALUOps;
    -- Output bus JumpReg signals
    JumpReg_flg: out T_SYSTEM_BOOL;
    -- Output bus Shift signals
    Shift_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end ALUControl;

architecture RTL of ALUControl is






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
        ALUOp_code,
        ALUFunct_val,
        CLK,
        RST
    )
    -- Internal variables
    variable flag : T_SYSTEM_BOOL;
    variable val : SingleCycleMIPS_Funcs;
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
            ALUOperation_code <= SingleCycleMIPS_ALUOps_and;
            JumpReg_flg <= '0';
            Shift_flg <= '0';
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


            if ALUOp_code = SingleCycleMIPS_ALUOpcodes_RFormat then
                val := ALUFunct_val;
                case val is
                    when SingleCycleMIPS_Funcs_add =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_add;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_addu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_addu;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_sub =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sub;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_subu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_subu;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_and =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_and;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_or =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_or;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_nor =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_nor;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_slt =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_slt;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_sltu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sltu;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_jr =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_or;
                        JumpReg_flg <= '1';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_srl =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sr;
                        JumpReg_flg <= '0';
                        Shift_flg <= '1';
                    when SingleCycleMIPS_Funcs_sll =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sl;
                        JumpReg_flg <= '0';
                        Shift_flg <= '1';
                    when SingleCycleMIPS_Funcs_mtlo =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_mtlo;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_mthi =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_mthi;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_mflo =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_mflo;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_mfhi =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_mfhi;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_mult =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_mult;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_multu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_multu;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_div =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_div;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when SingleCycleMIPS_Funcs_divu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_divu;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                    when others =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_and;
                        JumpReg_flg <= '0';
                        Shift_flg <= '0';
                end case;
            else
                case ALUOp_code is
                    when SingleCycleMIPS_ALUOpcodes_sub =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sub;
                    when SingleCycleMIPS_ALUOpcodes_add =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_add;
                    when SingleCycleMIPS_ALUOpcodes_addu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_addu;
                    when SingleCycleMIPS_ALUOpcodes_and =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_and;
                    when SingleCycleMIPS_ALUOpcodes_or =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_or;
                    when SingleCycleMIPS_ALUOpcodes_xor =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_xor;
                    when SingleCycleMIPS_ALUOpcodes_slt =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_slt;
                    when SingleCycleMIPS_ALUOpcodes_sltu =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_sltu;
                    when others =>
                        ALUOperation_code <= SingleCycleMIPS_ALUOps_and;
                end case;
                JumpReg_flg <= '0';
                Shift_flg <= '0';
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
