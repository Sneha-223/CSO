# gcc -c Q1D.s 
# gcc Q1D.o
# gdb a.out
# check sorted array in gdb with x/32h [address in r14]
# '32' is the length of the array, 'h' is for halfword (16 bit) values, and r14 hold the addr of the array

.data

numbers: .word 3, 2, 3, -8, 5, 6, 4, 1, -3, 12, 23, -18, 15, 6, 14, 1, 0, -2, 3, -8, 5, 16, 4, 1, 0, 2, 10, -8, 5, 33, 4, 11 

.text
.global main

main:
mov numbers@GOTPCREL(%rip),%r14                 # numbers array stored at r14
mov $0,%rdi                                     # rdi is the isSorted variable, it is currently set to false (i.e 0)

loop:
cmp $1,%rdi                                     # when isSorted is true exit the loop
je .Lexit
mov $1,%rdi                                     # set isSorted to true

mov $1,%rbx                                     # rbx is the loop index for odd loop
mov $2,%rsi                                     # memory increment for 'numbers' array, next element is at +2 of prev 

odd:
cmp $30,%rbx                                    # here the first value is n-2 (n is the number of elements to be sorted)
jg afterodd                                     # if index (rbx) is greater than n-2 then exit odd loop
mov %rsi,%rdx                                   
add $2,%rdx                                     # rdx is the index of the element after the current element, arr[rdx] = arr[i+1]
movswq (%r14,%rsi,1),%r8                        # mov value of arr[i] to r8
movswq (%r14,%rdx,1),%r10                       # mov value of arr[i+1] to r10
cmp %r10,%r8                                    # compare arr[i] and arr[i+1]
jle skipswapodd                                 # if r8 is less than r10 then jmp
mov %r8w,(%r14,%rdx,1)                          # mov val of arr[i] to arr[i+1]
mov %r10w,(%r14,%rsi,1)                         # mov val of arr[i+1] to arr[i]
mov $0,%rdi                                     # isSorted is set to 0, i.e false
skipswapodd:
add $4,%rsi                                     # increment array memory by 4 bytes (since values are each 2 bytes), eg: from arr[1] (at base address +2bytes) to arr[3] (at base address +6)
add $2,%rbx                                     # increment loop index i = i + 2
jmp odd

afterodd:

mov $0,%rbx                                     # rbx is the loop index for even loop
mov $0,%rsi                                     # memory increment for 'numbers' array, next element is at +2 of prev

even:
cmp $30,%rbx                                    # here the first value is n-2 (n is the number of elements to be sorted)
jg aftereven                                    # if index is greater than n-2 then exit odd loop
mov %rsi,%rdx                                   # rdx is the index of the element after the current element, arr[rdx] = arr[i+1]
add $2,%rdx                                     
movswq (%r14,%rsi,1),%r8                        # mov value of arr[i] to r8
movswq (%r14,%rdx,1),%r10                       # mov value of arr[i+1] to r10
cmp %r10,%r8                                    # compare arr[i] and arr[i+1]
jle skipswapeven                                # if r8 is less than r10 then jmp
mov %r8w,(%r14,%rdx,1)                          # mov val of arr[i] to arr[i+1]
mov %r10w,(%r14,%rsi,1)                         # mov val of arr[i+1] to arr[i]
mov $0,%rdi                                     # isSorted is set to 0, i.e false
skipswapeven:
add $4,%rsi
add $2,%rbx
jmp even

aftereven:

jmp loop

.Lexit:
ret
