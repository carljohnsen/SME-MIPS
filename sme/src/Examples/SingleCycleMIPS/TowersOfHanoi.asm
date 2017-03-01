main:
ori $a0 $0 3 # num = 3
ori $sp $0 1024
la $ra exit

or $t0 $0 $0 # i = 0
or $t2 $0 $a0 # tmp = 3
initloop:
sll $t1 $t0 2 # addr = i*4
addi $t0 $t0 1 # i++
sw $t2 0($t1) # *(addr) = i
addi $t2 $t2 -1 # tmp--
beq $t0 $a0 initend # if i == num
j initloop
initend: # Store pointers in memory TODO de er ikke aligned...
addi $t0 $a0 1
sll $t0 $t0 2
sw $t0 0($sp)
sw $t0 -4($sp)
sll $t0 $t0 1
sw $t0 -8($sp)
addi $sp $sp -12

towers:
addi $sp $sp 12
lw $t0 0($sp) # from
lw $t1 -4($sp) # to
lw $t2 -8($sp) # aux
ori $t3 $0 1
beq $a0 $t3 if
# else:
sw $a0 0($sp) # store num
sw $ra -4($sp) # store return addr
addi $a0 $a0 -1
sw $t0 -8($sp)
sw $t2 -12($sp)
sw $t1 -16($sp)
addi $sp $sp -20
jal towers
lw $t4 -4($t0)
addi $t5 $t5 1
sw $0 -4($t0)
addi $t0 $t0 -4
sw $t4 0($t1)
addi $t1 $t1 4
sw $t2 0($sp)
sw $t1 -4($sp)
sw $t0 -8($sp)
addi $sp $sp -12
jal towers
lw $ra 4($sp)
lw $a0 8($sp)
addi $sp $sp 8
j ret

if:
lw $t4 -4($t0)
sw $0 -4($t0)
addi $t5 $t5 1
addi $t0 $t0 -4
sw $t4 0($t1)
addi $t1 $t1 4
j ret

ret:
jr $ra

exit: