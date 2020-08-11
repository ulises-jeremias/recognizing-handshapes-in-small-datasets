- + done
- - TODO
- * imposible

# Implementaciones

- + DenseNet
- + ProtoNet
- + ProtoDenseNet
- + TL
- + MAML
- ? HandCropper (Example)
- - Ensemble NN (último)
- * SSL

# Experimentos

- + DenseNet + RWTH
- + DenseNet + Splits LSA16
- + DenseNet + Splits RWTH
- + DenseNet + Splits CIARP
- + TL + Splits LSA16
- + TL + Splits RWTH
- + TL + Splits CIARP
- + MAML + Splits LSA16
- + MAML + Splits RWTH
- + MAML + Splits CIARP

- Hacer cross-validation sobre los experimentos para evitar un test set fijo. Seguir usando 75%/25%, y variar la semilla para hacer N=10 pruebas distintas. Medir la media y desviación estándar.
 
Al final se hizo con N = 5

-  Hacer un estudio previo de los datasets de base para el Transfer Learning: LSA16, CIARP, RWTH, y ImageNet (+mnist, cifar10). Usar siempre DenseNet. Generar matriz de datasets vs datasets. También con N pruebas distintas.

Los resultados que faltan en las tablas son los de aplicar MAML al proceso de entrenamiento. Es decir, los que dicen "+ MAML" en el nombre de cada metodo de TL ahora mismo, significa que se usó de base un DenseNet entrenado con MAML.

Ahora mismo se está entrenando. El método con el que mejores resultados se obtenia en promedio para los splits de 5 y 10 samples era haciendo TL con MAML usando de base un modelo DenseNet entrenado sin MAML.

Yo creo que para el miercoles estaria completada la table, y mientras tanto se puede ir escribiendo el paper.

-  Probar con split de 30 también en RWTH. Usemos mínimo 30 ejemplos por clase (en RWTH) y ya fue.

Pequeño error, olvidé poner la cantidad minima de ejemplos en 30, pero correr los experimentos devuelta solo de RWTH lleva demasiado poco.

-  Cambiar de "Split 5" a "5 samples" para que se entienda más

Done

-  Poner último el resultado con el dataset entero (para que queden crecientes los resultados). Comentar cuantos ejemplos por clase tiene el dataset entero, tipo Full dataset(5 samples).

- + Optimizar proto
- + Repetir experimentos de Proto
- ? ProtoNet + HandCropper + RWTH
- 


Revizar que pasa con los 5 y 10 samples. Por qué están trabados.
Agrupar TL por dataset usado.


# Paper
- Metodología
    - Diagrama de las distintas combinaciones de pruebas
        - DenseNet
        - TL + DATASET
        - TL + MAML + DATASET
        - TL + MAML + DATASET + MAML
    - Aclarar que todos los exp utilizan data augmentation ya que es ortogonal a los modelos => citar a los experimentos del paper anterior respecto a la elección del tipo de data augmentation
- Resultados
    - Prototipical > todos ?
    - Efecto de usar MAML en entrenamiento
- Introducción
- Avisen cuando haya una versión semi completa.


# Paper V2
- Cambiar a formato FCS http://journal.hep.com.cn/fcs/EN/column/column11258.shtml
- Sección 2
    - Poner un diagrama por cada modelo. Quizás agrupar de a 2, tipo prototipical con MAML y densenet con TransferLearning
    - Explicar Wide-DenseNet con SE directamente. Tampoco darle mucha bola
    - Hacer un diagrama de MAML para small datasets.
- Sección 3
    - Dividir por experimentos: poner el setup, los resultados y el análisis de cada uno por separado
    - Experimentos:
        - DenseNet vs Prototypical
        - DenseNet vs Transfer Learning
        - DenseNet vs MAML
        - DenseNet vs Transfer Learning con MAML (hacer un diagrama de esto)
        - Resumen general
            -  Line plot por cada dataset, samples vs acc
                -  Densenet vs Proto vs Transfer (mejor) vs MAML(mejor)
            -  Line plot por cada dataset, samples vs acc
                -   Transfer learning, cada línea es un dataset usado para entrenar

- Conclusión
    -   CIARP OK
    -   LSA y RWTH: proto con pocos vs densenet pura con muchos
