#Clare Minnerath
#Assignment 1
#probably not the most efficient or clear but gets it done for nxn

	.data
#A:	.word 1, 2, 3, 4
#B:	.word 5, 6, 7, 8
A:	.word 1, 0, 3, 2, 6, 9, 2, 5, 1
B:	.word 3, 6, 5, 11, 12, 13, 14, 15, 16
n:	.word 3
space:	.asciiz "  "
nl:	.asciiz "\n"

	.text
	la $t0, A
	la $t1, B
	la $t2, n
	lw $t2, 0($t2)
	addi $s3, $s3, 4
	multu $t2, $s3
	mflo $t8			#increment for 2nd matrix
	addi $s4, $s4, -4
	mult $t2, $s4
	mflo $s4			#reset to start of matrix depending on size
	
	and $s1, $s1, $zero		#counters
	and $s0, $s0, $zero
	and $s2, $s2, $zero
	
loop:	lw $t3, 0($t0)			#loop that does work
	lw $t4, 0($t1)
	multu $t3, $t4
	mflo $t5
	add $s7, $s7, $t5
	addi $t0, $t0, 4
	add $t1, $t1, $t8
	addi $s0, $s0, 1
	slt $t6, $s0, $t2
	bne $t6, $zero, loop
	
	li $v0, 1
	add $a0, $s7, $zero		#output new array values
	syscall
	
	la $a0, space			#spacing
	li $v0, 4
	syscall
	
	#first loop
	and $s0, $s0, $zero
	addi $s1, $s1, 1
	la $t1, B
	multu $s3, $s1
	mflo $t9
	add $t0, $t0, $s4
	add $t1, $t1, $t9
	and $s7, $s7, $zero
	slt $t6, $s1, $t2
	bne $t6, $zero, loop
	
	la $a0, nl			#new line
	li $v0, 4
	syscall
	
	
	#final loop
	addi $s2, $s2, 1
	and $s0, $s0, $zero
	and $s1, $s1, $zero
	la $t1, B
	add $t0, $t0, $t8
	slt $t6, $s2,$t2
	and $s7, $s7, $zero
	bne $t6, $zero, loop
	
	
	
	
	
	
