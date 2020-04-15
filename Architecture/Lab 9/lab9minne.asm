#Clare Minnerath
#Lab 9 - Fibinocci to Look at Memory Reference


	.data
fib:	.word 0 : 20
size:	.word 20
intro:	.asciiz "Here are the first 20 fibonacci numbers: \n"
space:	.asciiz "  "

	.text
	la $a0, intro
	li $v0, 4
	syscall
	
	li $t0, 0
	li $t1, 1
	lw $t3, size
	li $t4, 0
	
loop:	sw $t1, fib($t4)
	add $t2, $t0, $t1
	move $t0, $t1
	move $t1, $t2
	addi $t4, $t4, 4
	sub $t3, $t3, 1
	bne $t3, $zero, loop
	
	li $t4, 0
	lw $t3, size
	
loop2:	lw $a0, fib($t4)
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $t4, $t4, 4
	sub $t3, $t3, 1
	bne $t3, $zero, loop2
	
	
	