#include <stdio.h>
#include <cuda_runtime.h>

#define BLOCK_SIZE 256

__device__ long long int atomicAddLL(long long int* address, long long int val) {
    unsigned long long int* address_as_ull = (unsigned long long int*)address;
    unsigned long long int old = *address_as_ull, assumed;

    do {
        assumed = old;
        old = atomicCAS(address_as_ull, assumed, static_cast<unsigned long long int>(val + assumed));
    } while (assumed != old);

    return old;
}

__global__ void sumKernel(int num, long long int* result) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    long long int sum = 0;

    for (int count = idx + 1; count <= num; count += stride) {
        sum += count;
    }

    atomicAddLL(result, sum);
}

int main() {
    int num;
    long long int sum = 0;
    long long int* dev_result;

    printf("Enter a positive integer: ");
    scanf("%d", &num);

    cudaMalloc((void**)&dev_result, sizeof(long long int));
    cudaMemcpy(dev_result, &sum, sizeof(long long int), cudaMemcpyHostToDevice);

    int numBlocks = (num + BLOCK_SIZE - 1) / BLOCK_SIZE;

    sumKernel<<<numBlocks, BLOCK_SIZE>>>(num, dev_result);
    cudaDeviceSynchronize();

    cudaMemcpy(&sum, dev_result, sizeof(long long int), cudaMemcpyDeviceToHost);

    printf("\nSum = %lld\n", sum);

    cudaFree(dev_result);

    return 0;
}
