binarySearch:
	lw	$t0, ($sp) #array
	lw 	$t1, 4($sp) #size
	lw	$t2, 8($sp) #value
	li	$t3, 0 #first
	addi	$t4, $t1, -1 #last
	li	$t5, -1 #position
	li	$t6, 0
	
	addi	$sp, $sp, -16
	sw	$s0, ($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
while:
	bnez   	$t6, return
	bgt  	$t3, $t4, return
	add	$t7, $t3, $t4
	sra	$s0, $t7, 1
	sll    	$s1, $s0, 2
	add	$s3, $t0, $s1
	lw	$s2, ($s3)
	beq	$s2, $t2, if
	bgt 	$s2, $t2, elseIf
	addi	$t3, $s0, 1
	b 	update
if:
	li	$t6, 1
	move	$t5, $s0
	b 	update
elseIf: 
	addi 	$t4, $s0, -1
update:
	b 	while
return:
	lw	$s0, ($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	addi	$sp, $sp, 12
	sw	$t5, 12($sp)
	jr	$ra