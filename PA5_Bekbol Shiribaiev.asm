.data

prompt: .asciiz "Please enter an integer: "
result: .asciiz "0000 0000 0000 0000 0000 0000 0000 0000"

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $t1, result		
	addi $t1, $t1, 38	
	li $t2, 39		
	li $t3, 4		


loop:
	blez $t2, exit		
	andi $t4, $t0, 1	
	addi $t4, $t4, 48	
	sb   $t4, ($t1)		
	srl  $t0, $t0, 1	
	addi $t1, $t1, -1		
	addi $t2, $t2, -1	
	addi $t3, $t3, -1	
	beqz $t3, skip		
	b loop
skip:         
   	addi $t1, $t1, -1     	
    	li $t3,  4 			
    	b loop        
	
exit:
	li $v0, 4
	la $a0, result
	syscall

	li $v0, 10
	syscall
	