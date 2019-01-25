#Clare Minnerath
#Lab 2 Part 1


	.data
greet:	.asciiz "Welcome to Computer Architecture!\n"
year:	.word 2019
wow:	.asciiz "Wow, "
sure:	.asciiz " sure was a great year!\n"
askyr:	.asciiz "What year did you start college? "
asknm:	.asciiz "What is your name? "
name:	.word 0:19
size:	.word 20
close1:	.asciiz "This has been fun, "
close2: .asciiz ", let's continue our conversation another time."

	.text
	la $a0, greet
	li $v0, 4
	syscall
	
	la $a0, askyr
	syscall
	
	li $v0, 5
	syscall
	la $t0, year
	sw $v0, 0($t0)
	
	la $a0, wow
	li $v0, 4
	syscall
	
	la $t0, year
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	la $a0, sure
	li $v0, 4
	syscall
	
	la $a0, asknm
	li $v0, 4
	syscall
	
	la $a0, name
	la $t0, size
	lw $a1, 0($t0)
	li $v0, 8
	syscall
	
	la $a0, close1
	li $v0, 4
	syscall
	
	la $a0, name
	syscall
	
	la $a0, close2
	syscall