# Notas

## Pendientes

- Tesis
  - Revisar cada modelo representativo para determinar sus características
    - Determinar un conjunto mínimo de elementos teóricos que agregar
  - Estudiar distribución del número de documentos relevantes por query para explicar métricas
  - Revisar resultados y métodos:
    - Artículos utilizando MessIRve
    - MTEB y La Leaderboard
    - Comparar los resultados obtenidos con resultados en otras lenguas para todos los modelos involucrados

## Modelos

- Léxicos
  - BM25
- Dual-encoders:
  - intfloat/multilingual-e5-large-instruct
  - BAAI/bge-m3
  - Qwen/Qwen3-Embedding-0.6B
  - jinaai/jina-embeddings-v5-text-small
- Dispersos:
  - naver/splade-v3
- Interacción tardía:
  - jinaai/jina-colbert-v2
- Cross-encoders:
  - BAAI/bge-reranker-v2-m3
  - jinaai/jina-reranker-v3

### Fuentes

- BM25:
  - S. E. Robertson, C. J. van Rijsbergen, and M. F. Porter, “Probabilistic models of indexing and searching,” in Information Retrieval Research (Proceedings of Research and Development in Information Retrieval, Cambridge, 1980), (R. N. Oddy, S. E. Robertson, C. J. van Rijsbergen, and P. W. Williams, eds.), pp. 35–56, London: Butterworths, 1981
  - Robertson, S. E., & Walker, S. (1994). Some simple effective approximations to the 2-Poisson model for probabilistic weighted retrieval. Proceedings of the 17th Annual International ACM SIGIR Conference on Research and Development in Information Retrieval.
  **- Robertson, S., & Zaragoza, H. (2009). The Probabilistic Relevance Framework: BM25 and Beyond. Foundations and Trends in Information Retrieval.**
- intfloat/multilingual-e5-large-instruct
  - **Wang, L., Yang, N., Huang, X., Yang, L., Majumder, R., & Wei, F. (2024). Multilingual E5 Text Embeddings: A Technical Report. arXiv preprint arXiv:2402.05672.**
- BAAI/bge-m3
  - **Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216.**
- Qwen/Qwen3-Embedding-0.6B
  - **Zhang, Y., et al. (2025). Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models. arXiv preprint arXiv:2506.05176.**
- jinaai/jina-embeddings-v5-text-small
  - **Akram, M. K., Sturua, S., Havriushenko, N., Herreros, Q., Günther, M., Werk, M., & Xiao, H. (2026). jina-embeddings-v5-text: Task-Targeted Embedding Distillation. arXiv preprint arXiv:2602.15547.**
- naver/splade-v3
  - **Formal, T., Lassance, C., Piwowarski, B., & Clinchant, S. (2021). SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking. Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval.**
  - **Lassance, C., Déjean, H., Formal, T., & Clinchant, S. (2024). SPLADE-v3: New baselines for SPLADE. arXiv preprint arXiv:2403.06789.**
- jinaai/jina-colbert-v2
  - **Khattab, O., & Zaharia, M. (2020). ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval.**
  - **Jha, R., Wang, B., Günther, M., Mastrapas, G., Sturua, S., Mohr, I., Koukounas, A., Akram, M. K., Wang, N., & Xiao, H. (2024). Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever. Proceedings of the Association for Computational Linguistics (ACL) / EMNLP 2024.**
- BAAI/bge-reranker-v2-m3
  - Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216 (Presenta la arquitectura técnica del ecosistema unificado BGE M3 / Reranker-v2).
  - Li, C., Liu, Z., Xiao, S., & Shao, Y. (2023). Making Large Language Models A Better Foundation For Dense Retrieval. arXiv preprint arXiv:2312.15503 (Describe el proceso de post-adaptación LLaRA que optimiza el preentrenamiento de codificadores base para tareas de alineación en el ecosistema BGE).
- jinaai/jina-reranker-v3
  - **Wang, F., Li, Y., & Xiao, H. (2025). jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking. arXiv preprint arXiv:2509.25085.**

## Rerankers

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

## Otras

- Sebastian Bruch, Siyu Gai, and Amir Ingber. 2023. An Analysis of Fusion Functions for Hybrid Retrieval. ACM Trans. Inf. Syst. 42, 1, Article 20 (January 2024), 35 pages. https://doi.org/10.1145/3596512

## Métricas

| Métrica                            | Propósito                             | Justificación en benchmarks           |
| :--------------------------------- | :------------------------------------ | :------------------------------------ |
| nDCG@10                            | Calidad del ranking (primaria)        | BEIR, MTEB, MIRACL, MessIRve, TREC DL |
| Recall@100                         | Cobertura de la etapa de recuperación | MIRACL, MessIRve, Mr. TyDi            |
| MRR@10                             | Utilidad del primer resultado         | MS MARCO, Mr. TyDi                    |
| MAP                                | Calidad del reranking                 | MTEB (tarea de reranking)             |
| P@k para k∈{10,50}k \in \{10, 50\} | Análisis de decaimiento de precisión  | TREC DL, TREC-COVID                   |

## Secciones

### Marco teórico

El marco teórico es atemporal y conceptual. Su función es dotar al lector de las herramientas formales necesarias para entender la tesis. Responde a la pregunta: "¿Qué necesita saber el lector para poder seguir mi argumento?"

Características clave:

- Definiciones, formalismos, teoremas, demostraciones (cuando aplique).
- Presenta conceptos en su forma canónica, no como una sucesión histórica de aportes.
- No discute quién hizo qué, sino qué es cada cosa.
- Idealmente, debería poder leerse como un capítulo de un libro de texto: si quitas las citas, el texto sigue teniendo coherencia interna.
- Tiende a ser estable: el marco teórico de hoy se parecerá mucho al de dentro de 10 años (BM25, TF-IDF, definiciones de espacios vectoriales, atención, etc.).

### Estado del arte

El estado del arte es temporal y comparativo. Su función es posicionar tu trabajo dentro de la conversación científica vigente. Responde a la pregunta: "¿Qué se ha hecho, qué falta por hacer, y dónde encaja mi contribución?"

Características clave:

- Discute trabajos específicos, sus resultados, sus limitaciones.
- Es cronológico o temático, pero siempre con la mirada puesta en la frontera del conocimiento.
- Justifica las decisiones de diseño de tu propia metodología ("se eligió X porque Y et al. mostraron que...").
- Incluye comparaciones cuantitativas ("el modelo X obtiene nDCG@10 de 0.45 en MIRACL").
- Es volátil: en 5 años, esta sección estará obsoleta.

### Índice

3. Marco Teórico
   1. Fundamentos de recuperación de información
      1. Definiciones canónicas (consulta, documento, corpus, ranking)
      2. Principio de Ordenación por Probabilidad (PRP)
      3. Equivalencia de rango bajo transformaciones monótonas
   2. Modelos léxicos: fundamentos
      1. Modelo de espacio vectorial y TF-IDF
      2. Modelo de Independencia Binaria (BIM) y peso RSJ
      3. Restricción al espacio de la consulta
      4. Modelo de Elitismo (2-Poisson) y saturación
      5. Normalización por longitud
      6. Formulación canónica de BM25
      7. Pseudo-Relevance Feedback (conceptual)
   3. Representaciones vectoriales del lenguaje
      1. Hipótesis distribucional y embeddings estáticos
      2. Arquitectura Transformer (encoder bidireccional vs decoder causal)
      3. Embeddings contextuales y estrategias de pooling (mean/CLS vs EOS/last-token)
      4. Embeddings guiados por instrucciones
   4. Paradigmas de modelos neuronales para IR
      1. Codificadores duales densos
      2. Codificadores dispersos neuronales
      3. Cross-encoders
      4. Modelos de interacción tardía (operador MaxSim)
      5. Funciones de puntuación: propiedades matemáticas y motivación de la fusión [SUBSECCIÓN PUENTE CLAVE]
   5. Aprendizaje de representaciones
      1. Funciones de pérdida contrastivas (InfoNCE canónica + variantes)
      2. Fine-tuning y aproximaciones de bajo rango (LoRA + hard negative mining)
      3. Representaciones jerárquicas y truncables (MRL)
      4. Destilación de conocimiento en IR [NUEVA] (KL, MarginMSE, multi-teacher, self-distillation)
   6. Fundamentos matemáticos de la fusión de rangos
      1. Formalización: rankings, score-fusion vs rank-fusion, analogía con teoría de elección social
      2. Métodos basados en puntuaciones (CombSUM, CombMNZ, normalización min-max/z-score)
      3. Métodos posicionales basados en rangos (Borda, Borda ponderado, Borda como modelo de usuario uniforme)
      4. Métodos mayoritarios (Condorcet, grafos semicompletos, componentes fuertemente conexas)
      5. Métodos probabilísticos y modelos de usuario (Bayes-fuse, modelo de profundidad estocástica, RBC)
      6. Fusión recíproca amortiguada (RRF y análisis de k)
   7. Evaluación en recuperación de información
      1. Métricas estándar (P@k, R@k, MAP, MRR, nDCG)
      2. Variantes bajo juicios incompletos (nDCG*)
      3. Similitud entre listas de ranking (Kendall τ vs RBO)
      4. Búsqueda eficiente: ANN, HNSW, IVF, búsqueda multi-vector
      5. Pruebas de significancia estadística

4. Estado del arte
   1. Modelos léxicos modernos y variantes de BM25
      1. Okapi BM25 y BM25F
      2. PRF y expansión de consulta
      3. Variantes modernas (BM25+, BM25L, BM25-Adaptive)
      4. Infraestructura (Anserini, Pyserini)
   2. Modelos semánticos representativos
      1. Dense bi-encoders multilingües (mDPR → mContriever → mE5 → mE5-instruct → Qwen3-Embedding → jina-v5)
      2. Modelos multifuncionales (BGE-M3) [con párrafo dedicado a fusión interna como anticipación de §4.4]
      3. Sparse encoders (SparTerm → SPLADE v1 → SPLADE-v3)
      4. Late interaction (ColBERT v1 → ColBERTv2 → Jina-ColBERT-v2)
      5. [Cierre narrativo] Convergencia hacia modelos unificados: ¿queda espacio para la fusión externa?
   3. Modelos de reranking neuronal
      1. Cross-encoders pointwise/pairwise (monoBERT, monoT5, RankT5, bge-reranker-v2-m3)
      2. Listwise rerankers con LLMs (RankGPT, RankZephyr, jina-reranker-v3 LBNL)
      3. Cascadas y trade-offs efectividad/eficiencia
   4. Estrategias de fusión y reranking en la literatura
      1. Fusión score-based clásica (CombSUM, CombMNZ; Fox & Shaw 1994)
      2. Fusión rank-based posicional (Borda-fuse, Bayes-fuse; Aslam & Montague 2001)
      3. Fusión rank-based mayoritaria (Condorcet-fuse; Montague & Aslam 2002)
      4. Fusión rank-based score-agnostic (RRF; Cormack 2009)
      5. Fusión rank-based con modelo de usuario (RBC; Bailey et al. 2017)
      6. Fusión léxico-semántica en la era neuronal [SECCIÓN CRÍTICA NUEVA] (Karpukhin 2020; Luan et al. 2021; Bruch et al. 2023; Lin et al. 2021; análisis crítico de cuándo la fusión aporta y cuándo no)
      7. Fusión interna del modelo vs fusión externa de listas (BGE-M3 como caso de estudio)
   5. Benchmarks de IR
      1. Históricos (TREC, LETOR)
      2. MS MARCO y derivados
      3. Multilingües (BEIR, MIRACL, Mr.TyDi, MTEB Multilingual)
      4. Robustez y consistencia (UQV100)
      5. MessIRve
   6. Particularidades del español en IR
      1. Tipología morfosintáctica y efectos sobre BM25
      2. Backbones específicos (BETO, RoBERTa-bne, MARIA)
      3. Resultados desglosados de modelos del §4.2 en español
      4. Variedades dialectales y MessIRve (rioplatense)
      5. Translationese: mMARCO-es vs MIRACL-es vs nativo
   7. [OPCIONAL] Posicionamiento de esta tesis: Síntesis de los gaps identificados que la tesis aborda


[Apéndice A] Preliminares matemáticos
Entropía cruzada, KL, SVD/Eckart-Young, distribución geométrica,
tokenización subword