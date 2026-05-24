Aquí tienes la extracción, clasificación y análisis riguroso del artículo científico provisto (*"Retrieval Consistency in the Presence of Query Variations"*, Bailey et al., SIGIR 2017), estructurado exactamente bajo los principios de tu tesis en Matemáticas Aplicadas de la UNAM y enfocado en tu objetivo experimental con el dataset *MessIRve*.

---

### Lista 1: Contenido para el Capítulo 3 — Marco Teórico (Atemporal y Formal)

Esta lista compila los conceptos matemáticos y formalismos generales que se extraen del *paper*. Se presentan de forma canónica para dotar al lector de las herramientas de fusión y métricas de similitud de listas.

| Concepto / Formalismo | Subsección Recomendada | Justificación Teórica | Ecuación / Formalismo en LaTeX | Nivel de Detalle Recomendado |
| --- | --- | --- | --- | --- |
| **Modelos de usuario probabilísticos para Fusión de Rangos (Generalización)** | **3.6** Fundamentos matemáticos de la fusión de rangos | Explica formalmente que un algoritmo de fusión puede interpretarse como la esperanza matemática de las preferencias de un universo de agentes que examinan las listas a diferentes profundidades aleatorias.

 | Sea un universo de agentes que eligen una profundidad de corte $d$ bajo una distribución de probabilidad $P(d=x)$. El puntaje final del documento está dado por su valor esperado de observaciones en los prefijos de longitud $d$.

 | <br>**Desarrollo formal completo:** Es la base para conectar Borda con aproximaciones geométricas.

 |
| **Puntaje de Borda mediante un Modelo de Usuario Uniforme** | **3.6** Fundamentos matemáticos de la fusión de rangos | Demuestra matemáticamente que el método clásico de conteo de Borda equivale a un modelo probabilístico donde la distribución de probabilidad de la profundidad de parada es uniforme.

 | Si la distribución sobre las profundidades de corte $x \in \{1, \dots, n\}$ es uniforme: 

<br>

<br> <br>$$P(d=x) = \frac{1}{n}$$

<br>

<br> El peso asignado a un elemento en el rango $x$ es proporcional al conteo lineal de Borda: 

<br>

<br>$$W_{\text{Borda}}(x) = \frac{n - x + 1}{n}$$

 | **Desarrollo formal completo:** Elegante y muy pertinente para una tesis de matemáticas aplicadas. |
| **Algoritmo de Fusión basado en Decaimiento Geométrico (Rank-Biased Centroid - Fundamento)** | **3.6** Fundamentos matemáticos de la fusión de rangos | Introduce formalmente la distribución geométrica para modelar la persistencia decreciente del usuario en sistemas de recuperación. Asigna mayor peso a las coincidencias en las primeras posiciones de las listas (*top-weightedness*).

 | Sea $\phi \in [0, 1]$ el parámetro de persistencia (paciencia) del usuario. La distribución de probabilidad de la profundidad $x$ es geométrica : 

<br>

<br> <br>$$P(d=x) = (1-\phi)\phi^{x-1}$$

<br>

<br> El puntaje de fusión asignado a un documento $i$ a profundidad $x$ en un conjunto de listas de entrada $\mathcal{R}$ es: 

<br>

<br>$$S_{\text{RBC}}(i) = \sum_{R \in \mathcal{R}} (1-\phi)\phi^{\text{rank}(i, R)-1}$$

 | <br>**Desarrollo formal completo:** Debes definir las propiedades de convergencia cuando las listas tienden a longitud infinita ($n \to \infty$) o son prefijos truncados.

 |
| **Métricas de Similitud entre Listas de Clasificación: Kendall's $\tau$ vs. RBO** | **3.7** Evaluación en recuperación de información | Contextualiza la necesidad de medir la correlación/consistencia de ordenamientos cuando las listas son disjuntas (no-conjoint) y se requiere ponderar las primeras posiciones (*rank-biased*).

 | No incluye la ecuación explícita de RBO (cita a Webber [38]) , pero define el comportamiento del parámetro de persistencia $\phi$ en la probabilidad condicional de transición del rango $i$ al $i+1$.

 | <br>**Desarrollo formal completo:** Explicar la debilidad estructural de Kendall (unweighted, asume permutaciones idénticas) frente a la robustez matemática de RBO.

 |

---

### Lista 2: Contenido para el Capítulo 4 — Estado del Arte (Específico y Comparativo)

Esta lista describe las aportaciones específicas del artículo científico, permitiendo situar metodológicamente tu experimentación sobre el dataset *MessIRve*.

* 
**Aporte:** **Introducción del algoritmo de fusión Rank-Biased Centroid (RBC)**.


* **Subsección:** *4.4 Estrategias de fusión y reranking en la literatura.*
* **Resumen para la tesis:** Bailey et al. (2017) proponen RBC como un método de fusión de rangos basado únicamente en posiciones (*rank-only*). A diferencia de CombSUM/CombMNZ, no requiere normalizar puntuaciones arbitrarias de los recuperadores y, a diferencia de Borda clásico, no penaliza las listas truncadas o de longitudes variables, ponderando de forma robusta las primeras posiciones mediante el parámetro de persistencia $\phi$.


* 
**Resultados numéricos clave:** El comportamiento asintótico de la fusión: si $\phi \to 0$ el algoritmo colapsa a un esquema mayoritario de primer orden (*first-past-the-post*) ; si $\phi \to 1$, se convierte puramente en un conteo de popularidad (presencia del documento en los distintos sistemas).


* 
**Contraparte formal:** Sí; se fundamenta en los modelos de decaimiento geométrico presentados en el subapartado matemático conceptual (ver apartado 3.6 en la Lista 1).




* 
**Aporte:** **Uso de Fusión de Rangos sobre variaciones sintácticas/expresivas de consultas (*Query Variations*)**.


* **Subsección:** *4.4 Estrategias de fusión y reranking en la literatura* (o alternativamente *4.6 Particularidades del español en IR* para contrastar).
* 
**Resumen para la tesis:** El trabajo demuestra que fusionar los resultados de múltiples variantes sintácticas de una misma necesidad de información (mediante RBC) supera consistentemente el rendimiento (NDCG, AP) de la mejor consulta individual de origen. Esto justifica el uso de estrategias de fusión cuando se generan múltiples paráfrasis mediante LLMs o expansiones de términos.


* 
**Resultados numéricos clave:** Utilizan la colección UQV100 (100 tópicos, con rangos de entre 19 y 101 variaciones de consulta por tópico, acumulando 5,765 consultas únicas tras normalización).


* 
**Contraparte formal:** Ninguna técnica matemática directa, es una metodología de evaluación de robustez en IR.




* 
**Aporte:** **Definición de la Consistencia de Recuperación (*Retrieval Consistency*) como propiedad independiente de la efectividad**.


* **Subsección:** *4.5 Benchmarks de IR o subsección nueva de métricas avanzadas en 4.4.*
* 
**Resumen para la tesis:** Se propone evaluar los sistemas de IR no solo por su precisión absoluta (relevancia profunda), sino por su *consistencia*: la capacidad del motor de búsqueda de regresar el mismo ordenamiento ideal de documentos independientemente de la variabilidad léxica o errores sintácticos con los que el usuario formule su intención.


* 
**Resultados numéricos clave:** Demuestran empíricamente que la consistencia (medida con RBO respecto al centroide RBC) está fuertemente correlacionada con métricas de relevancia profundas (deep metrics) , pero solo débilmente con métricas superficiales (shallow metrics).





---

### Lista 3: Contenido periférico o descartable

Elementos del *paper* que **NO** aportan valor a tu tesis (fusión de rangos en español sobre *MessIRve*) y que debes omitir para mantener el rigor matemático y el enfoque del proyecto:

1. 
**Detalles del corpus ClueWeb12-CatB y sistemas anonimizados (Sección 4.1):** Las descripciones del indexador específico utilizado por los autores y el procesamiento de anomalías de sus 5 motores de búsqueda comerciales/propietarios de 2017 son irrelevantes, ya que tú evaluarás modelos modernos de código abierto (BM25, SPLADE, ColBERT, E5) sobre *MessIRve*.


2. 
**Ejemplos léxicos específicos del inglés (Sección 1):** Ejemplos como la sustitución de *"facebook"* por *"facebok"* o *"faecbook"* , o términos como *"raspberry pi cost"*. En tu tesis, este espacio debe ser ocupado por los desafíos morfosintácticos inherentes al idioma español (subsección 4.6).


3. 
**Análisis detallado de Logs de clics históricos (Sección 2.2):** La discusión sobre los trabajos de Jiang et al. enfocados en análisis transaccionales de motores web comerciales a gran escala  se aleja de la naturaleza matemática y de evaluación en colecciones de prueba (*test collections*) de tu investigación.



---

### Sugerencia de reestructuración de tu Marco Teórico

Al analizar el marco matemático del artículo, se detecta que tu estructura actual en el **Capítulo 3** puede adolecer de un pequeño hueco conceptual en la transición entre la evaluación y los algoritmos de fusión:

* **Modificación propuesta:** Dentro de la subsección **3.6 Fundamentos matemáticos de la fusión de rangos**, te sugiero abrir explícitamente dos vertientes analíticas:
* 
*3.6.1 Métodos basados en puntuación (Score-based):* Tratamiento formal de la normalización de variables aleatorias o escalamientos lineales (CombSUM, CombMNZ).


* 
*3.6.2 Métodos basados en orden/posición (Rank-based):* Teoría de elección social (Borda, Condorcet) y su extensión a **modelos de usuario probabilísticos con decaimiento geométrico (RBC)**.




* 
**Modificación en el apartado de evaluación (3.7):** Asegúrate de incluir no solo métricas de relevancia canónicas (MAP, NDCG), sino la formalización matemática de **Similitud entre clasificaciones con pesos adaptativos (Rank-Biased Overlap - RBO)**, ya que analíticamente es la contraparte que te permitirá medir la estabilidad de tus fusiones sobre *MessIRve* cuando cambies de recuperadores léxicos a semánticos.