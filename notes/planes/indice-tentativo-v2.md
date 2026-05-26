Perfecto, con toda esta información puedo construir el esqueleto reestructurado. Antes de presentarlo, articulo brevemente la **filosofía de la nueva estructura** para que verifiques que está alineada con tu visión:

- **Marco teórico**: contiene (a) los fundamentos atemporales del problema, (b) los paradigmas y técnicas necesarias para entender los modelos, (c) **una subsección por cada modelo concreto** que usas (presentación formal/conceptual, no exhaustiva), y (d) los fundamentos matemáticos de los algoritmos de fusión.
- **Estado del arte**: contiene (a) MessIRve y otros benchmarks como objetos de comparación, (b) resultados publicados de los modelos del marco teórico sobre español/multilingüe (líneas base), (c) literatura específica sobre fusión de rangos en IR (incluyendo fusión léxico-semántica neuronal), (d) literatura sobre comparaciones fusión vs. reranking neuronal, (e) particularidades de español relevantes (sin backbones específicos).

---

# Esqueleto extendido del Marco Teórico y Estado del Arte (versión reestructurada)

Convenciones de nivel de detalle:
- *Definición básica*: 1–3 párrafos, sin demostraciones.
- *Desarrollo formal*: derivación matemática completa con propiedades.
- *Intuición + formalización*: motivación conceptual seguida de definición precisa.
- *Mención + referencia*: 1 párrafo con cita a fuente externa.
- *Ficha técnica*: presentación formal compacta de un modelo (1–3 páginas): backbone, esquema de entrenamiento, pérdida, características distintivas, posicionamiento dentro del paradigma.

---

# 3. Marco Teórico

## 3.1 Fundamentos de recuperación de información

### 3.1.1 Definiciones canónicas
- **[Detalle]** Definición básica.
- **[Contenido]** Definiciones formales de: corpus $\mathcal{D}$, documento $d$, consulta $q$, vocabulario $V$, ranking $\pi: \mathcal{D} \to \{1, \dots, |\mathcal{D}|\}$, función de puntuación $s: \mathcal{Q} \times \mathcal{D} \to \mathbb{R}$, juicios de relevancia (binarios y graduados) $\text{rel}(q, d)$, conjunto de relevantes $R_q$.
- **[Por qué]** Sin estas definiciones formales el resto del capítulo carece de objetos sobre los cuales razonar; toda formulación posterior las presupone.
- **[Origen]** Hueco prerrequisito; fuente: Manning, Raghavan & Schütze, *IIR* (2008), cap. 1.

### 3.1.2 Principio de Ordenación por Probabilidad (PRP)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Enunciado del PRP, supuestos sobre funciones de utilidad, demostración de que ordenar por $P(\text{Rel} \mid d, q)$ decreciente minimiza el riesgo bayesiano esperado, discusión de limitaciones (independencia entre documentos, costos uniformes).
- **[Por qué]** Es la hipótesis fundacional del paradigma probabilístico de IR y la justificación última de BM25 y de toda función de puntuación basada en relevancia estimada.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.1.3 Equivalencia de rango bajo transformaciones monótonas e inversión bayesiana
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Definición de la relación $\propto_q$ ("rank-equivalente para $q$"), demostración de que toda transformación monótona estricta preserva el ranking, derivación del paso de probabilidades a log-odds vía inversión bayesiana, conexión con el espacio de rankings que aparecerá en §3.7.
- **[Por qué]** Justifica el paso a log-odds en BM25 y, por extensión, la equivalencia entre formulaciones aparentemente distintas; conecta naturalmente con el formalismo de rankings de §3.7.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.1.4 Pipelines en cascada y la tarea de reordenamiento
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Esquema general de pipeline: recuperación inicial (recall-oriented) sobre todo el corpus → reordenamiento (precision-oriented) sobre top-$k$ candidatos; fundamentación de la cascada como respuesta al trade-off costo computacional vs efectividad; categorización de estrategias de reordenamiento: (a) reordenamiento neuronal por interacción profunda (cross-encoders, listwise LLMs); (b) reordenamiento por fusión de listas (rank fusion sobre múltiples retrievers); definición formal del problema de fusión como reordenamiento que toma $k$ rankings de entrada y produce uno de salida.
- **[Por qué]** Es la subsección que articula el objeto central de tu tesis. Sin ella, el lector no entiende por qué fusión y reranking neuronal son alternativas comparables: ambas son estrategias de reordenamiento. Conecta directamente con tu Objetivo General y con los Objetivos Específicos 3 y 4.
- **[Origen]** Síntesis transversal; fuentes: Nogueira & Cho (2019), SPLADE-v3 (cascada SPLADE→DeBERTaV3), Cormack et al. (2009).

---

## 3.2 Modelos léxicos: fundamentos

### 3.2.1 Modelo de espacio vectorial y TF-IDF
- **[Detalle]** Definición básica + desarrollo formal compacto.
- **[Contenido]** Vector de términos sobre $\mathbb{R}^{|V|}$, esquemas de pesado TF (frecuencia bruta, logarítmica, normalizada SMART), IDF (logarítmico, suavizado), similitud coseno, limitaciones.
- **[Por qué]** Es el marco contenedor de todos los modelos de bag-of-words y precursor conceptual de los embeddings modernos.
- **[Origen]** Hueco prerrequisito; fuente: Salton, Wong & Yang (1975); IIR cap. 6.

### 3.2.2 Modelo de Independencia Binaria (BIM) y peso RSJ
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Supuesto de independencia condicional de términos, derivación del peso Robertson-Spärck Jones $w_t = \log \frac{(r_t + 0.5)(N - n_t - R + r_t + 0.5)}{(R - r_t + 0.5)(n_t - r_t + 0.5)}$, mención de la *linked dependence* de Cooper.
- **[Por qué]** Puente lógico entre el PRP y BM25.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.3 Restricción al espacio de la consulta
- **[Detalle]** Desarrollo formal compacto.
- **[Contenido]** Argumento de cancelación para términos $t \notin q$, reducción a $V_q = q \cap V$, conexión con índices invertidos y anticipación de sparse encoders neuronales.
- **[Por qué]** Reduce el problema computacional al subconjunto activo y conecta con la estructura de los sparse encoders neuronales (§3.4.2).
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.4 Modelo de Elitismo (2-Poisson) y saturación no lineal
- **[Detalle]** Intuición + formalización.
- **[Contenido]** Hipótesis del eliteness, aproximación 2-Poisson, derivación heurística de $S(tf) = tf/(k_1 + tf)$, gráfica de saturación vs lineal.
- **[Por qué]** Justifica la saturación de TF en BM25 y reaparece como contraparte neuronal en SPLADE (log-ReLU).
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.5 Normalización suave por longitud
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Hipótesis verbosity vs scope, formulación $B = (1 - b) + b \cdot dl/\text{avgdl}$, comportamiento asintótico, rango empírico óptimo.
- **[Por qué]** El parámetro $b$ afecta directamente el comportamiento en español por la longitud variable derivada de morfología rica.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.6 Formulación canónica de BM25
- **[Detalle]** Desarrollo formal completo + ficha técnica del modelo.
- **[Contenido]** Ensamble final $\text{BM25}(q, d) = \sum_{t \in q} \text{IDF}(t) \cdot \frac{tf_{t,d} \cdot (k_1 + 1)}{tf_{t,d} + k_1 \cdot B_d}$, derivación como composición de §3.2.2–3.2.5, valores típicos $k_1 \in [1.2, 2.0]$, $b \in [0.5, 0.75]$, propiedades; mención breve de extensiones (BM25F, BM25+, BM25L) y de infraestructura de implementación (Anserini/Pyserini); rol de BM25 como uno de los retrievers base de tu sistema experimental.
- **[Por qué]** BM25 es el modelo léxico de tu sistema base; su ficha técnica completa debe vivir en el marco teórico junto con su derivación.
- **[Origen]** Robertson & Zaragoza (2009).

---

## 3.3 Representaciones vectoriales del lenguaje

### 3.3.1 Hipótesis distribucional y embeddings estáticos
- **[Detalle]** Intuición + formalización.
- **[Contenido]** Hipótesis de Harris (1954), formalización vía co-ocurrencia, mención esquemática de word2vec (skip-gram, CBOW) y GloVe, limitaciones de embeddings estáticos.
- **[Por qué]** Origen conceptual de toda la línea neuronal de IR.
- **[Origen]** Hueco prerrequisito; fuentes: Harris (1954); Mikolov et al. (2013); Pennington et al. (2014).

### 3.3.2 Arquitectura Transformer y atención (encoder bidireccional vs decoder causal)
- **[Detalle]** Desarrollo formal de atención escalada producto-punto; mención + referencia para el resto.
- **[Contenido]** Atención escalada producto-punto $\text{Attn}(Q, K, V) = \text{softmax}(QK^\top/\sqrt{d_k})V$, atención multi-cabeza, máscara causal vs ausencia de máscara (encoder bidireccional como BERT vs decoder causal como Qwen3), normalización de capa y conexiones residuales, implicaciones para extracción de embeddings.
- **[Por qué]** Toda la cohorte moderna depende del Transformer; la distinción encoder/decoder es crítica para Qwen3 y jina-v5 (causal + last-token pooling) frente a mE5 y SPLADE (bidireccional).
- **[Origen]** Vaswani et al. (2017); Phuong & Hutter (2022).

### 3.3.3 Embeddings contextuales y estrategias de pooling
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Estados ocultos $H \in \mathbb{R}^{n \times h}$, agregación a vector de secuencia: CLS pooling, mean pooling con/sin máscara, EOS/last-token pooling, justificación geométrica de cada esquema, equivalencia $\cos(u, v) = u \cdot v$ bajo normalización $L_2$.
- **[Por qué]** El pooling es decisión arquitectónica con consecuencias matemáticas concretas y aparece en todos los modelos del §3.6.
- **[Origen]** Prerrequisito BERT (Devlin et al. 2019); aplicaciones específicas en mE5, BGE-M3, Qwen3, jina-v5.

### 3.3.4 Tokenización subword
- **[Detalle]** Definición básica.
- **[Contenido]** Problema de OOV, idea de unidades subword, BPE (merges iterativos), WordPiece, SentencePiece, implicaciones para morfología rica del español (conexión con §5.x del estado del arte).
- **[Por qué]** Prerrequisito para todo lo neuronal; sin tokenización subword no se entiende cómo los modelos manejan flexión verbal y derivación en español.
- **[Origen]** Sennrich et al. (2016); Kudo (2018).

### 3.3.5 Embeddings guiados por instrucciones
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Concepto de prefijo de tarea, efecto sobre el espacio latente sin alterar pesos, contraste prefijos fijos (jina-v5: `Query:`/`Document:`) vs instrucciones libres (mE5-instruct), implicaciones para asimetría query/document.
- **[Por qué]** Mecanismo central en mE5-instruct, Qwen3-Embedding y jina-v5; el lector necesita entender que un mismo texto produce vectores distintos según el rol.
- **[Origen]** mE5-large-instruct, Qwen3-Embedding, jina-embeddings-v5.

---

## 3.4 Paradigmas de modelos neuronales para IR

### 3.4.1 Codificadores duales densos (Dense Bi-encoders)
- **[Detalle]** Definición formal canónica.
- **[Contenido]** Funciones $f_Q, f_D: \text{texto} \to \mathbb{R}^h$, score $s(q, d) = f_Q(q) \cdot f_D(d)$ o $\cos(\cdot)$, simetría/asimetría, ventaja del precómputo offline, limitación de la interacción solo en el producto interno.
- **[Por qué]** Paradigma de mE5, Qwen3, jina-v5 y harrier-oss; debe presentarse antes de las fichas técnicas.
- **[Origen]** Karpukhin et al. (2020).

### 3.4.2 Codificadores dispersos neuronales (Sparse Encoders)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Proyección a vocabulario $W_{\text{lex}} \in \mathbb{R}^{h \times |V|}$, cuantificación con activación no lineal (SPLADE: $\log(1+\text{ReLU}(\cdot))$, BGE-M3: $\text{ReLU}(\cdot)$), score $s_{\text{lex}} = \sum_{t \in q \cap d} w_{q_t} w_{d_t}$, conexión axiomática con saturación TF de §3.2.4, compatibilidad con índices invertidos.
- **[Por qué]** Paradigma de SPLADE-v3 y del componente sparse de BGE-M3; la conexión con la saturación TF (§3.2.4) es uno de los argumentos transversales más fuertes del marco teórico.
- **[Origen]** SPLADE (Formal et al. 2021); BGE-M3 (Chen et al. 2024).

### 3.4.3 Cross-encoders
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Función conjunta $f([q; d]) \to \mathbb{R}$ con atención cruzada plena entre tokens de $q$ y $d$, score como logit del CLS o como probabilidad de tokens yes/no en LLMs, ventaja vs limitación computacional, uso típico como reranker de top-$k$.
- **[Por qué]** Paradigma de bge-reranker-v2-m3 y competidor directo de la fusión en tu Objetivo Específico 4.
- **[Origen]** Nogueira & Cho (2019); bge-reranker-v2-m3.

### 3.4.4 Modelos de interacción tardía (operador MaxSim)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Embeddings por token $E_q \in \mathbb{R}^{|q| \times h}$, $E_d \in \mathbb{R}^{|d| \times h}$, MaxSim $S(q,d) = \sum_i \max_j E_{q_i} \cdot E_{d_j}^\top$, propiedades (no simetría), variante normalizada de BGE-M3, mecanismo de query augmentation con `[MASK]`.
- **[Por qué]** Paradigma de Jina-ColBERT-v2 y del componente multi-vector de BGE-M3; pieza central de tu pipeline experimental.
- **[Origen]** ColBERT (Khattab & Zaharia 2020); Jina-ColBERT-v2; BGE-M3.

### 3.4.5 Reordenamiento listwise con LLMs (Last but Not Late Interaction)
- **[Detalle]** Definición + intuición.
- **[Contenido]** Reformulación de reranking como tarea generativa/contextual sobre LLM: codificación conjunta de query y batch de candidatos en una misma ventana de contexto del decoder, atención cross-doc listwise, extracción de embeddings densos compactos por documento al final, cosine como score; contraste con cross-encoder pointwise (interacción interna entre docs vs interacción solo q-d) y con late interaction tradicional (interacción a nivel decisión final vs token-level).
- **[Por qué]** Es el paradigma de jina-reranker-v3, uno de los rerankers neuronales que evalúas; necesita formalización propia para distinguirlo de cross-encoders y de late interaction tipo ColBERT.
- **[Origen]** jina-reranker-v3 (Wang, Li & Xiao 2025).

### 3.4.6 Funciones de puntuación: propiedades y motivación de la fusión
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Tabla comparativa de propiedades por paradigma: dominio (acotado/no acotado), distribución empírica, sensibilidad a longitud, interpretabilidad probabilística; argumento matemático de por qué combinar scores heterogéneos sin normalización es problemático; introducción del eje conceptual score-fusion vs rank-fusion como respuesta a la heterogeneidad.
- **[Por qué]** **Subsección puente**: BM25 produce log-odds no acotados, los densos producen cosenos en $[-1,1]$, los sparse producen sumatorias no acotadas, MaxSim produce sumatorias estructuradas. Esta heterogeneidad es lo que motiva matemáticamente §3.7 y la elegancia de RRF.
- **[Origen]** Síntesis transversal.

---

## 3.5 Aprendizaje de representaciones

### 3.5.1 Funciones de pérdida contrastivas
- **[Detalle]** Desarrollo formal de InfoNCE canónica + variantes como modificaciones.
- **[Contenido]** Taxonomía pointwise/pairwise/listwise; InfoNCE $\mathcal{L} = -\log \frac{\exp(s(q, d^+)/\tau)}{\sum_{d \in \mathcal{B}} \exp(s(q, d)/\tau)}$; variantes: in-batch negatives, hard negatives, enmascaramiento de falsos negativos, pérdida bidireccional, CoSENT (listwise por orden), regularización dispersiva, Global Orthogonal Regularizer (GOR), regularización $L_1$ vs FLOPS (sparse).
- **[Por qué]** Toda la cohorte 2020–2026 entrena con variantes de InfoNCE.
- **[Origen]** mE5, BGE-M3, Qwen3, jina-v5 (GOR, CoSENT), SPLADE (FLOPS), jina-reranker-v3 (dispersive).

### 3.5.2 Fine-tuning eficiente: aproximaciones de bajo rango (LoRA)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Aproximación matricial de bajo rango (mención SVD/Eckart-Young, integrada aquí ya que se eliminó el apéndice); LoRA $W' = W + BA$ con $B \in \mathbb{R}^{h \times r}$, $A \in \mathbb{R}^{r \times h}$, $r \ll h$; hiperparámetros típicos ($r$, $\alpha$); proyección lineal compresiva $E_{\text{out}} = W \cdot E_{\text{Trans}}$ con $W \in \mathbb{R}^{m \times h}$.
- **[Por qué]** LoRA es central en jina-v5 (LoRA por tarea) y jina-reranker-v3 ($r=16, \alpha=32$).
- **[Origen]** Hu et al. (2021); jina-v5; jina-reranker-v3.

### 3.5.3 Hard negative mining
- **[Detalle]** Definición formal.
- **[Contenido]** Justificación geométrica vía análisis del gradiente de InfoNCE; estrategias: ANN-mined, BM25-mined, cross-system mining; filtrado por umbral de similitud (Qwen3: $\tau > 0.7$); escalado a 45+ negativos por consulta (jina-reranker-v3, SPLADE-v3).
- **[Por qué]** Motor empírico de prácticamente todos los modelos modernos; merece formalización canónica única.
- **[Origen]** mE5, SPLADE-v3, Qwen3, jina-reranker-v3.

### 3.5.4 Representaciones jerárquicas y truncables (MRL)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Formulación canónica $\mathcal{L}_{\text{MRL}} = \sum_{d \in \mathcal{M}} c_d \mathcal{L}(W^{(d)} X)$ con $\mathcal{M} = \{d_1 < d_2 < \dots < d_k\}$; variante con weight-tying vs sin weight-tying; trade-off efectividad/eficiencia; aplicación a vector único vs multi-vector.
- **[Por qué]** Ubicuo en Jina-ColBERT-v2 (multi-vector con 6 cabezas), Qwen3-Embedding y jina-v5; permite trade-offs explotables experimentalmente.
- **[Origen]** Kusupati et al. (2022); Jina-ColBERT-v2, Qwen3, jina-v5.

### 3.5.5 Destilación de conocimiento en IR
- **[Detalle]** Desarrollo formal de KL con softmax-temperatura y MarginMSE; mención + referencia para variantes.
- **[Contenido]** Esquema teacher-student; KL $\mathcal{L}_{\text{KD}} = \tau^2 D_{\text{KL}}(P_T^\tau \| P_S^\tau)$ (definición de KL integrada aquí, ya que se eliminó el apéndice); MarginMSE $\mathcal{L} = (m_T - m_S)^2$; combinación lineal multitarea; self-knowledge distillation (BGE-M3); destilación con proyección lineal entre dimensionalidades distintas (jina-v5).
- **[Por qué]** SPLADE-v3, Jina-ColBERT-v2, mE5 y jina-v5 dependen críticamente de destilación.
- **[Origen]** SPLADE-v3, Jina-ColBERT-v2, mE5, jina-v5, BGE-M3.

### 3.5.6 Fusión en el espacio de parámetros (model merging)
- **[Detalle]** Definición + intuición.
- **[Contenido]** Idea general: combinar checkpoints especializados en un único modelo; SLERP (Spherical Linear Interpolation) en Qwen3-Embedding; linear merging ponderado en jina-reranker-v3 (pesos 0.25–0.65 entre especialistas); contraste con fusión a nivel de listas y a nivel de scores.
- **[Por qué]** Es relevante para entender modelos como Qwen3 y jina-reranker-v3, y conecta narrativamente con la discusión de "fusión interna vs externa" del estado del arte.
- **[Origen]** Qwen3-Embedding (SLERP); jina-reranker-v3 (linear merging).

---

## 3.6 Modelos semánticos representativos

> **Nota narrativa**: esta sección presenta una **ficha técnica compacta** (1–3 páginas) por cada modelo que vas a usar experimentalmente. Cada ficha referencia los paradigmas (§3.4) y técnicas (§3.5) ya establecidos, evitando redundancia.

### 3.6.1 multilingual-E5-large-instruct
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone XLM-RoBERTa-large; paradigma dual-encoder denso (§3.4.1); pipeline dos etapas (preentrenamiento contrastivo débil 1B pares + SFT 1.6M pares con hard negatives + destilación de cross-encoder); pooling mean; instruction-tuning con instrucciones libres en lenguaje natural; cobertura 93 idiomas; conexión con §3.5.1, §3.5.3, §3.5.5.
- **[Por qué]** Modelo central en tu evaluación experimental; rol como retriever inicial para fusión y baseline individual.
- **[Origen]** Wang et al. (2024).

### 3.6.2 BGE-M3
- **[Detalle]** Ficha técnica + énfasis en multifuncionalidad.
- **[Contenido]** Backbone XLM-RoBERTa con preentrenamiento RetroMAE; **tres modalidades unificadas**: dense (§3.4.1), sparse (§3.4.2), multi-vector con MaxSim normalizado (§3.4.4); entrenamiento dos fases (1.2B pares no supervisados + SFT con MIRACL/Mr.TyDi y datos sintéticos); **self-knowledge distillation** con teacher como combinación lineal de las tres modalidades (§3.5.5); fusión interna $s_{\text{inter}} = w_1 s_{\text{dense}} + w_2 s_{\text{lex}} + w_3 s_{\text{mul}}$ como caso de score-fusion estática realizada a nivel de modelo; contexto 8K, cobertura 100+ idiomas.
- **[Por qué]** **Modelo conceptualmente central**: BGE-M3 internaliza la fusión, ofreciendo el espejo conceptual de tu propuesta de fusión externa. Esta tensión interna/externa es uno de los hilos narrativos más importantes de tu tesis.
- **[Origen]** Chen et al. (2024).

### 3.6.3 Qwen3-Embedding-0.6B
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone Qwen3 decoder-only con atención causal (§3.3.2); paradigma dual-encoder con last-token pooling (§3.3.3); pipeline tres etapas (preentrenamiento débil con 150M pares sintéticos generados por Qwen3-32B simulando agentes; SFT con 12M pares filtrados por similitud >0.7; **fusión SLERP de checkpoints** §3.5.6); MRL con dimensiones $\{32, 64, ..., 4096\}$ (§3.5.4); contexto 32K; instruction-tuning.
- **[Por qué]** Retriever inicial open-source de vanguardia y referencia para el contraste con propietarios (Objetivo Específico 5).
- **[Origen]** Zhang et al. (2025).

### 3.6.4 jina-embeddings-v5-text-small-retrieval
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone EuroBERT-210M / Qwen3-0.6B; paradigma dual-encoder; **adaptadores LoRA por tarea** (retrieval, STS, clustering, classification) (§3.5.2); entrenamiento dos etapas (destilación de Qwen3-Embedding-4B con proyección lineal §3.5.5; LoRA con base congelada); manejo de asimetría retrieval con prefijos fijos `Query:`/`Document:` (§3.3.5); contexto 32K vía interpolación RoPE; pérdida $\mathcal{L} = \lambda_{NCE}\mathcal{L}_{NCE}^{q\to d} + \lambda_D \mathcal{L}_{distill} + \lambda_S \mathcal{L}_{GOR}$; MRL.
- **[Por qué]** Mejor retriever individual en tus experimentos preliminares (nDCG@10 = 0.5115 sobre MessIRve); ilustra solución alternativa al multitarea vía LoRA.
- **[Origen]** Akram et al. (2026).

### 3.6.5 SPLADE-v3
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone BERT-base; paradigma sparse encoder (§3.4.2); cuantificación $\log(1 + \text{ReLU}(\cdot))$; regularización asimétrica $\lambda_q \neq \lambda_d$ con FLOPS (§3.5.1); destilación desde **ensamble de 5 cross-encoders** (MiniLM, RankT5, DeBERTaV3, DeBERTaV2, Electra) con MarginMSE rescored (§3.5.5); escalado a 100 negativos por consulta; mención breve de la evolución v1→v3 y de las variantes Lexical/DistilBERT/Doc; conexión axiomática con BM25 vía saturación de TF (§3.2.4).
- **[Por qué]** Sparse encoder de tu sistema base; ilustra concretamente la conexión TF-saturation neuronal con BM25.
- **[Origen]** Formal et al. (2021); Lassance et al. (2024).

### 3.6.6 Jina-ColBERT-v2
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone Jina-XLM-RoBERTa con FlashAttention y RoPE; paradigma late interaction (§3.4.4); preentrenamiento sobre RefinedWeb; entrenamiento dos fases (450M pares para preentrenamiento contrastivo simétrico + SFT con tripletas destiladas de jina-reranker-v2-base-multilingual); 14 idiomas (incluye español); 7 negativos por consulta; **MRL multi-vector con 6 cabezas independientes** ($d \in \{64, 96, 128, 256, 512, 768\}$); hallazgo crítico: weight-tying degrada late interaction; reducción 128→64 dim implica solo 1.59% caída en BEIR.
- **[Por qué]** Late interaction multilingüe de tu evaluación; modelo de reordenamiento neuronal alternativo a cross-encoders.
- **[Origen]** Jha et al. (2024).

### 3.6.7 bge-reranker-v2-m3
- **[Detalle]** Ficha técnica.
- **[Contenido]** Backbone derivado de BGE-M3; paradigma cross-encoder pointwise (§3.4.3); entrenamiento por destilación desde rerankers más grandes; cobertura multilingüe; mención breve del linaje monoBERT → monoT5 → bge-reranker como contexto.
- **[Por qué]** Reranker neuronal cross-encoder que evalúas; competidor directo de la fusión.
- **[Origen]** BAAI (2024).

### 3.6.8 jina-reranker-v3
- **[Detalle]** Ficha técnica con énfasis arquitectónico.
- **[Contenido]** Backbone Qwen3-0.6B (28 capas, 1024 hidden, 131K contexto); paradigma "Last but Not Late Interaction" (§3.4.5); MLP de proyección 1024→512→256; entrenamiento tres etapas (LoRA $r=16, \alpha=32$ con BGE-M3 data §3.5.2; escalado a 45 negativos con hard-neg cross-system de BGE/Jina/GTE/E5 con $\tau=0.05$ §3.5.3; **model merging lineal ponderado** entre especialistas §3.5.6); pérdida con regularización dispersiva.
- **[Por qué]** Reranker neuronal listwise de vanguardia; representa el SOTA contra el cual contrastar la fusión (Objetivo Específico 4).
- **[Origen]** Wang, Li & Xiao (2025).

---

## 3.7 Fundamentos matemáticos de la fusión de rangos

### 3.7.1 Formalización: rankings, score-fusion vs rank-fusion, analogía con teoría de elección social
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Espacio de rankings como permutaciones $\pi: \mathcal{D} \to \{1, \dots, |\mathcal{D}|\}$; distinción formal score-fusion vs rank-fusion; analogía teoría de elección social: documentos $\leftrightarrow$ candidatos, sistemas $\leftrightarrow$ votantes, fusión $\leftrightarrow$ regla de agregación; taxonomía (posicional vs mayoritario, supervisado vs no, score-based vs rank-based); mención del teorema de Arrow como contexto histórico-conceptual.
- **[Por qué]** Eje conceptual; sin distinguir formalmente score-fusion de rank-fusion el lector no entiende por qué evalúas RRF en lugar de CombSUM ni por qué la heterogeneidad de §3.4.6 es un problema.
- **[Origen]** Síntesis de Aslam & Montague (2001), Montague & Aslam (2002), Cormack et al. (2009).

### 3.7.2 Métodos basados en puntuaciones (CombSUM, CombMNZ, normalización)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** CombSUM $S(d) = \sum_i s_i(d)$; CombMNZ $S(d) = n_d \cdot \sum_i \tilde{s}_i(d)$; efecto coro como motivación de CombMNZ; técnicas de normalización: min-max, z-score, sigmoide; análisis del efecto sobre el ranking final; argumento de que la sensibilidad a escala es la principal limitación.
- **[Por qué]** CombMNZ es uno de los algoritmos que evaluarás; tus resultados preliminares muestran que es el mejor performer (nDCG@10 = 0.5517 sobre MessIRve), lo que merece tratamiento formal cuidadoso.
- **[Origen]** Fox & Shaw (1994); Aslam & Montague (2001).

### 3.7.3 Métodos posicionales basados en rangos (BordaFuse)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Borda canónico $P_i(d) = c - r_i(d) + 1$; agregación $S_{\text{Borda}}(d) = \sum_i P_i(d)$; Borda ponderado $S(d) = \sum_i \alpha_i P_i(d)$; lectura probabilística como esperanza bajo distribución uniforme de profundidad; comportamiento ante listas truncadas y de longitudes desiguales.
- **[Por qué]** Algoritmo que evaluarás; la lectura como modelo de usuario uniforme conecta con RBC y RRF y permite la unificación probabilística que es el clímax conceptual del capítulo.
- **[Origen]** Aslam & Montague (2001); Bailey et al. (2017).

### 3.7.4 Métodos mayoritarios y teoría de grafos semicompletos (Condorcet)
- **[Detalle]** Desarrollo formal con esbozo de teoremas.
- **[Contenido]** Grafo semicompleto de torneo $G = (\mathcal{D}, E)$ con aristas según mayorías pareadas; ganador de Condorcet; paradoja de Condorcet; teoremas (con esbozo): (T1) todo torneo tiene camino hamiltoniano; (T2) el grafo cocientado por SCC es transitivo; algoritmo Condorcet-fuse vía sort comparativo $O(nk \log n)$.
- **[Por qué]** Algoritmo que evaluarás; su fundamento en teoría de grafos lo distingue cualitativamente de los posicionales.
- **[Origen]** Montague & Aslam (2002).

### 3.7.5 Métodos probabilísticos y modelos de usuario (RBC)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Modelo de usuario con profundidad de parada estocástica; Rank-Biased Centroid $S_{\text{RBC}}(d) = \sum_i (1-\phi)\phi^{r_i(d)-1}$; análisis asintótico ($\phi \to 0$: first-past-the-post; $\phi \to 1$: conteo de popularidad); definición de la distribución geométrica integrada aquí (eliminación del apéndice); marco unificador de Bailey et al.: Borda, RBC y RRF como esperanzas bajo distintas distribuciones de profundidad.
- **[Por qué]** RBC es uno de los métodos centrales (nDCG@10 = 0.5485 sobre MessIRve, segundo mejor); su lectura como esperanza bajo distribución geométrica y la unificación con Borda y RRF es el aporte conceptual más fuerte del capítulo.
- **[Origen]** Bailey et al. (2017).

### 3.7.6 Fusión recíproca amortiguada (RRF)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Formulación $\text{RRF}(d) = \sum_i \frac{1}{k + r_i(d)}$; análisis del efecto de $k$; comportamiento asintótico ($k \to 0$ vs $k \to \infty$); invarianza de escala; complejidad computacional streaming; lectura como esperanza bajo una distribución específica (conexión con §3.7.5); justificación del valor por defecto $k = 60$.
- **[Por qué]** Algoritmo central; ilustra mejor que ningún otro la solución elegante a la heterogeneidad de §3.4.6.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

### 3.7.7 Fusión por rangos cuadráticos inversos (ISR)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Formulación $\text{ISR}(d) = \sum_i \frac{1}{r_i(d)^2}$; lectura como caso límite o variante de la familia rank-based con decaimiento más agresivo que RRF; análisis comparativo con RRF y RBC en términos de ponderación posicional; conexión con su origen en fusión multimodal.
- **[Por qué]** ISR está en tu lista de algoritmos a evaluar; necesita su propia subsección con derivación formal.
- **[Origen]** Mourão et al. (2015).

---

## 3.8 Evaluación en recuperación de información

### 3.8.1 Métricas estándar (P@k, R@k, MAP, MRR, nDCG)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Definiciones: $P@k$, $R@k$, $AP$, MAP, MRR, DCG, nDCG; propiedades: monotonía, ámbito (set-based vs rank-based), sensibilidad a profundidad; cuándo usar cada una; justificación de las elecciones específicas declaradas en tu Justificación: nDCG@10, Recall@100, MRR@10, MAP, P@10, P@50.
- **[Por qué]** Métricas explícitas de tu evaluación experimental; ningún paper de los que extrajiste las define rigurosamente.
- **[Origen]** Hueco prerrequisito; fuente: IIR cap. 8; Sanderson (2010).

### 3.8.2 Variantes bajo juicios incompletos (nDCG*)
- **[Detalle]** Definición básica.
- **[Contenido]** Problema de juicios incompletos en colecciones modernas (pooling), formulación de nDCG*, mención de bpref como métrica robusta alternativa.
- **[Por qué]** MessIRve probablemente presenta juicios incompletos; útil tener la variante documentada como nota técnica.
- **[Origen]** SPLADE-v3.

### 3.8.3 Similitud entre listas de ranking (Kendall τ vs RBO)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Kendall $\tau$; limitaciones (requiere listas conjuntivas, no ponderado); RBO con persistencia $\phi$: $\text{RBO} = (1-\phi)\sum_d \phi^{d-1} A_d$; propiedades de RBO (top-weighted, robusto a listas disjuntas, parametrizable); aplicación al concepto de retrieval consistency.
- **[Por qué]** RBO es métrica natural para evaluar consistencia entre las listas que vas a fusionar; complementa la evaluación de relevancia con evaluación de estabilidad.
- **[Origen]** Bailey et al. (2017).

### 3.8.4 Búsqueda eficiente: ANN, HNSW, IVF, búsqueda multi-vector
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Problema de la búsqueda exacta en alta dimensionalidad; ANN; HNSW (jerárquico); IVF (clustering + búsqueda en celdas); FAISS como implementación; búsqueda multi-vector para late interaction (PLAID); trade-off recall vs latencia.
- **[Por qué]** Jina-ColBERT-v2 requiere búsqueda multi-vector especializada; el lector necesita saber que la viabilidad de los modelos densos depende de estas estructuras.
- **[Origen]** ColBERT, Jina-ColBERT-v2; fuentes: Malkov & Yashunin (2018); Johnson et al. (2019).

### 3.8.5 Pruebas de significancia estadística
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Paired t-test, Wilcoxon signed-rank, randomization/permutation test (preferido en IR moderno), corrección por comparaciones múltiples (Bonferroni, Holm), interpretación de p-values.
- **[Por qué]** Necesarias para justificar las comparaciones empíricas del capítulo experimental.
- **[Origen]** Smucker, Allan & Carterette (2007).

### 3.8.6 Eficiencia computacional: latencia, throughput, costo de indexación
- **[Detalle]** Definición + intuición.
- **[Contenido]** Métricas de eficiencia: latencia por consulta (ms), throughput (q/s), tiempo y memoria de indexación, tamaño de índice; trade-off relevancia vs eficiencia formalizado; FLOPS como métrica intrínseca para sparse encoders.
- **[Por qué]** Tu Objetivo Específico 4 incluye comparación en eficiencia computacional entre fusión y reranking neuronal; sin métricas formalizadas la comparación queda hueca.
- **[Origen]** SPLADE-v3 (FLOPS); ColBERT (latencia); jina-reranker-v3.

---

# 4. Estado del Arte

> **Nota narrativa**: este capítulo no reintroduce los modelos del marco teórico, sino que reporta sus **resultados publicados** sobre benchmarks comparables, los **trabajos previos en fusión de rangos** (especialmente en español y multilingüe), y los **estudios comparativos fusión vs reranking neuronal**. Su rol es proveer las cifras y los antecedentes contra los que se medirá tu contribución.

---

## 4.1 Benchmarks de IR para evaluación comparativa

### 4.1.1 Históricos: TREC y LETOR
- **[Detalle]** Mención + referencia.
- **[Contenido]** Tracks TREC clásicos (3, 5, 9, Web Track) como contexto de la literatura de fusión; LETOR 3 como dataset estándar para Learning-to-Rank y validación histórica de RRF; limitación: dominios y tamaños restringidos comparados con benchmarks modernos.
- **[Por qué]** Contexto de toda la literatura clásica de fusión (CombSUM, Borda, Condorcet, RRF, RBC); imprescindible para situar las cifras de §4.4.
- **[Origen]** Fox & Shaw, Aslam & Montague, Montague & Aslam, Cormack et al.

### 4.1.2 MS MARCO y derivados (TREC DL 2019/2020/2021, mMARCO)
- **[Detalle]** Definición + tamaño + uso típico.
- **[Contenido]** MS MARCO: 8.8M pasajes, 1M queries, dominio web; TREC DL 2019/2020/2021 sobre el corpus MS MARCO con juicios densos; mMARCO como traducción multilingüe (incluye español); fenómeno *translationese* documentado por Jha et al. (2024).
- **[Por qué]** Benchmark estándar para la cohorte 2020–2025 (SPLADE, ColBERT, jina-reranker-v3); referencia obligatoria para contextualizar las cifras reportadas en §4.3.
- **[Origen]** Bajaj et al. (2016); Craswell et al. (2019, 2020).

### 4.1.3 BEIR: zero-shot multidominio
- **[Detalle]** Definición + características.
- **[Contenido]** 13 datasets zero-shot multidominio; métrica nDCG@10; hallazgo crítico: dense encoders fallan en zero-shot OOD respecto a BM25; rol como benchmark de robustez.
- **[Por qué]** Benchmark de referencia para los modelos del §3.6 en zero-shot; cifras BEIR de jina-reranker-v3 (61.85), SPLADE-v3 (51.7) y BGE-M3 son referenciables.
- **[Origen]** Thakur et al. (2021).

### 4.1.4 MIRACL y Mr.TyDi: IR multilingüe nativo
- **[Detalle]** Definición + características + cobertura de español.
- **[Contenido]** MIRACL (Zhang et al. 2023): 16+ idiomas con datos nativos (no traducidos), incluye español, métrica nDCG@10/Recall@100, profundidad de pooling y completitud de juicios; Mr.TyDi como colección multilingüe usada en SFT; particularidades de MIRACL-es: tamaño, dominio (Wikipedia), número de queries, número de relevantes promedio; rol como complemento natural a MessIRve.
- **[Por qué]** Es el benchmark con cobertura nativa de español más establecido; permite contextualizar el rendimiento de los modelos del §3.6 en español antes de discutir MessIRve.
- **[Origen]** Zhang et al. (2023, 2021).

### 4.1.5 MTEB y MTEB Multilingual
- **[Detalle]** Definición.
- **[Contenido]** Agregación masiva de tareas (retrieval, classification, clustering, STS); MTEB Multilingual incluye español; métrica de referencia para Qwen3 (70.58 superando Gemini-Embedding 68.37 y text-embedding-3-large 58.93).
- **[Por qué]** Permite contextualizar las cifras de modelos open-source vs propietarios, relevante para tu Objetivo Específico 5.
- **[Origen]** Muennighoff et al. (2022).

### 4.1.6 UQV100: robustez ante variaciones de consulta
- **[Detalle]** Definición + uso.
- **[Contenido]** 100 tópicos × 5,765 query variations; concepto de Retrieval Consistency medida con RBO; uso para evaluar estabilidad de fusiones.
- **[Por qué]** Justifica metodológicamente la evaluación de estabilidad de fusiones, complementaria a relevancia.
- **[Origen]** Bailey et al. (2017).

### 4.1.7 MessIRve: descripción exhaustiva
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Tamaño del corpus, número de queries (~700K), dominios cubiertos, origen de los datos (queries reales de la API de autocompletado de Google), procedimiento de juicios de relevancia (graduados/binarios, profundidad de pooling, número de anotadores, $\kappa$ de acuerdo), cobertura dialectal (rioplatense/argentino), comparación cuantitativa con MIRACL-es (tamaño, dominio, naturalidad de queries, completitud de juicios), licencia y disponibilidad; **líneas base reportadas en el paper original** incluyendo modelos propietarios (text-embedding-3-large de OpenAI) que serán objeto explícito de comparación en tu Objetivo Específico 5; fortalezas y limitaciones.
- **[Por qué]** Benchmark central de tu tesis y fuente principal de las líneas base contra las que compararás (Objetivo Específico 5).
- **[Origen]** Valentini et al. (2025).

---

## 4.2 Recuperación de información en español

### 4.2.1 Particularidades del español: efectos sobre BM25 y modelos neuronales
- **[Detalle]** Discusión + ejemplos concretos.
- **[Contenido]** Características morfosintácticas: flexión verbal rica, flexión nominal, derivación productiva, clíticos pronominales, libertad de orden; impacto sobre BM25: reducción de coincidencia léxica exacta; efectividad de stemming (Snowball-ES) y lematización (Freeling, spaCy-es) como atenuantes; conexión con tokenización subword (§3.3.4) en modelos neuronales como mecanismo alternativo; comparación cualitativa con inglés.
- **[Por qué]** Está en tu Justificación como motivación central; debe articularse formalmente. Conexión directa con tu Objetivo Específico 6 (analizar complementariedad léxico-semántico en español).
- **[Origen]** Hueco identificado; documentación de Snowball-ES, Freeling, spaCy-es.

### 4.2.2 Variedades dialectales y validez externa
- **[Detalle]** Discusión.
- **[Contenido]** Panorama de variedades: peninsular, mexicano, rioplatense (Argentina/Uruguay), caribeño, andino; diferencias léxicas/sintácticas relevantes para IR (vocabulario regional, formas de tratamiento, queries idiomáticas); MessIRve como muestra de español rioplatense; implicaciones para validez externa: resultados en MessIRve no extrapolan automáticamente a otras variedades; mención del code-switching español-inglés en queries técnicas.
- **[Por qué]** MessIRve proviene de búsquedas reales de Argentina; documentar la dimensión dialectal evita generalizaciones inválidas.
- **[Origen]** Hueco identificado; motivado por origen geográfico de MessIRve.

### 4.2.3 Translationese: mMARCO-es vs MIRACL-es vs queries nativas
- **[Detalle]** Discusión + implicaciones para validez externa.
- **[Contenido]** Definición de translationese; evidencia empírica de Jha et al.: modelos entrenados solo en mMARCO traducido sufren caída en colecciones nativas; gradiente de naturalidad: mMARCO-es (traducido) → MIRACL-es (anotación nativa sobre Wikipedia) → MessIRve (queries nativas reales); implicaciones metodológicas para tu evaluación.
- **[Por qué]** Justifica priorizar MessIRve como benchmark principal y advertir sobre la interpretación de mejoras en mMARCO-es.
- **[Origen]** Jha et al. (2024).

### 4.2.4 Resultados publicados en español de los modelos del §3.6
- **[Detalle]** Tabla comparativa exhaustiva + análisis.
- **[Contenido]** Tabla de resultados en MIRACL-es (nDCG@10 y Recall@100): mE5-small (51.2/87.6), base (52.9/88.6), large (51.5/89.1), instruct (53.7/89.3); Qwen3-Embedding-0.6B/4B/8B (cuando reportados); jina-embeddings-v5; BGE-M3 (dense/sparse/multivec/inter); Jina-ColBERT-v2; SPLADE-v3 (cuando reportado); bge-reranker-v2-m3 (≈69.32); jina-reranker-v3 (66.83 en MIRACL-es, −2.49 vs bge-reranker-v2-m3); **anomalía mE5**: large (51.5) inferior a base (52.9) en español pese a ser superior en multilingüe promedio; análisis de gap entre mejor modelo y BM25 en español vs en inglés (gap menor en español ⇒ mayor margen de mejora por fusión); evidencia empírica que fundamenta la hipótesis de complementariedad de tu tesis (Objetivo Específico 6).
- **[Por qué]** **Sección crítica para tu posicionamiento**: provee las cifras concretas con las que compararás, identifica anomalías que justifican experimentalmente la fusión, y articula la evidencia empírica detrás de tu Objetivo Específico 6.
- **[Origen]** mE5 (Wang et al. 2024); resultados desglosados de los demás modelos en MIRACL-es y benchmarks comparables.

---

## 4.3 Reordenamiento neuronal: estado del arte

### 4.3.1 Cross-encoders pointwise/pairwise: monoBERT, monoT5, RankT5
- **[Detalle]** Mención + referencia + cifras.
- **[Contenido]** monoBERT (Nogueira & Cho 2019): primer cross-encoder neuronal aplicado a reranking, MS MARCO MRR@10 = 0.365; monoT5 (Nogueira et al. 2020): reformulación seq2seq con tokens true/false; RankT5 (Zhuang et al. 2023): listwise dentro del paradigma generativo; comparación de esquemas de entrenamiento (pointwise BCE vs pairwise margin vs listwise listMLE); cifras representativas en MS MARCO y BEIR.
- **[Por qué]** Antecedentes históricos de bge-reranker-v2-m3 y jina-reranker-v3; necesario para contextualizar el linaje de los rerankers que evalúas.
- **[Origen]** Nogueira & Cho (2019); Nogueira et al. (2020); Zhuang et al. (2023).

### 4.3.2 Listwise rerankers con LLMs: RankGPT, RankZephyr, RankVicuna
- **[Detalle]** Mención + referencia + cifras.
- **[Contenido]** RankGPT (Sun et al. 2023): primer uso de LLMs como rerankers listwise zero-shot vía sliding window; RankZephyr/RankVicuna (Pradeep et al. 2023): destilación de RankGPT a modelos abiertos; cifras representativas en BEIR; antecedente directo de jina-reranker-v3 con paradigma "Last but Not Late".
- **[Por qué]** Linaje narrativo de jina-reranker-v3; sin estos antecedentes el paradigma listwise queda flotando sin historia.
- **[Origen]** Sun et al. (2023); Pradeep et al. (2023).

### 4.3.3 Resultados publicados de bge-reranker-v2-m3 y jina-reranker-v3
- **[Detalle]** Tabla comparativa + análisis.
- **[Contenido]** Cifras en BEIR, MIRACL, MS MARCO de los rerankers que usas; jina-reranker-v3 BEIR 61.85 (supera mxbai-rerank-large-v2 1.5B), HotpotQA 78.58, FEVER 94.01, MIRACL 66.83 (−2.49 vs bge-reranker-v2-m3 ≈ 69.32); discusión: bge-reranker-v2-m3 supera a jina-reranker-v3 en MIRACL; rol específico en cascadas (top-50, top-100); relación con tus resultados preliminares en MessIRve (jina-reranker-v3 = 0.5792 vs bge-reranker-v3-m3 = 0.5770).
- **[Por qué]** Provee las cifras de comparación directa entre tus rerankers neuronales y posiciona tus resultados sobre MessIRve dentro de la literatura.
- **[Origen]** BAAI (2024); Wang, Li & Xiao (2025).

### 4.3.4 Cascadas y trade-offs efectividad/eficiencia
- **[Detalle]** Discusión + tabla.
- **[Contenido]** Pipeline en cascada como patrón estándar; hallazgo SPLADE-v3: top-50 con DeBERTaV3 maximiza efectividad por unidad de latencia (excepción ArguAna); ColBERT 170× más rápido que cross-encoder BERT; tabla comparativa: latencia (ms/query) vs efectividad (nDCG@10) para cada paradigma; discusión sobre cuándo el reranking neuronal supera a la fusión y cuándo no.
- **[Por qué]** Tu Objetivo Específico 4 incluye comparación en eficiencia; sin esta discusión la comparación queda incompleta.
- **[Origen]** SPLADE-v3; ColBERT; jina-reranker-v3.

---

## 4.4 Fusión de rangos: estado del arte

### 4.4.1 Fusión score-based clásica: hallazgos de Fox & Shaw
- **[Detalle]** Desarrollo completo + cifras.
- **[Contenido]** Recapitulación formal desde §3.7.2; **hallazgo del efecto coro**: combinar paradigmas divergentes (vector + booleano P-norm) supera combinar variantes similares; resultados TREC-3: modelos individuales SV 0.1340, LV 0.1960, P-norm 0.2062–0.2270; fusión homogénea Pn1.0+Pn1.5 = 0.2183 (estanca); fusión heterogénea LV+Pn1.5 = 0.3104; VTc5s (5 sistemas) 0.2914 vs VTc2s (2 sistemas selectos) 0.3021 → más sistemas no implica mejor; necesidad crítica de normalización; ancla la hipótesis de tu tesis (combinación de paradigmas heterogéneos).
- **[Por qué]** El hallazgo de Fox & Shaw (combinar paradigmas divergentes > combinar variantes similares) ancla tu hipótesis y justifica empíricamente tu Objetivo Específico 6.
- **[Origen]** Fox & Shaw (1994).

### 4.4.2 Fusión rank-based posicional y mayoritaria: Borda, Bayes-fuse, Condorcet
- **[Detalle]** Desarrollo + cifras.
- **[Contenido]** Resultados TREC 3/5/9: Weighted Borda-fuse $\approx$ CombMNZ, ambos superan al mejor sistema individual mayoritariamente; subset Vogt (TREC 5): la diversidad de sistemas multiplica la ganancia; Bayes-fuse como versión supervisada con log-odds entrenados; Condorcet-fuse: reducción algorítmica al sort, resolución de ciclos vía SCC y caminos hamiltonianos; resultados TREC-3/5: Condorcet supera Borda-fuse y rCombMNZ sin necesidad de calibrar scores.
- **[Por qué]** Cifras de comparación para los algoritmos que evaluarás (Borda, Condorcet); contextualiza por qué los métodos no supervisados son atractivos cuando no hay datos de calibración.
- **[Origen]** Aslam & Montague (2001); Montague & Aslam (2002).

### 4.4.3 Fusión rank-based score-agnostic: RRF
- **[Detalle]** Desarrollo + cifras.
- **[Contenido]** Resultados LETOR 3 MAP = 0.6051 vs Condorcet 0.5917 ($p \approx 0.004$); en TREC supera líneas base 4–5%; **robustez de $k$**: variación piloto $k \in [0, 500]$ → MAP estable, óptimo cerca de $k = 60$; comparación con métodos de Learning-to-Rank tempranos (RankSVM, RankBoost): RRF compite o supera sin entrenamiento; ventajas decisivas: invarianza de escala, cómputo streaming, un solo hiperparámetro.
- **[Por qué]** RRF es el método más usado en la literatura moderna de fusión léxico-semántica (§4.4.5); tratamiento extenso justifica su prominencia experimental.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

### 4.4.4 Fusión rank-based con modelo de usuario: RBC
- **[Detalle]** Desarrollo + cifras.
- **[Contenido]** Aplicación en UQV100 (100 tópicos × 5,765 query variations): fusión sobre variaciones sintácticas de la consulta supera a la mejor query individual; **Retrieval Consistency**: medida con RBO, propiedad ortogonal a la efectividad, correlaciona fuerte con métricas profundas y débil con superficiales; robustez a listas truncadas y de longitudes desiguales (ventaja sobre Borda).
- **[Por qué]** RBC es uno de los algoritmos centrales de tu evaluación; las cifras de Bailey et al. proveen referencia.
- **[Origen]** Bailey et al. (2017).

### 4.4.5 Fusión léxico-semántica en la era neuronal
- **[Detalle]** Discusión crítica + cuadro de propiedades + identificación de gaps.
- **[Contenido]** **Bruch et al. (2023)** "An Analysis of Fusion Functions for Hybrid Retrieval" (ICTIR): análisis crítico moderno de RRF en contexto dense+sparse, identificación de cuándo realmente aporta y cuándo no, formalización del hybrid retrieval; **Karpukhin et al. (2020)**: interpolación lineal BM25+DPR como baseline híbrido, cifras en NaturalQuestions; **Luan et al. (2021)** "Sparse, Dense, and Attentional Representations": comparación teórica/empírica de las tres familias; **Lin (2022)** "A Proposed Conceptual Framework": marco unificador para representational approach; **Ma et al. (2021)** sobre normalización en hybrid retrieval; **Lin et al. (2023)** sobre fusión BM25+SPLADE+ColBERT; cuadro de propiedades: cuándo hybrid > dense, cuándo dense > hybrid, qué papel juega la normalización; **posicionamiento explícito de la tesis**: ningún trabajo previo evalúa sistemáticamente la familia completa de rank-fusion (RRF, RBC, Borda, Condorcet, CombMNZ, ISR) sobre representaciones modernas en español.
- **[Por qué]** **Sección crítica**: sin esta discusión la tesis parece resucitar técnicas de 1994–2017 sin diálogo con la literatura moderna; aquí se documenta el estado del arte de hybrid retrieval contra el cual tu trabajo se posiciona.
- **[Origen]** Bruch et al. (2023); Karpukhin et al. (2020); Luan et al. (2021); Lin (2022); Ma et al. (2021).

### 4.4.6 Fusión interna del modelo vs fusión externa de listas vs fusión paramétrica
- **[Detalle]** Discusión narrativa + tabla comparativa.
- **[Contenido]** Tres niveles de fusión: (a) **fusión interna** (BGE-M3 con $s_{\text{inter}} = w_1 s_d + w_2 s_l + w_3 s_m$ entrenada conjuntamente); (b) **fusión externa de listas** (RRF, RBC, Borda, Condorcet, CombMNZ, ISR aplicados post-hoc sobre rankings independientes); (c) **fusión en el espacio de parámetros** (SLERP en Qwen3, linear merging en jina-reranker-v3); tabla comparativa: requiere training conjunto, requiere alineación de scores, robustez ante drift de distribución, costo de mantenimiento, modularidad; argumento sobre por qué la fusión externa sigue siendo relevante (modularidad, componibilidad, no requiere reentrenamiento).
- **[Por qué]** **Es donde tu tesis encuentra su voz**: BGE-M3 fusiona internamente, tu propuesta fusiona externamente; esta sección contrasta formalmente ambas filosofías y articula el aporte conceptual de tu trabajo.
- **[Origen]** BGE-M3; Qwen3-Embedding (SLERP); jina-reranker-v3 (linear merging).

### 4.4.7 Fusión de rangos en español y otras lenguas no inglesas
- **[Detalle]** Revisión + identificación de gaps.
- **[Contenido]** Revisión sistemática de trabajos previos que aplican fusión de rangos a IR en español (CLEF tracks históricos, trabajos sobre colecciones EFE, trabajos en SEPLN); revisión análoga sobre otras lenguas no inglesas (chino, árabe, hindi en MIRACL/Mr.TyDi); contraste con la abundancia de trabajos en inglés; **identificación explícita del gap**: ningún trabajo sistemático evalúa la familia completa de rank-fusion sobre representaciones neuronales modernas en español sobre un benchmark de queries nativas reales como MessIRve.
- **[Por qué]** **Respuesta directa a la instrucción 2.2(a) de tu asesora**: documenta otros trabajos de fusión de rangos aplicados a IR en español/otras lenguas y cierra el gap con tu posicionamiento.
- **[Origen]** Revisión bibliográfica nueva: CLEF Ad-Hoc Track (ediciones con español), trabajos en SEPLN/IberLEF, papers de MIRACL en lenguas no inglesas, Lin et al. (2021) sobre Mr.TyDi.

---

## 4.5 Comparaciones empíricas: fusión vs reordenamiento neuronal

### 4.5.1 Estudios comparativos directos
- **[Detalle]** Revisión + cifras + análisis.
- **[Contenido]** Revisión de trabajos que comparan empíricamente fusión de rangos contra reordenamiento neuronal sobre los mismos retrievers base; cifras representativas: comparaciones reportadas en BEIR, MS MARCO, MIRACL; hallazgos generales sobre cuándo el reranking neuronal supera a la fusión y cuándo la fusión es competitiva; identificación de factores que modulan el resultado (calidad de los retrievers base, diversidad de paradigmas, longitud de la lista candidata, dominio); discusión específica de si existe evidencia previa de comparación sistemática en español.
- **[Por qué]** **Respuesta directa a la instrucción 2.2(c) de tu asesora**: documenta trabajos previos que comparan reranking neuronal vs fusión y posiciona tu Objetivo Específico 4.
- **[Origen]** Revisión bibliográfica: Bruch et al. (2023), Pradeep et al. (2023), Lin (2022), trabajos sobre cascadas SPLADE→cross-encoder.

### 4.5.2 Eficiencia computacional comparada
- **[Detalle]** Tabla comparativa + análisis.
- **[Contenido]** Cifras de latencia y costo computacional reportadas en la literatura: cross-encoders (alta latencia, requieren GPU, costo $O(k)$ por consulta sobre top-$k$); late interaction (latencia intermedia, requieren índice multi-vector); listwise LLMs (latencia más alta por longitud de contexto, requieren GPU de alta memoria); fusión de rangos (latencia marginal, $O(k \log k)$ sin inferencia neuronal adicional, paralelizable); tabla comparativa con cifras de SPLADE-v3, ColBERT, jina-reranker-v3; argumento sobre por qué la fusión es atractiva en escenarios con restricciones de latencia o sin GPU.
- **[Por qué]** Tu Objetivo Específico 4 explicita "eficiencia computacional" como dimensión de comparación; sin esta sección la comparación queda incompleta.
- **[Origen]** SPLADE-v3, ColBERT, jina-reranker-v3, Bruch et al. (2023).

---

## 4.6 Posicionamiento de esta tesis

- **[Detalle]** Síntesis narrativa (2–3 páginas).
- **[Contenido]** Recapitulación de los gaps identificados a lo largo del capítulo: 
  1. **Gap empírico en español**: ausencia de evaluación sistemática de la familia completa de rank-fusion sobre representaciones modernas en español sobre queries nativas reales (§4.4.7).
  2. **Gap conceptual**: falta de contraste explícito entre fusión interna (BGE-M3), fusión externa de listas (RRF, RBC, Borda, Condorcet, CombMNZ, ISR) y fusión paramétrica (SLERP, model merging) (§4.4.6).
  3. **Gap comparativo**: ausencia de comparación rigurosa entre fusión y reranking neuronal en términos conjuntos de relevancia y eficiencia sobre español (§4.5).
  4. **Gap de accesibilidad**: escasez de evidencia sobre modelos open-source vs propietarios en español nativo (§4.1.7, §4.2.4).
  
  Articulación de cómo cada uno de estos gaps mapea a tus objetivos específicos:
  - Gap 1 → Objetivos Específicos 2 y 3 (implementación y evaluación sistemática).
  - Gap 2 → Objetivo Específico 6 (análisis de complementariedad léxico-semántico).
  - Gap 3 → Objetivo Específico 4 (comparación fusión vs reranking neuronal).
  - Gap 4 → Objetivo Específico 5 (open-source vs propietarios).
  
  Pregunta de investigación refinada: *¿qué tipo de fusión —externa por scores, externa por rangos, contrastada con reranking neuronal— aporta más en español sobre queries nativas, y bajo qué condiciones?*; puente narrativo al capítulo de metodología.
- **[Por qué]** Cierra el capítulo articulando explícitamente los gaps que tu tesis aborda y los mapea a tus objetivos específicos. Útil pedagógicamente como puente al capítulo de metodología y como justificación última de la contribución.
- **[Origen]** Síntesis transversal de los gaps identificados a lo largo del capítulo.

---

Notas:

1. **Sobre §4.2.4 (resultados en español)**: hay una decisión que conviene clarificar. La tabla con cifras MIRACL-es de los modelos puede vivir en (a) §4.2.4 como sección separada, o (b) integrada dentro de cada ficha técnica del §3.6. Mi recomendación es (a) porque mantiene el principio "marco teórico = qué es el modelo, estado del arte = cómo se desempeña empíricamente". ¿De acuerdo?

2. **Sobre §4.4.7 (fusión en español)**: requerirá búsqueda bibliográfica activa. Si después de buscar no encuentras suficiente material, esta subsección puede convertirse en una nota crítica corta documentando explícitamente la **escasez** de literatura, lo cual *en sí mismo* refuerza el gap que tu tesis cubre. Esto convierte la ausencia en argumento.
