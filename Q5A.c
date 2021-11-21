#include <stdio.h>

void hammingdist(__int16_t num1, __int16_t num2, __int16_t* ans);
// {
//     int xor = num1^num2;

//     int count = 0;

//     while (xor>0)
//     {
//         if((xor&1)==1)
//         {
//             count++;
//         }
//         xor>>=1;
//     }
    
//     *ans = count;
// }
 
// void bin(unsigned n)
// {
//     /* step 1 */
//     if (n > 1)
//         bin(n / 2);
 
//     /* step 2 */
//     printf("%d", n % 2);
// }

// Driver Code
int main(void)
{
    __int16_t num1, num2;
    __int16_t ans=0;

    printf("Enter 2 numbers: ");
    scanf("%hd %hd", &num1, &num2);

    // //for testing---//
    // bin(num1);
    // printf(" ");
    // bin(num2);
    // printf("\n");
    // //-------------//

    hammingdist(num1, num2, &ans);

    printf("The hamming distance is: %hd\n", ans);
    
}