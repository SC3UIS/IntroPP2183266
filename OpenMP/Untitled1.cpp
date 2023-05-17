#include <stdio.h>
#include <math.h>
#include <mpi.h>

/* Define the function to be integrated here: */
double f(double x) {
  return x * x;
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

  // Splits work into subintervals and assigns them to different processes
  h = fabs(b - a) / n;
  for (i = rank + 1; i < n; i += size) {
    x = a + i * h;
    local_integral += f(x);
  }

  /* Reduce the partial results to obtain the total integral */
  MPI_Reduce(&local_integral, &sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

  if (rank == 0) {
    integral = (h / 2) * (f(a) + f(b) + 2 * sum);

    /* Print the answer */
    printf("\nThe integral is: %lf\n", integral);
  }

  /* Finalize MPI */
  MPI_Finalize();

  return 0;
}

