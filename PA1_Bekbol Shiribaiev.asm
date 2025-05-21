.data 
prompt1: .asciiz "Please enter a number: "
prompt2: .asciiz "Please enter second number: "
sum:	 .asciiz "The sum of the numbers is: "
diffr:	 .asciiz "\nnum1 - num2 + 2: "
product: .asciiz "\nnum1 * num2 - 5: "
quotient: .asciiz "\nInteger result of num1/num2: "
remainder:	 .asciiz "\nRemainder of num1 and num2 is: "

.text
	li	$v0, 4
	la	$a0, prompt1
	syscall			#print the first prompt
	
	li	$v0, 5
	syscall			#store the input in v0
	
	move	$t0, $v0	
	
	li 	$v0, 4
	la	$a0, prompt2
	syscall			#print the second prompt
	
	li	$v0, 5
	syscall			#store the second input in v0
	
	move 	$t1, $v0
	
	add	$t2, $t1, $t0	#add t1 and t0
	li	$v0, 4
	la	$a0, sum
	syscall
	
	li	$v0, 1
	move	$a0, $t2
	syscall			#print the sum
	
	sub	$t2, $t0, $t1
	addi	$t2, $t2, 2	
	
	li	$v0, 4
	la	$a0, diffr
	syscall
	
	li	$v0, 1
	move	$a0, $t2
	syscall			#print the diffr
	
	mult	$t0, $t1
	mflo	$t2
	addi	$t2, $t2, -5
	
	li	$v0, 4
	la	$a0, product
	syscall 
	
	li	$v0, 1
	move	$a0, $t2
	syscall
	
	div	$t0, $t1
	mflo	$t2
	mfhi	$t3
	
	li	$v0, 4
	la	$a0, quotient
	syscall
	
	li	$v0, 1
	move	$a0, $t2
	syscall
	
	li	$v0, 4
	la	$a0, remainder
	syscall
	
	li	$v0, 1
	move 	$a0, $t3
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	