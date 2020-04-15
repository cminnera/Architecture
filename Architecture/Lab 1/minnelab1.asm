#Clare Minnerath
#Lab 1 Exercise


	.data
x:	.word 3, 4, 8, 2, 9, 3, 6, 7, 10, 4, 12, 5, 7, 1, 2
size:	.word 15

	.text
	la $t0, x
	la $t1, size
	lw $t1, 0($t1)
	lw $t2, 0($t0)   	#current sum
	slti $t4, $t2, 5
	bne $t4, $zero, skip
	addi $t5, $t5, 1
skip:	addi $t0, $t0, 4
	addi $t1, $t1, -1
loop:	lw $t3, 0($t0)
	add $t2, $t2, $t3
	slti $t4, $t3, 5
	bne $t4, $zero, skip2
	addi $t5, $t5, 1
skip2:	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bne  $t1, $zero, loop	#loop if size is not zero
	add $s0, $s0, $t2
	add $s1, $s1, $t5
