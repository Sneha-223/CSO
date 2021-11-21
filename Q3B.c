#include <stdio.h>

// Function to rotate the matrix 90 degree clockwise
void matrixrotate(int N, __int16_t a[N][N]);
// {
//     // Traverse each cycle
//     for (int i = 0; i < N / 2; i++)
//     {
//         for (int j = i; j < N - i - 1; j++)
//         {

//             // Swap elements of each cycle
//             // in clockwise direction
//             __int16_t temp = a[i][j];
//             a[i][j] = a[N - 1 - j][i];
//             a[N - 1 - j][i] = a[N - 1 - i][N - 1 - j];
//             a[N - 1 - i][N - 1 - j] = a[j][N - 1 - i];
//             a[j][N - 1 - i] = temp;
//         }
//     }
// }

// Function for printing matrix
void printMatrix(int N, __int16_t arr[N][N])
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            printf("%hd ", arr[i][j]);
        printf("\n");
    }
}

// Driver code
int main()
{
    int N = 8;

    __int16_t arr[N][N];

    printf("Enter the values of the matrix: \n");

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            scanf("%hd", &arr[i][j]);
        }
    }

    matrixrotate(N, arr);
    printMatrix(N, arr);
    
    return 0;
}