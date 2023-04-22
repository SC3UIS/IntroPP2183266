----------///----------///----------///---TALLER 1---///----------///----------///----------///
Esta presente el archivo original trapezAreaSimple y el archivo omp_trapezAreaSimple

trapezAreaSimple el código implementa la regla del trapecio para aproximar la integral 
de una función en un intervalo definido por el usuario, utilizando el número de subintervalos 
especificado por el usuario.

COMPILACION USADA PARA trapezAreaSimple Y PARA omp_trapezAreaSimple en GUANE-1

Antes para entrar a guane se ejeguta el siguien comando:
ssh guane

Primero no dirigimos a la carpeta OpenMP

cd "/home/class/2023_1/jcaguerreroo/OpenMP/"

Una vez dentro de la carpeta ejecutamos el siguiente comando:
gcc -fopenmp trapezAreaSimple.C -o trapecio -lm

Este código compila el archivo fuente "trapezAreaSimple.C" utilizando el compilador gcc y las opciones 
"-fopenmp" para habilitar la compilación de código paralelo OpenMP y "-lm" para enlazar la biblioteca 
matemática. El archivo objeto resultante se guarda con el nombre "trapecio".

Despues se ejectuca el siguiendo comando:
./ trapecio.

Este comando ejecuta el archivo binario "trapecio" que se ha generado después de la compilación del 
código fuente "trapezAreaSimple.C".

Lo mismo se hace para el archivo omp_trapezAreaSimple cambiando el nombre del archivo en los comandos:
gcc -fopenmp omp_trapezAreaSimple.C -o omptrapecio -lm
./ omptrapecio

COMPILACION USADA PARA trapezAreaSimple Y PARA omp_trapezAreaSimple en maquina personal
Es bastante simple, en mi caso descargue e instale Dev-Cpp 5.11 TDM-GCC 4.9.2, desde este compilador
abri el archivo omp_trapezAreaSimple.C y ejecute el código
----------///----------///----------///----------///----------///----------///----------///----------///