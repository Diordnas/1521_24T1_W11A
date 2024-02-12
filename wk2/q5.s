# You should have more comments than I do in this file
# Ideally, nearly every line should have a comment next to it! :D

# The five parts of a loop:
#  - initialise
#  - check the condition
#  - the body of the loop
#  - increment the counter and jump back to condition
#  - end!

main:
	# i in $t0
	# j in $t1

outer_loop_init:
	li	$t0, 1

outer_loop_cond:
	bgt	$t0, 10, outer_loop_end

outer_loop_body:

inner_loop_init:
	li	$t1, 0

inner_loop_cond:
	bge	$t1, $t0, inner_loop_end

inner_loop_body:
	li	$v0, 11
	li	$a0, '*'
	syscall

inner_loop_step:
	add	$t1, $t1, 1
	b	inner_loop_cond

inner_loop_end:

	li	$v0, 11
	li	$a0, '\n'
	syscall

outer_loop_step:
	add	$t0, $t0, 1
	b	outer_loop_cond

outer_loop_end:
	li	$v0, 0
	jr	$ra