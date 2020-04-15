#Clare Minnerath
#Lab 7 Q2


	.data
fl1:	.float 3.65
fl2:	.float 0.4
fl3:	.float 6.02

	.text
	
	l.s $f0, fl1
	l.s $f1, fl2
	l.s $f2, fl3
	
	add.s $f12, $f0, $f1
	add.s $f12, $f12, $f2
	
	li $v0, 2
	syscall