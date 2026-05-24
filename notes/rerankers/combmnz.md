Este es el desglose y la clasificación del contenido del artículo seminal de Shaw y Fox (TREC-3), estructurado específicamente para los objetivos de tu tesis de licenciatura en Matemáticas Aplicadas.

---

## Lista 1: Contenido para Marco Teórico

En esta sección se extraen los conceptos formalizables y atemporales del artículo. Aunque el texto se centra mucho en la implementación práctica del sistema SMART, el núcleo matemático relevante para tu trabajo es la combinación lineal de similitudes.

### Tabla de Conceptos Teóricos

| Concepto | Subsección sugerida | Justificación | Nivel de detalle matemático |
| --- | --- | --- | --- |
| <br>**CombSUM** (Fusión por suma lineal de similitudes) 

 | **3.6** Fundamentos matemáticos de la fusión de rangos | Es la base teórica de la fusión de puntuaciones (*score fusion*). Representa la agregación lineal de evidencia proveniente de múltiples sistemas.

 | **Desarrollo formal completo.** Definición del operador de agregación y discusión sobre la necesidad de normalización previa si las escalas difieren. |
| <br>**Esquema de pesado analítico (SMART *ann*)** 

 | **3.2** Modelos léxicos: fundamentos | Es una variante formal de la función de pesado TF dentro del modelo de espacio vectorial, diseñada para atenuar la frecuencia de términos mediante normalización por el máximo.

 | **Definición básica.** Presentar la ecuación como una alternativa canónica a las funciones de frecuencia tradicionales en modelos vectoriales. |

### Ecuaciones Clave (LaTeX)

* **Esquema de pesado de términos (SMART *ann*):**
Utilizado por los autores para calcular el peso de un término en un documento sin depender de estadísticas globales de la colección:



$$term\_weight = 0.5 + 0.5 \cdot \frac{tf}{max\_tf}$$


Donde $tf$ es la frecuencia del término en el documento y $max\_tf$ es la frecuencia máxima de cualquier término en el mismo documento.


* **Formulación matemática implícita de CombSUM:**
Para un documento $d$ dentro de un conjunto de documentos candidatos, dada una colección de $N$ sistemas de recuperación independientes, la puntuación fusionada $S_{CombSUM}(d)$ se define de manera atemporal como:



$$S_{CombSUM}(d) = \sum_{i=1}^{N} s_i(d)$$


Donde $s_i(d)$ es la puntuación (o similitud) asignada al documento $d$ por el sistema $i$.



---

## Lista 2: Contenido para Estado del Arte

Aquí se ubican los hallazgos empíricos del experimento TREC-3 de Virginia Tech, los cuales sirven como antecedentes directos para la discusión de tus resultados.

### Aportes Específicos del Paper

* **El hallazgo principal sobre paradigmas vs. consultas**
* **Subsección:** **4.4** Estrategias de fusión y reranking en la literatura
* 
**Qué debe decir la tesis:** El trabajo demuestra empíricamente que los mayores incrementos en la efectividad de la recuperación provienen de la combinación de *paradigmas de búsqueda divergentes* (por ejemplo, combinar modelos vectoriales con consultas booleanas extendidas P-norm) en lugar de combinar múltiples consultas similares bajo un mismo modelo.


* 
**Resultados numéricos clave:** En la colección consolidada (*Both Disks*) , los sistemas individuales de vectores (SV, LV) obtuvieron precisiones promedio de **0.1340** y **0.1960** , mientras que los P-norm (Pn1.0 a Pn2.0) oscilaron entre **0.2062** y **0.2270**. Al fusionar dos modelos del mismo tipo (ej. Pn1.0 - Pn1.5 = **0.2183**) el rendimiento se estancó o empeoró respecto al mejor individual ; sin embargo, combinar paradigmas distintos (ej. LV - Pn1.5) disparó la métrica a **0.3104**.


* **Mapeo conceptual:** Fusión de paradigmas léxico-booleanos $\rightarrow$ Antecedente directo de la fusión léxico-semántica (BM25 + Dense Encoders) que evaluarás en MessIRve.


* **Rendimiento de las ejecuciones oficiales (VTc5s vs. VTc2s)**
* **Subsección:** **4.4** Estrategias de fusión y reranking en la literatura
* 
**Qué debe decir la tesis:** Al analizar el método CombSUM, los autores observaron que fusionar un subconjunto óptimo y complementario de solo dos ejecuciones (un vector corto y un P-norm, run *VTc2s*) puede superar numéricamente a la fusión masiva de todas las ejecuciones disponibles (*VTc5s*), demostrando que añadir más sistemas a la fusión no siempre garantiza mejores resultados si estos son redundantes.


* 
**Resultados numéricos clave:** Para el conjunto total de discos (*Both Disks*) , la combinación de los 5 sistemas (*VTc5s*) logró una precisión media no interpolada de **0.2914** (+28.4% sobre el mejor componente base). Por su parte, la combinación selectiva de 2 sistemas (*VTc2s*) alcanzó **0.3021** (+34.6% sobre su mejor componente base).





---

## Lista 3: Contenido descartable o periférico

Los siguientes elementos del artículo **no** aportan valor a tu tesis de matemáticas aplicadas y deben ser omitidos para mantener el enfoque metodológico y teórico:

* 
**Limitaciones de hardware y software de la época:** Toda la discusión sobre el uso de la arquitectura DECstation 5000/125, los 40 MB de RAM, y la imposibilidad técnica de construir archivos invertidos unificados debido a restricciones de almacenamiento en disco (Sección 2).


* 
**Preprocesamiento con SMART (1985):** Los detalles específicos sobre el *pre-parser* de SGML, la lista fija de 418 palabras de parada (*stop words*) de SMART y el algoritmo de lematización de plurales empleado en ese sistema particular.


* 
**Ajustes específicos de los operadores booleanos P-norm:** Los p-valores (1.0, 1.5, 2.0) y la simulación de frases con operadores AND en las consultas booleanas (Sección 3.1). Esto es propio de la mecánica interna del modelo P-norm y no de la estrategia de fusión en sí misma.



---

## Sugerencia de reestructuración para tu Marco Teórico

El artículo enfatiza un aspecto crítico: para que CombSUM (u otras estrategias de fusión de puntuaciones) sea matemáticamente válido y comparable a través de diferentes sistemas, los valores de similitud deben ser directamente comparables. En el artículo lo logran forzando un esquema de pesado (*ann*) que no depende de estadísticas globales de la colección.

En la recuperación de información moderna (léxica vs. semántica), las puntuaciones de BM25 (escalares positivos sin límite superior estricto) y las de los *dense encoders* (cosenos entre -1 y 1, o productos punto arbitrarios) no están en la misma escala.

* **Sugerencia:** Modifica la estructura de tu **Sección 3.6 (Fundamentos matemáticos de la fusión de rangos)** para incluir explícitamente una sub-subsección formal de **Técnicas de Normalización de Puntuaciones** (como *Min-Max Normalization* o *Z-Score Normalization*). Es un requisito matemático indispensable antes de aplicar cualquier operador de agregación lineal como CombSUM.