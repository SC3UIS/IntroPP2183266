----------///----------///----------///---TALLER 1---///----------///----------///----------///
Esta presente el archivo original trapezAreaSimple y el archivo omp_trapezAreaSimple

trapezAreaSimple el código implementa la regla del trapecio para aproximar la integral 
de una función en un intervalo definido por el usuario, utilizando el número de subintervalos 
especificado por el usuario.

OPCIONES DE COMPILACION USADAS PARA trapezAreaSimple Y PARA omp_trapezAreaSimple

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
----------///----------///----------///----------///----------///----------///----------///----------///