#Clare Minnerath
#Lab 5 
#Peripherial Keyboard in MIPS
	
	.data
RCR:	.word 0xffff0000
RDR:	.word 0xffff0004
mask:	.word 0x00000001
	
	.text 
main:	la $t0, RCR
	lw $t0, 0($t0)
	la $t1, RDR
	lw $t1, 0($t1)
	lw $t2, mask

	lw $t0, 0($t0)
	and $t0, $t0, $t2
	beqz $t0, main
	

	lb $t1, 0($t1)
	move $a0, $t1
	li $v0, 11
	syscall
	
	j main
