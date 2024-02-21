

main:
	# x in $t0

loop_init:
	li	$t0, 24

loop_cond:
	bge	$t0, 42, loop_end

loop_body:
	move	$a0, $t0		# printf("%d", y)
	li	$v0, 1			# mode 1: print_int
	syscall

	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# mode 11: print_char
	syscall

loop_incr:
	add	$t0, $t0, 3
	b	loop_cond

loop_end:

	jr	$ra