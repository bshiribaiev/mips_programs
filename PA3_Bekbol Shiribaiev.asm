.data
prompt:		.asciiz "Enter an integer: "
evenAvr:	.asciiz "The average of even numbers you enterd is: "	
oddAvr:		.asciiz "\nThe average of odd numbers you entered is: "
num:		.word -99	
.text
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	lw	$t1, num
	li	$s0, 0
	li	$s1, 0
	li	$t3, 0
	li	$t4, 0
even:		
	beq 	$v0, $t1, end
	andi 	$t2, $v0, 1
	bnez  	$t2, odd
	move 	$t0, $v0
	add	$s0, $s0, $t0
	addi	$t3, $t3, 1
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	b 	even
odd: 
	beq 	$v0, $t1, end
	andi 	$t2, $v0, 1
	beqz   	$t2, even
	move	$t5, $v0
	add	$s1, $s1, $t5
	addi	$t4, $t4, 1
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	b 	odd	
end:
	div	$s0, $t3
	mflo	$s2
	
	div	$s1, $t4
	mflo	$s3
	
	li	$v0, 4
	la	$a0, evenAvr
	syscall
	
	li	$v0, 1
	move	$a0, $s2
	syscall
	
	li	$v0, 4
	la	$a0, oddAvr
	syscall
	
	li	$v0, 1
	move	$a0, $s3
	syscall
	
	li	$v0, 10
	syscall

	
									