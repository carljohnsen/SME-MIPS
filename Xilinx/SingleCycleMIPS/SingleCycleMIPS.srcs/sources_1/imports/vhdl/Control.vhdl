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


entity Control is
  port(
    -- Input bus ControlIn signals
    ControlIn_opcode: in SingleCycleMIPS_Opcodes;

    -- Output bus RegDst signals
    RegDst_flg: out T_SYSTEM_BOOL;
    -- Output bus Branch signals
    Branch_flg: out T_SYSTEM_BOOL;
    -- Output bus MemRead signals
    MemRead_flg: out T_SYSTEM_BOOL;
    -- Output bus MemToReg signals
    MemToReg_flg: out T_SYSTEM_BOOL;
    -- Output bus ALUOp signals
    ALUOp_code: out SingleCycleMIPS_ALUOpcodes;
    -- Output bus MemWrite signals
    MemWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus ALUSrc signals
    ALUSrc_flg: out T_SYSTEM_BOOL;
    -- Output bus RegWrite signals
    RegWrite_flg: out T_SYSTEM_BOOL;
    -- Output bus Jump signals
    Jump_flg: out T_SYSTEM_BOOL;
    -- Output bus JAL signals
    JAL_flg: out T_SYSTEM_BOOL;
    -- Output bus LogicalImmediate signals
    LogicalImmediate_flg: out T_SYSTEM_BOOL;
    -- Output bus BranchNot signals
    BranchNot_flg: out T_SYSTEM_BOOL;


    -- Reset signal
    RST : Std_logic;

    -- Clock signal
    CLK : Std_logic
 );
end Control;

architecture RTL of Control is






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
        ControlIn_opcode,
        CLK,
        RST
    )
    -- Internal variables
    variable opcode : SingleCycleMIPS_Opcodes;
    variable num : T_SYSTEM_INT16;
    variable code : SingleCycleMIPS_ALUOpcodes;

    -- #### USER-DATA-NONCLOCKEDVARIABLES-START
    -- #### USER-DATA-NONCLOCKEDVARIABLES-END
	begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            RegDst_flg <= '0';
            Branch_flg <= '0';
            MemRead_flg <= '0';
            MemToReg_flg <= '0';
            ALUOp_code <= SingleCycleMIPS_ALUOpcodes_RFormat;
            MemWrite_flg <= '0';
            ALUSrc_flg <= '0';
            RegWrite_flg <= '0';
            Jump_flg <= '0';
            JAL_flg <= '0';
            LogicalImmediate_flg <= '0';
            BranchNot_flg <= '0';
            num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END
        else


            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END


            opcode := ControlIn_opcode;
            case opcode is
            when SingleCycleMIPS_Opcodes_Rformat =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(72, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_RFormat;
            when SingleCycleMIPS_Opcodes_lw =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(60, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_add;
            when SingleCycleMIPS_Opcodes_sw =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(34, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_add;
            when SingleCycleMIPS_Opcodes_beq =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(1, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_sub;
            when SingleCycleMIPS_Opcodes_addi =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(40, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_add;
            when SingleCycleMIPS_Opcodes_addiu =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(40, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_addu;
            when SingleCycleMIPS_Opcodes_j =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(128, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_or;
            when SingleCycleMIPS_Opcodes_andi =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_and;
            when SingleCycleMIPS_Opcodes_ori =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_or;
            when SingleCycleMIPS_Opcodes_slti =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_slt;
            when SingleCycleMIPS_Opcodes_xori =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_xor;
            when SingleCycleMIPS_Opcodes_sltiu =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(552, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_sltu;
            when SingleCycleMIPS_Opcodes_jal =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(392, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_or;
            when SingleCycleMIPS_Opcodes_bne =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(1025, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_sub;
            when others =>
                num := STD_LOGIC_VECTOR(TO_UNSIGNED(0, T_SYSTEM_INT16'length));
                code := SingleCycleMIPS_ALUOpcodes_RFormat;
            end case;
            BranchNot_flg <= num(10);
            LogicalImmediate_flg <= num(9);
            JAL_flg <= num(8);
            Jump_flg <= num(7);
            RegDst_flg <= num(6);
            ALUSrc_flg <= num(5);
            MemToReg_flg <= num(4);
            RegWrite_flg <= num(3);
            MemRead_flg <= num(2);
            MemWrite_flg <= num(1);
            Branch_flg <= num(0);
            ALUOp_code <= code;

        end if;

        -- Non-clocked process actions here

        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
