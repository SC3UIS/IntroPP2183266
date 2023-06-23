#include <stdio.h>

_global_ void sumNumbers(int num, int *result)
{
    int count = threadIdx.x + 1;
    atomicAdd(result, count);
}

int main()
{
    int num, sum = 0;
    int *dev_result;
    
    printf("Enter a positive integer: ");
    scanf("%d", &num);

    cudaMalloc((void**)&dev_result, sizeof(int));
    cudaMemcpy(dev_result, &sum, sizeof(int), cudaMemcpyHostToDevice);

    sumNumbers<<<1, num>>>(num, dev_result);

    cudaMemcpy(&sum, dev_result, sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(dev_result);

    printf("\nSum = %d\n", sum);

    return 0;
}