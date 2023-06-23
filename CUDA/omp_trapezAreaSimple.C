#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <sys/time.h>

/* Define the function to be integrated here: */
double f(double x){
  return x*x;
}

double get_wall_time() {
    struct timeval time;
    if (gettimeofday(&time, NULL)) {
        return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * 0.000001;
}

/*Program begins*/
int main(){
  int n,i;
  double a,b,h,x,sum=0,integral;

  /*Ask the user for necessary input */
  printf("\nEnter the no. of sub-intervals: ");
  scanf("%d",&n);
  printf("\nEnter the initial limit: ");
  scanf("%lf",&a);
  printf("\nEnter the final limit: ");
  scanf("%lf",&b);

  double start_time = get_wall_time(); // Inicio del tiempo de ejecución

  /*Begin Trapezoidal Method: */

  // Splits work into subintervals and assigns them to different threads
  h=fabs(b-a)/n;
  #pragma omp parallel for private(x) reduction(+:sum)
  for(i=1;i<n;i++){
    x=a+i*h;
    sum=sum+f(x);
  }

  double end_time = get_wall_time(); // Fin del tiempo de ejecución
  double tiempo_ejecucion = end_time - start_time;

  // Reduce the partial results to obtain the total integral
  integral=(h/2)*(f(a)+f(b)+2*sum);

  /*Print the answer */
  printf("\nThe integral is: %lf\n",integral);
  printf("Tiempo de ejecución: %f segundos\n", tiempo_ejecucion);

  // Cálculo de la escalabilidad y el speedup
  double tiempo_secuencial = 0.0;
  double speedup = tiempo_secuencial / tiempo_ejecucion;
  double escalabilidad = speedup;

  printf("Speedup: %f\n", speedup);
  printf("Escalabilidad: %f\n", escalabilidad);
}