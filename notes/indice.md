# Índice de la tesis

> **Índice autoritativo.** Este archivo define la estructura de la tesis.
> `notes.md` queda como notas personales de referencia (no autoritativo).
>
> Estado del refinamiento (*top-down*): estructura de capítulos **fijada**.
> Los capítulos 2 (Marco teórico) y 3 (Estado del arte) tienen detalle a nivel
> de secciones y subsecciones (pendiente de revisión). Los capítulos 1, 4, 5 y 6
> tienen por ahora solo el nivel de secciones, tomado del protocolo y los
> esqueletos; se refinarán en las siguientes iteraciones.

## Estructura de capítulos

1. Introducción
2. Marco teórico
3. Estado del arte
4. Metodología
5. Resultados experimentales
6. Conclusiones y trabajo futuro

Sin apéndices por ahora. Se podrán añadir en el futuro y se mantendrán al mínimo.

---

## 1. Introducción

1. Motivación
2. Objetivos
3. Hipótesis
4. Preguntas de investigación
5. Contribución
6. Organización de la tesis

## 2. Marco teórico

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

## 3. Estado del arte

1. Modelos léxicos modernos y variantes de BM25
   1. Okapi BM25 y BM25F
   2. PRF y expansión de consulta
   3. Variantes modernas (BM25+, BM25L, BM25-Adaptive)
   4. Infraestructura (Anserini, Pyserini)
2. Modelos semánticos representativos
   1. Dense bi-encoders multilingües (mDPR → mContriever → mE5 → mE5-instruct → Qwen3-Embedding → jina-v5)
   2. Modelos multifuncionales (BGE-M3) [con párrafo dedicado a fusión interna como anticipación de §3.4]
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
   3. Resultados desglosados de modelos del §3.2 en español
   4. Variedades dialectales y MessIRve (rioplatense)
   5. Translationese: mMARCO-es vs MIRACL-es vs nativo
7. [OPCIONAL] Posicionamiento de esta tesis: síntesis de los gaps identificados que la tesis aborda

## 4. Metodología

1. El conjunto de datos MessIRve
2. Arquitectura del sistema de recuperación
3. Modelos de recuperación base
4. Algoritmos de fusión
5. Diseño experimental
   1. Experimento 1: fusión vs. modelos individuales
   2. Experimento 2: comparación de algoritmos de fusión
   3. Experimento 3: algoritmos de fusión vs. reordenamiento neuronal
   4. Experimento 4: modelos abiertos vs. propietarios

## 5. Resultados experimentales

_(Por definir; a refinar en la siguiente iteración. Estructura tentativa: un bloque de resultados por experimento, más un análisis de complementariedad léxico-semántica.)_

## 6. Conclusiones y trabajo futuro

1. Conclusiones finales
2. Contribuciones del trabajo
3. Trabajo futuro
