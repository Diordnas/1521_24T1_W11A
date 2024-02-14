# goal code:
# #include <stdio.h>
# 
# int main(void) {
#     int x, y;
# 
#     printf("Enter a number: ");
#     scanf("%d", &x);
# 
#     y = x * x;
# 
#     printf("%d\n", y);
# 
#     return 0;
# }







main:
	la	$a0, prompt_str		# printf("Enter a number: ");
	li	$v0, 4			# syscall mode 4: print string
	syscall

	li	$v0, 5			# scanf("%d")
	syscall				# syscall mode 5: read int
	move	$t0, $v0

	# TODO: square the number
	mul	$t1, $t0, $t0

	move	$a0, $t1		# printf("%d")
	li	$v0, 1			# syscall mode 1: print int
	syscall

	li	$a0, '\n'		# printf("\n")
	li	$v0, 11			# syscall mode 11: print char
	syscall

	jr	$ra			# return 0

	.data
prompt_str:
	.asciiz "Enter a number: "
