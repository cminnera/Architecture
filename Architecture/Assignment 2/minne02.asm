#Clare Minnerath
#Assignment 2


	.data
askdec:	.asciiz "Enter an integer: "
out:	.asciiz "The integer in unsigned binary is: "


	
	.text
	
	la $a0, askdec
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0		#Entered int is now in $t0
	
	
	la $a0, out
	li $v0, 4
	syscall
	
	#convert
	li $s0, 31
	li $s2, -1

	
while:	srlv $t1, $t0, $s0
	and $t1, $t1, 1
	bne $t1, $zero, skip
	li $a0, 0
	li $v0, 1
	syscall
	j endif
skip:	li $a0, 1
	li $v0, 1
	syscall
endif:	addi $s0, $s0, -1
	bne $s0, $s2, while
	
	
	
	
	
	
	