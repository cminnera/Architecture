#Clare Minnerath
#Assignment 4
#Peripherial Keyboard in MIPS
	
	.data
RCR:	.word 0xffff0000
RDR:	.word 0xffff0004
mask:	.word 0x00000001
TDR:	.word 0xffff000c
TCR:	.word 0xffff0008
	
	.text 
main:	lw $t2, mask

loop:	la $t0, RCR
	lw $t0, 0($t0)
	la $t1, RDR
	lw $t1, 0($t1)

	lw $t0, 0($t0)
	and $t0, $t0, $t2
	beqz $t0, loop
	

	lb $t1, 0($t1)
	
loop2:	lw $t3, TCR
	lw $t4, TDR
	
	lw $t3, 0($t3)
	and $t3, $t3, $t2
	beqz $t3, loop2
	
	sb $t1, 0($t4)
	
	
	j main