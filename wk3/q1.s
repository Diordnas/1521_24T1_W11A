

	.data			# Enter the data section of memory
a:	.word	42		# 4 bytes - value: 42
b:	.space	4		# 4 bytes 
c:	.asciiz	"abcd"		# 5 bytes = 'a', 'b', 'c', 'd', '\0'
	.align 	2		# 3 bytes
d: 	.byte	1, 2, 3, 4	# 4 bytes = 1, 2, 3, 4
e: 	.word	1, 2, 3, 4	# 16 bytes = 1, 2, 3, 4
f:	.space	1		# 1 byte