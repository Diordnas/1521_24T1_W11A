# A program that reads 10 numbers into memory

N_SIZE = 10

main:
	# i in $t0

loop_init:
	li	$t0, 0			# i = 0

loop_cond:
	bge	$t0, N_SIZE, loop_end

loop_body:
	li	$v0, 5			# syscall 5 - read int
	syscall
	move	$t1, $v0		# move user-input value into $t1

	mul	$t2, $t0, 4		# index = i*4;
	sw	$t1, numbers($t2)	# store $t1 into numbers[i]

loop_step:
	add	$t0, $t0, 1		# i++

loop_end:
	li	$v0, 0			# return 0
	jr	$ra

	.data
numbers:	.space 4 * N_SIZE
