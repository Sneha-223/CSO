#include <stdio.h>

void calcfreq(char letters[], int* freq);
// {
//     for(int i=0; i<32; i++)
//     {
//         freq[letters[i]-'A']++;
//     }
// }


int main()
{
    char letters[33]; 

    printf("Enter a string of length 32: ");
    scanf("%s", letters);

    //printf("%s\n", letters);

    int freq[26]={0};

    calcfreq(letters, freq);

    //printing
    for(int i=0; i<26;i++)
    {
        printf("%d ", freq[i]);
    }
    printf("\n");

    return 0;
}
