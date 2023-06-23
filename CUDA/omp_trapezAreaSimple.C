/*
  Purpose:

    trapezAreaSimple is an example that implements the trapezoidal rule to approximate the integral of a function over a user-defined interval, 
    using the user-specified number of subintervalsfor Intro PP Students.

  Date and hour:

    22 Apr 2023 13:13:54 PM

  Licensing:

    This code is distributed under the GNU LGPL license.

  Modified:

    22 April 2023

  Author:
  Manas Sharma 
  OpenMP Modification:
  22 april 2023 by Juan Guerrero, Universidad Industrial de Santander juan2183266@correo.uis.edu.co                   
  This OpenMP Modification makes a parallelization of the original Code...  
*/

#include <stdio.h>
#include <math.h>
#include <omp.h>

/* Define the function to be integrated here: */
double f(double x){
  return x*x;
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

  /*Begin Trapezoidal Method: */

  // Splits work into subintervals and assigns them to different threads
  h=fabs(b-a)/n;
  #pragma omp parallel for private(x) reduction(+:sum)
  for(i=1;i<n;i++){
    x=a+i*h;
    sum=sum+f(x);
  }

  // Reduce the partial results to obtain the total integral
  integral=(h/2)*(f(a)+f(b)+2*sum);

  /*Print the answer */
  printf("\nThe integral is: %lf\n",integral);
}