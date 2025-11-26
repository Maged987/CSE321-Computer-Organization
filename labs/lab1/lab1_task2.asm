.data

    Name: .asciiz "Maged Abdelaziz Mohamed"
    ID: .asciiz "123" 
    Course: .asciiz "CSE321-Computer-Organization"
    Newline: .asciiz "\n"

.text

main:
    li $v0, 4
    la $a0, Name
    syscall

    li $v0, 4
    la $a0, Newline
    syscall

    li $v0, 4
    la $a0, ID
    syscall

    li $v0, 4
    la $a0, Newline
    syscall

    li $v0, 4
    la $a0, Course
    syscall 

exit:
    li $v0, 10
    syscall