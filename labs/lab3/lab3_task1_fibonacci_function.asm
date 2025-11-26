.data 

    prompt: .asciiz "\nEnter a number to get its fibonacci: "

.text

func:
        bne $a0 , $zero , if
        move $v0 , $zero 
        j returnfunc

    if:
        li $t1 , 1
        bne $a0 , $t1 , else
        li $v0 , 1 
        j returnfunc

    else:
        li $t1 , 0
        li $t2 , 1 
        li $t3 , 0
        addi $a0 , $a0 , -1

        for:
            beq $t3 , $a0 , endloop
            add $v0 , $t1 , $t2
            move $t1 , $t2
            move $t2 , $v0

            addi $t3 , $t3 , 1
            j for

        endloop:    

returnfunc:
    jr $ra

main:
    addi $sp , $sp , -4
    sw $ra , 0($sp)

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0 , $v0

    jal func

    move $a0 , $v0
    li $v0, 1
    syscall

returnmain:
    lw $ra , 0($sp)
    addi $sp , $sp , 4
    jr $ra
