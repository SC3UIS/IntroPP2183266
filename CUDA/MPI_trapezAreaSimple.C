#include <stdio.h>
#include <math.h>
#include <mpi.h>
#include <sys/time.h>

/* Define the function to be integrated here: */
double f(double x) {
  return x * x;
}

double get_wall_time() {
    struct timeval time;
    if (gettimeofday(&time, NULL)) {
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * 0.000001;
}

/* Program begins */
int main(int argc, char* argv[]) {
  int rank, size, n, i;
  double a, b, h, x, sum = 0, integral = 0;
  double local_integral = 0;

  /* Initialize MPI */
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  /* Ask the user for necessary input */
  if (rank == 0) {
    printf("\nEnter the no. of sub-intervals: ");
    scanf("%d", &n);
    printf("\nEnter the initial limit: ");
    scanf("%lf", &a);
    printf("\nEnter the final limit: ");
    scanf("%lf", &b);
  }

  /* Broadcast the input values to all processes */
  MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
  MPI_Bcast(&a, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
  MPI_Bcast(&b, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);

  /* Begin Trapezoidal Method: */

  double start_time = get_wall_time(); // Inicio del tiempo de ejecución

  // Splits work into subintervals and assigns them to different processes
  h = fabs(b - a) / n;
  for (i = rank + 1; i < n; i += size) {
    x = a + i * h;
    local_integral += f(x);
  }

  /* Reduce the partial results to obtain the total integral */
  MPI_Reduce(&local_integral, &sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

  if (rank == 0) {
    double end_time = get_wall_time(); // Fin del tiempo de ejecución
    double tiempo_ejecucion = end_time - start_time;

    integral = (h / 2) * (f(a) + f(b) + 2 * sum);

    /* Print the answer */
    printf("\nThe integral is: %lf\n", integral);
    printf("Tiempo de ejecución: %f segundos\n", tiempo_ejecucion);

    // Cálculo de la escalabilidad y el speedup
    double tiempo_secuencial = 0.0;
    MPI_Reduce(&tiempo_ejecucion, &tiempo_secuencial, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);

    int num_procesos = size;
    double speedup = tiempo_secuencial / tiempo_ejecucion;
    double escalabilidad = speedup / num_procesos;

    printf("Speedup: %f\n", speedup);
    printf("Escalabilidad: %f\n", escalabilidad);
  }

  /* Finalize MPI */
  MPI_Finalize();

  return 0;
}