# Integrantes
- 2183266 - Juan Camilo Guerrero Ortega `trapezAreaSimple`
- 2192508 - Juan Diego Claro Guerrero `trapezAreaSimple`
- 2182693 - Helman Andres Merchan Quevedo `summaSimple`

# Contenido
En esta carpeta se encuentran los archivos `CUDA_SumaSimple.cu`, `CUDA_trapezAreaSimple.cu`, `mpi_summasimple.c`, `MPI_trapezAreaSimple.C`, `omp_summasimple.c` y `omp_trapezAreaSimple.C` y el presente archivo `README.md` en donde estara la explicación de este trabajo.

## EJECUCIÓN DE LOS ARCHIVOS RELACIONADOS A LA SUMA SIMPLE

### `omp_summasimple.c`
![WhatsApp Image 2023-06-23 at 12 12 49 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/aae3a565-ecf1-44f1-b001-db894f3831bd)

### `mpi_summasimple.c`
![WhatsApp Image 2023-06-23 at 12 11 39 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/17b558f0-41d8-4361-874b-cf434a28e04b)


### `CUDA_SumaSimple.cu`
![WhatsApp Image 2023-06-23 at 9 04 58 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/712481c0-3c5a-48f9-8bad-923773624092)



### COMPARACIÓN EN ESCALABILIDAD

La escalabilidad se refiere a la capacidad de un programa para aprovechar eficientemente los recursos disponibles a medida que se aumenta el tamaño del problema o el número de recursos.
En el contexto de los tres códigos que proporcionaste (OpenMP, MPI y CUDA), la escalabilidad se puede evaluar considerando cómo se comporta el rendimiento del programa a medida que se incrementa el número de procesadores o núcleos utilizados.
Entre los tres códigos, OpenMP es una API de programación paralela para programación en hilos en arquitecturas de memoria compartida. El código OpenMP que proporcionaste utiliza una directiva parallel for para distribuir la carga de trabajo 
entre los hilos y una reducción (reduction) para sumar los resultados parciales. 

En el caso de MPI y CUDA, obtuvimos una escalabilidad de 1.000000, lo que significa que el programa logró un rendimiento perfectamente escalable. 
Esto sugiere que al aumentar el número de procesadores o nodos utilizados en un entorno de MPI y CUDA, el tiempo de ejecución disminuye proporcionalmente,
lo que indica un buen aprovechamiento de los recursos disponibles.

Por otro lado, en el entorno de OpenMP (OMP), obtuvimos un valor de escalabilidad de 0.000000,
lo que indica una falta de escalabilidad o incluso una degradación del rendimiento a medida que aumentas el número de hilos paralelos.
Esto puede deberse a diferentes razones, como una sobrecarga en la sincronización o a una gran cantidad de secciones críticas en tu programa.


### COMPARACIÓN EN TIEMPO
Dado que tanto el código de OpenMP como el código MPI son prácticamente idénticos, es probable que presenten tiempos de ejecución similares en la mayoría de los casos. 
La diferencia de rendimiento entre ellos dependerá del hardware y la configuración del sistema en el que se ejecuten. Sin embargo, si el hardware utilizado tiene múltiples núcleos o procesadores y el bucle es lo suficientemente grande como para aprovechar el paralelismo, 
el código de OpenMP puede tener un mejor tiempo de ejecución. Esto se debe a que OpenMP puede distribuir el bucle en hilos de ejecución en el mismo proceso y realizar una reducción parcial para calcular la suma total.
Por otro lado, el código MPI es adecuado para sistemas distribuidos y puede escalar bien en clústeres de computadoras con múltiples nodos de procesamiento. 

Teniendo en cuenta los valores obtenidos en la ejecución se puede decir que:

- **MPI**: Un tiempo de ejecución de 0.000042 segundos en MPI indica un rendimiento excepcionalmente rápido. MPI es un estándar de programación paralela para sistemas distribuidos, y este resultado sugiere que la implementación MPI utilizada ha logrado una alta eficiencia en la distribución y ejecución del trabajo en los nodos del sistema.

- **OpenMP (OMP)**: Un tiempo de ejecución de 0.005777 segundos en OMP indica un rendimiento más lento en comparación con MPI. OpenMP es una API de programación paralela para sistemas de memoria compartida, y este resultado sugiere que la implementación OMP puede tener cierta sobrecarga debido a la gestión de hilos y sincronización.

- **CUDA**: Un tiempo de ejecución de 0.001486 segundos en CUDA indica un rendimiento muy rápido. CUDA es una plataforma de computación paralela diseñada para aprovechar la potencia de las GPUs, y este resultado sugiere que la implementación CUDA utilizada ha logrado una alta eficiencia en el uso de la GPU para realizar cálculos paralelos

En resumen, los resultados indican que MPI y CUDA han logrado un rendimiento rápido, mientras que OMP es más lento en comparación.


### COMPARACIÓN EN SPEED UP

El speed-up (aceleración) es una medida de cuánto más rápido se ejecuta un programa en paralelo en comparación con su versión secuencial. El speed-up se calcula dividiendo el tiempo de ejecución secuencial por el tiempo de ejecución paralelo.

Teniendo en cuenta los resultaods obtenidos en la ejecución de cada archivo se puede decir qué:

- **MPI y CUDA**: Un speed-up de 1.000000 en MPI y CUDA indica que el tiempo de ejecución paralelo es igual al tiempo de ejecución secuencial. Esto significa que no se ha logrado una mejora en el rendimiento utilizando MPI y CUDA en comparación con la ejecución secuencial.

- **OpenMP (OMP)**: Un speed-up de 0.000000 en OMP indica que el tiempo de ejecución paralelo es infinitamente mayor que el tiempo de ejecución secuencial.



## EJECUCIÓN DE LOS ARCHIVOS RELACIONADOS A LA AREA DEL TRAPRECIO


### `omp_trapezAreaSimple.C`
![WhatsApp Image 2023-06-23 at 12 17 39 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/378c6fda-24ae-42fb-90c6-1df45054c23a)


### `MPI_trapezAreaSimple.C`
![WhatsApp Image 2023-06-23 at 12 15 38 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/0403de7c-08af-41d2-96dc-82ae6921667f)


### `CUDA_trapezAreaSimple.cu`
![WhatsApp Image 2023-06-23 at 2 52 05 PM](https://github.com/SC3UIS/IntroPP2183266/assets/55815692/1212f061-b374-41ca-b643-3f0c98e29cb5)



### COMPARACIÓN EN ESCALABILIDAD

Basándonos en los resultados de escalabilidad obtenidos en la ejecución de los archivos, podemos obtener las siguientes conclusiones preliminares:

- **MPI**: Una escalabilidad de 1.000000 en MPI indica que el tiempo de ejecución se mantiene constante a medida que se aumenta el número de recursos utilizados (por ejemplo, el número de nodos o procesadores). Esto sugiere que MPI está logrando una buena distribución de trabajo y aprovechamiento de recursos, y el rendimiento se escala linealmente con la adición de recursos. En términos de escalabilidad, un valor de 1.000000 es considerado muy bueno, ya que indica una mejora proporcional al aumentar los recursos.

- **OpenMP (OMP)**: Una escalabilidad de 0.000000 en OMP indica que no se está obteniendo una mejora en el rendimiento al aumentar el número de hilos utilizados. Esto puede deberse a una mala distribución de trabajo, exceso de sincronización, condiciones de carrera o falta de paralelismo en el código. Es necesario revisar la implementación de OMP para identificar y corregir los problemas que están afectando la escalabilidad.

- **CUDA**: Una escalabilidad de 11552.11 en CUDA es un valor inusualmente alto. Es posible que haya un error en el cálculo o la interpretación de los resultados. La escalabilidad se refiere a cómo mejora el rendimiento al aumentar los recursos utilizados, y es poco probable que un valor tan alto sea alcanzado en la práctica.


### COMPARACIÓN EN TIEMPO

Basándonos en los tiempos de ejecución obtenidos, podemos concluir lo siguiente:

- **MPI**: Un tiempo de ejecución de 0.000026 segundos en MPI indica un rendimiento extremadamente rápido. MPI es un estándar de programación paralela para sistemas distribuidos, por lo que este resultado sugiere que la implementación MPI utilizada ha logrado una alta eficiencia en la distribución y ejecución del trabajo en los nodos del sistema.

- **OpenMP (OMP)**: Un tiempo de ejecución de 0.006145 segundos en OMP indica un rendimiento más lento en comparación con MPI. OpenMP es una API de programación paralela para sistemas de memoria compartida, donde se utilizan múltiples hilos para dividir el trabajo.

- **CUDA**: Un tiempo de ejecución de 0.000014 segundos en CUDA indica un rendimiento excepcionalmente rápido. CUDA es una plataforma de computación paralela diseñada para aprovechar la potencia de las GPUs. Este resultado sugiere que la implementación CUDA utilizada ha logrado una alta eficiencia en el uso de la GPU para realizar cálculos paralelos.

En resumen, los resultados indican que MPI y CUDA han logrado un rendimiento muy rápido, mientras que OMP es un poco más lento en comparación.



### COMPARACIÓN EN SPEED UP

Basándonos en los valores de Speed Up obtenidos en la ejecuión, podemos obtener las siguientes conclusiones preliminares:

- **MPI**: Un Speed Up de 1.000000 significa que el tiempo de ejecución utilizando un solo procesador es igual al tiempo de ejecución utilizando múltiples procesadores. En términos de escalabilidad, un Speed Up de 1.000000 se considera pobre, ya que no hay mejora en el rendimiento al utilizar recursos adicionales.

- **OpenMP (OMP)**: El Speed Up de 0.000000 indica que el tiempo de ejecución utilizando un solo hilo es igual al tiempo de ejecución utilizando múltiples hilos. Esto indica una falta de escalabilidad en OMP.

- **CUDA**: Un Speed Up de 2957339.77 en CUDA es un valor extremadamente alto, Cuando el Speed Up es alto, significa que la aplicación paralela está aprovechando de manera efectiva los recursos adicionales y está distribuyendo y ejecutando el trabajo de manera más eficiente. En otras palabras, se está logrando una aceleración sustancial al utilizar recursos adicionales. 
Un valor alto de Speed Up es deseable en términos de escalabilidad, ya que indica que la aplicación paralela es capaz de aprovechar eficientemente los recursos adicionales y obtener un rendimiento significativamente mejor.



## CONCLUSIÓN FINAL

La elección entre CUDA, MPI y OpenMP depende de varios factores, como el tipo de problema, la arquitectura del sistema, la disponibilidad de recursos y las habilidades y conocimientos del programador. No hay una respuesta única y definitiva sobre cuál es la mejor opción, ya que cada enfoque tiene sus ventajas y desventajas.

- CUDA es una plataforma de programación paralela diseñada para aprovechar la potencia de las GPUs. Es altamente eficiente en el procesamiento paralelo de tareas intensivas en cómputo y puede ofrecer un rendimiento excepcional para aplicaciones que se benefician de la aceleración de la GPU. CUDA es especialmente adecuado para problemas que se pueden descomponer en tareas independientes y altamente paralelas, como el procesamiento de imágenes, simulaciones científicas o aprendizaje profundo.

- MPI (Message Passing Interface) es un estándar de programación paralela para sistemas distribuidos, donde los procesadores se comunican a través de mensajes. MPI es adecuado para aplicaciones que se ejecutan en clústeres de computadoras interconectadas, donde la comunicación y la sincronización entre nodos son esenciales. MPI permite la programación paralela en escala y se utiliza ampliamente en aplicaciones científicas y de simulación que requieren cálculos distribuidos en múltiples nodos.

- OpenMP es una API de programación paralela para sistemas de memoria compartida, donde se utilizan múltiples hilos para dividir el trabajo. OpenMP es más adecuado para aplicaciones que se benefician de la paralelización en sistemas multiprocesador o multinúcleo. Permite un enfoque más sencillo de programación paralela y se utiliza comúnmente en aplicaciones de modelado y simulación, procesamiento de señales y otras tareas de cálculo intensivo.
