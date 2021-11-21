# Assembly Language Programming

#### **Sneha Raghava Raju**

Some assignment problems done for a Computer Systems Organization course. The assignment consisted of programming questions to be done in the x86 assembly language.

-  **Q1D** - Sort a list of 32 integers using Odd-Even Sort. 

- **Q2A** -  Perform Sequential Sort on a list of 32 signed integers . Find the location of a key X, return -1 if X does not belong to the list. Report the number of iterations taken to successfully/unsuccessfully find X.

- **Q3B** - Given a Matrix M with 16 bit values in memory. (M has 8 rows and 8 columns). Rotate the matrix by 90 degrees in the clockwise direction without using any extra memory.

- **Q4B** - Given a character array C of length 32. Count the frequency of each capital letter 'A' to 'Z' appearing in C. Report 0 in case an alphabet does not appear in C.

- **Q5A** - Given two 16 bit signed integers A and B. Find the hamming distance between them and store the result in another integer C.

### Instructions to run the programs

- **Q1D**
```
gcc -c Q1D.s 
gcc Q1D.o
./a.out
```
- **Q2A**
```
gcc -c Q2A.s 
gcc Q2A.o
./a.out
```
- **Q3B**
```
gcc Q3B.c Q3B.s 
./a.out
```
- **Q4B**
```
gcc Q4B.c Q4B.s
./a.out
```
- **Q5A**
```
gcc Q5A.c Q5A.s
./a.out
```
 
