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
  - multilingual-e5-large-instruct
  - BGE-M3
  - Qwen3-Embedding-8B
  - jina-embeddings-v5-text-small
- Dispersos:
  - SPLADE-v3
- Interacción tardía:
  - Jina-ColBERT-v2
- Cross-encoders:
  - bge-reranker-v2-m3
  - jina-reranker-v3

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
