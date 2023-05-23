# Procesamiento Memoria Distribuída

En esta carpeta encontrarás los archivos requeridos para compilar y correr el código MPI (`MPI_trapezAreaSimple.C`). También se incluyen otros archivos importantes como 
`MPI_trapezAreaSimple.sbatch`, `output_trapezAreaSimple.txt` (archivo de salida), `trapezAreaSimple.C` (código original) y el archivo ejecutable.

## Compilación y ejecución

1. Solicitar los recursos necesarios y trabajamos dentro de la carpeta MPI creada en `MobaXterm`
2. Utilizando el comando `module load devtools/mpi/mpich/3.3.1`, se carga el módulo necesario para compilar el programa MPI y así satisfacer los requisitos del mismo.
3. Se puede compilar el código `MPI_trapezAreaSimple.C` mediante el uso del siguiente comando: `mpicc MPI_trapezAreaSimple.C -o mpiarea`. Al ejecutar este 
   comando, se creará un archivo ejecutable llamado `mpiarea`.
4. Para ejecutar el programa MPI con 12 procesos, se puede utilizar el siguiente comando: `mpirun -np 12 ./mpiarea`.

## Medir el tiempo de ejecución
Para obtener la medida de tiempo de ejecución del código MPI, puedes utilizar el siguiente comando: `time mpirun -np 12 ./mpiarea`.

## Tiempos de ejecución para los codigos `trapezAreaSimple.C`, `OMP_trapezAreaSimple.C` y `MPI_trapezAreaSimple.C` 
- ### `trapezAreaSimple.C`
<img width="430" alt="ori" src="https://github.com/SC3UIS/IntroPP2183266/assets/55815692/771004ab-ed47-442d-8c7b-8bb3db2657ee">

- ### `OMP_trapezAreaSimple.C`
<img width="430" alt="omp" src="https://github.com/SC3UIS/IntroPP2183266/assets/55815692/45053fe9-21ce-4748-8ac3-77a113a7466b">

- ### `MPI_trapezAreaSimple.C`
<img width="430" alt="mpi" src="https://github.com/SC3UIS/IntroPP2183266/assets/55815692/2c33538c-b923-4e27-976d-115d835c548c">

# Comparación
- La implementación más rápida es OMP, con un tiempo de ejecución real de 4,009 segundos.
- La segunda implementación con un tiempo real de ejecución de 5,432 segundos es la de MPI.
- La tercera y ultima es el código original con un tiempo real de ejecución de 11,166 segundos.
