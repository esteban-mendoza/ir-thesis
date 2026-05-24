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

# Estructura objetivo de la tesis (relevante para esta tarea)

La tesis tiene dos grandes secciones expositivas:

## 3. Marco teórico — atemporal, formal, conceptual
Su función es dotar al lector de las herramientas matemáticas y 
conceptuales necesarias. Presenta conceptos en su forma canónica, 
sin discutir trabajos específicos. Subsecciones:

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
Posiciona la tesis en la conversación científica vigente. 
Subsecciones:

   4.1 Modelos léxicos modernos y variantes de BM25
   4.2 Modelos semánticos representativos
       (modelos concretos: E5, BGE, Jina, mDPR, SPLADE, ColBERT, etc.,
        explicando cómo aplican las técnicas del cap. 3: LoRA, 
        Matryoshka, esquemas de entrenamiento específicos)
   4.3 Modelos de reranking neuronal
   4.4 Estrategias de fusión y reranking en la literatura
   4.5 Benchmarks de IR (multilingües y en español)
   4.6 Particularidades del español en IR

# Principio rector

- Marco teórico: el "qué es" en forma canónica y atemporal. 
  Si una idea se puede explicar sin citar a quién la propuso, 
  va aquí.
- Estado del arte: el "qué hizo cada quién" y "cómo se compara". 
  Si una idea es indisociable de un trabajo específico o requiere 
  comparación con otros, va aquí.

Ejemplo: la aproximación matricial de bajo rango va en marco teórico 
(3.5.2); LoRA como técnica concreta y sus resultados empíricos van 
en estado del arte (4.2).

# Material de entrada

A continuación te proporcionaré múltiples extractos generados 
previamente a partir de papers seminales. Cada extracto contiene 
una "Lista 2: Contenido para Estado del Arte" con aportes 
específicos, decisiones de diseño, resultados experimentales 
y comparaciones, clasificadas por subsección (4.1 a 4.6).

Los papers procesados son:
- BM25: Robertson, S., & Zaragoza, H. (2009). The Probabilistic Relevance Framework: BM25 and Beyond. Foundations and Trends in Information Retrieval.
- intfloat/multilingual-e5-large-instruct: Wang, L., Yang, N., Huang, X., Yang, L., Majumder, R., & Wei, F. (2024). Multilingual E5 Text Embeddings: A Technical Report. arXiv preprint arXiv:2402.05672
- BAAI/bge-m3 / BAAI/bge-reranker-v2-m3: Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216
- Qwen/Qwen3-Embedding-0.6B: Zhang, Y., et al. (2025). Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models. arXiv preprint arXiv:2506.05176
- jinaai/jina-embeddings-v5-text-small: Akram, M. K., Sturua, S., Havriushenko, N., Herreros, Q., Günther, M., Werk, M., & Xiao, H. (2026). jina-embeddings-v5-text: Task-Targeted Embedding Distillation. arXiv preprint arXiv:2602.15547
- naver/splade-v3: 
  - Formal, T., Lassance, C., Piwowarski, B., & Clinchant, S. (2021). SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking. Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval
  - Lassance, C., Déjean, H., Formal, T., & Clinchant, S. (2024). SPLADE-v3: New baselines for SPLADE. arXiv preprint arXiv:2403.06789
- jinaai/jina-colbert-v2
  - Khattab, O., & Zaharia, M. (2020). ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval
  - Jha, R., Wang, B., Günther, M., Mastrapas, G., Sturua, S., Mohr, I., Koukounas, A., Akram, M. K., Wang, N., & Xiao, H. (2024). Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever. Proceedings of the Association for Computational Linguistics (ACL) / EMNLP 2024
- jinaai/jina-reranker-v3: Wang, F., Li, Y., & Xiao, H. (2025). jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking. arXiv preprint arXiv:2509.25085

# Tarea

Tu trabajo es consolidar todos estos extractos en un esquema 
coherente y comparativo para el Estado del Arte (capítulo 4 de 
la tesis). Debes producir seis entregables:

## Entregable 1: Esquema consolidado por subsección

Para cada subsección del estado del arte (4.1 a 4.6), organiza 
todos los aportes extraídos. Para cada modelo o técnica:

- Nombre y referencia.
- Aporte clave (1-2 líneas).
- Decisiones de diseño relevantes (función de pérdida, datos 
  de entrenamiento, arquitectura base, técnicas de eficiencia 
  como LoRA o Matryoshka, etc.).
- Resultados numéricos clave (datasets, métricas, scores) 
  que valga la pena citar en la tesis.
- Limitaciones reconocidas.
- Conexión explícita con el marco teórico (e.g., "aplica la 
  aproximación de bajo rango de 3.5.2").

## Entregable 2: Cronología y linaje

Construye una cronología o árbol genealógico de los modelos y 
técnicas. Identifica:

- Qué papers son fundacionales y cuáles son extensiones.
- Qué influencias hay entre ellos (paper X cita y mejora paper Y).
- Tendencias detectables en el campo (e.g., evolución de modelos 
  densos hacia variantes esparsas, adopción creciente de fine-tuning 
  contrastivo, etc.).

Esto me ayudará a redactar narrativamente el estado del arte.

## Entregable 3: Tabla comparativa maestra

Genera una tabla comparativa que resuma todos los modelos relevantes 
para mi tesis con columnas como:

- Modelo / referencia
- Tipo (léxico / dense / sparse / cross-encoder / late interaction / 
  fusión / reranker)
- Idioma de entrenamiento (monolingüe inglés / multilingüe / etc.)
- Arquitectura base
- Técnicas de eficiencia (LoRA, Matryoshka, distilación, etc.)
- Esquema de entrenamiento (contrastive, supervised, etc.)
- Mejor resultado reportado (métrica + dataset)
- Disponible en español / aplicable a MessIRve
- Código abierto / propietario

Esta tabla será el insumo para una tabla similar en mi tesis.

## Entregable 4: Detección de redundancias y solapamientos

Lista casos donde varios extractos discuten el mismo modelo o 
técnica desde ángulos distintos. Recomienda cuál tratamiento 
adoptar y dónde ubicarlo principalmente (con referencias cruzadas 
si es necesario).

## Entregable 5: Detección de huecos

Identifica trabajos o líneas de investigación que NO aparecen en 
los extractos pero que mi tesis debería citar para tener un estado 
del arte completo. Por ejemplo:

- Modelos importantes en español o multilingües no procesados.
- Trabajos de fusión de rangos relevantes ausentes.
- Benchmarks que no he considerado.
- Trabajos críticos o "negative results" que matizan los resultados 
  optimistas reportados.

Para cada hueco, sugiere autor/año o término de búsqueda.

## Entregable 6: Narrativa sugerida

Propón un orden de exposición y una narrativa coherente para el 
capítulo 4. ¿Conviene ir por orden cronológico, por tipo de modelo, 
por familia de técnica? Justifica. Indica qué subsecciones podrían 
fusionarse o dividirse para mejorar el flujo. Identifica los puntos 
donde, narrativamente, conviene insertar comparaciones explícitas 
con mi propuesta de fusión de rangos.

# Formato de salida

Markdown estructurado. La tabla del entregable 3 puede ser extensa: 
no la abrevies. Sé conciso en los demás entregables, pero exhaustivo 
en cobertura.

# Material a procesar

A continuación pego los extractos. Procésalos todos antes de 
emitir tu respuesta:

---

[Pega aquí la "Lista 2" de cada chat anterior, separadas 
claramente con el nombre del paper como encabezado, e.g.:

## Lista 2 — Vaswani et al. 2017 (Transformer)
[contenido]

## Lista 2 — Robertson & Zaragoza 2009 (BM25)
[contenido]

...]