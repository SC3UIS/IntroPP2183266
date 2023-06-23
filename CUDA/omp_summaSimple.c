#include <stdio.h>
#include <omp.h>
#include <sys/time.h>

double get_wall_time() {
    struct timeval time;
    if (gettimeofday(&time, NULL)) {
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * 0.000001;
}

int main()
{
    int num, count, sum = 0;

    printf("Enter a positive integer: ");
    scanf("%d", &num);

    double start_time = get_wall_time(); // Inicio del tiempo de ejecución

    #pragma omp parallel for reduction(+:sum)
    for(count = 1; count <= num; ++count)
    {
        sum += count;
    }

    double end_time = get_wall_time(); // Fin del tiempo de ejecución
    double tiempo_ejecucion = end_time - start_time;

    printf("\nSum = %d\n", sum);
    printf("Tiempo de ejecución: %f segundos\n", tiempo_ejecucion);

    // Cálculo de la escalabilidad y el speedup
    double tiempo_secuencial = 0.0;
    double speedup = tiempo_secuencial / tiempo_ejecucion;
    double escalabilidad = speedup;

    printf("Speedup: %f\n", speedup);
    printf("Escalabilidad: %f\n", escalabilidad);

    return 0;
}