# A program that reads 10 numbers into memory

N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

main:
	# i in $t0
	# x in $t1
	# y in $t2

loop_init:
	li	$t0, 0			# i = 0

loop_cond:
	bge	$t0, N_SIZE_D_2, loop_end

loop_body:
	mul	$t3, $t0, 4		# index = i*4;
	lw	$t1, numbers($t3)	# x = numbers[i]

	mul	$t4, N_SIZE_M_1, 4
	sub	$t4, $t4, $t3
	lw	$t2, numbers($t4)	# y = numbers[i from the end]

	sw	$t2, numbers($t3) 	# numbers[i]
	sw	$t1, numbers($t4) 	# numbers[i from the end]

loop_step:
	add	$t0, $t0, 1

	b	loop_cond

loop_end:
	li	$v0, 0
	jr	$ra

	.data
numbers:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
