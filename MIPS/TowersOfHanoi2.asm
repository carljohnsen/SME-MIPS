ori  $a0 $0  20            # n = 3
ori  $sp $0  256         # set stack
ori  $s0 $0  1            # constant 1
la   $ra exit             # Load exit as final return addr

initloop:
sub  $t2 $a0 $t0          # tmp = num - i
sll  $t1 $t0 2            # addr = i * 4
sw   $t2 0($t1)           # mem[addr] = tmp
addi $t0 $t0 1            # i++
beq  $t0 $a0 initloopexit # i == num
j initloop

initloopexit:
sll  $t0 $a0 2            # from = num * 4
sw   $t0 0($sp)           # mem[sp] = from
sw   $t0 4($sp)           # mem[sp+4] = from
sll  $t0 $t0 1            # aux = from * 2
sw   $t0 8($sp)           # mem[sp+8] = aux
addi $a1 $sp 0            # a1 = from
addi $a2 $sp 8            # a2 = aux
addi $a3 $sp 4            # a3 = to
addi $sp $sp 12           # adjust the stack pointer

tower:
beq  $a0 $s0 iftrue       # if num == 1
sw   $ra 0($sp)           # store the return address
sw   $a0 4($sp)           # store the current num
addi $sp $sp 8            # adjust the stack pointer
ori  $t0 $a3 0            # tmp = aux
or   $a3 $0  $a2          # aux = to
or   $a2 $0  $t0          # to  = tmp
addi $a0 $a0 -1           # num-1
jal  tower                # call tower
ori  $t0 $a3 0            # tmp = aux
or   $a3 $0  $a2          # aux = to
or   $a2 $0  $t0          # to  = tmp
lw   $t0 0($a2)           # t = mem[to]
lw   $t1 0($a1)           # f = mem[from]
addi $t1 $t1 -4           # f -= 4
lw   $t2 0($t1)           # tmp = mem[f]
sw   $t2 0($t0)           # mem[t] = tmp
addi $t0 $t0 4            # t += 4
sw   $0  0($t1)           # mem[f] = 0
sw   $t0 0($a2)           # mem[to] = t
sw   $t1 0($a1)           # mem[from] = f
lw   $a0 -4($sp)          # fetch old num
addi $a0 $a0 -1           # num-1
or   $t0 $0  $a1          # tmp = from
or   $a1 $0  $a3          # from = aux
or   $a3 $0  $t0          # aux = tmp
jal  tower                # call tower
or   $t0 $0  $a1          # tmp = from
or   $a1 $0  $a3          # from = aux
or   $a3 $0  $t0          # aux = tmp
addi $sp $sp -8           # adjust stack pointer
lw   $ra 0($sp)           # Load stored return address
jr   $ra                  # return

iftrue:
lw   $t0 0($a2)           # t = mem[to]
lw   $t1 0($a1)           # f = mem[from]
addi $t1 $t1 -4           # f -= 4
lw   $t2 0($t1)           # tmp = mem[f]
sw   $t2 0($t0)           # mem[t] = tmp
addi $t0 $t0 4            # t += 4
sw   $0  0($t1)           # mem[f] = 0
sw   $t0 0($a2)           # mem[to] = t
sw   $t1 0($a1)           # mem[from] = f
jr   $ra                  # return

exit:
nop
nop
nop
nop
nop
