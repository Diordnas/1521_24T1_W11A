
main:
	push	$ra		# preserve value of $ra
				# we must do this for any function that calls a function
	# result in $t0

	li	$a0, 11		# result = sum4(11, 13, 17, 19)
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	move	$t0, $v0

	move	$a0, $t0	# print(sum4)
	li	$v0, 1		# syscall mode 1: print_int
	syscall

	li	$a0, '\n'	# print('\n')
	li	$v0, 11		# syscall mode 11: print_char
	syscall

	li	$v0, 0		# return = 0

	pop	$ra		# pop $ra

	jr	$ra		# return


sum4:
	push	$ra		# push all values we must preserve
	push	$s0
	push	$s1
	push	$s2
	push	$s3
	push	$s4
	push	$s5

	# $a0: a in $s2
	# $a1: b in $s3
	# $a2: c in $s4
	# $a3: d in $s5
	move	$s0, $a0	# move values out of a registers to keep them safe
	move	$s1, $a1
	move	$s2, $a2
	move	$s3, $a3


	# res1 in $s4
	# res2 in $s5
	move	$a0, $s0	# res 1 = sum2(a, b)
	move	$a1, $s1
	jal	sum2
	move	$s4, $v0

	move	$a0, $s2	# res2 = sum2(c, d)
	move	$a1, $s3
	jal	sum2
	move	$s5, $v0

	move	$a0, $s4	# return sum2(res1, res2)
	move	$a1, $s5
	jal	sum2

	pop	$s5		# pop in the opposite order to how we pushed
	pop	$s4
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra

	jr	$ra		# return


sum2:
	# args:
	# $a0: x
	# $a1: y
	add	$v0, $a0, $a1	# return x + y
	jr	$ra