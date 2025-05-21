.data
array:		.space 40
size:		.word 10
prompt:		.asciiz "Enter 10 integers: "
result:		.asciiz "The sorted array: "
space:		.asciiz " "

.text
main:
	lw	$t0, size
	la 	$s0, array
	
	li	$v0, 4
	la	$a0, prompt
	syscall
input:
	beqz	$t0, next
	li	$v0, 5
	syscall
	sw	$v0, ($s0)
	addi	$s0, $s0, 4
	addi	$t0, $t0, -1
	b 	input
next: 
	addi  	$sp, $sp, -8
	la	$s0, array
	sw	$s0, ($sp)  
	lw	$s2, size
	sw	$s2, 4($sp)
	jal	sort
	lw	$s1, ($sp)
	addi 	$sp, $sp, 8
	li	$v0, 4
	la	$a0, result
	syscall
output:
	blez	$s2, end
	lw	$a0, ($s1)
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, space
	syscall
	
	addi	$s1, $s1, 4
	addi	$s2, $s2, -1
	b 	output
end:	
	li 	$v0, 10
	syscall
sort:
	lw	$t0, 4($sp)
	lw	$t1, ($sp)
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
	lw	$t1, ($sp)
	b 	outer_loop
return:
	jr	$ra
