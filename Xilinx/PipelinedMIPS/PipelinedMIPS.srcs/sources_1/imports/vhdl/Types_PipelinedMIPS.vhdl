
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

    type PipelinedMIPS_ForwardSelection is
    (PipelinedMIPS_ForwardSelection_original,
     PipelinedMIPS_ForwardSelection_mem,
     PipelinedMIPS_ForwardSelection_wb);

    type PipelinedMIPS_ALUOpcodes is
    (PipelinedMIPS_ALUOpcodes_RFormat,
     PipelinedMIPS_ALUOpcodes_sub,
     PipelinedMIPS_ALUOpcodes_add,
     PipelinedMIPS_ALUOpcodes_addu,
     PipelinedMIPS_ALUOpcodes_and,
     PipelinedMIPS_ALUOpcodes_or,
     PipelinedMIPS_ALUOpcodes_xor,
     PipelinedMIPS_ALUOpcodes_slt,
     PipelinedMIPS_ALUOpcodes_sltu);

    type PipelinedMIPS_Funcs is
    (PipelinedMIPS_Funcs_sll,
     PipelinedMIPS_Funcs_ignore_1,
     PipelinedMIPS_Funcs_srl,
     PipelinedMIPS_Funcs_sra,
     PipelinedMIPS_Funcs_sllv,
     PipelinedMIPS_Funcs_ignore_5,
     PipelinedMIPS_Funcs_srlv,
     PipelinedMIPS_Funcs_srav,
     PipelinedMIPS_Funcs_jr,
     PipelinedMIPS_Funcs_jalr,
     PipelinedMIPS_Funcs_movz,
     PipelinedMIPS_Funcs_movn,
     PipelinedMIPS_Funcs_syscall,
     PipelinedMIPS_Funcs_bbreak,
     PipelinedMIPS_Funcs_ignore_14,
     PipelinedMIPS_Funcs_sync,
     PipelinedMIPS_Funcs_mfhi,
     PipelinedMIPS_Funcs_mthi,
     PipelinedMIPS_Funcs_mflo,
     PipelinedMIPS_Funcs_mtlo,
     PipelinedMIPS_Funcs_ignore_20,
     PipelinedMIPS_Funcs_ignore_21,
     PipelinedMIPS_Funcs_ignore_22,
     PipelinedMIPS_Funcs_ignore_23,
     PipelinedMIPS_Funcs_mult,
     PipelinedMIPS_Funcs_multu,
     PipelinedMIPS_Funcs_div,
     PipelinedMIPS_Funcs_divu,
     PipelinedMIPS_Funcs_ignore_28,
     PipelinedMIPS_Funcs_ignore_29,
     PipelinedMIPS_Funcs_ignore_30,
     PipelinedMIPS_Funcs_ignore_31,
     PipelinedMIPS_Funcs_add,
     PipelinedMIPS_Funcs_addu,
     PipelinedMIPS_Funcs_sub,
     PipelinedMIPS_Funcs_subu,
     PipelinedMIPS_Funcs_and,
     PipelinedMIPS_Funcs_or,
     PipelinedMIPS_Funcs_xor,
     PipelinedMIPS_Funcs_nor,
     PipelinedMIPS_Funcs_ignore_40,
     PipelinedMIPS_Funcs_ignore_41,
     PipelinedMIPS_Funcs_slt,
     PipelinedMIPS_Funcs_sltu,
     PipelinedMIPS_Funcs_ignore_44,
     PipelinedMIPS_Funcs_ignore_45,
     PipelinedMIPS_Funcs_ignore_46,
     PipelinedMIPS_Funcs_ignore_47,
     PipelinedMIPS_Funcs_tge,
     PipelinedMIPS_Funcs_tgeu,
     PipelinedMIPS_Funcs_tlt,
     PipelinedMIPS_Funcs_tltu,
     PipelinedMIPS_Funcs_teq,
     PipelinedMIPS_Funcs_ignore_53,
     PipelinedMIPS_Funcs_tne,
     PipelinedMIPS_Funcs_ignore_55,
     PipelinedMIPS_Funcs_ignore_56,
     PipelinedMIPS_Funcs_ignore_57,
     PipelinedMIPS_Funcs_ignore_58,
     PipelinedMIPS_Funcs_ignore_59,
     PipelinedMIPS_Funcs_ignore_60,
     PipelinedMIPS_Funcs_ignore_61,
     PipelinedMIPS_Funcs_ignore_62,
     PipelinedMIPS_Funcs_ignore_63);

    type PipelinedMIPS_ALUOps is
    (PipelinedMIPS_ALUOps_and,
     PipelinedMIPS_ALUOps_or,
     PipelinedMIPS_ALUOps_add,
     PipelinedMIPS_ALUOps_sl,
     PipelinedMIPS_ALUOps_sr,
     PipelinedMIPS_ALUOps_sra,
     PipelinedMIPS_ALUOps_sub,
     PipelinedMIPS_ALUOps_slt,
     PipelinedMIPS_ALUOps_addu,
     PipelinedMIPS_ALUOps_subu,
     PipelinedMIPS_ALUOps_mult,
     PipelinedMIPS_ALUOps_multu,
     PipelinedMIPS_ALUOps_nor,
     PipelinedMIPS_ALUOps_div,
     PipelinedMIPS_ALUOps_divu,
     PipelinedMIPS_ALUOps_xor,
     PipelinedMIPS_ALUOps_mtlo,
     PipelinedMIPS_ALUOps_mthi,
     PipelinedMIPS_ALUOps_mflo,
     PipelinedMIPS_ALUOps_mfhi,
     PipelinedMIPS_ALUOps_sltu);

    type PipelinedMIPS_Opcodes is
    (PipelinedMIPS_Opcodes_Rformat,
     PipelinedMIPS_Opcodes_ignore_1,
     PipelinedMIPS_Opcodes_j,
     PipelinedMIPS_Opcodes_jal,
     PipelinedMIPS_Opcodes_beq,
     PipelinedMIPS_Opcodes_bne,
     PipelinedMIPS_Opcodes_blez,
     PipelinedMIPS_Opcodes_bgtz,
     PipelinedMIPS_Opcodes_addi,
     PipelinedMIPS_Opcodes_addiu,
     PipelinedMIPS_Opcodes_slti,
     PipelinedMIPS_Opcodes_sltiu,
     PipelinedMIPS_Opcodes_andi,
     PipelinedMIPS_Opcodes_ori,
     PipelinedMIPS_Opcodes_xori,
     PipelinedMIPS_Opcodes_lui,
     PipelinedMIPS_Opcodes_ignore_16,
     PipelinedMIPS_Opcodes_floating,
     PipelinedMIPS_Opcodes_ignore_18,
     PipelinedMIPS_Opcodes_ignore_19,
     PipelinedMIPS_Opcodes_ignore_20,
     PipelinedMIPS_Opcodes_ignore_21,
     PipelinedMIPS_Opcodes_ignore_22,
     PipelinedMIPS_Opcodes_ignore_23,
     PipelinedMIPS_Opcodes_ignore_24,
     PipelinedMIPS_Opcodes_ignore_25,
     PipelinedMIPS_Opcodes_ignore_26,
     PipelinedMIPS_Opcodes_ignore_27,
     PipelinedMIPS_Opcodes_ignore_28,
     PipelinedMIPS_Opcodes_ignore_29,
     PipelinedMIPS_Opcodes_ignore_30,
     PipelinedMIPS_Opcodes_ignore_31,
     PipelinedMIPS_Opcodes_lb,
     PipelinedMIPS_Opcodes_lh,
     PipelinedMIPS_Opcodes_lwl,
     PipelinedMIPS_Opcodes_lw,
     PipelinedMIPS_Opcodes_lbu,
     PipelinedMIPS_Opcodes_lhu,
     PipelinedMIPS_Opcodes_lwr,
     PipelinedMIPS_Opcodes_ignore_39,
     PipelinedMIPS_Opcodes_sb,
     PipelinedMIPS_Opcodes_sh,
     PipelinedMIPS_Opcodes_swl,
     PipelinedMIPS_Opcodes_sw,
     PipelinedMIPS_Opcodes_ignore_44,
     PipelinedMIPS_Opcodes_ignore_45,
     PipelinedMIPS_Opcodes_swr,
     PipelinedMIPS_Opcodes_cache,
     PipelinedMIPS_Opcodes_ll,
     PipelinedMIPS_Opcodes_lwc1,
     PipelinedMIPS_Opcodes_lwc2,
     PipelinedMIPS_Opcodes_pref,
     PipelinedMIPS_Opcodes_ignore_52,
     PipelinedMIPS_Opcodes_ldc1,
     PipelinedMIPS_Opcodes_ldc2,
     PipelinedMIPS_Opcodes_ignore_55,
     PipelinedMIPS_Opcodes_sc,
     PipelinedMIPS_Opcodes_swc1,
     PipelinedMIPS_Opcodes_swc2,
     PipelinedMIPS_Opcodes_ignore_59,
     PipelinedMIPS_Opcodes_ignore_60,
     PipelinedMIPS_Opcodes_sdc1,
     PipelinedMIPS_Opcodes_sdc2,
     PipelinedMIPS_Opcodes_ignore_63);


    -- converts PipelinedMIPS.ForwardSelection into a string
    pure function str(b: PipelinedMIPS_ForwardSelection) return string;
    -- converts PipelinedMIPS.ALUOpcodes into a string
    pure function str(b: PipelinedMIPS_ALUOpcodes) return string;
    -- converts PipelinedMIPS.Funcs into a string
    pure function str(b: PipelinedMIPS_Funcs) return string;
    -- converts PipelinedMIPS.ALUOps into a string
    pure function str(b: PipelinedMIPS_ALUOps) return string;
    -- converts PipelinedMIPS.Opcodes into a string
    pure function str(b: PipelinedMIPS_Opcodes) return string;



-- User defined types here
-- #### USER-DATA-TRAILTYPES-START
-- #### USER-DATA-TRAILTYPES-END


end CUSTOM_TYPES;

package body CUSTOM_TYPES is
    -- converts PipelinedMIPS.ForwardSelection into a string
    pure function str(b: PipelinedMIPS_ForwardSelection) return string is
    begin
        return PipelinedMIPS_ForwardSelection'image(b);
    end str;
    -- converts PipelinedMIPS.ALUOpcodes into a string
    pure function str(b: PipelinedMIPS_ALUOpcodes) return string is
    begin
        return PipelinedMIPS_ALUOpcodes'image(b);
    end str;
    -- converts PipelinedMIPS.Funcs into a string
    pure function str(b: PipelinedMIPS_Funcs) return string is
    begin
        return PipelinedMIPS_Funcs'image(b);
    end str;
    -- converts PipelinedMIPS.ALUOps into a string
    pure function str(b: PipelinedMIPS_ALUOps) return string is
    begin
        return PipelinedMIPS_ALUOps'image(b);
    end str;
    -- converts PipelinedMIPS.Opcodes into a string
    pure function str(b: PipelinedMIPS_Opcodes) return string is
    begin
        return PipelinedMIPS_Opcodes'image(b);
    end str;

-- User defined bodies here
-- #### USER-DATA-BODY-START
-- #### USER-DATA-BODY-END

end CUSTOM_TYPES;