
get_str_len:
	# s in $t0
	# length in $t1

loop_init:
	la	$t0, string	# s = &string[0]
	li	$t1, 0		# length = 0

loop_cond:
	lb	$t2, ($t0)
	beqz	$t2, loop_end

loop_step:
	add	$t1, $t1, 1	# length++
	add	$t0, $t0, 1	# s++

	b	loop_cond

loop_end:

	move	$v0, $t1	# return length;
	jr	$ra

	.data
string:
	.asciiz "...."