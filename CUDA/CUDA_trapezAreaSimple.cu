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

double get_wall_time() {
    struct timeval time;
    if (gettimeofday(&time, NULL)) {
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * 0.000001;
}

int main() {
    int n, i;
    double a, b, h, integral;
    double *result;
    double *d_result;
    struct timeval start, end;

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

    double start_time = get_wall_time(); // Inicio del tiempo de ejecución

    // Launch the kernel with one thread per interval
    trapezoidalRule<<<(n + 255) / 256, 256>>>(a, b, h, n, d_result);

    double end_time = get_wall_time(); // Fin del tiempo de ejecución
    double execution_time = end_time - start_time;

    // Copy the result array from the device to the host
    cudaMemcpy(result, d_result, n * sizeof(double), cudaMemcpyDeviceToHost);

    // Calculate the final integral value
    integral = 0.0;
    for (i = 0; i < n; i++) {
        integral += result[i];
    }
    integral -= (result[0] + result[n - 1]) / 2.0;

    // Free memory on the device
    cudaFree(d_result);

    // Free memory on the host
    free(result);

    printf("\nThe integral is: %lf\n", integral);
    printf("Execution Time: %.6f ms\n", execution_time);

    // Cálculo del speedup y la escalabilidad
    double sequential_time = (b * b * b * b - a * a * a * a) / 4; // Cálculo secuencial equivalente
    double speedup = sequential_time / (execution_time / 1000.0);
    double scalability = speedup / 1.0; // Suponiendo que se utiliza 1 GPU

    printf("Speedup: %.2f\n", speedup);
    printf("Scalability: %.2f\n", scalability);

    return 0;
}
