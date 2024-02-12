# You should have more comments than I do in this file
# Ideally, nearly every line should have a comment next to it! :D

# The five parts of a loop:
#  - initialise
#  - check the condition
#  - the body of the loop
#  - increment the counter and jump back to condition
#  - end!

main:
	# x in $t0

init:
	li	$t0, 24

cond:
	bge	$t0, 42, end

body:
	li	$v0, 1			# mode 1: print int
	move	$a0, $t0		#
	syscall				# print(y)

	li	$v0, 11
	li	$a0, '\n'
	syscall

step:
	add	$t0, $t0, 3
	b	cond

end:
	li	$v0, 0
	jr	$ra