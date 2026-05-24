# Contexto

Estoy escribiendo mi tesis de licenciatura en Matemáticas Aplicadas 
en la UNAM. El título tentativo es:

"Evaluación de estrategias de fusión de rangos (rank fusion) en la 
recuperación de información en español: un análisis sobre el conjunto 
de datos MessIRve."

# Objetivo de la tesis

Evaluar y comparar la eficacia de algoritmos de fusión de rangos 
aplicados a la combinación de resultados recuperados por modelos de 
código abierto léxicos (BM25) y semánticos (dense/sparse encoders, 
cross-encoders, late interaction) sobre el conjunto de datos MessIRve, 
contrastándolos con modelos de reordenamiento neuronal y con líneas 
base propietarias.

# Estructura objetivo de la tesis

La tesis tiene dos grandes secciones expositivas:

## 3. Marco teórico — atemporal, formal, conceptual
Su función es dotar al lector de las herramientas matemáticas y 
conceptuales necesarias. Presenta conceptos en su forma canónica, 
sin discutir trabajos específicos.

   3.1 Fundamentos de recuperación de información
   3.2 Modelos léxicos: fundamentos (TF-IDF, BM25, PRF)
   3.3 Representaciones vectoriales del lenguaje
       3.3.1 Hipótesis distribucional y embeddings estáticos
       3.3.2 Arquitectura Transformer y atención
       3.3.3 Embeddings contextuales
   3.4 Paradigmas de modelos neuronales para IR
       (definiciones formales de dual-encoder, sparse-encoder, 
        cross-encoder, late interaction — SIN modelos concretos)
   3.5 Aprendizaje de representaciones
       3.5.1 Funciones de pérdida contrastivas
       3.5.2 Fine-tuning y aproximaciones de bajo rango
       3.5.3 Representaciones jerárquicas y truncables
   3.6 Fundamentos matemáticos de la fusión de rangos
   3.7 Evaluación en recuperación de información

## 4. Estado del arte — temporal, comparativo, específico
Discute trabajos concretos, sus resultados y limitaciones.

   4.1 Modelos léxicos modernos y variantes de BM25
   4.2 Modelos semánticos representativos
       (modelos concretos: E5, BGE, Jina, mDPR, SPLADE, ColBERT, etc.,
        explicando cómo aplican las técnicas del cap. 3)
   4.3 Modelos de reranking neuronal
   4.4 Estrategias de fusión y reranking en la literatura
   4.5 Benchmarks de IR (multilingües y en español)
   4.6 Particularidades del español en IR

# Principio rector

- Marco teórico: el "qué es" en forma canónica y atemporal. Si una 
  idea se puede explicar sin citar a quién la propuso, va aquí.
- Estado del arte: el "qué hizo cada quién" y "cómo se compara". 
  Si una idea es indisociable de un trabajo específico o requiere 
  comparación con otros, va aquí.

# Los papers considerados

- BM25: 
  - Robertson, S., & Zaragoza, H. (2009). The Probabilistic Relevance Framework: BM25 and Beyond. Foundations and Trends in Information Retrieval.
- intfloat/multilingual-e5-large-instruct: 
  - Wang, L., Yang, N., Huang, X., Yang, L., Majumder, R., & Wei, F. (2024). Multilingual E5 Text Embeddings: A Technical Report. arXiv preprint arXiv:2402.05672
- BAAI/bge-m3 / BAAI/bge-reranker-v2-m3: 
  - Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216
- Qwen/Qwen3-Embedding-0.6B: 
  - Zhang, Y., et al. (2025). Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models. arXiv preprint arXiv:2506.05176
- jinaai/jina-embeddings-v5-text-small: 
  - Akram, M. K., Sturua, S., Havriushenko, N., Herreros, Q., Günther, M., Werk, M., & Xiao, H. (2026). jina-embeddings-v5-text: Task-Targeted Embedding Distillation. arXiv preprint arXiv:2602.15547
- naver/splade-v3: 
  - Formal, T., Lassance, C., Piwowarski, B., & Clinchant, S. (2021). SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking. Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval
  - Lassance, C., Déjean, H., Formal, T., & Clinchant, S. (2024). SPLADE-v3: New baselines for SPLADE. arXiv preprint arXiv:2403.06789
- jinaai/jina-colbert-v2
  - Khattab, O., & Zaharia, M. (2020). ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval
  - Jha, R., Wang, B., Günther, M., Mastrapas, G., Sturua, S., Mohr, I., Koukounas, A., Akram, M. K., Wang, N., & Xiao, H. (2024). Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever. Proceedings of the Association for Computational Linguistics (ACL) / EMNLP 2024
- jinaai/jina-reranker-v3: Wang, F., Li, Y., & Xiao, H. (2025). jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking. arXiv preprint arXiv:2509.25085

Rerankers:
- Rank-Biased Centroids (rbc)
  - Bailey, Peter, Alistair Moffat, Falk Scholer, and Paul Thomas. "Retrieval consistency in the presence of query variations." In Proceedings of the 40th international ACM SIGIR conference on research and development in information retrieval, pp. 395-404. 2017.
- RRF
  - Cormack, Gordon V., Charles LA Clarke, and Stefan Buettcher. "Reciprocal rank fusion outperforms condorcet and individual rank learning methods." In Proceedings of the 32nd international ACM SIGIR conference on Research and development in information retrieval, pp. 758-759. 2009.
- CombMNZ
  - Fox, Edward A., and Joseph A. Shaw. "Combination of multiple searches." NIST special publication SP 243 (1994).
- Condorcet
  - Mark Montague and Javed A. Aslam. 2002. Condorcet fusion for improved retrieval. In Proceedings of the eleventh international conference on Information and knowledge management (CIKM '02). Association for Computing Machinery, New York, NY, USA, 538–548. https://doi.org/10.1145/584792.584881
- BordaFuse
  - Javed A. Aslam and Mark Montague. 2001. Models for metasearch. In Proceedings of the 24th annual international ACM SIGIR conference on Research and development in information retrieval (SIGIR '01). Association for Computing Machinery, New York, NY, USA, 276–284. https://doi.org/10.1145/383952.384007

# Material de entrada

A continuación te proporcionaré múltiples extractos generados a 
partir de papers seminales. Cada extracto contiene:

- Una "Lista 1: Contenido para Marco Teórico"
- Una "Lista 2: Contenido para Estado del Arte"
- Opcionalmente, una "Lista 3: Contenido descartable"
- Posibles "Sugerencias de reestructuración"

# Tarea

Realiza una consolidación COMPLETA de ambas secciones (marco teórico 
y estado del arte) a partir de los extractos. Tu respuesta debe 
estructurarse en dos grandes partes (A y B), seguidas de una sección 
de cierre (C).

═══════════════════════════════════════════════════════════════════
PARTE A — CONSOLIDACIÓN DEL MARCO TEÓRICO (capítulo 3)
═══════════════════════════════════════════════════════════════════

## A.1 Esquema consolidado por subsección

Para cada subsección (3.1 a 3.7, con sub-subsecciones), lista todos 
los conceptos extraídos que pertenecen ahí. Agrupa conceptos 
equivalentes en un solo punto. Para cada uno:

- Nombre canónico (no atado a un paper).
- Papers de origen (trazabilidad).
- Nivel de detalle recomendado (definición / desarrollo formal / 
  intuición).
- Variantes o formulaciones distintas si las hay.

## A.2 Redundancias detectadas

Lista conceptos que aparecen en múltiples extractos con nombres o 
formulaciones distintas. Para cada uno:

- Versiones encontradas.
- Formulación recomendada.
- Justificación breve.

## A.3 Huecos detectados

Conceptos prerrequisito ausentes en los extractos pero necesarios 
para que el marco teórico sea auto-contenido. Para cada uno:

- Concepto faltante.
- Subsección donde debería ir.
- Justificación.
- Sugerencia de fuente de referencia.

## A.4 Orden de exposición sugerido

Orden lineal dentro y entre subsecciones, respetando dependencias 
conceptuales. Justifica decisiones no obvias. Señala renombramientos 
o reubicaciones de sub-subsecciones si los recomiendas.

## A.5 Alertas sobre alcance

- Conceptos sobredimensionados.
- Conceptos subdimensionados (especialmente en fusión de rangos y 
  modelos semánticos, que son el núcleo de la tesis).
- Material que parece más propio del estado del arte.
- Material que podría asumirse como conocimiento previo (audiencia: 
  matemáticas aplicadas).

═══════════════════════════════════════════════════════════════════
PARTE B — CONSOLIDACIÓN DEL ESTADO DEL ARTE (capítulo 4)
═══════════════════════════════════════════════════════════════════

## B.1 Esquema consolidado por subsección

Para cada subsección (4.1 a 4.6), organiza todos los aportes. 
Para cada modelo o técnica:

- Nombre y referencia.
- Aporte clave (1-2 líneas).
- Decisiones de diseño relevantes (función de pérdida, datos, 
  arquitectura base, técnicas de eficiencia como LoRA o Matryoshka).
- Resultados numéricos clave (datasets, métricas, scores).
- Limitaciones reconocidas.
- Conexión explícita con el marco teórico (e.g., "aplica la 
  aproximación de bajo rango de 3.5.2").

## B.2 Cronología y linaje

Árbol genealógico o cronología de los modelos y técnicas. Identifica:

- Papers fundacionales vs. extensiones.
- Influencias entre ellos.
- Tendencias del campo.

## B.3 Tabla comparativa maestra

Tabla con columnas:

- Modelo / referencia
- Tipo (léxico / dense / sparse / cross-encoder / late interaction / 
  fusión / reranker)
- Idioma de entrenamiento
- Arquitectura base
- Técnicas de eficiencia (LoRA, Matryoshka, distilación, etc.)
- Esquema de entrenamiento
- Mejor resultado reportado (métrica + dataset)
- Aplicable a español / MessIRve
- Código abierto / propietario

No la abrevies.

## B.4 Redundancias y solapamientos

Casos donde varios extractos discuten el mismo modelo o técnica 
desde ángulos distintos. Recomendación de tratamiento principal 
y referencias cruzadas si aplica.

## B.5 Huecos detectados

Trabajos o líneas que NO aparecen en los extractos pero deberían 
citarse:

- Modelos importantes en español o multilingües.
- Trabajos de fusión de rangos relevantes.
- Benchmarks no considerados.
- Trabajos críticos o de "negative results".

Para cada hueco: autor/año o término de búsqueda sugerido.

## B.6 Narrativa sugerida

Propón orden de exposición y narrativa para el capítulo 4 
(cronológica / por tipo / por familia). Justifica. Indica fusiones 
o divisiones de subsecciones. Señala dónde insertar comparaciones 
explícitas con la propuesta de fusión de rangos de la tesis.

═══════════════════════════════════════════════════════════════════
PARTE C — INTEGRACIÓN ENTRE MARCO TEÓRICO Y ESTADO DEL ARTE
═══════════════════════════════════════════════════════════════════

## C.1 Conceptos en ambos lugares

Identifica conceptos que, según los extractos, aparecen tanto en 
marco teórico como en estado del arte. Para cada uno:

- Recomienda en cuál sección debe quedarse principalmente.
- Justifica con base en el principio rector.

## C.2 Referencias cruzadas sugeridas

Lista las referencias cruzadas explícitas que conviene establecer 
en el texto final (e.g., "el modelo X aplica la técnica formalizada 
en 3.5.2").

## C.3 Inconsistencias o tensiones

Casos donde el marco teórico no provee herramientas que el estado 
del arte requiere para entenderse, o viceversa. Sugiere ajustes.

## C.4 Resumen ejecutivo de decisiones

Cierra con una lista numerada y concisa (10-15 puntos) de las 
decisiones más importantes que debo tomar a partir de esta 
consolidación, ordenadas por prioridad.

═══════════════════════════════════════════════════════════════════

# Formato de salida

Markdown estructurado, con tablas cuando aporten claridad. Sé 
exhaustivo en los entregables A.1, B.1, B.3 (no abrevies). 
Sé conciso en los entregables de orden, alertas y narrativa. 
Prefiere listas anidadas a párrafos largos. Usa los encabezados 
exactos (A.1, A.2, etc.) que te indico para facilitar mi navegación.

# Antes de empezar

Si detectas que los extractos están incompletos, mal clasificados 
o presentan contradicciones serias, señálalo al inicio de tu 
respuesta antes de proceder con la consolidación.

# Material a procesar

A continuación pego los extractos completos. Procésalos todos 
antes de emitir tu respuesta:

---

