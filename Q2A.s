.data

numbers: .word 3, 2, 3, -8, 5, 6, 4, 1, -3, 12, 23, -18, 15, 6, 14, 1, 0, -2, 3, -8, 5, 16, 4, 1, 0, 2, 10, -8, 5, 33, 4, 11

key: .word 5

.text
.global main

main:
mov numbers@GOTPCREL(%rip),%r14             # moving 'numbers' array to r14
mov key@GOTPCREL(%rip),%r15                 # moving 'key' to r15
movswq key(%rip),%r8                        # moving value of key to r8 (movswq because we are moving a signed word to a quad)
mov $0,%rsi                                 # incrementer for the array 'numbers'
movswq (%r14,%rsi,1),%r9                    # mov value of arr[0] to r9
mov $0,%r11                                 # r11 hold the count of number of iternation taken to find the key
mov $0,%r12                                 

loop:
cmp $32,%r11                                # first number is the length of the array, comparing length to the index r11
jne skip                                    # if the index is not equal to the length, jump to skip 
    mov $-1,%r11                            # if the index=length, then the number was not found so the answer is -1
    jmp .Lexit
skip:
cmp %r8,%r9                                 # comparing key to numbers[i]
je .Lexit                                   # if they are equal, the number was found so jump to exit
add $2,%rsi                                 # increments rsi to rsi+4 i.e next array element
movswq (%r14,%rsi,1),%r9                    # mov value of arr[i] to r9
inc %r11                                    # increment count
inc %r12
jmp loop

finish:                                     # at this point the index of the number is in r11 (the ans is assuming the arr is 0 indexed)

.Lexit:
ret
