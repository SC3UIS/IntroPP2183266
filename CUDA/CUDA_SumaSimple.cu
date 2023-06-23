#include <stdio.h>
#include <cuda_runtime.h>

__global__ void sumKernel(int num, int* result) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    int sum = 0;

    for (int count = idx + 1; count <= num; count += stride) {
        sum += count;
    }

    atomicAdd(result, sum);
}

int main() {
    int num, sum = 0;
    int* dev_result;

    printf("Enter a positive integer: ");
    scanf("%d", &num);

    cudaMalloc((void**)&dev_result, sizeof(int));
    cudaMemcpy(dev_result, &sum, sizeof(int), cudaMemcpyHostToDevice);

    int blockSize = 256;  // Puedes ajustar el tamaño del bloque según tus necesidades
    int numBlocks = (num + blockSize - 1) / blockSize;

    sumKernel<<<numBlocks, blockSize>>>(num, dev_result);
    cudaDeviceSynchronize();

    cudaMemcpy(&sum, dev_result, sizeof(int), cudaMemcpyDeviceToHost);

    printf("\nSum = %d\n", sum);

    cudaFree(dev_result);

    return 0;
}
