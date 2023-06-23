#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

__global__ void sumNumbers(int num, int *result)
{
    int count = threadIdx.x + 1;
    atomicAdd(result, count);
}

double get_wall_time() {
    struct timeval time;
    if (gettimeofday(&time, NULL)) {
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * 0.000001;
}

int main()
{
    int num, sum = 0;
    int *dev_result;

    printf("Enter a positive integer: ");
    scanf("%d", &num);

    double start_time = get_wall_time(); // Inicio del tiempo de ejecución

    cudaMalloc((void**)&dev_result, sizeof(int));
    cudaMemcpy(dev_result, &sum, sizeof(int), cudaMemcpyHostToDevice);

    sumNumbers<<<1, num>>>(num, dev_result);

    cudaMemcpy(&sum, dev_result, sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(dev_result);

    double end_time = get_wall_time(); // Fin del tiempo de ejecución
    double tiempo_ejecucion = end_time - start_time;

    printf("\nSum = %d\n", sum);
    printf("Tiempo de ejecución: %f segundos\n", tiempo_ejecucion);

    // Cálculo del speedup y la escalabilidad
    double tiempo_secuencial = num * (num + 1) / 2; // Cálculo secuencial equivalente
    double speedup = tiempo_secuencial / tiempo_ejecucion;
    double escalabilidad = speedup;

    printf("Speedup: %f\n", speedup);
    printf("Escalabilidad: %f\n", escalabilidad);

    return 0;
}