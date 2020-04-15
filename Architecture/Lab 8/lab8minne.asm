#Clare Minnerath
#Lab 8

	.data
error:	.asciiz "Error, overflow occured "
asku:	.asciiz "Enter an integer "
nl:	.asciiz "\n"
sum:	.asciiz "The sum is "


	.text
	
	#set bit 11 of Copro 0 reg $12 to enable global interrupt
	mfc0 $t2, $12 #read
	#set bit 11
	or $t2, $t2, 0x00000800 #modify

	mtc0 $t2, $12 #write
	
	
main:	la $a0, asku
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0		#Entered int is now in $t0
	
	la $a0, asku
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0		#Entered int is now in $t1
	
	

	
	add $t0, $t0, $t1
	
	la $a0, sum
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	
	
	
	syscall


	la $a0, nl
	li $v0, 4
	syscall
	syscall
	j main

	#interrupt handeler
	.ktext 0x80000180
	la $a0, error
	li $v0, 4	#call syscall 4
	syscall
	

