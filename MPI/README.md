# Procesamiento Memoria Distribuída

En esta carpeta encontrarás los archivos requeridos para compilar y correr el código MPI (`MPI_trapezAreaSimple.C`). También se incluyen otros archivos importantes como 
(`MPI_trapezAreaSimple.sbatch`), (`output_trapezAreaSimple.txt`) (archivo de salida), (`trapezAreaSimple.C`) (código original) y el archivo ejecutable.

### Compilación y ejecución

1. Solicitar los recursos necesarios y trabajamos dentro de la carpeta MPI creada en `MobaXterm`
2. Utilizando el comando `module load devtools/mpi/mpich/3.3.1`, se carga el módulo necesario para compilar el programa MPI y así satisfacer los requisitos del mismo.
3. Se puede compilar el código `MPI_trapezAreaSimple.C` mediante el uso del siguiente comando: `mpicc MPI_trapezAreaSimple.C -o mpiarea`. Al ejecutar este 
   comando, se creará un archivo ejecutable llamado `mpiarea`.
4. Para ejecutar el programa MPI con 12 procesos, se puede utilizar el siguiente comando: `mpirun -np 12 ./mpiarea`.

### Medir el tiempo de ejecución
Para obtener la medida de tiempo de ejecución del código MPI, puedes utilizar el siguiente comando: "time mpirun -np 12 ./mpiarea".
