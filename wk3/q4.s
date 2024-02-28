# // A simple program that will read 10 numbers into an array

N_SIZE = 10

main:
	# i in $t0
	# temp value in $t1

read_numbers_loop_init:
	li	$t0, 0					# i = 0

read_numbers_loop_cond:
	bge	$t0, N_SIZE, read_numbers_loop_end	# while i < N_size {

read_numbers_loop_body:
	li	$v0, 5					# scanf("%d", $t1)
	syscall						# mode 5: read_int
	move	$t1, $v0

	mul	$t2, $t0, 4				# numbers[i] = $t1
	sw	$t1, numbers($t2)

read_numbers_loop_incr:
	add	$t0, $t0, 1				# i++
	b	read_numbers_loop_cond			# }

read_numbers_loop_end:
	jr	$ra					# return

	.data
numbers:
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0		# array of 10 zeroes