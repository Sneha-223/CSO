#gives the frequency of each letter in the 32 letter string
#eg: the string "ABBBBBCCCDD..." would give '1 5 3 2...' 
#gcc Q4B.c Q4B.s  (to compile)

.text
.global calcfreq  
# void calcfreq(char letters[], int* freq)
# rdi->first arg,rsi->second arg
calcfreq:
movq $0,%rcx                            #rcx is used as an incrementer to loop thru the string

loop:
cmpq $32,%rcx                           #compare the value of the incrementer to 32
je .Lexit                               #if they are equal, jump to Lexit
movzbq (%rdi,%rcx,1),%rax               #rdi is the letters array so: move the value letters[rcx] to rax (since char is 1 byte and rax is 8 we use zbq -> zero fill byte to quad word)
sub $65,%rax                            #subtract 65 from the value in rax and put the answer in rax
cmp $32,%rax                            # if rax is greater than 32 skip
jg skip
cmp $0,%rax                             # if rax is lesser than 0 skip
jl skip
movq (%rsi,%rax,4),%r9                  #rsi is freq array so: move freq[rax] to r9
inc %r9                                 #increment r9
movq %r9,(%rsi,%rax,4)                  #move the value in r9 (that been incremented) back to the relevent position, i.e freq[rax]
skip:
inc %rcx                                #increment the incrementer
jmp loop                                #jump to the starting of the loop again

.Lexit:
ret


