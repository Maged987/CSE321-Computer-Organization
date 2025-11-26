.data
    prompt: .asciiz "Enter a number from 0 to 4: "
    zerocase: .asciiz "Zero case \n"
    firstcase: .asciiz "First case \n"
    secondcase: .asciiz "Second case \n"
    thirdcase: .asciiz "Third case \n"
    fourthcase: .asciiz "Fourth case \n"
    default: .asciiz "Number is wrong \n"

.text

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0 , $v0

switchcase:
case0:
    li $t1 , 0
    bne $t0 , $t1 , case1

    li $v0, 4
    la $a0, zerocase
    syscall

    j endcase

case1:
    li $t1 , 1
    bne $t0 , $t1 , case2

    li $v0, 4
    la $a0, firstcase
    syscall

    j endcase

case2:
    li $t1 , 2
    bne $t0 , $t1 , case3

    li $v0, 4
    la $a0, secondcase
    syscall

    j endcase

case3:
    li $t1 , 3
    bne $t0 , $t1 , case4

    li $v0, 4
    la $a0, thirdcase
    syscall

    j endcase

case4:
    li $t1 , 4
    bne $t0 , $t1 , dfaultcase

    li $v0, 4
    la $a0, fourthcase
    syscall

    j endcase

dfaultcase:
    li $v0, 4
    la $a0, default
    syscall

endcase:

exit:
    li $v0, 10
    syscall