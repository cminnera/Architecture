#Clare Minnerath
#Lab 3

#Different From Assign 2 because it shifts the mask rather than 


	.data
askdec:	.asciiz "Enter an integer: "
out:	.asciiz "The integer in unsigned binary is: "
mask:	.word 2147483648


	
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
	
	la $t2, mask
	lw $t2, 0($t2)
	
	#convert
	li $s0, 32

	
while:	add $t1, $t1, $t0
	and $t1, $t1, $t2
	srl $t2, $t2, 1
	bne $t1, $zero, skip
	li $a0, 0
	li $v0, 1
	syscall
	j endif
skip:	li $a0, 1
	li $v0, 1
	syscall
endif:	addi $s0, $s0, -1
	bne $s0, $zero, while