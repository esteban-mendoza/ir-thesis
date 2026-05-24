Aquí tienes la extracción y clasificación del contenido del paper seminal de **SPLADE (Formal et al., 2021)**, estructurada y adaptada rigurosamente para los capítulos 3 y 4 de tu tesis en Matemáticas Aplicadas.

---

## Lista 1: Contenido para Marco Teórico (Atemporal y Formal)

Esta lista recupera los fundamentos matemáticos y conceptuales generalizables que introduce o formaliza el paper, abstrayendo el modelo concreto (SPLADE).

### 1. Cuantificación Teórica de la Complejidad de Búsqueda (Cómputo Esperado de FLOPS)

* **Subsección sugerida:** 3.7 Evaluación en recuperación de información (o una subsección nueva sobre Complejidad Computacional en Indexación).
* 
**Justificación:** Define formalmente la métrica teórica subyacente para evaluar la eficiencia en tiempo de búsqueda de un índice invertido basado en vectores dispersos, usando probabilidades de activación independientes.


* **Ecuación / Formalismo:**

$$\mathbb{E}_{q,d} \left[ \sum_{j \in V} p_j^{(q)} p_j^{(d)} \right]$$


Donde $V$ representa el vocabulario completo de la colección, y $p_j^{(q)}, p_j^{(d)}$ denotan las probabilidades de activación (peso no nulo) del token $j$ en la consulta $q$ y el documento $d$, respectivamente.


* **Nivel de detalle recomendado:** Desarrollo formal completo. Es una excelente métrica probabilística para un matemático aplicada a la computación.

### 2. El Regularizador FLOPS como Relajación de la Varianza del Índice

* **Subsección sugerida:** 3.5.1 Funciones de pérdida contrastivas (o una nueva sección en 3.4/3.5 dedicada a Regularización de Dispersión / *Sparsity*).
* 
**Justificación:** A diferencia de la penalización clásica $L_1$ (que promueve dispersión absoluta pero de forma desbalanceada), la regularización basada en FLOPS minimiza la colisión en las listas de posteo, penalizando el cuadrado del peso medio para balancear el índice invertido (evitando cuellos de botella de términos muy frecuentes estilo Zipf).


* **Ecuación / Formalismo:**
Dado un lote de tamaño $N$, se calcula la activación media suavizada para el token $j$ como $\overline{a}_j = \frac{1}{N} \sum_{i=1}^{N} w_j^{(d_i)}$. La pérdida de regularización se formaliza como:



$$\mathcal{L}_{\text{FLOPS}} = \sum_{j \in V} \overline{a}_j^2 = \sum_{j \in V} \left( \frac{1}{N} \sum_{i=1}^{N} w_j^{(d_i)} \right)^2$$


* 
**Nivel de detalle recomendado:** Desarrollo formal completo, contrastándolo explícitamente con la norma $L_1$ canónica ($\sum |w_j|$).



### 3. El Efecto de Saturación Logarítmica en Pesos Léxicos Neuronales

* **Subsección sugerida:** 3.4 Paradigmas de modelos neuronales para IR (Subsección de *Sparse Encoders*).
* 
**Justificación:** Formaliza matemáticamente la incorporación del principio axiomático de la recuperación de información tradicional (la frecuencia de términos sublineal, como en $TF-IDF$ o $BM25$) dentro de la agregación de embeddings contextuales para evitar la dominancia de componentes vectoriales.


* **Ecuación / Formalismo:**

$$w_j = \sum_{i \in t} \log(1 + \text{ReLU}(w_{ij}))$$


Donde $w_{ij}$ representa la proyección/importancia lineal cruda de un token de la secuencia $i$ sobre la dimensión del vocabulario $j$.


* 
**Nivel de detalle recomendado:** Desarrollo formal completo, conectándolo analíticamente con las funciones de saturación no lineales y su impacto en la dispersión natural del gradiente.



### 4. Función de Pérdida con Negativos en el Lote (In-Batch Negatives) con Softmax Cruzada

* **Subsección sugerida:** 3.5.1 Funciones de pérdida contrastivas.
* 
**Justificación:** Define formalmente la optimización basada en la maximización de la probabilidad de relevancia sobre un espacio muestral que combina negativos duros y negativos aleatorios compartidos eficientemente en arquitecturas siamesas.


* **Ecuación / Formalismo:**

$$\mathcal{L}_{\text{rank-IBN-log}} = -\log \frac{e^{s(q_i, d_i^+)}}{e^{s(q_i, d_i^+)} + e^{s(q_i, d_i^-)} + \sum_{j \neq i} e^{s(q_i, d_{j}^+)}}$$


Donde $s(q,d)$ es la función de similitud (producto punto), $d_i^-$ es un negativo duro y $\sum_{j \neq i} e^{s(q_i, d_{j}^+)}$ mapea los documentos positivos de otras consultas dentro del mismo lote operando como negativos corporativos.


* **Nivel de detalle recomendado:** Desarrollo formal completo.

---

## Lista 2: Contenido para Estado del Arte (Temporal y Específico)

Esta lista extrae las contribuciones particulares de SPLADE  y cómo interactúan con las herramientas matemáticas descritas en el marco teórico.

### 1. El Modelo SPLADE (SParse Lexical AnD Expansion)

* **Subsección sugerida:** 4.2 Modelos semánticos representativos (*Sparse Encoders*).
* 
**Resumen para la tesis:** SPLADE soluciona las deficiencias de su predecesor conceptual *SparTerm*. Elimina el uso de compuertas binarias complejas entrenadas en dos etapas (gating secuencial) y permite, por primera vez, un entrenamiento *end-to-end* en una sola etapa de una representación ultra dispersa que proyecta los textos al vocabulario completo de BERT (WordPiece, $|V|=30,522$). Utiliza una inicialización basada en los logits de la capa Masked Language Model (MLM) de BERT.


* 
**Resultados numéricos clave (MS MARCO Dev / TREC DL 2019):** * *SPLADE-$L_1$*: MRR@10: **0.322**, NDCG@10: **0.667**, FLOPS: **0.88**.


* 
*SPLADE-FLOPS*: MRR@10: **0.322**, NDCG@10: **0.665**, FLOPS: **0.73**.
(Nota la drástica reducción de operaciones frente a variantes sin saturación logarítmica como ST exp-$l_1$ con FLOPS de 4.62).




* Contraparte formal en Cap. 3: Aplica directamente la saturación logarítmica (ver 3.4) y la optimización conjunta de regularizadores (ver 3.5.1).



### 2. El balanceo de hiperparámetros de dispersión diferencial ($\lambda_q \neq \lambda_d$)

* **Subsección sugerida:** 4.2 Modelos semánticos representativos.
* **Resumen para la tesis:** Una decisión de diseño crítica expuesta en el paper es la asimetría en las restricciones de dispersión. Al aplicar mayor presión de regularización a la consulta ($\lambda_q$) que al documento ($\lambda_d$), se restringe el tamaño de la consulta manteniendo un tiempo de latencia en tiempo real (*online inference*) extremadamente bajo, permitiendo que la expansión masiva ocurra predominantemente del lado del documento en indexación *offline*.


* 
**Resultados numéricos clave:** Demuestra empíricamente el compromiso efectividad-eficiencia controlando de $10^{-1}$ a $10^{-4}$ la fuerza del regularizador.


* Contraparte formal en Cap. 3: Vinculado al planteamiento de la pérdida agregada: $\mathcal{L} = \mathcal{L}_{\text{rank-IBN}} + \lambda_q \mathcal{L}_{\text{reg}}^q + \lambda_d \mathcal{L}_{\text{reg}}^d$.



### 3. Comparativa frente a Encoders Densos (ANCE, TCT-ColBERT) y Léxicos Tradicionales

* **Subsección sugerida:** 4.4 Estrategias de fusión y reranking en la literatura (o 4.2 como benchmark competitivo).
* 
**Resumen para la tesis:** El paper posiciona a los métodos de dispersión aprendida al nivel de desempeño de los métodos densos bi-encoders de vanguardia (como ANCE), pero mitigando por completo la necesidad de implementar librerías costosas y arquitecturas de búsqueda de vecinos más cercanos aproximados (ANN) como FAISS, cuya distorsión sobre métricas de IR no estaba teóricamente calibrada. SPLADE puede ser inyectado directamente sobre motores de indexación léxica estándar (Lucene/ElasticSearch) modificando únicamente los diccionarios de pesos.


* 
**Resultados numéricos clave:** SPLADE (MRR@10 **0.322**) supera holgadamente a BM25 (MRR@10 **0.184**) y es competitivo frente a ANCE (MRR@10 **0.330**) en la colección MS MARCO.



---

## Lista 3: Contenido descartable o periférico

Elementos del paper que **NO** deben formar parte de tu enfoque:

1. 
**Infraestructura de Indexación Numba/Python (Sección 4 - "Training, indexing and retrieval"):** El paper menciona un sistema personalizado basado en arreglos de Python acelerados con Numba para ejecutar la recuperación en paralelo. Esto es un detalle de ingeniería del sistema operativo de ellos y es irrelevante para tu tesis, dado que tú evaluarás la fusión de rangos a nivel de salidas algorítmicas de los modelos, no la velocidad de ejecución a bajo nivel de su *pipeline* de código.


2. 
**Detalles de Hardware Específico (Sección 4):** La mención de las "4 GPUs Tesla V100 con 32GB" y el uso exacto del optimizador Adam con 6,000 pasos de *warmup* para MS MARCO  son periféricos. Solo te interesan los conceptos de entrenamiento, no la replicación exacta de su pre-entrenamiento en inglés, ya que tu enfoque está centrado en el español y en el conjunto de datos MessIRve.



---

## Sugerencia de reestructuración de tu Marco Teórico

Dado que eres matemático de la UNAM y estás evaluando estrategias de *rank fusion*, la introducción de modelos tipo SPLADE altera sutilmente la frontera de lo que es un "modelo léxico" y un "modelo semántico". Te propongo la siguiente modificación en la subsección **3.4** del marco teórico para darle mayor rigor formal y acomodar este paper de manera impecable:

* **Estructura Actual:** 3.4 Paradigmas de modelos neuronales para IR (dual-encoder, sparse-encoder, cross-encoder, late interaction)
* **Modificación propuesta (Desglosar 3.4.2):**
* **3.4.1 Paradigmas de Proyección Densa (Dual-Encoders / Arquitecturas Siamesas):** Espacios ortogonales continuos de baja dimensionalidad.
* 
**3.4.2 Paradigmas de Proyección Dispersa y Expansión de Vocabulario (Sparse Encoders):** Aquí es donde formalizarás analíticamente cómo mapear un vector de texto de dimensión densa intermedia $d$ hacia un espacio vectorial disperso de dimensión masiva e interpretable $|V|$ (coincidente con el vocabulario del tokenizador). Esto te permitirá explicar matemáticamente la diferencia entre una **proyección latente abstracta** (como SNRM) y una **proyección léxica expandida contextual** (como la función de agregación con compuerta ReLU/Log de SparTerm y SPLADE), sin necesidad de nombrar a los modelos comerciales hasta el Capítulo 4.