# Prints a right - angled triangle of asterisks, 10 rows high.

main:
	# i in $t0
	# j in $t1

row_loop_init:
	li	$t0, 1

row_loop_cond:
	bgt	$t0, 10, row_loop_end

row_loop_body:

col_loop_init:
	li	$t1, 0

col_loop_cond:
	bge	$t1, $t0, col_loop_end

col_loop_body:
	li	$a0, '*'
	li	$v0, 11
	syscall

col_loop_incr:
	add	$t1, $t1, 1
	b	col_loop_cond

col_loop_end:

	li	$a0, '\n'
	li	$v0, 11
	syscall

row_loop_incr:
	add	$t0, $t0, 1
	b	row_loop_cond

row_loop_end:


	li	$v0, 0
	jr	$ra