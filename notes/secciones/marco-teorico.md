# Consolidación del Marco Teórico — Tesis sobre Fusión de Rangos en MessIRve

A continuación entrego los cinco entregables solicitados, integrando los ocho extractos procesados.

---

## Entregable 1: Esquema consolidado por subsección

### 3.1 Fundamentos de recuperación de información

| # | Concepto (forma canónica) | Papers de origen | Nivel | Variantes / notas |
|---|---|---|---|---|
| 3.1.1 | **Probability Ranking Principle (PRP)** — el orden óptimo de salida es monótonamente decreciente en $P(\text{rel}\mid d,q)$ | BM25 (Robertson & Zaragoza) | Desarrollo formal completo | Discutir supuestos sobre funciones de utilidad/pérdida y limitaciones |
| 3.1.2 | **Equivalencia de rango bajo transformaciones monótonas** (paso a log-odds, inversión bayesiana) | BM25 | Desarrollo formal | Base para derivar funciones de scoring lineales |
| 3.1.3 | **Arquitectura general de un sistema de IR**: indexación, recuperación, ordenamiento (prerrequisito implícito en todos) | Todos | Definición / intuición | Necesario como marco previo (ver Entregable 3) |

### 3.2 Modelos léxicos: fundamentos

| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.2.1 | **Modelo de espacio vectorial y heurística TF-IDF** | BM25 (implícito), todos lo asumen | Desarrollo formal | Prerrequisito (ver Entregable 3) |
| 3.2.2 | **Independencia condicional de términos (Naive Bayes)** y *linked dependence* de Cooper | BM25 | Desarrollo formal | |
| 3.2.3 | **Restricción al espacio de la consulta** (términos fuera de $q$ tienen ratio $=1$) | BM25 | Desarrollo formal | Conexión natural con representaciones dispersas |
| 3.2.4 | **Modelo de Independencia Binaria (BIM) y peso Robertson-Spärck Jones (RSJ)** | BM25 | Desarrollo formal | **Nuevo** (sugerido por extracto BM25) — puente formal entre TF-IDF y BM25 |
| 3.2.5 | **Modelo de Elitismo (2-Poisson)** como variable latente | BM25 | Desarrollo formal | Justifica curva de saturación |
| 3.2.6 | **Saturación no lineal de TF**: $S(tf)=\frac{tf}{k_1+tf}$ | BM25 | Desarrollo formal | |
| 3.2.7 | **Normalización suave por longitud**: $B = (1-b) + b\cdot dl/\text{avgdl}$ (verbosidad vs. alcance) | BM25 | Desarrollo formal | |
| 3.2.8 | **Pseudo-Relevance Feedback (PRF) — formulación teórica** | BM25 | Definición / intuición | El uso histórico va al cap. 4; aquí solo el formalismo |

### 3.3 Representaciones vectoriales del lenguaje

#### 3.3.1 Hipótesis distribucional y embeddings estáticos
- **Hipótesis distribucional** (prerrequisito; ver hueco) — *todos los papers la asumen*
- **Embeddings estáticos** (Word2Vec, GloVe — prerrequisito; ver hueco)

#### 3.3.2 Arquitectura Transformer y atención
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.3.2.a | Arquitectura Transformer (atención multi-cabeza, FFN, residuales) | Todos lo asumen; ColBERT, mE5, BGE-M3, Qwen3, Jina lo usan | Desarrollo formal | Prerrequisito a desarrollar |
| 3.3.2.b | **Atención causal vs. bidireccional** (encoder-only vs. decoder-only) | jina-reranker-v3, Qwen3 | Desarrollo formal | Crucial para distinguir BERT-like de LLM-based |
| 3.3.2.c | **Embeddings posicionales rotatorios (RoPE)** y extensión de contexto por interpolación de $\theta$ | Jina-ColBERT-v2, jina-v5, Qwen3 | Definición / intuición | |
| 3.3.2.d | Equivalencia entre coseno y producto punto bajo normalización $L_2$ | ColBERT (explícito); todos | Definición / propiedad algebraica | |

#### 3.3.3 Embeddings contextuales
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.3.3.a | Embeddings contextuales (estados ocultos por token) | Todos | Desarrollo formal | |
| 3.3.3.b | **Estrategias de pooling**: CLS, mean pooling, last-token (EOS) pooling | mE5, Qwen3, jina-v5 | Desarrollo formal | Diferencia clave entre encoder y decoder backbones |
| 3.3.3.c | **Embeddings condicionados por instrucciones** (prefijos de tarea, plantillas) | mE5-instruct, Qwen3, jina-v5 (`Query:`/`Document:`) | Definición / intuición | Variantes: instrucciones libres (mE5/Qwen3) vs. prefijos fijos (jina-v5) |

### 3.4 Paradigmas de modelos neuronales para IR

| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.4.1 | **Dual-encoder (bi-encoder) denso**: $s(q,d)=\langle f(q), f(d)\rangle$, escalable vía ANN | mE5, Qwen3, jina-v5, BGE-M3 | Desarrollo formal | |
| 3.4.2 | **Sparse encoder neuronal**: proyección al vocabulario $|V|$, scoring vía intersección $s_{\text{lex}}=\sum_{t\in q\cap d} w_q^t w_d^t$ | SPLADE v1/v3, BGE-M3 | Desarrollo formal | Variantes de agregación: $w=\text{ReLU}(W_{\text{lex}}^T h)$ con $\max$ (BGE-M3) vs. saturación log $w_j=\sum_i \log(1+\text{ReLU}(w_{ij}))$ (SPLADE). **Adoptar la log-saturación de SPLADE** por ser más general |
| 3.4.3 | **Cross-encoder (full interaction)**: entrada concatenada $[q;d]$ y atención cruzada total | jina-reranker-v3, BGE-M3 (teacher), SPLADE (teacher) | Desarrollo formal | |
| 3.4.4 | **Late interaction y operador MaxSim**: $S(q,d)=\sum_i \max_j \langle E_q^i, E_d^j\rangle$ | ColBERT, Jina-ColBERT-v2, BGE-M3 | Desarrollo formal | |
| 3.4.5 | **Listwise / "last but not late" interaction** (contextualización conjunta query+lote de documentos en decoder causal) | jina-reranker-v3 | Definición / intuición | Posicionar como variante reciente del cross-encoder |
| 3.4.6 | **Aumento de consulta con tokens `[MASK]`** (query augmentation implícita por atención) | ColBERT | Intuición formalizada | |
| 3.4.7 | **Funciones de scoring y propiedades de sus distribuciones** (acotamiento, escala, distribución) | BGE-M3 (sugerido) | Definición / intuición | **Sub-subsección puente con 3.6** — fundamenta el problema de incompatibilidad de escalas |

### 3.5 Aprendizaje de representaciones

#### 3.5.1 Funciones de pérdida contrastivas
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.5.1.a | **InfoNCE** y entropía cruzada categórica | mE5, BGE-M3, Qwen3, jina-v5, jina-reranker-v3, SPLADE | Desarrollo formal | Formulación canónica única; adoptar la de BGE-M3/Qwen3 |
| 3.5.1.b | **In-batch negatives** y simetría bidireccional ($q\to d$ y $d\to q$) | mE5, jina-v5, jina-reranker-v3, SPLADE | Desarrollo formal | |
| 3.5.1.c | **Hard negatives** y minería de negativos | mE5, BGE-M3, Qwen3, jina-reranker-v3, SPLADE | Definición / intuición | |
| 3.5.1.d | **Enmascaramiento de falsos negativos** (función indicadora $m_{ij}$ con tolerancia $\epsilon$) | Qwen3 | Desarrollo formal | |
| 3.5.1.e | **MarginMSE**: $\mathcal{L}=((s(q,d^+)-s(q,d^-))-(S(q,d^+)-S(q,d^-)))^2$ | SPLADE-v3 | Desarrollo formal | |
| 3.5.1.f | **Destilación KL** sobre distribuciones softmax con temperatura | Jina-ColBERT-v2, SPLADE-v3, jina-v5 | Desarrollo formal | |
| 3.5.1.g | **Regularizador FLOPS** y comparación con $L_1$ para control de dispersión | SPLADE | Desarrollo formal | |
| 3.5.1.h | **Pérdida dispersiva** (anti-colapso de representaciones) | jina-reranker-v3 | Desarrollo formal | |
| 3.5.1.i | **Regularizador ortogonal global (GOR)** — distribución uniforme en hiperesfera | jina-v5 | Desarrollo formal | |
| 3.5.1.j | **CoSENT / pérdida listwise por orden de coseno** | jina-v5 | Desarrollo formal | Útil sólo si se discute STS |
| 3.5.1.k | **Combinación lineal multitarea** $\mathcal{L}=\sum \lambda_i \mathcal{L}_i$ | SPLADE-v3, jina-v5, BGE-M3 | Desarrollo formal | Marco unificador |

#### 3.5.2 Destilación de conocimiento (sugerencia de subsección nueva — ver Entregable 4)
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.5.2.a | **Esquema teacher–student** en IR (cross-encoder → bi/sparse/multi-vector) | mE5, BGE-M3, SPLADE-v3, Jina-ColBERT-v2, jina-v5 | Desarrollo formal | |
| 3.5.2.b | **Self-knowledge distillation** (combinación lineal de scores propios como soft target) | BGE-M3 | Desarrollo formal | |
| 3.5.2.c | **Destilación con proyección lineal entre espacios de distinta dimensionalidad** $\psi(z^S)=Wz^S+b$ | jina-v5 | Desarrollo formal | |

#### 3.5.3 Fine-tuning y aproximaciones de bajo rango
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.5.3.a | **Aproximación matricial de bajo rango** (formalismo SVD / factorización) | (Sugerido — prerrequisito) | Desarrollo formal | Ver hueco en Entregable 3 |
| 3.5.3.b | **LoRA y adaptadores específicos por tarea** | jina-v5, jina-reranker-v3 | Desarrollo formal | (Aplicaciones concretas: cap. 4) |
| 3.5.3.c | **Proyección lineal de compresión de embeddings** $E' = W\cdot E$ | ColBERT, jina-v5 | Desarrollo formal | |

#### 3.5.4 Representaciones jerárquicas y truncables
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.5.4.a | **Matryoshka Representation Learning (MRL)**: $\mathcal{L}_{\text{MRL}}=\sum_d c_d \mathcal{L}(W^{(d)} X)$ | Jina-ColBERT-v2, Qwen3, jina-v5 | Desarrollo formal | |
| 3.5.4.b | **Variantes con/sin weight-tying** (MRL-E vs. cabezas independientes) | Jina-ColBERT-v2 | Desarrollo formal | |

#### 3.5.5 Fusión de modelos en el espacio de parámetros (sub-subsección sugerida)
| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.5.5.a | **Promedio lineal de pesos / model merging** | jina-reranker-v3 | Definición / intuición | |
| 3.5.5.b | **Spherical Linear Interpolation (SLERP)** sobre checkpoints | Qwen3 | Desarrollo formal | |
| 3.5.5.c | **Contraste con fusión de rangos** (early-stage vs. late-stage fusion) | jina-reranker-v3, Qwen3 | Definición / intuición | Puente discursivo con 3.6 |

### 3.6 Fundamentos matemáticos de la fusión de rangos
> *Los extractos aportan poco material directo; esta subsección requiere mayoritariamente fuentes externas (ver Entregable 3).*

| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.6.1 | **Combinación lineal de scores** (forma general $S = \sum_i w_i s_i$) | BGE-M3 (fusión nativa dense+lex+multi), SPLADE-v3 | Desarrollo formal | |
| 3.6.2 | **Normalización min-max por consulta** | SPLADE-v3 | Definición | |
| 3.6.3 | **Problema de incompatibilidad de escalas** entre scores BM25 (log-odds), coseno acotado, MaxSim no acotado | Sugerido por Jina-ColBERT-v2, BGE-M3 | Desarrollo formal | Motivación central |
| 3.6.4 | RRF, Borda, Condorcet y otros métodos clásicos | (Hueco — fuentes externas) | Desarrollo formal | Núcleo metodológico de la tesis |

### 3.7 Evaluación en recuperación de información

| # | Concepto | Papers | Nivel | Notas |
|---|---|---|---|---|
| 3.7.1 | Métricas básicas: precisión, recall, MRR, MAP, nDCG (DCG/iDCG) | (Hueco — prerrequisito) | Desarrollo formal | |
| 3.7.2 | **nDCG\*** bajo juicios incompletos | SPLADE-v3 | Definición | |
| 3.7.3 | **Meta-análisis tipo RANGER** (efectos fijos/aleatorios sobre múltiples colecciones) | SPLADE-v3 | Sólo intuición | Opcional — puede subdimensionarse |
| 3.7.4 | **Complejidad esperada en índice invertido**: $\mathbb{E}[\sum_j p_j^{(q)} p_j^{(d)}]$ (FLOPS) | SPLADE | Desarrollo formal | |
| 3.7.5 | **Indexación y búsqueda eficiente de multi-vectores** (búsqueda ANN sobre bolsas de vectores) | ColBERT, Jina-ColBERT-v2 | Definición / intuición | |

---

## Entregable 2: Detección de redundancias

| # | Concepto duplicado | Versiones encontradas | Recomendación | Justificación |
|---|---|---|---|---|
| R1 | Late interaction / MaxSim | ColBERT (formulación original con sim genérica), Jina-ColBERT-v2 (con producto punto), BGE-M3 (con normalización por $1/N$) | **Adoptar formulación de ColBERT** y mencionar la normalización de BGE-M3 como variante | La de ColBERT es la canónica histórica; la normalización por longitud es decisión de ingeniería |
| R2 | InfoNCE | Aparece en 6 extractos con notación ligeramente distinta | **Adoptar formulación de Qwen3/BGE-M3** como base, mostrar simétrica bidireccional como en jina-v5/jina-reranker-v3 | Qwen3 da la versión más completa con denominador exhaustivo |
| R3 | Destilación con KL-divergence | Jina-ColBERT-v2 (con temperatura $\tau$), SPLADE-v3 (sin $\tau$ explícita), jina-v5 (proyección lineal previa) | **Presentar la versión con temperatura** (Jina-ColBERT-v2) | Más general; $\tau\to 1$ recupera el caso especial |
| R4 | Hard negatives + in-batch negatives | mE5, BGE-M3, Qwen3, SPLADE, jina-reranker-v3 | Una única exposición unificada en 3.5.1 | Concepto idéntico bajo todas las fuentes |
| R5 | Compresión por proyección lineal de embeddings | ColBERT (reducir 768→128), jina-v5 (proyección entre dimensiones para destilación) | **Una sola exposición en 3.5.3.c** | Misma técnica algebraica |
| R6 | Equivalencia coseno ↔ producto punto bajo norma $L_2$ | ColBERT explícito; usado implícitamente en todos | **Presentar una sola vez en 3.3.2** como propiedad algebraica | Es prerrequisito común |
| R7 | Saturación no lineal de frecuencias | BM25 (TF saturation) y SPLADE (log-saturation neuronal) | **Mantener ambas separadas** (3.2.6 vs. 3.4.2), pero **conectarlas explícitamente** | Mismo principio matemático aplicado en dos contextos; conexión ilumina el diseño de SPLADE |
| R8 | Combinación lineal multitarea de pérdidas | SPLADE-v3, BGE-M3, jina-v5 | **Presentar formalismo único en 3.5.1.k** y mencionar instanciaciones en cap. 4 | Idéntico esqueleto matemático |
| R9 | Pooling de last-token (EOS) | Qwen3, jina-v5 | Una sola exposición en 3.3.3.b junto con CLS y mean | Variante natural en arquitecturas decoder-only |
| R10 | Embeddings condicionados por instrucción | mE5-instruct, Qwen3, jina-v5 | **Una exposición conceptual en 3.3.3.c**; las instanciaciones (instrucciones libres vs. prefijos fijos) van al cap. 4 | Mismo mecanismo subyacente |
| R11 | Late interaction + MaxSim normalizado | BGE-M3 lo presenta dividiendo entre $N$ | Mantener como variante en nota a pie | Cambio menor |

---

## Entregable 3: Detección de huecos

| # | Concepto faltante | Subsección | Justificación | Fuente sugerida |
|---|---|---|---|---|
| H1 | **Arquitectura general de un sistema de IR** (corpus, índice invertido, query processing, top-k retrieval) | 3.1 | Marco conceptual mínimo antes de modelos específicos | Manning, Raghavan & Schütze, *Introduction to Information Retrieval* (2008), caps. 1–2 |
| H2 | **TF-IDF en su forma canónica** | 3.2.1 | Los extractos lo asumen pero no lo desarrollan; necesario antes de BIM/BM25 | Manning et al. (2008), cap. 6; Salton & Buckley (1988) |
| H3 | **Hipótesis distribucional y embeddings estáticos** (Word2Vec, GloVe) | 3.3.1 | Tu propio esquema lo prevé, ningún extracto lo cubre | Mikolov et al. (2013); Pennington et al. (2014); Jurafsky & Martin (2024), cap. 6 |
| H4 | **Arquitectura Transformer** (atención escalada, multi-cabeza, FFN, normalización) | 3.3.2 | Todos los modelos la asumen; sólo Jina-ColBERT-v2 menciona detalles de RoPE | Vaswani et al. (2017) "Attention is All You Need"; Jurafsky & Martin (2024), cap. 9 |
| H5 | **BERT, MLM y pretraining bidireccional** | 3.3.3 | Backbone de SPLADE, ColBERT, BGE-M3, mE5 | Devlin et al. (2019) |
| H6 | **Entropía, entropía cruzada y divergencia KL** (fundamentos de teoría de la información) | 3.5.1 (prerrequisito) | InfoNCE y destilación KL los usan; se asumen sin definir | Cover & Thomas, *Elements of Information Theory*, caps. 2 y 8 |
| H7 | **SVD y aproximación matricial de bajo rango (Eckart–Young)** | 3.5.3.a | Necesario para fundamentar formalmente LoRA y compresión | Trefethen & Bau, *Numerical Linear Algebra*, caps. 4–5 |
| H8 | **Métricas estándar de IR**: precisión, recall, MRR, MAP, DCG/nDCG con definición formal | 3.7.1 | SPLADE-v3 menciona nDCG\* sin definir nDCG estándar | Manning et al. (2008), cap. 8; Järvelin & Kekäläinen (2002) para nDCG |
| H9 | **Reciprocal Rank Fusion (RRF), CombSUM, CombMNZ, Borda count, Condorcet** | 3.6.4 | **Hueco crítico**: ningún extracto cubre los métodos de fusión que son el núcleo de tu tesis | Cormack, Clarke & Buettcher (2009) "Reciprocal Rank Fusion outperforms Condorcet…"; Fox & Shaw (1994); Aslam & Montague (2001) |
| H10 | **Métodos de normalización de scores** (z-score, min-max, sum-to-one, sigmoide) más allá de min-max | 3.6.2 | Esencial para fusion basada en scores; sólo SPLADE-v3 menciona min-max | Wu, Crestani & Bi (2006); Renda & Straccia (2003) |
| H11 | **Búsqueda de vecinos más cercanos aproximada (ANN)**: HNSW, IVF-PQ, FAISS | 3.7.5 | Mencionada en SPLADE y ColBERT pero sin formalización | Malkov & Yashunin (2018) HNSW; Johnson, Douze & Jégou (2017) FAISS |
| H12 | **Bag-of-words y representaciones léxicas dispersas clásicas** | 3.2.1 | Necesario para que el lector entienda por qué SPLADE proyecta a $|V|$ | Manning et al. (2008), cap. 6 |
| H13 | **Tokenización subword** (WordPiece, BPE, SentencePiece) | 3.3.2 (nota) | SPLADE depende de WordPiece (30,522 tokens); afecta interpretabilidad | Sennrich et al. (2016); Kudo & Richardson (2018) |

---

## Entregable 4: Orden de exposición sugerido

### Orden entre subsecciones (con dependencias)

```
3.1 → 3.2 → 3.3 → 3.4 → 3.5 → 3.7 → 3.6
```

**Decisión no obvia:** colocar **3.7 antes de 3.6**. Justificación: la fusión de rangos (3.6) requiere métricas de evaluación (3.7) para definir el problema de optimización subyacente ("fusionar para maximizar nDCG@k"). Alternativa: mantener el orden original e intercalar definiciones mínimas de métricas en 3.6.

### Orden interno por subsección

**3.1**: arquitectura del sistema (H1) → PRP (3.1.1) → equivalencia de rango (3.1.2)

**3.2**: TF-IDF (H2) → BIM/RSJ (3.2.4) → independencia (3.2.2) → restricción a query (3.2.3) → 2-Poisson (3.2.5) → saturación TF (3.2.6) → normalización por longitud (3.2.7) → BM25 ensamblado → PRF (3.2.8)

**3.3**: 3.3.1 (hipótesis distribucional + estáticos) → 3.3.2 (Transformer + atención + RoPE + propiedad coseno/dot) → 3.3.3 (contextuales + pooling + instrucciones)

**3.4**: 3.4.1 dual-encoder → 3.4.2 sparse encoder (con saturación log, conectando a 3.2.6) → 3.4.3 cross-encoder → 3.4.4 late interaction → 3.4.5 listwise/last-but-not-late → 3.4.6 query augmentation → 3.4.7 propiedades de las funciones de scoring

**3.5**: 
- 3.5.1 contrastivas: entropía cruzada/KL (prerrequisito H6) → InfoNCE → in-batch + simétrica → hard negatives → masking de falsos negativos → MarginMSE → KL-distillation → regularizadores (FLOPS, GOR, dispersiva) → CoSENT → combinación multitarea
- 3.5.2 destilación (esquema general → self-distillation → con proyección)
- 3.5.3 bajo rango (SVD/Eckart-Young → LoRA → proyección de compresión)
- 3.5.4 Matryoshka
- 3.5.5 model merging (linear → SLERP → contraste con fusión de rangos)

**3.7**: métricas básicas (H8) → nDCG\* → meta-análisis → complejidad esperada → ANN multi-vector (H11)

**3.6**: combinación lineal de scores → normalización (min-max + H10) → incompatibilidad de escalas → métodos basados en rango (RRF, Borda, Condorcet — H9) → métodos basados en score (CombSUM, CombMNZ)

### Renombrados / movimientos sugeridos

1. **Renombrar 3.5** a *"Aprendizaje de representaciones y transferencia de conocimiento"* (jina-v5)
2. **Añadir 3.5.2** "Destilación de conocimiento en espacios vectoriales" (separada de las pérdidas contrastivas y antes de bajo rango)
3. **Añadir 3.5.5** "Fusión de modelos en el espacio de parámetros" (puente con 3.6)
4. **Renombrar 3.6** a *"Fundamentos matemáticos de la fusión de rangos y agregación de evidencias"*
5. **Añadir 3.4.7** "Funciones de scoring y propiedades distribucionales" (puente explícito hacia 3.6)

---

## Entregable 5: Alertas sobre alcance

### Sobredimensionados (reducir)
- **CoSENT (3.5.1.j)**: orientado a STS, no a ranking. Mencionar en una línea como variante listwise.
- **Meta-análisis RANGER (3.7.3)**: marginal para tu evaluación; basta una nota a pie si lo usas.
- **Pérdida dispersiva, GOR (3.5.1.h–i)**: técnicas anti-colapso interesantes pero secundarias; explicar en una página combinada como "regularización geométrica de representaciones".
- **Detalles del 2-Poisson (3.2.5)**: el desarrollo formal completo puede sobrecargar; bastaría con la intuición + paso al límite asintótico que da BM25.
- **Last-but-not-late (3.4.5)**: muy específico de un solo paper (jina-reranker-v3); presentar en cap. 4, dejando en 3.4 sólo la idea general de "interacción listwise en decoders causales".

### Subdimensionados (expandir)
- **3.6 Fusión de rangos**: es el núcleo de tu tesis y los extractos aportan poquísimo. Necesitas al menos:
  - Tipologías: rank-based vs. score-based fusion
  - Garantías teóricas (Cormack et al. para RRF; teoría de votación para Borda/Condorcet)
  - Análisis de complejidad y propiedades (idempotencia, monotonicidad, Pareto-optimalidad)
- **3.6.3 Incompatibilidad de escalas**: mencionado en pasada por el extracto de Jina-ColBERT-v2; merece desarrollo formal con ejemplos numéricos comparando rangos típicos de BM25, coseno y MaxSim.
- **3.4.7 Propiedades de funciones de scoring**: es el puente conceptual entre cap. 3 y tu metodología; merece tratamiento formal explícito.
- **3.7 Métricas**: los extractos casi no las cubren; expande con definiciones formales rigurosas (matemáticas aplicadas) de DCG, nDCG, MAP, MRR, R@k.

### Material que debe migrarse al cap. 4
- **Pipelines de entrenamiento concretos** (3 etapas de Qwen3, 2 etapas de BGE-M3, dos fases de Jina-ColBERT-v2) → 4.2
- **Hiperparámetros específicos** ($\lambda_q \neq \lambda_d$ en SPLADE, $\tau=0.05$ en Jina, dimensiones MRL específicas) → 4.2
- **LoRA con $r=16, \alpha=32$ aplicado a backbone Qwen3-0.6B** → 4.2/4.3 (sólo el formalismo abstracto va a 3.5.3)
- **Plantillas de chat / prompts específicos** (Qwen3 reranker, jina-v5 prefijos) → 4.3 / 4.6
- **Datos sintéticos generados por LLM** (mE5-instruct, Qwen3, BGE-M3) → 4.5 (benchmarks/datos)
- **Comparaciones empíricas** (nDCG concretos en MIRACL, BEIR, MS MARCO) → 4.5

### Conocimiento previo asumible (audiencia: matemáticas aplicadas UNAM)
- **Álgebra lineal básica** (producto interno, normas, ortogonalidad, SVD): no desarrollar; sí citar resultados clave (Eckart-Young) cuando se invoquen.
- **Probabilidad básica** (esperanza, condicional, Bayes): asumir; el PRP usa Bayes pero la inversión bayesiana sí merece desarrollo (3.1.2) por su rol específico en IR.
- **Optimización por gradiente y backpropagation**: asumir; mencionar sólo donde haya sutilezas (e.g., gradiente de $L_1$ vs. FLOPS).
- **Softmax y entropía cruzada**: tu audiencia las conoce, pero conviene definirlas brevemente al introducir InfoNCE (medio párrafo) por ser centrales.
- **Convergencia de series, espacios métricos**: asumir totalmente.

### Alerta de coherencia narrativa
Tu tesis evalúa **fusión late-stage (de rangos)**. El cap. 3 actualmente prepara muy bien los modelos individuales pero **flaquea en la justificación matemática del problema de fusión**. Sugiero que 3.4.7 + 3.5.5 + 3.6 formen una **trilogía narrativa**: 
> "Distintos paradigmas producen scores en escalas incompatibles (3.4.7) → una opción es fusionar internamente vía model merging (3.5.5) → la otra, más flexible y central a esta tesis, es fusionar las listas resultantes (3.6)."

Esto convertirá el marco teórico en una motivación natural de tu metodología, no en un catálogo enciclopédico.