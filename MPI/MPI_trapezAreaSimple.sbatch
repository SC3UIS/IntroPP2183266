#!/bin/bash
#SBATCH --job-name=trapezAreaSimple
#SBATCH --ntasks=12
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --output=output_trapezAreaSimple.txt

## Cargar módulo
module load devtools/mpi/mpich/3.3.1

## Compilación del código
mpicc MPI_trapezAreaSimple.C -o mpiarea

## Ejecución con MPI
mpirun -np 12 ./mpiarea