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
  - microsoft/harrier-oss-v1-0.6b
- Dispersos:
  - naver/splade-v3
- Interacción tardía:
  - jinaai/jina-colbert-v2
- Cross-encoders:
  - BAAI/bge-reranker-v2-m3
  - jinaai/jina-reranker-v3

### Fuentes

- BM25:
  - Robertson, S. E., & Spärck Jones, K. (1976). Relevance weighting of search terms. Journal of the American Society for Information Science.
  - Robertson, S. E., & Walker, S. (1994). Some simple effective approximations to the 2-Poisson model for probabilistic weighted retrieval. Proceedings of the 17th Annual International ACM SIGIR Conference on Research and Development in Information Retrieval.
  - Spärck Jones, K., Walker, S., & Robertson, S. E. (2000). A probabilistic model of information retrieval: development and comparative experiments: Part 1 & Part 2. Information Processing & Management.
  - Robertson, S., & Zaragoza, H. (2009). The Probabilistic Relevance Framework: BM25 and Beyond. Foundations and Trends in Information Retrieval.
- intfloat/multilingual-e5-large-instruct
  - Wang, L., Yang, N., Huang, X., Yang, L., Majumder, R., & Wei, F. (2024). Multilingual E5 Text Embeddings: A Technical Report. arXiv preprint arXiv:2402.05672.
- BAAI/bge-m3
  - Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216.
- Qwen/Qwen3-Embedding-0.6B
  - Zhang, Y., et al. (2025). Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models. arXiv preprint arXiv:2506.05176.
- jinaai/jina-embeddings-v5-text-small
  - Akram, M. K., Sturua, S., Havriushenko, N., Herreros, Q., Günther, M., Werk, M., & Xiao, H. (2026). jina-embeddings-v5-text: Task-Targeted Embedding Distillation. arXiv preprint arXiv:2602.15547.
- microsoft/harrier-oss-v1-0.6b
  - Huang, X., Wang, L., Wei, F., Lu, J., Risvik, K., & Li, J. (2026). Microsoft Open Sources Industry-Leading Embedding Model. Technical Announcement, Microsoft Research / Foundry Labs.
- naver/splade-v3
  - Formal, T., Lassance, C., Piwowarski, B., & Clinchant, S. (2021). SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking. Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval.
  - Lassance, C., Déjean, H., Formal, T., & Clinchant, S. (2024). SPLADE-v3: New baselines for SPLADE. arXiv preprint arXiv:2403.06789.
- jinaai/jina-colbert-v2
  - Khattab, O., & Zaharia, M. (2020). ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval.
  - Jha, R., Wang, B., Günther, M., Mastrapas, G., Sturua, S., Mohr, I., Koukounas, A., Akram, M. K., Wang, N., & Xiao, H. (2024). Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever. Proceedings of the Association for Computational Linguistics (ACL) / EMNLP 2024.
- BAAI/bge-reranker-v2-m3
  - Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv preprint arXiv:2402.03216 (Presenta la arquitectura técnica del ecosistema unificado BGE M3 / Reranker-v2).
  - Li, C., Liu, Z., Xiao, S., & Shao, Y. (2023). Making Large Language Models A Better Foundation For Dense Retrieval. arXiv preprint arXiv:2312.15503 (Describe el proceso de post-adaptación LLaRA que optimiza el preentrenamiento de codificadores base para tareas de alineación en el ecosistema BGE).
- jinaai/jina-reranker-v3
  - Wang, F., Li, Y., & Xiao, H. (2025). jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking. arXiv preprint arXiv:2509.25085.

### Elementos teóricos

- Léxicos
  - TF-IDF
  - 2-Poisson model
  - Probabilistic Relevance Framework
- *-encoders:
  - InfoNCE for contrastive learning
  - Kullback-Leibler (KL) divergence
  - pérdida de entropía cruzada binaria (BCE)

### Elementos arquitectónicos y modelos

- dual-encoders
- sparse-encoders
- cross-encoder
- late interaction
- XLM-RoBERTa (e5, bge-m3)
- MCLS (Multiple CLS) (bge-m3)
- incrustación posicional rotatoria (RoPE)
- Aprendizaje de Representación Matryoshka (MRL) (Qwen)
- adaptadores de baja clasificación (LoRA) (jina-embeddings-v5)

## Rerankers

- Rerankers:
  - Rank-Biased Centroids (rbc)
  - RRF
  - CombMNZ
  - Condorcet-fuse
  - Borda-fuse

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

2. Marco teórico
   2.1 Fundamentos de recuperación de información
       (definición formal del problema, espacio de documentos, relevancia)
   2.2 Modelos léxicos: fundamentos
       (TF-IDF, BM25 como caso del Probabilistic Relevance Framework)
   2.3 Representaciones vectoriales del lenguaje
       2.3.1 Hipótesis distribucional y embeddings estáticos
       2.3.2 Arquitectura Transformer y atención
       2.3.3 Embeddings contextuales
   2.4 Paradigmas de modelos neuronales para IR
       (definiciones formales de dual-encoder, sparse-encoder, 
       cross-encoder, late interaction — sin entrar en modelos concretos)
   2.5 Aprendizaje de representaciones
       2.5.1 Funciones de pérdida contrastivas
       2.5.2 Fine-tuning y aproximaciones de bajo rango
       2.5.3 Representaciones jerárquicas y truncables
   2.6 Fundamentos matemáticos de la fusión de rangos
       (definición de lista ordenada, agregación de preferencias, 
       Condorcet, Borda como objetos formales)
   2.7 Evaluación en recuperación de información
       (definiciones de nDCG, MAP, MRR, Recall, Precision)

3. Estado del arte
   3.1 Modelos léxicos modernos y variantes de BM25
   3.2 Modelos semánticos representativos
       (E5, BGE, Jina, mDPR, SPLADE, ColBERT, etc., 
       discutiendo cómo cada uno aplica las técnicas del cap. 3:
       LoRA, Matryoshka, esquemas de entrenamiento específicos)
   3.3 Modelos de reranking neuronal
   3.4 Estrategias de fusión y reranking en la literatura
   3.5 Benchmarks de IR
       3.5.1 Multilingües
       3.5.2 En español (MessIRve y antecedentes)
   3.6 Particularidades del español en IR
