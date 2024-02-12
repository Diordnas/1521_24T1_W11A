# A program that reads 10 numbers into memory

N_SIZE = 10

main:
	# i in $t0

loop_init:
	li	$t0, 0		# i = 0

loop_cond:
	bge	$t0, N_SIZE, loop_end

loop_body:
	mul	$t2, $t0, 4	# index = i*4;
	lw	$t1, numbers($t2)

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

loop_step:
	add	$t0, $t0, 1

	b	loop_cond

loop_end:
	li	$v0, 0
	jr	$ra

	.data
numbers:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
