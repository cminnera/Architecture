#Clare Minnerath
#Lab 7 Q1


	.data
upw1:	.word 0x0310f290
low1:	.word 0x4012e020
upw2:	.word 0x0023a401
low2:	.word 0x229bf033
upw3:	.space 4
low3:	.space 4 


	.text
	lw $t0, upw1
	lw $t1, upw2
	lw $t2, low1
	lw $t3, low2
	
	add $t0, $t0, $t1	#add upper 32
	
	add $t2, $t2, $t3	#add lower 32
	
	sltu $t4, $t2, $t3
	
	add $t0, $t0, $t4	#add carry to upper 32
	
	sw $t2, low3
	sw $t0, upw3
	
	
	