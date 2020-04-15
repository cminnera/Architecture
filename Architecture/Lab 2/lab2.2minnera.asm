#Clare Minnerath
#Lab 2 Part 2


	.data
name:	.word 0:19
size:	.word 20
dis:	.word 0:5
dsize:	.word 6
c1:	.word 0:4
c2:	.word 0:4
c3:	.word 0:4
csize:	.word 5
askn:	.asciiz "Enter your name: "
askdis:	.asciiz "Enter 3-letter code of your favorite PC discipline: "
askc:	.asciiz "\nEnter your 3 favorite course numbers in "
thnx:	.asciiz "Thanks, "
close1:	.asciiz "I see you like "
close2:	.asciiz " courses "
com:	.asciiz " , "
comand:	.asciiz " ,and "
fclose: .asciiz ". Great! Have a nice day!"



	.text
	la $a0, askn
	li $v0, 4
	syscall
	
	la $a0, name
	la $t0, size
	lw $a1, 0($t0)
	li $v0, 8
	syscall
	
	la $a0, askdis
	li $v0, 4
	syscall
	
	la $a0, dis
	la $t0, dsize
	lw $a1, 0($t0)
	li $v0, 8
	syscall
	
	la $a0, askc
	li $v0, 4
	syscall
	
	la $a0, dis
	syscall
	
	
	la $a0, c1
	la $t0, csize
	lw $a1, 0($t0)
	li $v0, 8
	syscall
	
	la $a0, c2
	syscall
	
	la $a0, c3
	syscall
	
	
	la $a0, thnx
	li $v0, 4
	syscall
	
	la $a0, name
	syscall
	
	la $a0, close1
	syscall
	
	la $a0, dis
	syscall
	
	la $a0, close2
	syscall
	la $a0, c1
	syscall
	la $a0, com
	syscall
	la $a0, c2
	syscall
	la $a0, comand
	syscall
	la $a0, c3
	syscall
	
	la $a0, fclose
	syscall
	
	
	