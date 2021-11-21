#gcc Q5A.c Q5A.s  (to compile)

# void hammingdist(__int16_t num1, __int16_t num2, __int16_t* ans);
# rdi->first arg, rsi->second arg, rdx->third arg

.text
.global hammingdist  
hammingdist:
mov $0,%rcx                              # rcx is used as an incrementer to loop thru the 16 bit value
mov $0,%r9                               # r9 is the count, to count the number of diff bits
mov %rdi,%r12                            # move first number into r12
mov %rsi,%r14                            # move second number into r14
xor %r12,%r14                            # xor the two numbers, store in r14 (xor returns 1 for each same bit, 0 for different bit)
mov %r14,%r13                            # the xor'd number is now in r13

loop:
cmp $16,%rcx                            # compare the value of the incrementer to 16 (since the number is 16 bits)
je .Lexit                               # if equal exit the loop
mov %r13,%r14                           # move the xor'd number into r14
and $1,%r14                             # AND r14 and 1
cmp $1,%r14                             # compare the AND'd result with 1 (if the bits are same this will be true)
jne skipincrement                       # if they are not equal skip inc the count
inc %r9                                 # if they are equal then the bits are diff, so inc the count
mov %r9w,(%rdx)                         # move the count into the 'ans' var (rdx)
skipincrement:      
shr $1,%r13                             # shift the xor'd result by 1 bit
inc %rcx                                # increment the loop incrementer
jmp loop

finish:

.Lexit:
ret
