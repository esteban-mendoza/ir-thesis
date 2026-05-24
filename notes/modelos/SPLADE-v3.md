A continuación presento la extracción y clasificación exhaustiva del contenido del reporte técnico de **SPLADE-v3** (), estructurado rigurosamente bajo el principio rector de tu tesis.

---

## Lista 1: Contenido para Marco Teórico

Esta lista contiene los formalismos, metodologías de destilación y funciones de pérdida en su estado matemático puro y generalizable, abstrayéndolos del modelo concreto SPLADE-v3.

| Concepto / Formalismo | Subsección Recomendada | Justificación | Ecuación / Formalismo Teórico ($\LaTeX$) | Nivel de Detalle Recomendado |
| --- | --- | --- | --- | --- |
| **Destilación de Conocimiento mediante Margen MSE (MarginMSE)** | **3.5.1 Funciones de pérdida contrastivas** | El reporte técnico fundamenta su ganancia en optimizar la diferencia de márgenes predicha por el estudiante frente a un ensamble de profesores. Es una pérdida crucial en modelos bi-encoder/sparse.

 | Sea $s(q, d)$ la puntuación predicha por el modelo estudiante y $S(q, d)$ la del profesor. La pérdida MarginMSE para un triplete $(q, d^+, d^-)$ se formaliza canónicamente como:

<br>

<br>$$\mathcal{L}_{\text{MarginMSE}} = \left( (s(q, d^+) - s(q, d^-)) - (S(q, d^+) - S(S(q, d^-)) \right)^2$$

<br>

 | **Desarrollo formal completo** (explicando cómo preserva los márgenes relativos de relevancia). |
| **Destilación basada en Divergencia de Kullback-Leibler (KL-Div)** | **3.5.1 Funciones de pérdida contrastivas** | El paper formaliza el uso de KL-Div para destilar la distribución de probabilidad de relevancia generada por un Cross-Encoder hacia un modelo de recuperación de primera etapa.

 | Sean $P$ la distribución de probabilidad de puntuaciones suavizadas (softmax) del profesor sobre un conjunto de documentos, y $Q$ la del estudiante. Su formulación atemporal es:

<br>

<br>$$\mathcal{L}*{\text{KL}} = D*{\text{KL}}(P \parallel Q) = \sum_{i} P(d_i | q) \log \left( \frac{P(d_i |
| **Combinación Lineal Multitarea de Pérdidas de Destilación** | **3.5.1 Funciones de pérdida contrastivas** | El paper demuestra que combinar pérdidas orientadas a precisión (KL) y exhaustividad (MSE) balancea el aprendizaje del modelo de IR. La formulación generalizada de la combinación ponderada es apta para el marco conceptual.

 | Dados los hiperparámetros de penalización $\lambda_{1}$ y $\lambda_{2}$, la función de pérdida combinada se define como:

<br>

<br>$$\mathcal{L}_{\text{total}} = \lambda_{\text{KL}} \mathcal{L}_{\text{KL}} + \lambda_{\text{MSE}} \mathcal{L}_{\text{MarginMSE}}$$

<br>

 | **Desarrollo formal completo.** |
| **Agregación por Normalización Min-Max por Consulta** | **3.6 Fundamentos matemáticos de la fusión de rangos** | El paper utiliza la agregación min-max para homogeneizar las escalas de puntuación de múltiples profesores antes de fusionarlos. Aunque es una técnica de normalización, en IR actúa como paso previo a la fusión de scores.

 | Dada una consulta $q$ y una puntuación cruda $s(q,d)$ de un modelo $M$, la normalización se expresa como:

<br>

<br>$$\bar{s}(q,d) = \frac{s(q,d) - \min_{d' \in D} s(q,d')}{\max_{d' \in D} s(q,d') - \min_{d' \in D} s(q,d')}$$

<br>

 | **Definición básica.** |
| **Meta-análisis basado en el Tamaño del Efecto (RANGER)** | **3.7 Evaluación en recuperación de información** | El paper adopta el marco conceptual RANGER para evaluar la consistencia estadística de un recuperador a través de múltiples colecciones (meta-análisis de efectos fijos/aleatorios).

 | No incluye ecuaciones explícitas en el texto, pero el concepto se fundamenta en el cálculo del tamaño del efecto global e intervalos de confianza (95% CI) combinando múltiples *query sets*.

 | **Sólo intuición** (explicar la metodología general para agregar métricas de múltiples colecciones). |
| **Evaluación bajo Juicios Incompletos ($\text{nDCG}^{*}$)** | **3.7 Evaluación en recuperación de información** | Define formalmente cómo medir el Gain Acumulado Descontado cuando se mitiga el sesgo de documentos no juzgados en colecciones masivas o transferidas.

 | <br>$\text{nDCG}^{*}$ se calcula aplicando la formulación estándar de $\text{nDCG}$ pero computando el vector de relevancia ideal ($iDCG$) considerando única y exclusivamente el subconjunto de documentos que poseen juicios explícitos (positivos o negativos) en el *top-k*.

 | **Definición básica.** |

---

## Lista 2: Contenido para Estado del Arte

Esta sección recopila las contribuciones históricas, configuraciones específicas, resultados empíricos y variantes de la familia de modelos SPLADE detalladas en el documento.

### Aportes Específicos e Integración en el Estado del Arte

* **Estrategia de Entrenamiento y Destilación en Ensamble de SPLADE-v3**
* 
**Subsección:** *4.2 Modelos semánticos representativos* 


* 
**Resumen para la tesis:** SPLADE-v3 refina los modelos de expansión léxica dispersa mediante el uso de un ensamble de 5 modelos de reordenamiento Cross-Encoder (MiniLM, RankT5, DeBERTaV3, DeBERTaV2 y Electra) para generar puntuaciones de destilación sobre MS MARCO. Introduce un ajuste afín (*rescored*) para normalizar las estadísticas del ensamble y mitigar el desfase distributivo en pérdidas tipo MarginMSE.


* 
**Resultados numéricos clave:** En MS MARCO passages (sin títulos), SPLADE-v3 alcanza un **MRR@10 de 40.2** frente al 37.6 de SPLADE++ SelfDistil. En el benchmark fuera de dominio BEIR (promedio de 13 datasets), logra un **nDCG@10 de 51.7** (un incremento absoluto del 1.0%).


* 
**Contraparte formal en Marco Teórico:** Se conecta directamente con las funciones de pérdida por destilación combinadas descritas en la sección 3.5.1 y la normalización de scores en la sección 3.6.




* **Configuración de Negativos por Lote (Multiple Negatives Per Batch)**
* 
**Subsección:** *4.2 Modelos semánticos representativos* 


* 
**Resumen para la tesis:** A diferencia de las iteraciones previas de SPLADE que dependían de un único negativo duro por consulta, SPLADE-v3 escala a 100 ejemplares negativos muestreados a partir de un modelo SPLADE++ (50 del top-50 y 50 aleatorios del top-1k). Los autores concluyen empíricamente que incrementar el volumen de negativos duros optimiza sustancialmente el rendimiento *in-domain* pero ofrece rendimientos decrecientes en la generalización *zero-shot*.


* **Contraparte formal en Marco Teórico:** Se relaciona con la optimización y minería de ejemplos negativos duros en el aprendizaje contrastivo (sección 3.5.1).


* **Variantes Dispersas Eficientes: SPLADE-v3-Lexical, DistilBERT y Doc**
* 
**Subsección:** *4.2 Modelos semánticos representativos* 


* 
**Resumen para la tesis:** El estudio introduce tres variantes orientadas a la eficiencia operativa:


1. 
*SPLADE-v3-Lexical*, que elimina el mecanismo de expansión de consultas reduciendo el costo computacional a **0.6 FLOPS**;


2. 
*SPLADE-v3-DistilBERT*, que reduce la huella de inferencia usando una arquitectura destilada;


3. 
*SPLADE-v3-Doc*, que remueve por completo el procesamiento en tiempo de consulta operando como un Bag-of-Words binario indexado.




* 
**Resultados numéricos clave:** *SPLADE-v3-Lexical* retiene un rendimiento notable *in-domain* (**40.0 MRR@10** en MS MARCO) pero sufre una degradación severa en escenarios fuera de dominio (**49.1 nDCG@10** en BEIR). *SPLADE-v3-Doc* demuestra ser el menos efectivo en transferencia zero-shot (**47.0 nDCG@10** en BEIR).




* **Análisis Empírico de la Cascada de Reordenamiento (First-Stage vs. Cross-Encoder)**
* 
**Subsección:** *4.3 Modelos de reranking neuronal* o *4.4 Estrategias de fusión y reranking en la literatura* 


* 
**Resumen para la tesis:** Evalúa el impacto de reordenar las primeras 50 etapas de documentos recuperados por SPLADE-v3 empleando modelos avanzados como DeBERTaV3. El estudio valida que reordenar un número acotado de documentos ($k=50$) recuperados por un codificador disperso de alta calidad representa un balance óptimo entre latencia computacional y ganancia de efectividad, superando consistentemente al recuperador base en casi todos los dominios (con excepciones notables como ArguAna).





---

## Lista 3: Contenido descartable o periférico

Considerando que tu tesis se enfoca estrictamente en **estrategias de fusión de rangos en español sobre el dataset MessIRve**, se sugiere omitir o resumir al mínimo los siguientes puntos del artículo por considerarse tangenciales:

1. 
**Métricas de FLOPS de hardware específicas (Sección 4, Tabla 1):** Los estimados de FLOPS provistos (e.g., 1.2 o 1.4) corresponden a perfiles computacionales ligados de forma exclusiva al vocabulario y tokenización del inglés en arquitecturas BERT/DistilBERT. No aportan valor analítico directo al comportamiento de los algoritmos de fusión sobre MessIRve.


2. 
**Análisis pormenorizado del comportamiento en datasets específicos de BEIR (Tabla 2):** Datos aislados de colecciones altamente específicas del inglés (como *Climate-FEVER*, *SciFact*, o las tareas de argumentación de *ArguAna*) deben omitirse. Solo vale la pena rescatar la métrica macro (*Average BEIR*) como indicador general de la robustez del modelo fuera de dominio.


3. 
**Discusión sobre el preentrenamiento de CoCondenser (Sección 2.4):** Los detalles sobre si inicializar desde checkpoints específicos de *CoCondenser* o *SelfDistil* benefician el proceso de *curriculum learning* son excesivamente internos al pipeline de entrenamiento de codificadores ingleses de Naver Labs. Dado que en tu metodología aplicarás fusión de rangos sobre resultados pre-recuperados o modelos ya existentes, la receta exacta de entrenamiento arquitectónico es secundaria.



---

## Sugerencia de reestructuración para tu tesis

Al analizar el diseño experimental de SPLADE-v3, se identifica una técnica sumamente relevante que actualmente **no tiene un espacio explícito** en la estructura capitular de tu marco teórico:

* **Sugerencia:** Modificar la subsección **3.5.1** o abrir una nueva subsección **3.5.4 titulada "Destilación de Conocimiento en Recuperación de Información" (Knowledge Distillation for IR).**
* 
**Justificación:** El paper demuestra de forma contundente que los modelos de primera etapa más potentes ya no se entrenan únicamente con tripletas de contraste estándar (MarginMSE/InfoNCE básicas), sino mediante esquemas de destilación donde un modelo denso o disperso (estudiante) imita las puntuaciones continuas de un Cross-Encoder o un ensamble de ellos. Dado que tu tesis contrasta codificadores dispersos frente a Cross-Encoders y líneas base propietarias, es matemáticamente indispensable formalizar en el Marco Teórico cómo se transfiere el conocimiento analítico de un reordenador (profesor) a un indexador (estudiante) a través de la suavización de distribuciones de probabilidad y la preservación de márgenes de relevancia.