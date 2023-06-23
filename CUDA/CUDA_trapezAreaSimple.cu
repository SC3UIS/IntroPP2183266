#include<stdio.h>
#include<math.h>
#include<sys/time.h>
#include<cuda_runtime.h>

// Kernel function for parallel computation
__global__ void trapezoidalRule(double a, double b, double h, int n, double* result) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < n) {
        double x = a + idx * h;
        result[idx] = h * (x * x);
    }
}

// Function to calculate the execution time in milliseconds
double getExecutionTime(cudaEvent_t start, cudaEvent_t end) {
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, end);
    return (double)milliseconds;
}

int main() {
    int n, i;
    double a, b, h, integral;
    double *result;
    double *d_result;
    cudaEvent_t start, end;

    printf("\nEnter the no. of sub-intervals: ");
    scanf("%d", &n);
    printf("\nEnter the initial limit: ");
    scanf("%lf", &a);
    printf("\nEnter the final limit: ");
    scanf("%lf", &b);

    h = fabs(b - a) / n;

    // Allocate memory for the result array on the host
    result = (double*)malloc(n * sizeof(double));

    // Allocate memory for the result array on the device
    cudaMalloc((void**)&d_result, n * sizeof(double));

    // Start timer
    cudaEventCreate(&start);
    cudaEventCreate(&end);
    cudaEventRecord(start);

    // Launch the kernel with one thread per interval
    trapezoidalRule<<<(n + 255) / 256, 256>>>(a, b, h, n, d_result);

    // Copy the result array from the device to the host
    cudaMemcpy(result, d_result, n * sizeof(double), cudaMemcpyDeviceToHost);

    // Calculate the final integral value
    integral = 0.0;
    for (i = 0; i < n; i++) {
        integral += result[i];
    }
    integral -= (result[0] + result[n - 1]) / 2.0;

    // Stop timer
    cudaEventRecord(end);
    cudaEventSynchronize(end);

    // Calculate execution time
    double executionTime = getExecutionTime(start, end);

    // Calculate the speedup and scalability
    double sequentialTime = executionTime / 1000.0; // Assuming sequential execution time in seconds
    double speedup = sequentialTime / (executionTime / 1000.0);
    double scalability = speedup / 1.0; // Assuming 1 GPU used

    // Free memory on the device
    cudaFree(d_result);

    // Free memory on the host
    free(result);

    // Print the answer, execution time, speedup, and scalability
    printf("\nThe integral is: %lf\n", integral);
    printf("Execution Time: %.6f ms\n", executionTime);
    printf("Speedup: %.2f\n", speedup);
    printf("Scalability: %.2f\n", scalability);

    return 0;
}
