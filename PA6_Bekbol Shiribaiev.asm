.data
array:		.space 40
size:		.word 10
prompt:		.asciiz "Enter an integer: "
result1:	.asciiz "The maximum value: "
result2:	.asciiz "\nThe minimum value: "
.text
main:
	lw	$t0, size
	la 	$a1, array
input:
	beqz	$t0, next
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	
	sw	$v0, ($a1)
	addi	$a1, $a1, 4
	addi	$t0, $t0, -1
	b 	input
next: 
	lw	$a0, size
	la	$a1, array
	jal	sort
	move	$t0, $v0
	move 	$t1, $v1
	
	li	$v0, 4
	la	$a0, result1
	syscall
	li	$v0, 1
	move	$a0, $t1
	syscall
	
	li	$v0, 4
	la	$a0, result2
	syscall
	li	$v0, 1
	move	$a0, $t0
	syscall
	
	li 	$v0, 10
	syscall
sort:
	move	$t0, $a0
	move	$t1, $a1
	addi	$t2, $t0, -1
outer_loop:
	blez 	$t2, return
	li	$t3, 0
inner_loop:	
	bge 	$t3, $t2, updateOuter
	lw	$t4, ($t1)
	lw	$t5, 4($t1)
	bgt 	$t4, $t5, swap
	b 	updateInner
swap:	
	sw	$t5, ($t1)
	sw	$t4, 4($t1)
updateInner:
	addi	$t3, $t3, 1
	addi	$t1, $t1, 4
	b 	inner_loop
updateOuter:
	addi	$t2, $t2, -1
	move	$t1, $a1
	b 	outer_loop
return:
	move	$t1, $a1
	lw	$v0, ($t1)
	lw	$v1, 36($t1)
	jr	$ra
