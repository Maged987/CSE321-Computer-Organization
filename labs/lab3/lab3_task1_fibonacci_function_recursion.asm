.data

    prompt: .asciiz "\nEnter a number to get its fibonacci: "

.text

func:
    addi $sp , $sp , -12        # to save ra, a0 as we need it again while calling, (fib - 1) value to load it after (fib - 2)
                                # there is no calling after that so no need to save (fib - 2)
    sw $ra , 8($sp)
    sw $a0 , 4($sp)

    bne $a0 , $zero , if
    move $v0 , $zero
    j funcreturn

if:
    li $t0 , 1
    bne $a0 , $t0 , else
    li $v0 , 1
    j funcreturn

else:
    addi $a0 , $a0 , -1

    jal func

    sw $v0 , 0($sp)

    lw $a0 , 4($sp)
    addi $a0 , $a0 , -2

    jal func

    lw $t1 , 0($sp)
    add $v0 , $v0 , $t1

funcreturn:
    lw $a0 , 4($sp)
    lw $ra , 8($sp)
    addi $sp , $sp , 12
    jr $ra

main:
    addi $sp , $sp , -4
    sw $ra, 0($sp)

    li $v0 , 4
    la $a0 , prompt
    syscall

    li $v0 , 5
    syscall
    move $a0 , $v0

    jal func

    move $a0 , $v0
    li $v0 , 1
    syscall

returnmain:
    lw $ra , 0($sp)
    addi $sp , $sp , 4

    jr $ra
