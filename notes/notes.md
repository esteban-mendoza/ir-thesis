# Notas

## Pendientes

- Tesis
  - Explicar BM25 y Splade en la misma sección de fundamentos para modelos léxicos
  - Mover tokenizers antes de arquitectura transformer
  - Eliminar sección 3.3.5: Embeddings guiados por instrucciones
  - Eliminar 3.4.6 Funciones de puntuación: propiedades y motivación de la fusión
  - Considerar remover 3.5.2 Fine-tuning eficiente: aproximaciones de bajo rango (LoRA)
  - Investigar sobre 3.8.3 Similitud entre listas de ranking (Kendall τ vs RBO)
  - Eliminar 3.8.4 Búsqueda eficiente: ANN, HNSW, IVF, búsqueda multi-vector 
  - Revisar cada modelo representativo para determinar sus características
    - Determinar un conjunto mínimo de elementos teóricos que agregar
  - Estudiar distribución del número de documentos relevantes por query para explicar métricas
  - Revisar resultados y métodos:
    - Artículos utilizando MessIRve
    - MTEB y La Leaderboard
    - Comparar los resultados obtenidos con resultados en otras lenguas para todos los modelos involucrados
  - Agregar nota sobre por qué nos limitamos a modelos 0.6B
  - Probar gemini-embedding-001?

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
