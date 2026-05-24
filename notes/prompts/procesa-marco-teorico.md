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
una "Lista 1: Contenido para Marco Teórico" con conceptos, 
formalismos, ecuaciones e ideas matemáticas clasificadas por 
subsección (3.1 a 3.7).

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

# Tarea

Tu trabajo es consolidar todos estos extractos en un esquema 
coherente, exhaustivo y sin redundancias para el Marco Teórico 
(capítulo 3 de la tesis). Debes producir cinco entregables:

## Entregable 1: Esquema consolidado por subsección

Para cada subsección del marco teórico (3.1 a 3.7, con sus 
sub-subsecciones), lista todos los conceptos extraídos de los 
papers que pertenecen ahí. Agrupa conceptos equivalentes o 
redundantes en un solo punto. Para cada punto:

- Nombre del concepto en su forma canónica (no atado al paper).
- Papers de origen (para trazabilidad).
- Nivel de detalle recomendado (definición / desarrollo formal / 
  intuición).
- Si hay variantes o formulaciones distintas entre papers, 
  indícalas.

## Entregable 2: Detección de redundancias

Lista todas las redundancias detectadas: conceptos que aparecen 
en múltiples extractos con nombres distintos, definiciones que 
se solapan, formalismos equivalentes presentados de forma 
diferente. Para cada redundancia:

- Identifica las versiones encontradas.
- Recomienda cuál formulación adoptar (la más general o la más 
  pedagógica).
- Justifica brevemente.

## Entregable 3: Detección de huecos

Identifica conceptos PRERREQUISITO que NO aparecen en ningún 
extracto pero que son necesarios para que el marco teórico sea 
auto-contenido. Por ejemplo: si los extractos hablan de softmax 
contrastivo pero ninguno define entropía cruzada, eso es un hueco. 
Para cada hueco:

- Concepto faltante.
- Subsección donde debería ir.
- Justificación de por qué es necesario.
- Sugerencia de fuente de referencia (libro de texto, paper 
  fundacional) que yo debería consultar.

## Entregable 4: Orden de exposición sugerido

Propón un orden lineal de exposición dentro de cada subsección 
y entre subsecciones, respetando dependencias conceptuales 
(no introducir A si depende de B aún no presentado). Justifica 
brevemente las decisiones no obvias. Si detectas que alguna 
sub-subsección debería moverse o renombrarse para mejorar el 
flujo, dilo explícitamente.

## Entregable 5: Alertas sobre alcance

Indica si detectas:

- Conceptos que están sobredimensionados (ocupan demasiado 
  espacio para su relevancia en mi tesis).
- Conceptos que están subdimensionados (merecen más profundidad 
  dada la centralidad de la fusión de rangos y los modelos 
  semánticos en mi tesis).
- Material que parece más propio del estado del arte y debería 
  migrarse al capítulo 4.
- Material que aparece en mi marco teórico pero que, dada la 
  audiencia (tesis de matemáticas aplicadas), podría asumirse 
  como conocimiento previo (e.g., álgebra lineal básica).

# Formato de salida

Markdown estructurado, con tablas cuando ayuden a la claridad. 
Sé exhaustivo en los entregables 1-3 y conciso en 4-5. Prefiero 
listas anidadas a párrafos largos.

# Material a procesar

A continuación pego los extractos. Procésalos todos antes de 
emitir tu respuesta:

---

