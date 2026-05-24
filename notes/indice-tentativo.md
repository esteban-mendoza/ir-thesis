# Esqueleto extendido del Marco Teórico y Estado del Arte

A continuación, cada subsección se presenta con tres anotaciones:

- **[Detalle]**: nivel de profundidad recomendado.
- **[Por qué]**: justificación de inclusión (1–2 oraciones).
- **[Origen]**: modelo(s) o fuente(s) que motivan su inclusión.

Las convenciones de nivel de detalle son:
- *Definición básica*: 1–3 párrafos, sin demostraciones.
- *Desarrollo formal*: derivación matemática completa con propiedades.
- *Intuición + formalización*: motivación conceptual seguida de definición precisa.
- *Mención + referencia*: 1 párrafo con cita a fuente externa.

---

# 3. Marco Teórico

## 3.1 Fundamentos de recuperación de información

### 3.1.1 Definiciones canónicas (consulta, documento, corpus, ranking, juicios de relevancia)
- **[Detalle]** Definición básica.
- **[Por qué]** Sin estas definiciones formales el resto del capítulo carece de objetos sobre los cuales razonar; toda formulación posterior las presupone.
- **[Origen]** Hueco prerrequisito (ningún paper procesado lo cubre); fuente: Manning, Raghavan & Schütze, *IIR* (2008), cap. 1.

### 3.1.2 Principio de Ordenación por Probabilidad (PRP)
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Es la hipótesis fundacional del paradigma probabilístico de IR y la justificación última de BM25 y de toda función de puntuación basada en relevancia estimada.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.1.3 Equivalencia de rango bajo transformaciones monótonas e inversión bayesiana
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Justifica el paso a log-odds en BM25 y, por extensión, la equivalencia entre formulaciones aparentemente distintas; conecta naturalmente con el formalismo de rankings de §3.6.
- **[Origen]** Robertson & Zaragoza (2009).

---

## 3.2 Modelos léxicos: fundamentos

### 3.2.1 Modelo de espacio vectorial y TF-IDF
- **[Detalle]** Definición básica + desarrollo formal compacto.
- **[Por qué]** Es el marco contenedor de todos los modelos de bag-of-words y precursor conceptual de los embeddings modernos; el lector debe verlo antes de BM25.
- **[Origen]** Hueco prerrequisito; fuente: Salton, Wong & Yang (1975); IIR cap. 6.

### 3.2.2 Modelo de Independencia Binaria (BIM) y peso RSJ
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Es el puente lógico entre el PRP y BM25; sin él la formulación de BM25 aparece como mágica en lugar de derivada.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.3 Restricción al espacio de la consulta
- **[Detalle]** Desarrollo formal compacto.
- **[Por qué]** Reduce el problema computacional al subconjunto activo y conecta naturalmente con la estructura de los sparse encoders neuronales (§3.4.2).
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.4 Modelo de Elitismo (2-Poisson) y saturación no lineal
- **[Detalle]** Intuición + formalización (no derivación exhaustiva).
- **[Por qué]** Justifica la curva de saturación de TF que es central en BM25 y reaparece como contraparte neuronal en SPLADE (log-ReLU); su intuición es indispensable, su derivación completa no.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.5 Normalización suave por longitud
- **[Detalle]** Desarrollo formal.
- **[Por qué]** El parámetro $b$ de BM25 es uno de los pocos sintonizables y su semántica (verbosidad vs. alcance) afecta directamente el comportamiento en español, donde la longitud de documento varía por morfología.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.6 Formulación canónica de BM25
- **[Detalle]** Desarrollo formal completo.
- **[Por qué]** Es uno de los modelos base de tu sistema experimental; la formulación canónica es referencia obligatoria.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.7 Pseudo-Relevance Feedback (conceptual)
- **[Detalle]** Definición básica.
- **[Por qué]** Antecedente conceptual de los pipelines en cascada modernos (recuperación inicial + reranking) que son el contexto donde tu tesis se ubica.
- **[Origen]** Robertson & Zaragoza (2009); fuente complementaria: Lavrenko & Croft (2001).

---

## 3.3 Representaciones vectoriales del lenguaje

### 3.3.1 Hipótesis distribucional y embeddings estáticos
- **[Detalle]** Intuición + formalización (no derivación de algoritmos).
- **[Por qué]** Es el origen conceptual de toda la línea neuronal de IR; sin la hipótesis distribucional, el lector no entiende por qué las representaciones vectoriales son una idea coherente.
- **[Origen]** Hueco prerrequisito; fuentes: Harris (1954); Mikolov et al. (2013); Pennington et al. (2014).

### 3.3.2 Arquitectura Transformer y atención (encoder bidireccional vs decoder causal)
- **[Detalle]** Desarrollo formal de atención escalada producto-punto; mención + referencia para el resto del bloque.
- **[Por qué]** Toda la cohorte de modelos modernos depende del Transformer; la distinción encoder/decoder es además crítica porque modelos como Qwen3 y jina-v5 requieren atención causal y last-token pooling, mientras que mE5 y SPLADE usan encoders bidireccionales.
- **[Origen]** Hueco prerrequisito + diferenciación motivada por Qwen3-Embedding y jina-embeddings-v5; fuente: Vaswani et al. (2017); Phuong & Hutter (2022).

### 3.3.3 Embeddings contextuales y estrategias de pooling
- **[Detalle]** Desarrollo formal.
- **[Por qué]** El pooling es una decisión arquitectónica con consecuencias matemáticas concretas (mean/CLS para BERT-like vs EOS/last-token para decoder-only); aparece en casi todos los modelos del estado del arte y debe formalizarse antes de discutirlos.
- **[Origen]** mE5, BGE-M3 (CLS/mean), Qwen3-Embedding, jina-v5 (last-token); BERT como prerrequisito (Devlin et al. 2019).

### 3.3.4 Embeddings guiados por instrucciones
- **[Detalle]** Definición básica + intuición.
- **[Por qué]** Es un mecanismo de modulación del espacio latente sin alterar pesos, presente en mE5-instruct y Qwen3-Embedding; el lector necesita entender que un mismo texto puede producir vectores distintos según el rol asignado.
- **[Origen]** mE5-large-instruct, Qwen3-Embedding.

---

## 3.4 Paradigmas de modelos neuronales para IR

### 3.4.1 Codificadores duales densos (Dense Bi-encoders)
- **[Detalle]** Definición formal canónica.
- **[Por qué]** Es el paradigma neuronal más simple y la línea base de comparación para todos los demás; presente en mE5, Qwen3, jina-v5.
- **[Origen]** mE5, BGE-M3, Qwen3-Embedding, jina-embeddings-v5.

### 3.4.2 Codificadores dispersos neuronales (Sparse Encoders)
- **[Detalle]** Desarrollo formal completo.
- **[Por qué]** Es uno de los paradigmas que evaluarás; su saturación logarítmica $\log(1+\text{ReLU}(\cdot))$ es la contraparte neuronal de la saturación de TF y conecta explícitamente con §3.2.4.
- **[Origen]** SPLADE, BGE-M3 (componente sparse).

### 3.4.3 Cross-encoders
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Son el competidor directo de la fusión de rangos en tu Objetivo Específico 4; el lector necesita entender por qué su atención cruzada plena es más expresiva pero computacionalmente prohibitiva.
- **[Origen]** Qwen3-Embedding (reranking puntual con tokens yes/no), bge-reranker-v2-m3.

### 3.4.4 Modelos de interacción tardía (operador MaxSim)
- **[Detalle]** Desarrollo formal completo.
- **[Por qué]** Es el paradigma intermedio entre dual-encoders y cross-encoders; ColBERT y Jina-ColBERT-v2 son piezas centrales de tu pipeline experimental.
- **[Origen]** ColBERT, Jina-ColBERT-v2, BGE-M3 (componente multi-vector).

### 3.4.5 Funciones de puntuación: propiedades matemáticas y motivación de la fusión
- **[Detalle]** Desarrollo formal.
- **[Por qué]** **Subsección puente clave**: documenta que BM25 produce log-odds no acotados, los densos producen cosenos en [-1,1], los sparse producen sumatorias no acotadas y MaxSim produce sumatorias estructuradas; esta heterogeneidad es lo que motiva matemáticamente §3.6 y, en particular, la elegancia de RRF.
- **[Origen]** Síntesis transversal (BM25 + mE5 + SPLADE + ColBERT); concepto no aislado en ningún paper único pero es el corazón argumental de tu tesis.

---

## 3.5 Aprendizaje de representaciones

### 3.5.1 Funciones de pérdida contrastivas
- **[Detalle]** Desarrollo formal de InfoNCE canónica + presentación de variantes como modificaciones del denominador o de la simetría.
- **[Por qué]** Toda la cohorte 2020–2026 entrena con variantes de InfoNCE; presentar una forma canónica y derivar las demás como modificaciones evita la dispersión que produciría una pérdida por modelo.
- **[Origen]** mE5, BGE-M3, Qwen3 (con masking), jina-v5 (bidireccional, GOR, CoSENT), SPLADE (con FLOPS), jina-reranker-v3 (dispersive loss).

### 3.5.2 Fine-tuning y aproximaciones de bajo rango
- **[Detalle]** Desarrollo formal de LoRA + definición de hard negative mining.
- **[Por qué]** LoRA es central en jina-v5 (LoRA por tarea) y jina-reranker-v3 ($r=16, \alpha=32$); el hard negative mining es el motor empírico de prácticamente todos los modelos modernos y merece formalización canónica única.
- **[Origen]** jina-v5, jina-reranker-v3 (LoRA); mE5, SPLADE-v3, Qwen3, jina-reranker-v3 (hard negatives); fuente: Hu et al. (2021) para LoRA.

### 3.5.3 Representaciones jerárquicas y truncables (MRL)
- **[Detalle]** Desarrollo formal.
- **[Por qué]** MRL es ubicuo en modelos modernos (Jina-ColBERT-v2, Qwen3, jina-v5) y permite trade-offs efectividad/eficiencia que pueden ser explotados en tu evaluación experimental.
- **[Origen]** Jina-ColBERT-v2 (multi-vector con 6 cabezas), Qwen3-Embedding, jina-embeddings-v5; fuente: Kusupati et al. (2022).

### 3.5.4 Destilación de conocimiento en IR [SUBSECCIÓN NUEVA]
- **[Detalle]** Desarrollo formal de KL con softmax-temperatura y MarginMSE; mención + referencia para variantes especializadas.
- **[Por qué]** Cuatro de los modelos centrales (SPLADE-v3, Jina-ColBERT-v2, mE5, jina-v5) dependen críticamente de destilación; sin formalización aquí, la mitad del estado del arte queda colgada de un concepto no establecido.
- **[Origen]** SPLADE-v3 (ensamble de 5 cross-encoders), Jina-ColBERT-v2 (KL desde reranker), mE5 (destilación de cross-encoder), jina-v5 (destilación con proyección lineal), BGE-M3 (self-distillation).

---

## 3.6 Fundamentos matemáticos de la fusión de rangos

### 3.6.1 Formalización: rankings, score-fusion vs rank-fusion, analogía con teoría de elección social
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Es el eje conceptual de tu tesis; sin distinguir formalmente score-fusion de rank-fusion el lector no entiende por qué evalúas RRF en lugar de CombSUM ni por qué la heterogeneidad de §3.4.5 es un problema.
- **[Origen]** Síntesis de Aslam & Montague (2001), Montague & Aslam (2002), Cormack et al. (2009); concepto que ningún extracto formaliza pero es ineludible.

### 3.6.2 Métodos basados en puntuaciones (CombSUM, CombMNZ, normalización)
- **[Detalle]** Desarrollo formal de CombSUM y CombMNZ; desarrollo formal de min-max, z-score y sigmoide como técnicas de normalización.
- **[Por qué]** Es la línea base histórica de fusión y, crítico para tu tesis, requiere normalización porque combina scores heterogéneos; explicitar estas técnicas justifica matemáticamente por qué los métodos rank-based son atractivos.
- **[Origen]** Fox & Shaw (1994), Aslam & Montague (2001); SPLADE-v3 (min-max por consulta).

### 3.6.3 Métodos posicionales basados en rangos (Borda)
- **[Detalle]** Desarrollo formal de Borda canónico, Borda ponderado, y Borda como modelo de usuario uniforme.
- **[Por qué]** Es uno de los métodos que evaluarás; la lectura como modelo de usuario uniforme conecta Borda con RBC y permite la unificación probabilística que es el clímax conceptual del capítulo.
- **[Origen]** Aslam & Montague (2001), Bailey et al. (2017).

### 3.6.4 Métodos mayoritarios y teoría de grafos semicompletos (Condorcet)
- **[Detalle]** Desarrollo formal con esbozo de teoremas (componentes fuertemente conexas y caminos hamiltonianos); mención de la paradoja de Condorcet y teorema de Arrow como contexto.
- **[Por qué]** Condorcet es uno de los métodos que evaluarás; su fundamento en teoría de grafos lo distingue cualitativamente de los métodos posicionales y merece tratamiento riguroso.
- **[Origen]** Montague & Aslam (2002).

### 3.6.5 Métodos probabilísticos y modelos de usuario (Bayes-fuse, RBC)
- **[Detalle]** Desarrollo formal completo, incluyendo el marco unificador de Bailey et al. y análisis asintótico de RBC ($\phi \to 0$ y $\phi \to 1$).
- **[Por qué]** RBC es uno de los métodos centrales de tu evaluación; su lectura como esperanza bajo distribución geométrica y la unificación con Borda y RRF como casos particulares es el aporte conceptual más fuerte del capítulo.
- **[Origen]** Aslam & Montague (2001), Bailey et al. (2017).

### 3.6.6 Fusión recíproca amortiguada (RRF)
- **[Detalle]** Desarrollo formal completo + análisis de mitigación de outliers + sensibilidad al hiperparámetro $k$ + invarianza de escala.
- **[Por qué]** RRF es probablemente el método que más usarás y es el que mejor ilustra la solución elegante al problema de heterogeneidad de §3.4.5; merece desarrollo más profundo que los demás.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

---

## 3.7 Evaluación en recuperación de información

### 3.7.1 Métricas estándar (P@k, R@k, MAP, MRR, nDCG)
- **[Detalle]** Desarrollo formal.
- **[Por qué]** Son las métricas que usarás en tu evaluación experimental; ningún extracto las define rigurosamente y son indispensables.
- **[Origen]** Hueco prerrequisito; fuente: IIR cap. 8; Sanderson (2010).

### 3.7.2 Variantes bajo juicios incompletos (nDCG*)
- **[Detalle]** Definición básica.
- **[Por qué]** Si MessIRve presenta juicios incompletos (a verificar en su paper), esta variante es relevante; útil mantenerla aunque sea como nota técnica.
- **[Origen]** SPLADE-v3.

### 3.7.3 Similitud entre listas de ranking (Kendall τ vs RBO)
- **[Detalle]** Desarrollo formal.
- **[Por qué]** RBO es la métrica natural para evaluar consistencia entre las listas que vas a fusionar; su decaimiento por rango lo hace robusto a listas truncadas, propiedad útil en tu pipeline.
- **[Origen]** Bailey et al. (2017).

### 3.7.4 Búsqueda eficiente: ANN, HNSW, IVF, búsqueda multi-vector
- **[Detalle]** Definición básica + intuición.
- **[Por qué]** ColBERT y Jina-ColBERT-v2 no buscan con FAISS estándar sino con búsqueda multi-vector especializada (PLAID); el lector necesita saber que la viabilidad de los modelos densos depende de estas estructuras de datos.
- **[Origen]** ColBERT, Jina-ColBERT-v2 (necesidad de PLAID); fuente: Malkov & Yashunin (2018); Johnson et al. (2019).

### 3.7.5 Pruebas de significancia estadística
- **[Detalle]** Definición básica + intuición.
- **[Por qué]** Necesarias para justificar las comparaciones empíricas del capítulo experimental y para no caer en el error de reportar diferencias no significativas como mejoras.
- **[Origen]** Hueco prerrequisito; fuente: Smucker, Allan & Carterette (2007).

---

# 4. Estado del Arte

## 4.1 Modelos léxicos modernos y variantes de BM25

### 4.1.1 Okapi BM25 y BM25F
- **[Detalle]** Desarrollo del modelo + parámetros típicos + resultados de referencia.
- **[Por qué]** BM25 sigue siendo línea base obligatoria en 2025 y componente crítico de tu sistema de fusión; BM25F es la extensión a documentos estructurados.
- **[Origen]** Robertson & Zaragoza (2009).

### 4.1.2 PRF y expansión de consulta
- **[Detalle]** Definición + discusión de query drift.
- **[Por qué]** Antecedente histórico de pipelines en cascada; relevante para contextualizar por qué la fusión de rangos surge como alternativa.
- **[Origen]** Robertson & Zaragoza (2009); fuentes complementarias: Lavrenko & Croft (2001) RM3.

### 4.1.3 Variantes modernas (BM25+, BM25L, BM25-Adaptive)
- **[Detalle]** Mención + referencia.
- **[Por qué]** Permite documentar que BM25 no es un objeto estático y que existen variantes que podrían ser parte del sistema base; importante para validez metodológica.
- **[Origen]** Hueco identificado; fuentes: Lv & Zhai (2011) BM25+/BM25L.

### 4.1.4 Infraestructura: Anserini, Pyserini
- **[Detalle]** Mención + referencia.
- **[Por qué]** Es la herramienta probable de tu implementación experimental; legitima la elección de BM25 como reproducible.
- **[Origen]** Hueco identificado; fuente: Yang, Fang & Lin (2017); Lin et al. (2021).

---

## 4.2 Modelos semánticos representativos

### 4.2.1 Dense bi-encoders multilingües

#### 4.2.1.1 mDPR
- **[Detalle]** Mención + referencia + arquitectura general.
- **[Por qué]** Es el modelo fundacional del bi-encoder multilingüe; sin él, la línea de mE5 no se entiende.
- **[Origen]** Hueco identificado; fuente: Karpukhin et al. (2020); Asai et al. mDPR.

#### 4.2.1.2 mContriever
- **[Detalle]** Mención + referencia.
- **[Por qué]** Introduce el preentrenamiento contrastivo no supervisado, paso intermedio entre mDPR y mE5.
- **[Origen]** Hueco identificado; fuente: Izacard et al. (2021).

#### 4.2.1.3 mE5 (small/base/large) y mE5-large-instruct
- **[Detalle]** Desarrollo completo: arquitectura, datos, pérdida, resultados desglosados en español.
- **[Por qué]** Familia central en tu evaluación; los resultados desglosados en español (anomalía mE5-large vs mE5-base) son evidencia directa que motiva tu hipótesis sobre fusión.
- **[Origen]** mE5 (Wang et al. 2024).

#### 4.2.1.4 Qwen3-Embedding (0.6B/4B/8B)
- **[Detalle]** Desarrollo completo: pipeline 3 etapas, MRL, fusión SLERP de checkpoints, comparación con propietarios.
- **[Por qué]** Modelo de vanguardia open-source con resultados superiores a OpenAI text-embedding-3-large; pieza clave para tu Objetivo Específico 5 (open vs propietario).
- **[Origen]** Qwen3-Embedding (Zhang et al. 2025).

#### 4.2.1.5 jina-embeddings-v5-text
- **[Detalle]** Desarrollo: LoRA por tarea, prefijos `Query:`/`Document:`, RoPE-32K.
- **[Por qué]** Ilustra una solución alternativa al multi-tarea (LoRA en lugar de instruction-tuning); su decisión sobre prefijos simples vs instrucciones tiene implicaciones para corpora en español sin anotación abundante.
- **[Origen]** jina-embeddings-v5 (Akram et al.).

### 4.2.2 Modelos multifuncionales: BGE-M3
- **[Detalle]** Desarrollo completo + párrafo dedicado a fusión interna $s_{\text{inter}} = w_1 s_d + w_2 s_l + w_3 s_m$.
- **[Por qué]** **Pieza narrativa central**: BGE-M3 internaliza la fusión, lo que ofrece el espejo conceptual de tu propuesta de fusión externa; esta es la observación más valiosa del capítulo y articula la pregunta de investigación.
- **[Origen]** BGE-M3 (Chen et al. 2024).

### 4.2.3 Sparse encoders

#### 4.2.3.1 SPLADE v1 a SPLADE-v3
- **[Detalle]** Desarrollo completo de v1 + evolución a v3 (destilación de ensamble, MarginMSE) + variantes eficientes (Lexical, Doc, DistilBERT).
- **[Por qué]** Es el sparse encoder de referencia y candidato para tu sistema base; la evolución v1→v3 muestra cómo la destilación transformó el panorama.
- **[Origen]** SPLADE (Formal et al. 2021), SPLADE-v3 (Lassance et al. 2024).

#### 4.2.3.2 DeepImpact, uniCOIL, TILDE, doc2query
- **[Detalle]** Mención + referencia.
- **[Por qué]** Línea hermana de SPLADE; conviene ubicar SPLADE en su contexto sin desarrollarlas exhaustivamente.
- **[Origen]** Hueco identificado; fuentes: Mallia et al. (2021); Nogueira & Lin (2019); Zhuang & Zuccon (2021).

### 4.2.4 Late interaction

#### 4.2.4.1 ColBERT v1
- **[Detalle]** Desarrollo completo: marcadores `[Q]`/`[D]`, query augmentation, MaxSim, proyección compresiva.
- **[Por qué]** Es el modelo seminal de late interaction y candidato para tu sistema base; sus ablaciones (sustitución de MaxSim) iluminan por qué la decisión arquitectónica importa.
- **[Origen]** ColBERT (Khattab & Zaharia 2020).

#### 4.2.4.2 ColBERTv2
- **[Detalle]** Definición + intuición sobre centroid compression y residual representation.
- **[Por qué]** Pieza intermedia esencial entre ColBERT v1 y Jina-ColBERT-v2; sin ella el linaje queda con un salto inexplicado.
- **[Origen]** Hueco identificado; fuente: Santhanam et al. (2022).

#### 4.2.4.3 Jina-ColBERT-v2
- **[Detalle]** Desarrollo completo: backbone Jina-XLM-RoBERTa, MRL multi-vector con 6 cabezas, hallazgo sobre weight-tying.
- **[Por qué]** Es el late interaction multilingüe de referencia para tu evaluación; la inclusión de español en su entrenamiento lo hace especialmente relevante.
- **[Origen]** Jina-ColBERT-v2 (Jha et al. 2024).

### 4.2.5 [Cierre narrativo] Convergencia hacia modelos unificados
- **[Detalle]** Discusión narrativa (1–2 páginas).
- **[Por qué]** **Punto de inflexión narrativo del capítulo**: tras presentar BGE-M3 (fusión interna), Qwen3 (MRL nativo) y jina-v5 (LoRA por tarea), el lector debe ver explícitamente que los modelos modernos internalizan la fusión, lo que motiva la pregunta de investigación de tu tesis.
- **[Origen]** Síntesis transversal (BGE-M3, Qwen3, jina-v5).

---

## 4.3 Modelos de reranking neuronal

### 4.3.1 Cross-encoders pointwise/pairwise (monoBERT, monoT5, RankT5, bge-reranker-v2-m3)
- **[Detalle]** Desarrollo: arquitectura cross-encoder + esquemas de entrenamiento.
- **[Por qué]** Son el competidor directo de la fusión de rangos en tu Objetivo Específico 4; bge-reranker-v2-m3 además es el reranker multilingüe de referencia para MIRACL.
- **[Origen]** Hueco parcial: monoBERT (Nogueira & Cho 2019), monoT5 (Nogueira et al. 2020), RankT5 (Zhuang et al. 2023); bge-reranker-v2-m3 referenciado pero no procesado.

### 4.3.2 Listwise rerankers con LLMs (RankGPT, RankZephyr, jina-reranker-v3 LBNL)
- **[Detalle]** Desarrollo completo de jina-reranker-v3; mención + referencia para RankGPT/RankZephyr como antecedente.
- **[Por qué]** jina-reranker-v3 es candidato directo de tu evaluación y representa el estado del arte en reranking listwise; RankGPT/RankZephyr son antecedentes narrativos imprescindibles.
- **[Origen]** jina-reranker-v3 (Wang, Li & Xiao 2025); huecos: Sun et al. (2023), Pradeep et al. (2023).

### 4.3.3 Cascadas y trade-offs efectividad/eficiencia
- **[Detalle]** Discusión + tabla comparativa (latencia vs nDCG@10).
- **[Por qué]** Tu Objetivo Específico 4 incluye comparación en eficiencia computacional; sin esta discusión, la comparación queda hueca.
- **[Origen]** SPLADE-v3 (cascada SPLADE→DeBERTaV3 como sweet spot); ColBERT (170× speedup vs cross-encoder).

---

## 4.4 Estrategias de fusión y reranking en la literatura

### 4.4.1 Fusión score-based clásica (CombSUM, CombMNZ)
- **[Detalle]** Desarrollo completo + hallazgo del efecto coro + discusión de cuándo combinar paradigmas heterogéneos vs homogéneos.
- **[Por qué]** Es la línea base histórica y uno de los métodos que evaluarás; el hallazgo de Fox & Shaw (combinar paradigmas divergentes > combinar variantes similares) ancla tu hipótesis.
- **[Origen]** Fox & Shaw (1994).

### 4.4.2 Fusión rank-based posicional (Borda-fuse, Bayes-fuse)
- **[Detalle]** Desarrollo + resultados TREC.
- **[Por qué]** Borda es uno de los métodos que evaluarás; Bayes-fuse documenta la versión supervisada que justifica por qué los métodos no supervisados (RRF, RBC) son atractivos cuando no hay datos de calibración.
- **[Origen]** Aslam & Montague (2001).

### 4.4.3 Fusión rank-based mayoritaria (Condorcet-fuse)
- **[Detalle]** Desarrollo + complejidad algorítmica + resultados TREC.
- **[Por qué]** Condorcet es uno de los métodos que evaluarás; su fundamento cualitativamente distinto (mayoritario vs posicional) es una hipótesis testable.
- **[Origen]** Montague & Aslam (2002).

### 4.4.4 Fusión rank-based score-agnostic (RRF)
- **[Detalle]** Desarrollo completo + análisis de robustez a $k$ + resultados LETOR/TREC.
- **[Por qué]** RRF es el método más probable de ser tu mejor performer; merece tratamiento más extenso que los demás dada su centralidad.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

### 4.4.5 Fusión rank-based con modelo de usuario (RBC)
- **[Detalle]** Desarrollo completo + comportamiento asintótico en $\phi$ + concepto de retrieval consistency.
- **[Por qué]** RBC es uno de los métodos que evaluarás; el concepto de consistency es una métrica complementaria valiosa para evaluar estabilidad de tus fusiones.
- **[Origen]** Bailey et al. (2017).

### 4.4.6 Fusión léxico-semántica en la era neuronal [SECCIÓN CRÍTICA NUEVA]
- **[Detalle]** Discusión crítica + cuadro de propiedades + identificación de gaps.
- **[Por qué]** **Sin esta sección la tesis parece resucitar técnicas de 1994–2017 sin diálogo con la literatura moderna**; aquí es donde se cita Bruch et al. (2023), Karpukhin (2020) sobre interpolación lineal, Luan et al. (2021), y se posiciona explícitamente tu trabajo.
- **[Origen]** Hueco crítico identificado; fuentes: Bruch et al. (2023), Karpukhin et al. (2020), Luan et al. (2021), Lin (2022).

### 4.4.7 Fusión interna del modelo vs fusión externa de listas
- **[Detalle]** Discusión narrativa + tabla comparativa.
- **[Por qué]** **Es donde tu tesis encuentra su voz**: BGE-M3 fusiona internamente, tu propuesta fusiona externamente, y esta sección debe contrastar formalmente ambas filosofías; mencionar también model merging (SLERP) para completar el espectro.
- **[Origen]** BGE-M3, Qwen3-Embedding (SLERP), jina-reranker-v3 (linear merging).

---

## 4.5 Benchmarks de IR

### 4.5.1 Históricos: TREC, LETOR
- **[Detalle]** Mención + referencia.
- **[Por qué]** Son el contexto de toda la literatura clásica de fusión (CombSUM, Borda, Condorcet, RRF, RBC); imprescindibles para situar las cifras.
- **[Origen]** Fox & Shaw, Aslam & Montague, Montague & Aslam, Cormack et al.

### 4.5.2 MS MARCO y derivados (TREC DL 2019/2020/2021)
- **[Detalle]** Definición + tamaño + uso típico.
- **[Por qué]** Es el benchmark estándar para la cohorte 2020–2025 (SPLADE, ColBERT, jina-reranker-v3); referencia obligatoria para todas las cifras del capítulo.
- **[Origen]** Hueco identificado; fuentes: Bajaj et al. (2016); Craswell et al. (2019, 2020).

### 4.5.3 Multilingües: BEIR, MIRACL, Mr.TyDi, MTEB Multilingual
- **[Detalle]** Definición + características + cobertura de español.
- **[Por qué]** Son los benchmarks donde se reportan las cifras de los modelos que usarás; MIRACL en particular incluye español y permite comparar con MessIRve.
- **[Origen]** Thakur et al. (2021) BEIR, Zhang et al. (2023) MIRACL, Zhang et al. (2021) Mr.TyDi, Muennighoff et al. (2022) MTEB.

### 4.5.4 Robustez y consistencia: UQV100
- **[Detalle]** Definición + uso para evaluar fusión sobre variantes de consulta.
- **[Por qué]** Justifica metodológicamente la evaluación de estabilidad de fusiones, complementaria a relevancia.
- **[Origen]** Bailey et al. (2017).

### 4.5.5 MessIRve
- **[Detalle]** Desarrollo completo: tamaño, dominio, características, juicios, comparación con MIRACL-es.
- **[Por qué]** Es el benchmark central de tu tesis y debe presentarse exhaustivamente; sin esto, los lectores no pueden evaluar tu contribución específica.
- **[Origen]** Hueco crítico identificado; fuente: paper original de MessIRve (verificar cita).

---

## 4.6 Particularidades del español en IR

### 4.6.1 Tipología morfosintáctica y efectos sobre BM25
- **[Detalle]** Discusión + ejemplos concretos (flexión, derivación, género/número).
- **[Por qué]** Lo planteas explícitamente en tu Justificación como motivación de la tesis; debe articularse formalmente en el estado del arte. La morfología rica del español afecta directamente la coincidencia léxica de BM25 y la efectividad de la lematización.
- **[Origen]** Hueco identificado; fuentes: documentación de Snowball-ES, Freeling, spaCy-es.

### 4.6.2 Backbones específicos en español: BETO, RoBERTa-bne, MarIA
- **[Detalle]** Mención + referencia + comparación con backbones multilingües.
- **[Por qué]** Documenta la alternativa monolingüe que existe pero que no usas; justifica por qué eliges modelos multilingües (cobertura, calidad, infraestructura).
- **[Origen]** Hueco identificado; fuentes: Cañete et al. BETO, Gutiérrez-Fandiño et al. MarIA.

### 4.6.3 Resultados desglosados de modelos del §4.2 en español
- **[Detalle]** Tabla comparativa + análisis de la anomalía mE5-large vs mE5-base.
- **[Por qué]** Es la evidencia empírica directa de que el ranking entre modelos no es robusto en español; **motiva matemáticamente tu hipótesis** de que la fusión puede aportar más en español que en inglés.
- **[Origen]** mE5 (Wang et al. 2024); resultados desglosados en MIRACL-es.

### 4.6.4 Variedades dialectales y MessIRve
- **[Detalle]** Discusión sobre español rioplatense vs peninsular vs mexicano.
- **[Por qué]** MessIRve proviene de búsquedas reales de Argentina; documentar la dimensión dialectal evita generalizaciones inválidas a otras variedades del español.
- **[Origen]** Hueco identificado; motivado por el origen geográfico de MessIRve.

### 4.6.5 Translationese: mMARCO-es vs MIRACL-es vs nativo
- **[Detalle]** Discusión + implicaciones para validez externa.
- **[Por qué]** Jina-ColBERT-v2 documenta que mMARCO traducido sufre sesgo respecto a colecciones nativas; relevante para juzgar la validez de extrapolar de mMARCO a MessIRve.
- **[Origen]** Jina-ColBERT-v2 (Jha et al. 2024).

---

## 4.7 [OPCIONAL] Posicionamiento de esta tesis
- **[Detalle]** Síntesis narrativa (2–3 páginas).
- **[Por qué]** Cierra el capítulo articulando explícitamente los gaps que tu tesis aborda: evaluación sistemática de fusión rank-based en español sobre MessIRve, contraste fusión externa vs interna, modelos open-source vs propietarios. Útil pedagógicamente como puente al capítulo de metodología.
- **[Origen]** Síntesis transversal de los gaps identificados.

## Apéndice A — Preliminares matemáticos

### A.1 Entropía cruzada y softmax
- **[Detalle]** Definición + propiedades.
- **[Por qué]** Aparece en toda la familia InfoNCE/KL; el lector con formación en matemáticas aplicadas la conoce, pero conviene tenerla a mano para referencia.
- **[Origen]** Hueco prerrequisito; fuente: Goodfellow et al. (2016) caps. 3 y 5.

### A.2 Divergencia de Kullback-Leibler
- **[Detalle]** Definición + propiedades.
- **[Por qué]** Es el corazón de la destilación KL en §3.5.4; merece definición precisa accesible.
- **[Origen]** Hueco prerrequisito; fuente: Cover & Thomas (2006) cap. 2.

### A.3 SVD y Teorema de Eckart-Young
- **[Detalle]** Definición + enunciado del teorema.
- **[Por qué]** Es el fundamento matemático de LoRA (§3.5.2) y de la proyección lineal compresiva en ColBERT; el lector lo conoce, pero la conexión específica con técnicas modernas amerita recordatorio.
- **[Origen]** Hueco prerrequisito motivado por LoRA y ColBERT; fuente: Strang, *Introduction to Linear Algebra*; Eckart & Young (1936).

### A.4 Distribución geométrica
- **[Detalle]** Definición + momentos.
- **[Por qué]** RBC se basa explícitamente en ella; el lector puede haberla olvidado y conviene tenerla a mano.
- **[Origen]** Bailey et al. (2017).

### A.5 Tokenización subword (BPE, WordPiece, SentencePiece)
- **[Detalle]** Definición básica.
- **[Por qué]** Prerrequisito para todo lo neuronal; en español tiene implicaciones específicas (morfología rica) que se discuten en §4.6.
- **[Origen]** Hueco prerrequisito; fuente: Sennrich et al. (2016); Kudo (2018).