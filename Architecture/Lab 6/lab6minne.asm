#Clare Minnerath
#Lab 6

	.data
RCR:	.word 0xffff0000
RDR:	.word 0xffff0004

	.text
	#set bit 1 of RCR to enable keyboard inturrupt
	lw $t3, RCR
	lw $t0, 0($t3)
	or $t0, $t0, 2
	sw $t0, 0($t3)
	
	#set bit 11 of Copro 0 reg $12 to enable global interrupt
	mfc0 $t2, $12 #read
	#set bit 11
	or $t2, $t2, 0x00000800 #modify

	mtc0 $t2, $12 #write
	
main:	j main

	#interrupt handeler
	.ktext 0x80000180
	#get data from RDR
	lw $t1, RDR
	lb $a0, 0($t1)
	li $v0, 11	#call syscall 11
	syscall
	
	eret
