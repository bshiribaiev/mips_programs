# Program that asks the user to enter a year, and then determines and displays whether it is a leap year. 
.data
prompt:		.asciiz "Please enter a year: "
result1:	.asciiz "It is a leap year!"
result2:	.asciiz "It is not a leap year."
.text
main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	move	$t0, $v0
	
	rem 	$t1, $t0, 400
	rem	$t2, $t0, 100
	rem	$t3, $t0, 4
	
	beqz   	$t1, one
	beqz	$t3, two
one:	
	bnez  	$t2, end
	bnez	$t3, end			
	li	$v0, 4
	la	$a0, result1
	syscall

	li	$v0, 10
	syscall
two:
	beqz	$t2, end
	li	$v0, 4
	la	$a0, result1
	syscall

	li	$v0, 10
	syscall
end:
	li	$v0, 4
	la	$a0, result2
	syscall
	
	li	$v0, 10
	syscall		
			