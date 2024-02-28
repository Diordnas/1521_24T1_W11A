# A simple program that will print 10 numbers from an array

N_SIZE = 10


main:
	# i in $t0
	# temp value for address calculation in $t1, $t2

print_numbers_loop_init:
	li	$t0, 0					# int i = 0

print_numbers_loop_cond:
	bge	$t0, N_SIZE, print_numbers_loop_end	# while i < N_SIZE {

print_numbers_loop_body:
	mul	$t1, $t0, 4				# calculate address of numbers[i]
	la	$t2, numbers
	add	$t2, $t2, $t1

	lw	$a0, ($t2)				# printf("%d", numbers[i])
	li	$v0, 1					# mode 1: print_int
	syscall

	li	$a0, '\n'				# printf("\n")
	li	$v0, 11					# mode 11: print_char
	syscall

print_numbers_loop_incr:
	add	$t0, $t0, 1				# i++
	b	print_numbers_loop_cond			# }

print_numbers_loop_end:
	jr	$ra					# return


	.data
numbers:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9