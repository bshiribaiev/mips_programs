.data
prompt:		.asciiz "Please enter a non-negative integer: "
out:		.asciiz "Hex: "
result:		.asciiz "0x00000000"
.text
main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	la	$t1, result
	addi	$t1, $t1, 9
	
	li 	$t2, 8
loop:
	blez	$t2, end	
	addi 	$t2, $t2, -1
	andi	$t3, $t0, 15
	addi 	$t3, $t3, 48
	srl	$t0, $t0, 4
	li	$t4, 57
	bgt 	$t3, $t4, next
	sb	$t3, ($t1)
	addi	$t1, $t1, -1
	b	loop
next:	
	addi 	$t3, $t3, 7
	sb	$t3, ($t1)
	addi	$t1, $t1, -1
	b	loop
			
end:
	li	$v0, 4
	la	$a0, out
	syscall
	
	la	$a0, result
	syscall
	li	$v0, 10		
	syscall		