# Set the stack pointer
ori $sp 100

# Load data into memory
ori $1 $0 4
sw $1 0($0)
ori $1 $0 5
sw $1 4($0)
ori $1 $0 2
sw $1 8($0)
ori $1 $0 3
sw $1 12($0)
ori $1 $0 1
sw $1 16($0)
ori $1 $0 11
sw $1 20($0)
ori $1 $0 6
sw $1 24($0)
ori $1 $0 16
sw $1 28($0)
ori $1 $0 -1
sw $1 32($0)
ori $1 $0 7
sw $1 36($0)

or $a0 $0 $0
addi $a1, $zero, 0 # left = 0
addi $a2, $zero, 9 # right = 4

qsort:
bge $a1, $a2, return
sll $t0, $a1, 2 # left * 4
add $t1, $a0, $t0 # addresse til lef
lw $t0, ($t1) # tmp = v[left]
add $t3, $a1, $a2 # $t3 = left + right
#div $t3, $t3, 2   # $t3 = $t3 / 2
srl $t3 $t3 1 
sll $t3, $t3, 2
add $t3, $a0, $t3
lw $t2, ($t3) # v[(left + right)/2]
sw $t2, ($t1) # v[left] = v[(left + right)/2]
add $t9, $t2, $zero # gem pivot
sw $t0, ($t3) # v[(left + right)/2] = tmp

add $t5, $a1, $zero # last = left
addi $t4, $a1, 0 # i = left + 1
j condition

loop:
sll $t3, $t4, 2 # i * 4
add $t3, $a0, $t3 
lw $t6, ($t3) # v[i]
bge $t6, $t9, condition # if $t6 >= $t0
addi $t5, $t5, 1 # last++
sll $t7, $t5, 2
add $t7, $t7, $a0
lw $t0, ($t7) # tmp = v[last]
sw $t6, ($t7) # v[last] = v[i]
sw $t0, ($t3) # v[i] = tmp


condition:
addi $t4, $t4, 1 # i++
ble $t4, $a2, loop

sll $t7, $t5, 2
add $t7, $t7, $a0

add $t0, $t9, $zero
lw $t2, ($t7) # v[last]
sw $t2, ($t1) # v[left] = v[last]
sw $t0, ($t7) # v[last] = v[left]


addi $sp, $sp, -4
sw $t5, ($sp)
addi $sp, $sp, -4
sw $a2, ($sp)
addi $sp, $sp, -4
sw $ra, ($sp)

addi $a2, $t5, -1
jal qsort

lw $ra, ($sp)
addi $sp, $sp, 4
lw $a2, ($sp)
addi $sp, $sp, 4
lw $a1, ($sp)
addi $a1, $a1, 1
sw $ra, ($sp)

jal qsort

lw $ra, ($sp)
addi $sp, $sp, 4
return:

beqz $ra, exit
jr $ra
exit: