
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

package CUSTOM_TYPES is

-- User defined types here
-- #### USER-DATA-CORETYPES-START
-- #### USER-DATA-CORETYPES-END

    type SingleCycleMIPS_Opcodes is
    (SingleCycleMIPS_Opcodes_Rformat,
     SingleCycleMIPS_Opcodes_ignore_1,
     SingleCycleMIPS_Opcodes_j,
     SingleCycleMIPS_Opcodes_jal,
     SingleCycleMIPS_Opcodes_beq,
     SingleCycleMIPS_Opcodes_bne,
     SingleCycleMIPS_Opcodes_blez,
     SingleCycleMIPS_Opcodes_bgtz,
     SingleCycleMIPS_Opcodes_addi,
     SingleCycleMIPS_Opcodes_addiu,
     SingleCycleMIPS_Opcodes_slti,
     SingleCycleMIPS_Opcodes_sltiu,
     SingleCycleMIPS_Opcodes_andi,
     SingleCycleMIPS_Opcodes_ori,
     SingleCycleMIPS_Opcodes_xori,
     SingleCycleMIPS_Opcodes_lui,
     SingleCycleMIPS_Opcodes_ignore_16,
     SingleCycleMIPS_Opcodes_floating,
     SingleCycleMIPS_Opcodes_ignore_18,
     SingleCycleMIPS_Opcodes_ignore_19,
     SingleCycleMIPS_Opcodes_ignore_20,
     SingleCycleMIPS_Opcodes_ignore_21,
     SingleCycleMIPS_Opcodes_ignore_22,
     SingleCycleMIPS_Opcodes_ignore_23,
     SingleCycleMIPS_Opcodes_ignore_24,
     SingleCycleMIPS_Opcodes_ignore_25,
     SingleCycleMIPS_Opcodes_ignore_26,
     SingleCycleMIPS_Opcodes_ignore_27,
     SingleCycleMIPS_Opcodes_ignore_28,
     SingleCycleMIPS_Opcodes_ignore_29,
     SingleCycleMIPS_Opcodes_ignore_30,
     SingleCycleMIPS_Opcodes_ignore_31,
     SingleCycleMIPS_Opcodes_lb,
     SingleCycleMIPS_Opcodes_lh,
     SingleCycleMIPS_Opcodes_lwl,
     SingleCycleMIPS_Opcodes_lw,
     SingleCycleMIPS_Opcodes_lbu,
     SingleCycleMIPS_Opcodes_lhu,
     SingleCycleMIPS_Opcodes_lwr,
     SingleCycleMIPS_Opcodes_ignore_39,
     SingleCycleMIPS_Opcodes_sb,
     SingleCycleMIPS_Opcodes_sh,
     SingleCycleMIPS_Opcodes_swl,
     SingleCycleMIPS_Opcodes_sw,
     SingleCycleMIPS_Opcodes_ignore_44,
     SingleCycleMIPS_Opcodes_ignore_45,
     SingleCycleMIPS_Opcodes_swr,
     SingleCycleMIPS_Opcodes_cache,
     SingleCycleMIPS_Opcodes_ll,
     SingleCycleMIPS_Opcodes_lwc1,
     SingleCycleMIPS_Opcodes_lwc2,
     SingleCycleMIPS_Opcodes_pref,
     SingleCycleMIPS_Opcodes_ignore_52,
     SingleCycleMIPS_Opcodes_ldc1,
     SingleCycleMIPS_Opcodes_ldc2,
     SingleCycleMIPS_Opcodes_ignore_55,
     SingleCycleMIPS_Opcodes_sc,
     SingleCycleMIPS_Opcodes_swc1,
     SingleCycleMIPS_Opcodes_swc2,
     SingleCycleMIPS_Opcodes_ignore_59,
     SingleCycleMIPS_Opcodes_ignore_60,
     SingleCycleMIPS_Opcodes_sdc1,
     SingleCycleMIPS_Opcodes_sdc2,
     SingleCycleMIPS_Opcodes_ignore_63);

    type SingleCycleMIPS_Funcs is
    (SingleCycleMIPS_Funcs_sll,
     SingleCycleMIPS_Funcs_ignore_1,
     SingleCycleMIPS_Funcs_srl,
     SingleCycleMIPS_Funcs_sra,
     SingleCycleMIPS_Funcs_sllv,
     SingleCycleMIPS_Funcs_ignore_5,
     SingleCycleMIPS_Funcs_srlv,
     SingleCycleMIPS_Funcs_srav,
     SingleCycleMIPS_Funcs_jr,
     SingleCycleMIPS_Funcs_jalr,
     SingleCycleMIPS_Funcs_movz,
     SingleCycleMIPS_Funcs_movn,
     SingleCycleMIPS_Funcs_syscall,
     SingleCycleMIPS_Funcs_bbreak,
     SingleCycleMIPS_Funcs_ignore_14,
     SingleCycleMIPS_Funcs_sync,
     SingleCycleMIPS_Funcs_mfhi,
     SingleCycleMIPS_Funcs_mthi,
     SingleCycleMIPS_Funcs_mflo,
     SingleCycleMIPS_Funcs_mtlo,
     SingleCycleMIPS_Funcs_ignore_20,
     SingleCycleMIPS_Funcs_ignore_21,
     SingleCycleMIPS_Funcs_ignore_22,
     SingleCycleMIPS_Funcs_ignore_23,
     SingleCycleMIPS_Funcs_mult,
     SingleCycleMIPS_Funcs_multu,
     SingleCycleMIPS_Funcs_div,
     SingleCycleMIPS_Funcs_divu,
     SingleCycleMIPS_Funcs_ignore_28,
     SingleCycleMIPS_Funcs_ignore_29,
     SingleCycleMIPS_Funcs_ignore_30,
     SingleCycleMIPS_Funcs_ignore_31,
     SingleCycleMIPS_Funcs_add,
     SingleCycleMIPS_Funcs_addu,
     SingleCycleMIPS_Funcs_sub,
     SingleCycleMIPS_Funcs_subu,
     SingleCycleMIPS_Funcs_and,
     SingleCycleMIPS_Funcs_or,
     SingleCycleMIPS_Funcs_xor,
     SingleCycleMIPS_Funcs_nor,
     SingleCycleMIPS_Funcs_ignore_40,
     SingleCycleMIPS_Funcs_ignore_41,
     SingleCycleMIPS_Funcs_slt,
     SingleCycleMIPS_Funcs_sltu,
     SingleCycleMIPS_Funcs_ignore_44,
     SingleCycleMIPS_Funcs_ignore_45,
     SingleCycleMIPS_Funcs_ignore_46,
     SingleCycleMIPS_Funcs_ignore_47,
     SingleCycleMIPS_Funcs_tge,
     SingleCycleMIPS_Funcs_tgeu,
     SingleCycleMIPS_Funcs_tlt,
     SingleCycleMIPS_Funcs_tltu,
     SingleCycleMIPS_Funcs_teq,
     SingleCycleMIPS_Funcs_ignore_53,
     SingleCycleMIPS_Funcs_tne,
     SingleCycleMIPS_Funcs_ignore_55,
     SingleCycleMIPS_Funcs_ignore_56,
     SingleCycleMIPS_Funcs_ignore_57,
     SingleCycleMIPS_Funcs_ignore_58,
     SingleCycleMIPS_Funcs_ignore_59,
     SingleCycleMIPS_Funcs_ignore_60,
     SingleCycleMIPS_Funcs_ignore_61,
     SingleCycleMIPS_Funcs_ignore_62,
     SingleCycleMIPS_Funcs_ignore_63);

    type SingleCycleMIPS_ALUOpcodes is
    (SingleCycleMIPS_ALUOpcodes_RFormat,
     SingleCycleMIPS_ALUOpcodes_sub,
     SingleCycleMIPS_ALUOpcodes_add,
     SingleCycleMIPS_ALUOpcodes_addu,
     SingleCycleMIPS_ALUOpcodes_and,
     SingleCycleMIPS_ALUOpcodes_or,
     SingleCycleMIPS_ALUOpcodes_xor,
     SingleCycleMIPS_ALUOpcodes_slt,
     SingleCycleMIPS_ALUOpcodes_sltu);

    type SingleCycleMIPS_ALUOps is
    (SingleCycleMIPS_ALUOps_and,
     SingleCycleMIPS_ALUOps_or,
     SingleCycleMIPS_ALUOps_add,
     SingleCycleMIPS_ALUOps_sl,
     SingleCycleMIPS_ALUOps_sr,
     SingleCycleMIPS_ALUOps_sra,
     SingleCycleMIPS_ALUOps_sub,
     SingleCycleMIPS_ALUOps_slt,
     SingleCycleMIPS_ALUOps_addu,
     SingleCycleMIPS_ALUOps_subu,
     SingleCycleMIPS_ALUOps_mult,
     SingleCycleMIPS_ALUOps_multu,
     SingleCycleMIPS_ALUOps_nor,
     SingleCycleMIPS_ALUOps_div,
     SingleCycleMIPS_ALUOps_divu,
     SingleCycleMIPS_ALUOps_xor,
     SingleCycleMIPS_ALUOps_mtlo,
     SingleCycleMIPS_ALUOps_mthi,
     SingleCycleMIPS_ALUOps_mflo,
     SingleCycleMIPS_ALUOps_mfhi,
     SingleCycleMIPS_ALUOps_sltu);


    -- converts SingleCycleMIPS.Opcodes into a string
    pure function str(b: SingleCycleMIPS_Opcodes) return string;
    -- converts SingleCycleMIPS.Funcs into a string
    pure function str(b: SingleCycleMIPS_Funcs) return string;
    -- converts SingleCycleMIPS.ALUOpcodes into a string
    pure function str(b: SingleCycleMIPS_ALUOpcodes) return string;
    -- converts SingleCycleMIPS.ALUOps into a string
    pure function str(b: SingleCycleMIPS_ALUOps) return string;



-- User defined types here
-- #### USER-DATA-TRAILTYPES-START
-- #### USER-DATA-TRAILTYPES-END


end CUSTOM_TYPES;

package body CUSTOM_TYPES is
    -- converts SingleCycleMIPS.Opcodes into a string
    pure function str(b: SingleCycleMIPS_Opcodes) return string is
    begin
        return SingleCycleMIPS_Opcodes'image(b);
    end str;
    -- converts SingleCycleMIPS.Funcs into a string
    pure function str(b: SingleCycleMIPS_Funcs) return string is
    begin
        return SingleCycleMIPS_Funcs'image(b);
    end str;
    -- converts SingleCycleMIPS.ALUOpcodes into a string
    pure function str(b: SingleCycleMIPS_ALUOpcodes) return string is
    begin
        return SingleCycleMIPS_ALUOpcodes'image(b);
    end str;
    -- converts SingleCycleMIPS.ALUOps into a string
    pure function str(b: SingleCycleMIPS_ALUOps) return string is
    begin
        return SingleCycleMIPS_ALUOps'image(b);
    end str;

-- User defined bodies here
-- #### USER-DATA-BODY-START
-- #### USER-DATA-BODY-END

end CUSTOM_TYPES;