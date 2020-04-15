#Clare Minnerath
#Lab 4


	.data
stack:	.word 0, 0, 0, 0, 0
size:	.word 5
sp:	.asciiz "  sp = "
nl:	.asciiz "\n"
gap:	.asciiz " "
save1:	.word 0:31
save2:	.word 0:31
	
	.text
	lw $s0, size
	la $a0, stack
	li $a1, -1
	
	
main:	jal print
	move $a0, $v0
	
	
	li $a2, 1
	jal push
	move $a0, $v0
	move $a1, $v1
	
	
	li $a2, 5
	jal push
	move $a0, $v0
	move $a1, $v1
	
	
	li $a2, 3
	jal push
	move $a0, $v0
	move $a1, $v1

	
	li $a2, 4
	jal push
	move $a0, $v0
	move $a1, $v1
	
	jal print
	move $a0, $v0
	
	jal adds
	move $a0, $v0
	move $a1, $v1
	lw $s0, size		#since funct. composition, you'd need another stack to maintain original $s0
	
	
	jal print
	move $a0, $v0
	
	
	jal adds
	move $a0, $v0
	move $a1, $v1
	lw $s0, size
	
	jal print
	move $a0, $v0
	
	jal pop
	move $a0, $v0
	
	jal print
	move $a0, $v0

	
	j exit
	
print:	sw $s0, save1
	sw $s1, save2
	move $s1, $a0
	
loop:	lw $a0, 0($s1)
	li $v0, 1
	syscall
	la $a0, gap
	li $v0, 4
	syscall
	addi $s1, $s1, 4
	addi $s0, $s0, -1
	bne $s0, $zero, loop
	la $a0, sp
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	la $a0, nl
	li $v0, 4
	syscall
	lw $s0, save1
	lw $s1, save2
	la $v0, stack
	jr $ra
	

push:	sw $s0, save1
	move $v0, $a0

	li $s0, 4
	addi $a1, $a1, 1
	multu $a1, $s0
	mflo $s0
	add $a0, $a0, $s0
	sw $a2, 0($a0)
	move $v1, $a1
	lw $s0, save1
	jr $ra
	
	
pop:	sw $s0, save1
	move $v0, $a0
	
	li $s0, 4
	multu $a1, $s0
	mflo $s0
	add $a0, $a0, $s0
	lw $v1, 0($a0)
	addi $a1, $a1, -1 #sp is passed by ref. in $a1
	lw $s0, save1
	jr $ra
	

adds:	sw $s0, save1
	sw $s1, save2
	move $s1, $ra
	
	jal pop
	move $a0, $v0
	move $s0, $v1
	jal pop
	move $a0, $v0
	add $a2, $s0, $v1
	jal push
	move $ra, $s1
	lw $s0, save1
	lw $s1, save2
	jr $ra		#Note: after calling push a[] is in $v0 and sp in $v1

exit:
	
