#Clare Minnerath
#minne01if


	.text					#Instruction Hex Codes
	and $t0, $t0, $zero			#0x01004024
	addi $t0, $t0, 2			#0x21080002
	multu $s1, $t0				#0x02280019
	mflo $t0				#0x00004012
	slt $t2, $t0, $s0			#0x0110502a
	bne $t2, $zero, if			#0x15400002
	addi $s1, $s1, -1			#0x2231ffff
	j skipif				#0x08100009
if:	addi $s0, $s0, 1			#0x22100001
skipif:

	
	
	
