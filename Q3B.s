# rotates matrix clockwise by 90 degrees
# gcc Q3B.c Q3B.s (to compile)
# currently N = 8 (ie number of rows and columns), to change this, change the value of N in the C code 
# AND update the value of N/2 (round up) on line 16 below

.text
.global matrixrotate  
# void matrixrotate(int N, __int16_t a[N][N]);
# rdi->first arg,rsi->second arg

matrixrotate:
mov $0,%rbx                             # incrementer i
mov $0,%rcx                             # incrementer j

outerloop:
cmp $4,%rbx                             # compare N/2 (round up) to i (rbx)
jge .Lexit                              # if greater than or equal to, then exit

mov %rbx,%rcx                           # mov value of i (rbx) to j (rcx)
mov %rdi,%r8                            # mov N (rdi) into r8
sub %rbx,%r8                            # sub N (r8) and i (rbx), now r8 -> N-i
dec %r8                                 # now r8 -> N-i-1

innerloop:
cmp %r8,%rcx                            # compare N-i-1 and j
jge endofinnerloop

# calculate mem offset for a[i][j]
mov %rbx,%r9                            # move i (rbx) into r9
imul %rdi,%r9                           # multiply N (rdi) and i (r9) and store result in r9
add %rcx,%r9                            # add j (rcx) and N*i (r9) and store in r9, now r9 -> N*i + j

movswq (%rsi,%r9,2),%r15                # mov value of a[i][j] into temp var (r15), in mem terms baseaddr+(N*i+j) into r15

# calculate mem offset for a[N - 1 - j][i]
mov %rdi,%r10                           # mov N (rdi) into r10
sub %rcx,%r10                           # sub N (r10) and j (rcx), now r10 -> N-j
dec %r10                                # now r10 -> N-1-j
mov %r10,%r12                           # now r12 -> N-1-j
imul %rdi,%r10                          # multiply N*r10 to get mem row offset
add %rbx,%r10                           # now r10 -> N*(N-1-j)+i i.e the mem offset for a[N-1-j][i] 

movswq (%rsi,%r10,2),%r14               # now r14 -> a[N - 1 - j][i]
mov %r14w,(%rsi,%r9,2)                  # mov a[N - 1 - j][i] to a[i][j]

# calculate mem offset for a[N - 1 - i][N - 1 - j]
mov %rdi,%r11                           # mov N (rdi) into r11
sub %rbx,%r11                           # sub N (r11) and i (rbx), now r10 -> N-i
dec %r11                                # now r11 -> N-1-i
mov %r11,%r9                            # now r9 -> N-1-i
imul %rdi,%r11                          # multiply N*r11 to get mem row offset
add %r12,%r11                           # add N-1-j (r12) to r11, now r11 -> N*(N-1-i) + N-1-j, i.e the mem offset for a[N-1-i][N-1-j] 

movswq (%rsi,%r11,2),%r13               # now r13 -> a[N - 1 - i][N - 1 - j]
mov %r13w,(%rsi,%r10,2)                 # mov a[N-1-i][N-1-j] to a[N-1-j][i]

# calculate mem offset for a[j][N - 1 - i]
mov %rcx,%r12                           # mov j (rcx) into r12
imul %rdi,%r12                          # multiply N*r12 -> N*j
add %r9,%r12                            # now r12 -> N*j +N-1-i, the mem offset for a[j][N-1-i]

movswq (%rsi,%r12,2),%r14               # mov a[j][N-1-i] to r14
mov %r14w,(%rsi,%r11,2)                 # mov a[j][N-1-i] to a[N-1-i][N-1-j]

# mov value of a[i][j] to a[j][N-1-i]
mov %r15w,(%rsi,%r12,2)                 # r15 is the value of a[i][j]

inc %rcx                                # increment j
jmp innerloop

endofinnerloop:

inc %rbx                                # increment i
jmp outerloop

finish:

.Lexit:
ret

