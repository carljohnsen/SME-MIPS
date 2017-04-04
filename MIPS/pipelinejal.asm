jal store
ret:
ori $t0 $0 4
sw $t0 12($0)
j exit

store:
ori $t0 $0 1
sw $t0 0($0)
ori $t0 $0 2
sw $t0 4($0)
ori $t0 $0 3
sw $t0 8($0)
lw $t1 0($0)
lw $t2 4($0)
bgt $t2 $t1 ret
#jr $ra

exit:
nop
nop
nop
nop
nop