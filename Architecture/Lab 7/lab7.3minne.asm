#Clare Minnerath
#Lab 7 Q3


	.data
d1:	.double 1.2
d2:	.double 913.412
d3:	.double 41223.2

	.text
	
	l.d $f2, d1
	l.d $f4, d2
	l.d $f6, d3
	
	add.d $f12, $f2, $f4
	add.d $f12, $f12, $f6
	
	li $v0, 3
	syscall