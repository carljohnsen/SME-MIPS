using System;
namespace PipelinedMIPS
{
    public enum ALUOpcodes
    {
        RFormat,
        sub,
        add,
        addu,
        and,
        or,
        slt,
        sltu,
    }

    public enum ALUOps
    {
        and,
        or,
        add,
        sl,
        sr,
        sra,
        sub,
        slt,
        addu,
        subu,
        mult,
        multu,
        nor,
        div,
        divu,
        xor,
        mtlo,
        mthi,
        mflo,
        mfhi,
        sltu,
    }

    // Values taken from MIPS reference data card from the book
    public enum Funcs
    {
        sll,
        srl = 2,
        sra,
        sllv,
        srlv = 6,
        srav,
        jr,
        jalr,
        movz,
        movn,
        syscall,
        _break, // break is a keyword
        sync = 15,
        mfhi,
        mthi,
        mflo,
        mtlo,
        mult = 24,
        multu,
        div,
        divu,
        add = 32,
        addu,
        sub,
        subu,
        and,
        or,
        xor,
        nor,
        slt = 42,
        sltu,
        tge = 48,
        tgeu,
        tlt,
        tltu,
        teq,
        tne = 54
    }

    public enum Opcodes
    {
        Rformat,
        j = 2,
        jal,
        beq,
        bne,
        blez,
        bgtz,
        addi,
        addiu,
        slti,
        sltiu,
        andi,
        ori,
        xori,
        lui,
        floating = 17,
        lb = 32,
        lh,
        lwl,
        lw,
        lbu,
        lhu,
        lwr,
        sb = 40,
        sh,
        swl,
        sw,
        swr = 46,
        cache,
        ll,
        lwc1,
        lwc2,
        pref,
        ldc1 = 53,
        ldc2,
        sc = 56,
        swc1,
        swc2,
        sdc1 = 61,
        sdc2 = 62,
    }

    public enum ForwardSelection
    {
        original,
        mem,
        wb
    }
}
