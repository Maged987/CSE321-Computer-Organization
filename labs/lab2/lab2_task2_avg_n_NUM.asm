.data

    prompt: .asciiz "Enter count of numbers to get avg: "
    number: .asciiz "Enter the Number: "
    result: .asciiz "Average result is: "
    quotient: .asciiz " and quotient "
    Newline: .asciiz "\n"

.text

main:
    li $t0 , 0
    li $t1 , 0
  
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t2 , $v0

    li $v0, 4
    la $a0, Newline
    syscall

for:
    beq $t1 , $t2 , endloop    

    li $v0, 4
    la $a0, number
    syscall

    li $v0, 5
    syscall
    add $t0 , $t0 , $v0 

    addi $t1 , $t1 , 1
    j for

endloop:
    li $v0, 4
    la $a0, result
    syscall

    div $t0 , $t2
    mflo $a0

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, quotient
    syscall

    mfhi $a0
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall