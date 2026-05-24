# Esqueleto extendido del Marco Teórico y Estado del Arte (versión completa)

Convenciones de nivel de detalle:
- *Definición básica*: 1–3 párrafos, sin demostraciones.
- *Desarrollo formal*: derivación matemática completa con propiedades.
- *Intuición + formalización*: motivación conceptual seguida de definición precisa.
- *Mención + referencia*: 1 párrafo con cita a fuente externa.

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
- **[Contenido]** Definición de la relación $\propto_q$ ("rank-equivalente para $q$"), demostración de que toda transformación monótona estricta preserva el ranking, derivación del paso de probabilidades a log-odds vía inversión bayesiana, conexión con el espacio de rankings que aparecerá en §3.6.
- **[Por qué]** Justifica el paso a log-odds en BM25 y, por extensión, la equivalencia entre formulaciones aparentemente distintas; conecta naturalmente con el formalismo de rankings de §3.6.
- **[Origen]** Robertson & Zaragoza (2009).

---

## 3.2 Modelos léxicos: fundamentos

### 3.2.1 Modelo de espacio vectorial y TF-IDF
- **[Detalle]** Definición básica + desarrollo formal compacto.
- **[Contenido]** Vector de términos sobre $\mathbb{R}^{|V|}$, esquemas de pesado TF (frecuencia bruta, logarítmica, normalizada SMART), IDF (logarítmico, suavizado), similitud coseno, limitaciones (alta dimensionalidad, no captura semántica).
- **[Por qué]** Es el marco contenedor de todos los modelos de bag-of-words y precursor conceptual de los embeddings modernos; el lector debe verlo antes de BM25.
- **[Origen]** Hueco prerrequisito; fuente: Salton, Wong & Yang (1975); IIR cap. 6.

### 3.2.2 Modelo de Independencia Binaria (BIM) y peso RSJ
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Supuesto de independencia condicional de términos, derivación del peso Robertson-Spärck Jones $w_t = \log \frac{(r_t + 0.5)(N - n_t - R + r_t + 0.5)}{(R - r_t + 0.5)(n_t - r_t + 0.5)}$, mención de la *linked dependence* de Cooper como matiz crítico.
- **[Por qué]** Es el puente lógico entre el PRP y BM25; sin él la formulación de BM25 aparece como mágica en lugar de derivada.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.3 Restricción al espacio de la consulta
- **[Detalle]** Desarrollo formal compacto.
- **[Contenido]** Argumento de que para términos $t \notin q$ el peso se cancela en el ranking, reducción del cómputo a $V_q = q \cap V$, conexión con la estructura sparse de los índices invertidos y anticipación de la conexión con sparse encoders neuronales.
- **[Por qué]** Reduce el problema computacional al subconjunto activo y conecta naturalmente con la estructura de los sparse encoders neuronales (§3.4.2).
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.4 Modelo de Elitismo (2-Poisson) y saturación no lineal
- **[Detalle]** Intuición + formalización (no derivación exhaustiva).
- **[Contenido]** Hipótesis del eliteness (documentos "sobre el tema" generan TF distinto), aproximación 2-Poisson, derivación heurística de la curva de saturación $S(tf) = \frac{tf}{k_1 + tf}$, gráfica comparativa de saturación vs lineal.
- **[Por qué]** Justifica la curva de saturación de TF que es central en BM25 y reaparece como contraparte neuronal en SPLADE (log-ReLU); su intuición es indispensable, su derivación completa no.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.5 Normalización suave por longitud
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Hipótesis de verbosidad vs alcance (*verbosity vs scope*), formulación $B = (1 - b) + b \cdot dl/\text{avgdl}$, comportamiento en los extremos $b = 0$ (sin normalización) y $b = 1$ (normalización completa), discusión del rango empírico óptimo.
- **[Por qué]** El parámetro $b$ de BM25 es uno de los pocos sintonizables y su semántica (verbosidad vs. alcance) afecta directamente el comportamiento en español, donde la longitud de documento varía por morfología.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.6 Formulación canónica de BM25
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Ensamble final $\text{BM25}(q, d) = \sum_{t \in q} \text{IDF}(t) \cdot \frac{tf_{t,d} \cdot (k_1 + 1)}{tf_{t,d} + k_1 \cdot B_d}$, derivación como composición de §3.2.2–3.2.5, valores típicos $k_1 \in [1.2, 2.0]$, $b \in [0.5, 0.75]$, propiedades (monotonía, saturación, no-acotación).
- **[Por qué]** Es uno de los modelos base de tu sistema experimental; la formulación canónica es referencia obligatoria.
- **[Origen]** Robertson & Zaragoza (2009).

### 3.2.7 Pseudo-Relevance Feedback (conceptual)
- **[Detalle]** Definición básica.
- **[Contenido]** Esquema general PRF (recuperar top-$R$, asumir relevancia, expandir consulta con términos), motivación, riesgo de query drift, mención de variantes específicas (Rocchio, RM3) sin desarrollarlas.
- **[Por qué]** Antecedente conceptual de los pipelines en cascada modernos (recuperación inicial + reranking) que son el contexto donde tu tesis se ubica.
- **[Origen]** Robertson & Zaragoza (2009); fuente complementaria: Lavrenko & Croft (2001).

---

## 3.3 Representaciones vectoriales del lenguaje

### 3.3.1 Hipótesis distribucional y embeddings estáticos
- **[Detalle]** Intuición + formalización (no derivación de algoritmos).
- **[Contenido]** Enunciado de la hipótesis de Harris (1954) "you shall know a word by the company it keeps", formalización vía co-ocurrencia, mención esquemática de word2vec (skip-gram, CBOW) y GloVe (factorización de matriz log-coocurrencia), limitaciones de embeddings estáticos (un vector por tipo, no contextualidad).
- **[Por qué]** Es el origen conceptual de toda la línea neuronal de IR; sin la hipótesis distribucional, el lector no entiende por qué las representaciones vectoriales son una idea coherente.
- **[Origen]** Hueco prerrequisito; fuentes: Harris (1954); Mikolov et al. (2013); Pennington et al. (2014).

### 3.3.2 Arquitectura Transformer y atención (encoder bidireccional vs decoder causal)
- **[Detalle]** Desarrollo formal de atención escalada producto-punto; mención + referencia para el resto del bloque.
- **[Contenido]** Atención escalada producto-punto $\text{Attn}(Q, K, V) = \text{softmax}(QK^\top/\sqrt{d_k})V$, atención multi-cabeza, máscara causal vs ausencia de máscara (encoder bidireccional como BERT vs decoder causal como GPT/Qwen), normalización de capa y conexiones residuales (mención), implicaciones para extracción de embeddings.
- **[Por qué]** Toda la cohorte de modelos modernos depende del Transformer; la distinción encoder/decoder es además crítica porque modelos como Qwen3 y jina-v5 requieren atención causal y last-token pooling, mientras que mE5 y SPLADE usan encoders bidireccionales.
- **[Origen]** Hueco prerrequisito + diferenciación motivada por Qwen3-Embedding y jina-embeddings-v5; fuente: Vaswani et al. (2017); Phuong & Hutter (2022).

### 3.3.3 Embeddings contextuales y estrategias de pooling
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Estados ocultos $H \in \mathbb{R}^{n \times h}$, agregación a vector de secuencia: CLS pooling (BERT-like), mean pooling sobre tokens (con/sin máscara de padding), EOS/last-token pooling (decoder-only), justificación geométrica de cada esquema, equivalencia $\cos(u, v) = u \cdot v$ bajo normalización $L_2$.
- **[Por qué]** El pooling es una decisión arquitectónica con consecuencias matemáticas concretas (mean/CLS para BERT-like vs EOS/last-token para decoder-only); aparece en casi todos los modelos del estado del arte y debe formalizarse antes de discutirlos.
- **[Origen]** mE5, BGE-M3 (CLS/mean), Qwen3-Embedding, jina-v5 (last-token); BERT como prerrequisito (Devlin et al. 2019).

### 3.3.4 Embeddings guiados por instrucciones
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Concepto de prefijo de tarea (e.g., `Query:`, `Document:`, `Represent this sentence for retrieval:`), efecto sobre el espacio latente sin alterar pesos, contraste entre prefijos fijos (jina-v5) vs instrucciones libres en lenguaje natural (mE5-instruct), implicaciones para asimetría query/document.
- **[Por qué]** Es un mecanismo de modulación del espacio latente sin alterar pesos, presente en mE5-instruct y Qwen3-Embedding; el lector necesita entender que un mismo texto puede producir vectores distintos según el rol asignado.
- **[Origen]** mE5-large-instruct, Qwen3-Embedding, jina-embeddings-v5.

---

## 3.4 Paradigmas de modelos neuronales para IR

### 3.4.1 Codificadores duales densos (Dense Bi-encoders)
- **[Detalle]** Definición formal canónica.
- **[Contenido]** Funciones de codificación independientes $f_Q, f_D: \text{texto} \to \mathbb{R}^h$ (a veces compartidas), score $s(q, d) = f_Q(q) \cdot f_D(d)$ o $\cos(f_Q(q), f_D(d))$, simetría/asimetría, ventaja arquitectónica clave (precómputo offline del corpus), limitación (interacción solo en el espacio del producto interno).
- **[Por qué]** Es el paradigma neuronal más simple y la línea base de comparación para todos los demás; presente en mE5, Qwen3, jina-v5.
- **[Origen]** mE5, BGE-M3, Qwen3-Embedding, jina-embeddings-v5.

### 3.4.2 Codificadores dispersos neuronales (Sparse Encoders)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Proyección a vocabulario $W_{\text{lex}} \in \mathbb{R}^{h \times |V|}$, cuantificación con activación no lineal $w_j = \sum_{i \in t} \log(1 + \text{ReLU}(w_{ij}))$ (SPLADE) o $w_j = \text{ReLU}(W_{\text{lex}}^\top H[i])$ (BGE-M3), score $s_{\text{lex}} = \sum_{t \in q \cap d} w_{q_t} w_{d_t}$, conexión axiomática con saturación TF de §3.2.4, compatibilidad con índices invertidos.
- **[Por qué]** Es uno de los paradigmas que evaluarás; su saturación logarítmica $\log(1+\text{ReLU}(\cdot))$ es la contraparte neuronal de la saturación de TF y conecta explícitamente con §3.2.4.
- **[Origen]** SPLADE, BGE-M3 (componente sparse).

### 3.4.3 Cross-encoders
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Función conjunta $f([q; d]) \to \mathbb{R}$ con atención cruzada plena entre tokens de $q$ y $d$, score como logit del CLS o como probabilidad de tokens yes/no en LLMs, ventaja (interacción rica) vs limitación (cómputo $O(|Q| \cdot |D|)$ no precomputable), uso típico como reranker de top-$k$.
- **[Por qué]** Son el competidor directo de la fusión de rangos en tu Objetivo Específico 4; el lector necesita entender por qué su atención cruzada plena es más expresiva pero computacionalmente prohibitiva.
- **[Origen]** Qwen3-Embedding (reranking puntual con tokens yes/no), bge-reranker-v2-m3.

### 3.4.4 Modelos de interacción tardía (operador MaxSim)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Embeddings por token $E_q \in \mathbb{R}^{|q| \times h}$, $E_d \in \mathbb{R}^{|d| \times h}$, operador MaxSim $S(q,d) = \sum_i \max_j E_{q_i} \cdot E_{d_j}^\top$, propiedades (no simetría, no negatividad bajo normalización), variante normalizada de BGE-M3 con factor $1/N$, mecanismo de query augmentation con `[MASK]`.
- **[Por qué]** Es el paradigma intermedio entre dual-encoders y cross-encoders; ColBERT y Jina-ColBERT-v2 son piezas centrales de tu pipeline experimental.
- **[Origen]** ColBERT, Jina-ColBERT-v2, BGE-M3 (componente multi-vector).

### 3.4.5 Funciones de puntuación: propiedades matemáticas y motivación de la fusión
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Tabla comparativa de propiedades por paradigma: dominio (acotado/no acotado), distribución empírica, sensibilidad a longitud, interpretabilidad probabilística; argumento matemático de por qué combinar scores heterogéneos sin normalización es problemático; introducción del eje conceptual score-fusion vs rank-fusion como respuesta a esta heterogeneidad.
- **[Por qué]** **Subsección puente clave**: documenta que BM25 produce log-odds no acotados, los densos producen cosenos en [-1,1], los sparse producen sumatorias no acotadas y MaxSim produce sumatorias estructuradas; esta heterogeneidad es lo que motiva matemáticamente §3.6 y, en particular, la elegancia de RRF.
- **[Origen]** Síntesis transversal (BM25 + mE5 + SPLADE + ColBERT); concepto no aislado en ningún paper único pero es el corazón argumental de tu tesis.

---

## 3.5 Aprendizaje de representaciones

### 3.5.1 Funciones de pérdida contrastivas
- **[Detalle]** Desarrollo formal de InfoNCE canónica + presentación de variantes como modificaciones del denominador o de la simetría.
- **[Contenido]** Taxonomía pointwise/pairwise/listwise, formulación canónica InfoNCE $\mathcal{L} = -\log \frac{\exp(s(q, d^+)/\tau)}{\sum_{d \in \mathcal{B}} \exp(s(q, d)/\tau)}$, variantes: in-batch negatives, hard negatives, enmascaramiento de falsos negativos (factor $m_{ij}$), pérdida bidireccional $\mathcal{L} = \mathcal{L}_{q \to d} + \mathcal{L}_{d \to q}$, CoSENT (listwise por orden), regularización dispersiva (anti-colapso), Global Orthogonal Regularizer (GOR), regularización de dispersión $L_1$ vs FLOPS.
- **[Por qué]** Toda la cohorte 2020–2026 entrena con variantes de InfoNCE; presentar una forma canónica y derivar las demás como modificaciones evita la dispersión que produciría una pérdida por modelo.
- **[Origen]** mE5, BGE-M3, Qwen3 (con masking), jina-v5 (bidireccional, GOR, CoSENT), SPLADE (con FLOPS), jina-reranker-v3 (dispersive loss).

### 3.5.2 Fine-tuning y aproximaciones de bajo rango
- **[Detalle]** Desarrollo formal de LoRA + definición de hard negative mining.
- **[Contenido]** Aproximación matricial de bajo rango (mención SVD/Eckart-Young como referencia al apéndice), formulación LoRA $W' = W + BA$ con $B \in \mathbb{R}^{h \times r}$, $A \in \mathbb{R}^{r \times h}$, $r \ll h$; hiperparámetros típicos ($r$, $\alpha$); proyección lineal compresiva $E_{\text{out}} = W \cdot E_{\text{Trans}}$ con $W \in \mathbb{R}^{m \times h}$, $m \ll h$; hard negative mining (definición geométrica, justificación por el gradiente, mención de estrategias: ANN, BM25-mined, cross-system).
- **[Por qué]** LoRA es central en jina-v5 (LoRA por tarea) y jina-reranker-v3 ($r=16, \alpha=32$); el hard negative mining es el motor empírico de prácticamente todos los modelos modernos y merece formalización canónica única.
- **[Origen]** jina-v5, jina-reranker-v3 (LoRA); mE5, SPLADE-v3, Qwen3, jina-reranker-v3 (hard negatives); fuente: Hu et al. (2021) para LoRA.

### 3.5.3 Representaciones jerárquicas y truncables (MRL)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Formulación canónica $\mathcal{L}_{\text{MRL}} = \sum_{d \in \mathcal{M}} c_d \mathcal{L}(W^{(d)} X)$ con $\mathcal{M} = \{d_1 < d_2 < \dots < d_k\}$ conjunto de dimensiones anidadas; variante con weight-tying (todas las cabezas comparten parámetros, fallida en late interaction) vs sin weight-tying (cada cabeza con parámetros propios); trade-off efectividad/eficiencia parametrizable; aplicación a vector único vs multi-vector.
- **[Por qué]** MRL es ubicuo en modelos modernos (Jina-ColBERT-v2, Qwen3, jina-v5) y permite trade-offs efectividad/eficiencia que pueden ser explotados en tu evaluación experimental.
- **[Origen]** Jina-ColBERT-v2 (multi-vector con 6 cabezas), Qwen3-Embedding, jina-embeddings-v5; fuente: Kusupati et al. (2022).

### 3.5.4 Destilación de conocimiento en IR [SUBSECCIÓN NUEVA]
- **[Detalle]** Desarrollo formal de KL con softmax-temperatura y MarginMSE; mención + referencia para variantes especializadas.
- **[Contenido]** Esquema teacher-student general; destilación KL $\mathcal{L}_{\text{KD}} = \tau^2 D_{\text{KL}}(P_T^\tau \| P_S^\tau)$ con softmax-temperatura; MarginMSE $\mathcal{L}_{\text{MarginMSE}} = (m_T - m_S)^2$ donde $m = s(q,d^+) - s(q,d^-)$; combinación lineal multitarea $\mathcal{L} = \sum_i \lambda_i \mathcal{L}_i$; self-knowledge distillation (BGE-M3: combinación lineal de modalidades como teacher); destilación con proyección lineal entre dimensionalidades distintas (jina-v5: $\psi(z^S) = Wz^S + b$).
- **[Por qué]** Cuatro de los modelos centrales (SPLADE-v3, Jina-ColBERT-v2, mE5, jina-v5) dependen críticamente de destilación; sin formalización aquí, la mitad del estado del arte queda colgada de un concepto no establecido.
- **[Origen]** SPLADE-v3 (ensamble de 5 cross-encoders), Jina-ColBERT-v2 (KL desde reranker), mE5 (destilación de cross-encoder), jina-v5 (destilación con proyección lineal), BGE-M3 (self-distillation).

---

## 3.6 Fundamentos matemáticos de la fusión de rangos

### 3.6.1 Formalización: rankings, score-fusion vs rank-fusion, analogía con teoría de elección social
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Espacio de rankings como permutaciones $\pi: \mathcal{D} \to \{1, \dots, |\mathcal{D}|\}$; distinción formal score-fusion (combina valores reales de scores) vs rank-fusion (combina solo posiciones); analogía teoría de elección social: documentos $\leftrightarrow$ candidatos, sistemas de IR $\leftrightarrow$ votantes, fusión $\leftrightarrow$ regla de agregación; taxonomía (posicional vs mayoritario, supervisado vs no supervisado, score-based vs rank-based); mención del teorema de Arrow como contexto histórico-conceptual.
- **[Por qué]** Es el eje conceptual de tu tesis; sin distinguir formalmente score-fusion de rank-fusion el lector no entiende por qué evalúas RRF en lugar de CombSUM ni por qué la heterogeneidad de §3.4.5 es un problema.
- **[Origen]** Síntesis de Aslam & Montague (2001), Montague & Aslam (2002), Cormack et al. (2009); concepto que ningún extracto formaliza pero es ineludible.

### 3.6.2 Métodos basados en puntuaciones (CombSUM, CombMNZ, normalización)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** CombSUM $S(d) = \sum_i s_i(d)$; CombMNZ $S(d) = n_d \cdot \sum_i \tilde{s}_i(d)$ donde $n_d$ es número de sistemas que recuperan $d$; efecto coro como motivación de CombMNZ; técnicas de normalización: min-max $\tilde{s} = (s - s_{\min})/(s_{\max} - s_{\min})$, z-score $\tilde{s} = (s - \mu)/\sigma$, sigmoide $\tilde{s} = 1/(1+e^{-s})$; análisis del efecto de cada normalización sobre el ranking final; argumento de que la sensibilidad a escala es la principal limitación de score-fusion.
- **[Por qué]** Es la línea base histórica de fusión y, crítico para tu tesis, requiere normalización porque combina scores heterogéneos; explicitar estas técnicas justifica matemáticamente por qué los métodos rank-based son atractivos.
- **[Origen]** Fox & Shaw (1994), Aslam & Montague (2001); SPLADE-v3 (min-max por consulta).

### 3.6.3 Métodos posicionales basados en rangos (Borda)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Borda canónico $P_i(d) = c - r_i(d) + 1$ donde $c$ es número de candidatos; agregación $S_{\text{Borda}}(d) = \sum_i P_i(d)$; Borda ponderado $S(d) = \sum_i \alpha_i P_i(d)$; lectura probabilística de Borda como esperanza bajo distribución uniforme de profundidad de consulta; comportamiento ante listas truncadas y de longitudes desiguales.
- **[Por qué]** Es uno de los métodos que evaluarás; la lectura como modelo de usuario uniforme conecta Borda con RBC y permite la unificación probabilística que es el clímax conceptual del capítulo.
- **[Origen]** Aslam & Montague (2001), Bailey et al. (2017).

### 3.6.4 Métodos mayoritarios y teoría de grafos semicompletos (Condorcet)
- **[Detalle]** Desarrollo formal con esbozo de teoremas; mención de la paradoja de Condorcet y teorema de Arrow como contexto.
- **[Contenido]** Definición de grafo semicompleto de torneo $G = (\mathcal{D}, E)$ con aristas dirigidas según mayorías pareadas; ganador de Condorcet; paradoja de Condorcet (no transitividad); teoremas (con esbozo de demostración): (T1) todo torneo tiene un camino hamiltoniano; (T2) el grafo cocientado por componentes fuertemente conexas es transitivo; algoritmo Condorcet-fuse vía sort comparativo $O(nk \log n)$.
- **[Por qué]** Condorcet es uno de los métodos que evaluarás; su fundamento en teoría de grafos lo distingue cualitativamente de los métodos posicionales y merece tratamiento riguroso.
- **[Origen]** Montague & Aslam (2002).

### 3.6.5 Métodos probabilísticos y modelos de usuario (Bayes-fuse, RBC)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Bayes-fuse: log-odds condicionados a rangos $w_i(r) = \log \frac{P(r \mid R)}{P(r \mid \bar{R})}$; modelo de usuario con profundidad de parada estocástica; Rank-Biased Centroid $S_{\text{RBC}}(d) = \sum_i (1-\phi)\phi^{r_i(d)-1}$; análisis asintótico ($\phi \to 0$: first-past-the-post; $\phi \to 1$: conteo de popularidad); conexión con la distribución geométrica (referencia al apéndice); marco unificador de Bailey et al.: Borda, RBC y RRF como esperanzas bajo distintas distribuciones de profundidad.
- **[Por qué]** RBC es uno de los métodos centrales de tu evaluación; su lectura como esperanza bajo distribución geométrica y la unificación con Borda y RRF como casos particulares es el aporte conceptual más fuerte del capítulo.
- **[Origen]** Aslam & Montague (2001), Bailey et al. (2017).

### 3.6.6 Fusión recíproca amortiguada (RRF)
- **[Detalle]** Desarrollo formal completo.
- **[Contenido]** Formulación $\text{RRF}(d) = \sum_i \frac{1}{k + r_i(d)}$; análisis del efecto de $k$ sobre la mitigación de outliers (rangos altos); comportamiento asintótico ($k \to 0$: dominio de rangos top, sensible a outliers; $k \to \infty$: cuasi-uniforme); invarianza de escala como propiedad clave; complejidad computacional streaming; lectura como esperanza bajo una distribución específica (conexión con §3.6.5); justificación del valor por defecto $k = 60$.
- **[Por qué]** RRF es probablemente el método que más usarás y es el que mejor ilustra la solución elegante al problema de heterogeneidad de §3.4.5; merece desarrollo más profundo que los demás.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

---

## 3.7 Evaluación en recuperación de información

### 3.7.1 Métricas estándar (P@k, R@k, MAP, MRR, nDCG)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Definiciones: $P@k$, $R@k$, Average Precision $AP = \frac{1}{|R_q|}\sum_k P@k \cdot \text{rel}(k)$, MAP como promedio de AP sobre consultas, MRR $= \frac{1}{|Q|}\sum_q \frac{1}{\text{rank}_1(q)}$, DCG $= \sum_i \frac{2^{\text{rel}_i} - 1}{\log_2(i+1)}$, nDCG = DCG/IDCG; propiedades: monotonía, ámbito (set-based vs rank-based), sensibilidad a profundidad; cuándo usar cada una.
- **[Por qué]** Son las métricas que usarás en tu evaluación experimental; ningún extracto las define rigurosamente y son indispensables.
- **[Origen]** Hueco prerrequisito; fuente: IIR cap. 8; Sanderson (2010).

### 3.7.2 Variantes bajo juicios incompletos (nDCG*)
- **[Detalle]** Definición básica.
- **[Contenido]** Problema de juicios incompletos en colecciones modernas (pooling), formulación de nDCG* (variante que penaliza documentos no juzgados como no relevantes vs variante que los excluye), implicaciones para comparaciones entre sistemas, mención de bpref y otras métricas robustas.
- **[Por qué]** Si MessIRve presenta juicios incompletos (a verificar en su paper), esta variante es relevante; útil mantenerla aunque sea como nota técnica.
- **[Origen]** SPLADE-v3.

### 3.7.3 Similitud entre listas de ranking (Kendall τ vs RBO)
- **[Detalle]** Desarrollo formal.
- **[Contenido]** Kendall $\tau = (P - Q)/\binom{n}{2}$ donde $P$ y $Q$ son pares concordantes y discordantes; limitaciones de Kendall (requiere listas conjuntivas, no ponderado por rango); RBO con persistencia $\phi$: $\text{RBO} = (1-\phi)\sum_d \phi^{d-1} A_d$ donde $A_d$ es el solapamiento a profundidad $d$; propiedades de RBO (top-weighted, robusto a listas disjuntas, parametrizable); aplicación al concepto de retrieval consistency.
- **[Por qué]** RBO es la métrica natural para evaluar consistencia entre las listas que vas a fusionar; su decaimiento por rango lo hace robusto a listas truncadas, propiedad útil en tu pipeline.
- **[Origen]** Bailey et al. (2017).

### 3.7.4 Búsqueda eficiente: ANN, HNSW, IVF, búsqueda multi-vector
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Problema de la búsqueda exacta en alta dimensionalidad; idea general de Approximate Nearest Neighbors; HNSW (Hierarchical Navigable Small World): grafo jerárquico, intuición de navegación; IVF (Inverted File): clustering + búsqueda en celdas; FAISS como implementación de referencia; búsqueda multi-vector para late interaction (PLAID, centroid-based compression); trade-off recall vs latencia.
- **[Por qué]** ColBERT y Jina-ColBERT-v2 no buscan con FAISS estándar sino con búsqueda multi-vector especializada (PLAID); el lector necesita saber que la viabilidad de los modelos densos depende de estas estructuras de datos.
- **[Origen]** ColBERT, Jina-ColBERT-v2 (necesidad de PLAID); fuente: Malkov & Yashunin (2018); Johnson et al. (2019).

### 3.7.5 Pruebas de significancia estadística
- **[Detalle]** Definición básica + intuición.
- **[Contenido]** Paired t-test (supuestos de normalidad, limitaciones), Wilcoxon signed-rank (no paramétrico), randomization/permutation test (preferido en IR moderno por no asumir distribución), corrección por comparaciones múltiples (Bonferroni, Holm), interpretación de p-values en el contexto de IR (mejoras pequeñas pero significativas vs grandes pero no significativas).
- **[Por qué]** Necesarias para justificar las comparaciones empíricas del capítulo experimental y para no caer en el error de reportar diferencias no significativas como mejoras.
- **[Origen]** Hueco prerrequisito; fuente: Smucker, Allan & Carterette (2007).

---

## Apéndice A — Preliminares matemáticos

### A.1 Entropía cruzada y softmax
- **[Detalle]** Definición + propiedades.
- **[Contenido]** Softmax $\sigma(z)_i = e^{z_i}/\sum_j e^{z_j}$, entropía cruzada $H(p, q) = -\sum_x p(x) \log q(x)$, gradiente respecto a logits, conexión con maximum likelihood, papel en clasificación y en InfoNCE.
- **[Por qué]** Aparece en toda la familia InfoNCE/KL; el lector con formación en matemáticas aplicadas la conoce, pero conviene tenerla a mano para referencia.
- **[Origen]** Hueco prerrequisito; fuente: Goodfellow et al. (2016) caps. 3 y 5.

### A.2 Divergencia de Kullback-Leibler
- **[Detalle]** Definición + propiedades.
- **[Contenido]** $D_{\text{KL}}(P \| Q) = \sum_x P(x) \log \frac{P(x)}{Q(x)}$, no negatividad, no simetría, no es métrica, relación con entropía cruzada $H(P, Q) = H(P) + D_{\text{KL}}(P \| Q)$, uso en destilación de conocimiento.
- **[Por qué]** Es el corazón de la destilación KL en §3.5.4; merece definición precisa accesible.
- **[Origen]** Hueco prerrequisito; fuente: Cover & Thomas (2006) cap. 2.

### A.3 SVD y Teorema de Eckart-Young
- **[Detalle]** Definición + enunciado del teorema.
- **[Contenido]** Descomposición en valores singulares $A = U\Sigma V^\top$, valores singulares como medida de "energía", teorema de Eckart-Young: la mejor aproximación de rango $r$ en norma de Frobenius es $A_r = U_r \Sigma_r V_r^\top$, conexión con LoRA (las actualizaciones de pesos son aproximadamente de bajo rango) y con proyección compresiva en ColBERT.
- **[Por qué]** Es el fundamento matemático de LoRA (§3.5.2) y de la proyección lineal compresiva en ColBERT; el lector lo conoce, pero la conexión específica con técnicas modernas amerita recordatorio.
- **[Origen]** Hueco prerrequisito motivado por LoRA y ColBERT; fuente: Strang, *Introduction to Linear Algebra*; Eckart & Young (1936).

### A.4 Distribución geométrica
- **[Detalle]** Definición + momentos.
- **[Contenido]** $P(X = k) = (1-p)^{k-1} p$ para $k = 1, 2, \dots$; esperanza $E[X] = 1/p$; varianza $\text{Var}(X) = (1-p)/p^2$; propiedad de pérdida de memoria; aparición como modelo de usuario en RBC.
- **[Por qué]** RBC se basa explícitamente en ella; el lector puede haberla olvidado y conviene tenerla a mano.
- **[Origen]** Bailey et al. (2017).

### A.5 Tokenización subword (BPE, WordPiece, SentencePiece)
- **[Detalle]** Definición básica.
- **[Contenido]** Problema de OOV (out-of-vocabulary), idea de unidades subword, algoritmo BPE (merges iterativos), WordPiece (greedy longest-match), SentencePiece (sin pre-tokenización), implicaciones para morfología rica del español.
- **[Por qué]** Prerrequisito para todo lo neuronal; en español tiene implicaciones específicas (morfología rica) que se discuten en §4.6.
- **[Origen]** Hueco prerrequisito; fuente: Sennrich et al. (2016); Kudo (2018).

---

# 4. Estado del Arte

## 4.1 Modelos léxicos modernos y variantes de BM25

### 4.1.1 Okapi BM25 y BM25F
- **[Detalle]** Desarrollo del modelo + parámetros típicos + resultados de referencia.
- **[Contenido]** Recapitulación de la formulación BM25 desde §3.2.6; parámetros estándar empíricos; BM25F como extensión a documentos estructurados (combinación lineal de TF por campo *antes* de saturación, no de scores); resultados representativos en TREC Web (pesos óptimos como $w_{\text{title}}=38.4$ vs $w_{\text{body}}=1.0$); discusión de limitaciones (independencia, ignora orden y proximidad, no captura sinonimia).
- **[Por qué]** BM25 sigue siendo línea base obligatoria en 2025 y componente crítico de tu sistema de fusión; BM25F es la extensión a documentos estructurados.
- **[Origen]** Robertson & Zaragoza (2009).

### 4.1.2 PRF y expansión de consulta
- **[Detalle]** Definición + discusión de query drift.
- **[Contenido]** Recapitulación del esquema PRF desde §3.2.7; discusión empírica del fenómeno query drift; comparación posicionamiento BM25+PRF vs Language Models (Ponte & Croft) vs DFR; mención de RM3 como variante específica de relevancia con suavizado.
- **[Por qué]** Antecedente histórico de pipelines en cascada; relevante para contextualizar por qué la fusión de rangos surge como alternativa.
- **[Origen]** Robertson & Zaragoza (2009); fuentes complementarias: Lavrenko & Croft (2001) RM3.

### 4.1.3 Variantes modernas (BM25+, BM25L, BM25-Adaptive)
- **[Detalle]** Mención + referencia.
- **[Contenido]** BM25L (corrección para documentos largos), BM25+ (componente aditivo para términos no saturados), BM25-Adaptive (ajuste dinámico de $k_1$); cuándo cada variante mejora sobre BM25 estándar.
- **[Por qué]** Permite documentar que BM25 no es un objeto estático y que existen variantes que podrían ser parte del sistema base; importante para validez metodológica.
- **[Origen]** Hueco identificado; fuentes: Lv & Zhai (2011) BM25+/BM25L.

### 4.1.4 Infraestructura: Anserini, Pyserini
- **[Detalle]** Mención + referencia.
- **[Contenido]** Anserini como capa Lucene reproducible para investigación; Pyserini como interfaz Python; importancia para reproducibilidad de baselines BM25; mención de configuraciones recomendadas para español (analizadores, stemmers).
- **[Por qué]** Es la herramienta probable de tu implementación experimental; legitima la elección de BM25 como reproducible.
- **[Origen]** Hueco identificado; fuente: Yang, Fang & Lin (2017); Lin et al. (2021).

---

## 4.2 Modelos semánticos representativos

### 4.2.1 Dense bi-encoders multilingües

#### 4.2.1.1 mDPR
- **[Detalle]** Mención + referencia + arquitectura general.
- **[Contenido]** Adaptación multilingüe de Dense Passage Retrieval; backbone multilingual BERT; entrenamiento con pares de QA traducidos; resultados de referencia en colecciones cross-lingüe; importancia histórica como primer bi-encoder multilingüe entrenado para retrieval.
- **[Por qué]** Es el modelo fundacional del bi-encoder multilingüe; sin él, la línea de mE5 no se entiende.
- **[Origen]** Hueco identificado; fuente: Karpukhin et al. (2020); Asai et al. mDPR.

#### 4.2.1.2 mContriever
- **[Detalle]** Mención + referencia.
- **[Contenido]** Preentrenamiento contrastivo no supervisado sobre pares construidos por inverse cloze task; reduce dependencia de datos etiquetados; impacto en zero-shot transfer.
- **[Por qué]** Introduce el preentrenamiento contrastivo no supervisado, paso intermedio entre mDPR y mE5.
- **[Origen]** Hueco identificado; fuente: Izacard et al. (2021).

#### 4.2.1.3 mE5 (small/base/large) y mE5-large-instruct
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Pipeline de dos etapas (preentrenamiento contrastivo débil con 1B pares + SFT con 1.6M pares + hard negatives + destilación de cross-encoder); arquitecturas (MiniLM small, XLM-RoBERTa base/large); resultados MIRACL desglosados en español: small 51.2/87.6, base 52.9/88.6, large 51.5/89.1, instruct 53.7/89.3; **anomalía mE5-large vs base en español** como evidencia clave; mE5-instruct: datos sintéticos GPT-3.5/4, cobertura 93 idiomas, alineamiento por instrucciones, Tatoeba 83.8 superando LaBSE; conexión explícita con §3.4.1, §3.5.1, §3.5.2, §3.5.4.
- **[Por qué]** Familia central en tu evaluación; los resultados desglosados en español (anomalía mE5-large vs mE5-base) son evidencia directa que motiva tu hipótesis sobre fusión.
- **[Origen]** mE5 (Wang et al. 2024).

#### 4.2.1.4 Qwen3-Embedding (0.6B/4B/8B)
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Backbone Qwen3 decoder-only con atención causal; last-token pooling; pipeline tres etapas (preentrenamiento débil con 150M pares sintéticos generados por Qwen3-32B simulando agentes; SFT con 12M pares filtrados por similitud >0.7; **fusión SLERP de checkpoints** como forma de model merging); MRL con dimensiones {32, 64, 128, ..., 4096}; contexto 32K; resultados Qwen3-Embedding-8B en MTEB Multilingual = 70.58 superando Gemini-Embedding (68.37) y text-embedding-3-large (58.93); conexión explícita con §3.3.3, §3.5.1, §3.5.3, §3.5.4.
- **[Por qué]** Modelo de vanguardia open-source con resultados superiores a OpenAI text-embedding-3-large; pieza clave para tu Objetivo Específico 5 (open vs propietario).
- **[Origen]** Qwen3-Embedding (Zhang et al. 2025).

#### 4.2.1.5 jina-embeddings-v5-text
- **[Detalle]** Desarrollo.
- **[Contenido]** Backbones EuroBERT-210M y Qwen3-0.6B; **adaptadores LoRA por tarea** (retrieval, STS, clustering, classification) como solución alternativa a instruction-tuning; entrenamiento en dos etapas (destilación de Qwen3-Embedding-4B con proyección lineal, luego LoRA con base congelada); manejo de asimetría retrieval con prefijos fijos `Query:`/`Document:` (decisión justificada por costo de anotación); contexto extendido a 32K vía interpolación RoPE; pérdida retrieval $\mathcal{L} = \lambda_{NCE}\mathcal{L}_{NCE}^{q\to d} + \lambda_D \mathcal{L}_{distill} + \lambda_S \mathcal{L}_{GOR}$; conexión con §3.5.1, §3.5.2, §3.5.4.
- **[Por qué]** Ilustra una solución alternativa al multi-tarea (LoRA en lugar de instruction-tuning); su decisión sobre prefijos simples vs instrucciones tiene implicaciones para corpora en español sin anotación abundante.
- **[Origen]** jina-embeddings-v5 (Akram et al.).

### 4.2.2 Modelos multifuncionales: BGE-M3
- **[Detalle]** Desarrollo completo + párrafo dedicado a fusión interna.
- **[Contenido]** Triple unificación (multi-lingual 100+, multi-functional dense+sparse+multivec, multi-granularity 8K); backbone XLM-RoBERTa con preentrenamiento RetroMAE; entrenamiento dos fases (1.2B pares no supervisados + SFT con MIRACL/Mr.TyDi y datos sintéticos GPT-3.5); **self-knowledge distillation** con teacher como combinación lineal de las tres modalidades; **fusión interna** $s_{\text{inter}} = w_1 s_{\text{dense}} + w_2 s_{\text{lex}} + w_3 s_{\text{mul}}$ como caso de score-fusion estática realizada a nivel de modelo; resultados SOTA MIRACL/MKQA al momento de publicación; **anticipación explícita del contraste con fusión externa de §4.4**.
- **[Por qué]** **Pieza narrativa central**: BGE-M3 internaliza la fusión, lo que ofrece el espejo conceptual de tu propuesta de fusión externa; esta es la observación más valiosa del capítulo y articula la pregunta de investigación.
- **[Origen]** BGE-M3 (Chen et al. 2024).

### 4.2.3 Sparse encoders

#### 4.2.3.1 SPLADE v1 a SPLADE-v3
- **[Detalle]** Desarrollo completo.
- **[Contenido]** SPLADE v1: arquitectura end-to-end sobre BERT-base con MLM head, eliminación del gating de SparTerm, regularización asimétrica $\lambda_q \neq \lambda_d$ (más en query para reducir latencia online), pérdida $\mathcal{L} = \mathcal{L}_{\text{rank-IBN}} + \lambda_q \mathcal{L}_{\text{reg}}^q + \lambda_d \mathcal{L}_{\text{reg}}^d$, MS MARCO MRR@10 = 0.322 con FLOPS 0.73; evolución a SPLADE-v3: destilación desde **ensamble de 5 cross-encoders** (MiniLM, RankT5, DeBERTaV3, DeBERTaV2, Electra), MarginMSE rescored, escalado a 100 negativos por query (50 top-50 + 50 aleatorios top-1k), MS MARCO MRR@10 = 40.2, BEIR 51.7; variantes eficientes: Lexical (sin expansión query, 0.6 FLOPS, 40.0/49.1), DistilBERT, Doc (BoW binario, 47.0); hallazgo de cascada: reranking top-50 con DeBERTaV3 como sweet spot.
- **[Por qué]** Es el sparse encoder de referencia y candidato para tu sistema base; la evolución v1→v3 muestra cómo la destilación transformó el panorama.
- **[Origen]** SPLADE (Formal et al. 2021), SPLADE-v3 (Lassance et al. 2024).

#### 4.2.3.2 DeepImpact, uniCOIL, TILDE, doc2query
- **[Detalle]** Mención + referencia.
- **[Contenido]** Línea hermana de SPLADE: doc2query/docTTTTTquery (expansión generativa offline), DeepImpact (impacto léxico contextualizado), uniCOIL (term weighting con BERT), TILDE/TILDEv2 (eficiencia query-time); cuadro comparativo breve de filosofías (expansión vs contextualización vs ponderación).
- **[Por qué]** Línea hermana de SPLADE; conviene ubicar SPLADE en su contexto sin desarrollarlas exhaustivamente.
- **[Origen]** Hueco identificado; fuentes: Mallia et al. (2021); Nogueira & Lin (2019); Zhuang & Zuccon (2021).

### 4.2.4 Late interaction

#### 4.2.4.1 ColBERT v1
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Arquitectura: BERT compartido con marcadores `[Q]`/`[D]`, query augmentation con tokens `[MASK]`, proyección lineal compresiva a $m \in \{64, 128\}$ desde $h=768$, operador MaxSim (referencia a §3.4.4); filtrado offline por similitud; resultados MS MARCO: MRR@10 = 0.360 (full retrieval), 0.349 (reranking de BM25 top-1000); 170× más rápido que cross-encoder BERT; índice 9M pasajes en ~3h con 4 GPU; ablaciones clave: sustituir MaxSim por suma de promedios destruye discriminación local; remover query augmentation degrada drásticamente.
- **[Por qué]** Es el modelo seminal de late interaction y candidato para tu sistema base; sus ablaciones (sustitución de MaxSim) iluminan por qué la decisión arquitectónica importa.
- **[Origen]** ColBERT (Khattab & Zaharia 2020).

#### 4.2.4.2 ColBERTv2
- **[Detalle]** Definición + intuición.
- **[Contenido]** **Centroid-based compression** (clustering de embeddings de tokens y representación residual respecto al centroide), reducción dramática del tamaño de índice; entrenamiento con destilación desde cross-encoder; pipeline PLAID para servicio eficiente; impacto en escalabilidad de late interaction.
- **[Por qué]** Pieza intermedia esencial entre ColBERT v1 y Jina-ColBERT-v2; sin ella el linaje queda con un salto inexplicado.
- **[Origen]** Hueco identificado; fuente: Santhanam et al. (2022).

#### 4.2.4.3 Jina-ColBERT-v2
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Backbone Jina-XLM-RoBERTa con FlashAttention y RoPE; preentrenamiento sobre RefinedWeb; entrenamiento en dos fases (450M pares para preentrenamiento contrastivo simétrico + SFT con tripletas destiladas de jina-reranker-v2-base-multilingual); 14 idiomas (45.9% inglés, incluye español); 7 negativos por consulta; **MRL multi-vector con 6 cabezas independientes** ($d \in \{64, 96, 128, 256, 512, 768\}$); hallazgo crítico: weight-tying degrada late interaction (descartado en favor de cabezas independientes); reducción 128→64 dim implica solo 1.59% caída en BEIR nDCG@10; resultados en mMARCO multilingüe SOTA zero-shot.
- **[Por qué]** Es el late interaction multilingüe de referencia para tu evaluación; la inclusión de español en su entrenamiento lo hace especialmente relevante.
- **[Origen]** Jina-ColBERT-v2 (Jha et al. 2024).

### 4.2.5 [Cierre narrativo] Convergencia hacia modelos unificados
- **[Detalle]** Discusión narrativa (1–2 páginas).
- **[Contenido]** Síntesis transversal: tres tendencias convergentes — (a) modelos multifuncionales (BGE-M3 con dense+sparse+multivec); (b) representaciones truncables (MRL en Qwen3, jina-v5, Jina-ColBERT-v2); (c) adaptación por tarea (LoRA en jina-v5, instruction-tuning en mE5-instruct); diagnóstico: los modelos modernos **internalizan la fusión** y la especialización; **pregunta de investigación de la tesis explicitada**: ¿la fusión externa de rangos sobre representaciones especializadas heterogéneas aporta sobre la fusión interna de un modelo unificado?
- **[Por qué]** **Punto de inflexión narrativo del capítulo**: tras presentar BGE-M3 (fusión interna), Qwen3 (MRL nativo) y jina-v5 (LoRA por tarea), el lector debe ver explícitamente que los modelos modernos internalizan la fusión, lo que motiva la pregunta de investigación de tu tesis.
- **[Origen]** Síntesis transversal (BGE-M3, Qwen3, jina-v5).

---

## 4.3 Modelos de reranking neuronal

### 4.3.1 Cross-encoders pointwise/pairwise (monoBERT, monoT5, RankT5, bge-reranker-v2-m3)
- **[Detalle]** Desarrollo.
- **[Contenido]** monoBERT (Nogueira & Cho 2019): primer cross-encoder neuronal aplicado a reranking; monoT5 (Nogueira et al. 2020): reformulación como generación seq2seq con tokens true/false; RankT5 (Zhuang et al. 2023): listwise dentro del paradigma generativo; bge-reranker-v2-m3 (BAAI 2024): cross-encoder multilingüe basado en BGE-M3, MIRACL nDCG@10 ≈ 69.32, BEIR ≈ 56.51; comparación de esquemas de entrenamiento (pointwise BCE vs pairwise margin vs listwise listMLE).
- **[Por qué]** Son el competidor directo de la fusión de rangos en tu Objetivo Específico 4; bge-reranker-v2-m3 además es el reranker multilingüe de referencia para MIRACL.
- **[Origen]** Hueco parcial: monoBERT (Nogueira & Cho 2019), monoT5 (Nogueira et al. 2020), RankT5 (Zhuang et al. 2023); bge-reranker-v2-m3 referenciado pero no procesado.

### 4.3.2 Listwise rerankers con LLMs (RankGPT, RankZephyr, jina-reranker-v3 LBNL)
- **[Detalle]** Desarrollo completo de jina-reranker-v3; mención + referencia para RankGPT/RankZephyr.
- **[Contenido]** RankGPT (Sun et al. 2023): primer uso de LLMs como rerankers listwise zero-shot vía sliding window; RankZephyr/RankVicuna (Pradeep et al. 2023): destilación de RankGPT a modelos abiertos; **jina-reranker-v3 con paradigma "Last but Not Late" (LBNL)**: codifica query y batch de documentos candidatos en la misma ventana de contexto del decoder, atención cross-doc listwise, extracción de embeddings densos compactos por documento al final, cosine como score; backbone Qwen3-0.6B (28 capas, 1024 hidden, 131K contexto); MLP 1024→512→256; entrenamiento tres etapas (LoRA $r=16, \alpha=32$ con BGE-M3 data; escalado a 45 negativos con hard-neg cross-system de BGE/Jina/GTE/E5 con $\tau=0.05$; **model merging** lineal ponderado entre especialistas con pesos 0.25–0.65); resultados BEIR 61.85 (supera mxbai-rerank-large-v2 1.5B), HotpotQA 78.58, FEVER 94.01, MIRACL 66.83 (−2.49 vs bge-reranker-v2-m3); limitación: contexto compartido restringe escalabilidad listwise.
- **[Por qué]** jina-reranker-v3 es candidato directo de tu evaluación y representa el estado del arte en reranking listwise; RankGPT/RankZephyr son antecedentes narrativos imprescindibles.
- **[Origen]** jina-reranker-v3 (Wang, Li & Xiao 2025); huecos: Sun et al. (2023), Pradeep et al. (2023).

### 4.3.3 Cascadas y trade-offs efectividad/eficiencia
- **[Detalle]** Discusión + tabla comparativa.
- **[Contenido]** Pipeline en cascada como patrón estándar (retriever léxico/denso → reranker neuronal); hallazgo SPLADE-v3: top-50 con DeBERTaV3 maximiza efectividad por unidad de latencia (excepción ArguAna); ColBERT 170× más rápido que cross-encoder; tabla comparativa: latencia (ms/query) vs efectividad (nDCG@10) para cada paradigma; discusión sobre cuándo el reranking neuronal supera a la fusión y cuándo no.
- **[Por qué]** Tu Objetivo Específico 4 incluye comparación en eficiencia computacional; sin esta discusión, la comparación queda hueca.
- **[Origen]** SPLADE-v3 (cascada SPLADE→DeBERTaV3 como sweet spot); ColBERT (170× speedup vs cross-encoder).

---

## 4.4 Estrategias de fusión y reranking en la literatura

### 4.4.1 Fusión score-based clásica (CombSUM, CombMNZ)
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Recapitulación formal desde §3.6.2; **hallazgo del efecto coro**: combinar paradigmas divergentes (vector + booleano P-norm) supera combinar variantes similares; resultados TREC-3: modelos individuales SV 0.1340, LV 0.1960, P-norm 0.2062–0.2270; fusión homogénea Pn1.0+Pn1.5 = 0.2183 (estanca); fusión heterogénea LV+Pn1.5 = 0.3104; VTc5s (5 sistemas) 0.2914 vs VTc2s (2 sistemas selectos) 0.3021 → **más sistemas no implica mejor**; necesidad crítica de normalización de scores; ancla la hipótesis de tu tesis (combinación de paradigmas heterogéneos).
- **[Por qué]** Es la línea base histórica y uno de los métodos que evaluarás; el hallazgo de Fox & Shaw (combinar paradigmas divergentes > combinar variantes similares) ancla tu hipótesis.
- **[Origen]** Fox & Shaw (1994).

### 4.4.2 Fusión rank-based posicional (Borda-fuse, Bayes-fuse)
- **[Detalle]** Desarrollo.
- **[Contenido]** Formalismos desde §3.6.3 y §3.6.5; resultados TREC 3/5/9: Weighted Borda-fuse $\approx$ CombMNZ, ambos superan al mejor sistema individual mayoritariamente; subset Vogt (TREC 5): la diversidad de sistemas multiplica la ganancia; Bayes-fuse como versión supervisada con log-odds entrenados; comparación: Weighted Borda no requiere training pero asume escala lineal; Bayes-fuse modela con probabilidades pero requiere datos calibrados.
- **[Por qué]** Borda es uno de los métodos que evaluarás; Bayes-fuse documenta la versión supervisada que justifica por qué los métodos no supervisados (RRF, RBC) son atractivos cuando no hay datos de calibración.
- **[Origen]** Aslam & Montague (2001).

### 4.4.3 Fusión rank-based mayoritaria (Condorcet-fuse)
- **[Detalle]** Desarrollo.
- **[Contenido]** Formalismo desde §3.6.4; **reducción algorítmica al sort**: usar QuickSort/MergeSort con función de comparación pareada por mayoría, complejidad $O(nk \log n)$; resolución de ciclos vía SCC y caminos hamiltonianos; taxonomía bidimensional {sólo rangos vs scores} × {entrenamiento vs sin entrenamiento}, Condorcet-fuse ubicado en (rangos, sin entrenamiento); resultados TREC-3/5: supera Borda-fuse y rCombMNZ sin necesidad de calibrar scores.
- **[Por qué]** Condorcet es uno de los métodos que evaluarás; su fundamento cualitativamente distinto (mayoritario vs posicional) es una hipótesis testable.
- **[Origen]** Montague & Aslam (2002).

### 4.4.4 Fusión rank-based score-agnostic (RRF)
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Formalismo desde §3.6.6; resultados LETOR 3 MAP = 0.6051 vs Condorcet 0.5917 ($p \approx 0.004$); en TREC supera líneas base 4–5%; **robustez de $k$**: variación piloto $k \in [0, 500]$ → MAP estable, óptimo cerca de $k = 60$; comparación con métodos de Learning-to-Rank tempranos (RankSVM, RankBoost): RRF compite o supera sin entrenamiento; ventajas decisivas: invarianza de escala, cómputo streaming, un solo hiperparámetro.
- **[Por qué]** RRF es el método más probable de ser tu mejor performer; merece tratamiento más extenso que los demás dada su centralidad.
- **[Origen]** Cormack, Clarke & Büttcher (2009).

### 4.4.5 Fusión rank-based con modelo de usuario (RBC)
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Formalismo desde §3.6.5; **comportamiento asintótico**: $\phi \to 0$ ⇒ first-past-the-post (solo importa el primer rango), $\phi \to 1$ ⇒ conteo de popularidad uniforme; aplicación en **UQV100** (100 tópicos × 5,765 query variations): fusión sobre variaciones sintácticas de la consulta supera a la mejor query individual; **introducción del concepto de Retrieval Consistency**: medida con RBO, propiedad ortogonal a la efectividad, correlaciona fuerte con métricas profundas y débil con superficiales; robustez a listas truncadas y de longitudes desiguales (ventaja sobre Borda).
- **[Por qué]** RBC es uno de los métodos que evaluarás; el concepto de consistency es una métrica complementaria valiosa para evaluar estabilidad de tus fusiones.
- **[Origen]** Bailey et al. (2017).

### 4.4.6 Fusión léxico-semántica en la era neuronal [SECCIÓN CRÍTICA NUEVA]
- **[Detalle]** Discusión crítica + cuadro de propiedades + identificación de gaps.
- **[Contenido]** **Bruch et al. (2023)** "An Analysis of Fusion Functions for Hybrid Retrieval" (ICTIR): análisis crítico moderno de RRF en contexto dense+sparse, identificación de cuándo realmente aporta y cuándo no; **Karpukhin et al. (2020)**: interpolación lineal BM25+DPR como baseline híbrido; **Luan et al. (2021)** "Sparse, Dense, and Attentional Representations": comparación teórica/empírica de las tres familias; **Lin (2022)** "A Proposed Conceptual Framework": marco unificador para representational approach; **Ma et al. (2021)** sobre normalización en hybrid retrieval; cuadro de propiedades: cuándo hybrid > dense, cuándo dense > hybrid, qué papel juega la normalización; **posicionamiento explícito de la tesis**: ningún trabajo previo evalúa sistemáticamente la familia completa de rank-fusion (RRF, RBC, Borda, Condorcet, CombMNZ) sobre representaciones modernas en español.
- **[Por qué]** **Sin esta sección la tesis parece resucitar técnicas de 1994–2017 sin diálogo con la literatura moderna**; aquí es donde se cita Bruch et al. (2023), Karpukhin (2020) sobre interpolación lineal, Luan et al. (2021), y se posiciona explícitamente tu trabajo.
- **[Origen]** Hueco crítico identificado; fuentes: Bruch et al. (2023), Karpukhin et al. (2020), Luan et al. (2021), Lin (2022).

### 4.4.7 Fusión interna del modelo vs fusión externa de listas
- **[Detalle]** Discusión narrativa + tabla comparativa.
- **[Contenido]** Tres niveles de fusión: (a) **fusión interna** (BGE-M3 con $s_{\text{inter}} = w_1 s_d + w_2 s_l + w_3 s_m$ entrenada conjuntamente); (b) **fusión externa de listas** (RRF, RBC, etc., aplicada post-hoc sobre rankings independientes); (c) **fusión en el espacio de parámetros** (model merging: SLERP en Qwen3, linear merging en jina-reranker-v3); tabla comparativa: requiere training conjunto, requiere alineación de scores, robustez ante drift de distribución, costo de mantenimiento; argumento sobre por qué la fusión externa sigue siendo relevante (modularidad, componibilidad, no requiere reentrenamiento) frente a fusión interna (mayor potencial de optimización conjunta pero menos flexible).
- **[Por qué]** **Es donde tu tesis encuentra su voz**: BGE-M3 fusiona internamente, tu propuesta fusiona externamente, y esta sección debe contrastar formalmente ambas filosofías; mencionar también model merging (SLERP) para completar el espectro.
- **[Origen]** BGE-M3, Qwen3-Embedding (SLERP), jina-reranker-v3 (linear merging).

---

## 4.5 Benchmarks de IR

### 4.5.1 Históricos: TREC, LETOR
- **[Detalle]** Mención + referencia.
- **[Contenido]** Tracks TREC clásicos (3, 5, 9, Web Track) como contexto de la literatura de fusión; LETOR 3 como dataset estándar para Learning-to-Rank temprano y validación de RRF; mención de la limitación: tamaños y dominios restringidos comparados con benchmarks modernos.
- **[Por qué]** Son el contexto de toda la literatura clásica de fusión (CombSUM, Borda, Condorcet, RRF, RBC); imprescindibles para situar las cifras.
- **[Origen]** Fox & Shaw, Aslam & Montague, Montague & Aslam, Cormack et al.

### 4.5.2 MS MARCO y derivados (TREC DL 2019/2020/2021)
- **[Detalle]** Definición + tamaño + uso típico.
- **[Contenido]** MS MARCO: 8.8M pasajes, 1M queries, juicios sparse pero a gran escala, dominio web; TREC DL 2019/2020/2021 como tracks evaluativos sobre el corpus MS MARCO con juicios densos; mMARCO como traducción multilingüe (incluye español); fenómeno *translationese* documentado por Jha et al.; uso típico para reportar MRR@10 y nDCG@10.
- **[Por qué]** Es el benchmark estándar para la cohorte 2020–2025 (SPLADE, ColBERT, jina-reranker-v3); referencia obligatoria para todas las cifras del capítulo.
- **[Origen]** Hueco identificado; fuentes: Bajaj et al. (2016); Craswell et al. (2019, 2020).

### 4.5.3 Multilingües: BEIR, MIRACL, Mr.TyDi, MTEB Multilingual
- **[Detalle]** Definición + características + cobertura de español.
- **[Contenido]** BEIR (Thakur et al. 2021): 13 datasets zero-shot multidominio, métrica nDCG@10, hallazgo crítico: dense encoders fallan en zero-shot OOD respecto a BM25; MIRACL (Zhang et al. 2023): 16+ idiomas con datos nativos (no traducidos), incluye español, métrica nDCG@10/Recall@100; Mr.TyDi: colección multilingüe usada en SFT; MTEB / MTEB Multilingual (Muennighoff et al. 2022): agregación masiva de tareas, métrica de referencia para Qwen3 (70.58); cobertura de español en cada uno.
- **[Por qué]** Son los benchmarks donde se reportan las cifras de los modelos que usarás; MIRACL en particular incluye español y permite comparar con MessIRve.
- **[Origen]** Thakur et al. (2021) BEIR, Zhang et al. (2023) MIRACL, Zhang et al. (2021) Mr.TyDi, Muennighoff et al. (2022) MTEB.

### 4.5.4 Robustez y consistencia: UQV100
- **[Detalle]** Definición + uso para evaluar fusión sobre variantes de consulta.
- **[Contenido]** Colección de 100 tópicos con 19–101 variaciones sintácticas por tópico (5,765 queries únicas); diseñada para evaluar robustez ante reformulaciones; **Retrieval Consistency** medida con RBO como métrica complementaria a relevancia; uso para evaluar estabilidad de fusiones; relevancia para tu evaluación experimental como referencia metodológica.
- **[Por qué]** Justifica metodológicamente la evaluación de estabilidad de fusiones, complementaria a relevancia.
- **[Origen]** Bailey et al. (2017).

### 4.5.5 MessIRve
- **[Detalle]** Desarrollo completo.
- **[Contenido]** Descripción exhaustiva: tamaño del corpus, número de queries, dominios cubiertos, origen de los datos (búsquedas reales vs sintéticas), procedimiento de juicios de relevancia (graduados/binarios, profundidad de pooling, número de anotadores, kappa de acuerdo), cobertura dialectal (rioplatense/argentino), comparación cuantitativa con MIRACL-es (tamaño, dominio, naturalidad de queries, completitud de juicios), licencia y disponibilidad; discusión de fortalezas (queries reales en español nativo) y limitaciones (sesgo regional, posibles juicios incompletos); rol específico en tu evaluación experimental.
- **[Por qué]** Es el benchmark central de tu tesis y debe presentarse exhaustivamente; sin esto, los lectores no pueden evaluar tu contribución específica.
- **[Origen]** Hueco crítico identificado; fuente: paper original de MessIRve (verificar cita).

---

## 4.6 Particularidades del español en IR

### 4.6.1 Tipología morfosintáctica y efectos sobre BM25
- **[Detalle]** Discusión + ejemplos concretos.
- **[Contenido]** Características morfosintácticas relevantes del español: flexión verbal rica (~50 formas por verbo), flexión nominal por género/número, derivación productiva (sufijos diminutivos/aumentativos), clíticos pronominales pospuestos, libertad relativa de orden de palabras; impacto sobre BM25: reducción de coincidencia léxica exacta entre query y documento por variación morfológica; efectividad de stemming (Snowball-ES, lematización con Freeling/spaCy-es) como atenuante; comparación cualitativa con inglés (morfología pobre); implicación: BM25 puro tiene techo más bajo en español que en inglés sin pre-procesamiento adecuado.
- **[Por qué]** Lo planteas explícitamente en tu Justificación como motivación de la tesis; debe articularse formalmente en el estado del arte. La morfología rica del español afecta directamente la coincidencia léxica de BM25 y la efectividad de la lematización.
- **[Origen]** Hueco identificado; fuentes: documentación de Snowball-ES, Freeling, spaCy-es.

### 4.6.2 Backbones específicos en español: BETO, RoBERTa-bne, MarIA
- **[Detalle]** Mención + referencia + comparación con backbones multilingües.
- **[Contenido]** BETO (Cañete et al. 2020): primer BERT entrenado exclusivamente en español, 16GB de texto; RoBERTa-bne / MarIA (Gutiérrez-Fandiño et al. 2022): basado en 570GB del corpus de la Biblioteca Nacional de España, mayor escala; comparación cualitativa de rendimiento BETO vs XLM-RoBERTa vs MarIA en tareas de NLU en español; **justificación de no usarlos en tu tesis**: ausencia de versiones entrenadas para retrieval, falta de infraestructura de fine-tuning contrastivo a escala, ventaja de los multilingües en transfer learning desde inglés con datos abundantes; documentación del trade-off cobertura monolingüe profunda vs cobertura multilingüe robusta.
- **[Por qué]** Documenta la alternativa monolingüe que existe pero que no usas; justifica por qué eliges modelos multilingües (cobertura, calidad, infraestructura).
- **[Origen]** Hueco identificado; fuentes: Cañete et al. BETO, Gutiérrez-Fandiño et al. MarIA.

### 4.6.3 Resultados desglosados de modelos del §4.2 en español
- **[Detalle]** Tabla comparativa + análisis de la anomalía mE5-large vs mE5-base.
- **[Contenido]** Tabla con resultados en MIRACL-es (nDCG@10 y Recall@100) para todos los modelos de §4.2: mE5-small/base/large/instruct, Qwen3-Embedding-0.6B/4B/8B (cuando reportados), jina-embeddings-v5, BGE-M3 (dense/sparse/multivec/inter), Jina-ColBERT-v2; **anomalía mE5**: large (51.5) inferior a base (52.9) en español pese a ser superior en promedio multilingüe; análisis: el ranking entre modelos no es robusto en español, lo que sugiere variabilidad entre representaciones que la fusión podría aprovechar; análisis de gap entre mejor modelo y BM25 en español vs en inglés (gap menor en español ⇒ mayor margen de mejora por fusión); evidencia empírica directa que fundamenta la hipótesis de la tesis.
- **[Por qué]** Es la evidencia empírica directa de que el ranking entre modelos no es robusto en español; **motiva matemáticamente tu hipótesis** de que la fusión puede aportar más en español que en inglés.
- **[Origen]** mE5 (Wang et al. 2024); resultados desglosados en MIRACL-es.

### 4.6.4 Variedades dialectales y MessIRve
- **[Detalle]** Discusión.
- **[Contenido]** Panorama de variedades del español: peninsular (España), mexicano, rioplatense (Argentina/Uruguay), caribeño, andino; diferencias léxicas y sintácticas relevantes para IR (vocabulario regional, formas de tratamiento, queries idiomáticas); MessIRve como muestra de español rioplatense/argentino; implicaciones para validez externa: resultados en MessIRve no extrapolan automáticamente a otras variedades; mención del fenómeno de code-switching español-inglés en queries técnicas; recomendación metodológica: comparar resultados MessIRve vs MIRACL-es como sanity check de generalidad.
- **[Por qué]** MessIRve proviene de búsquedas reales de Argentina; documentar la dimensión dialectal evita generalizaciones inválidas a otras variedades del español.
- **[Origen]** Hueco identificado; motivado por el origen geográfico de MessIRve.

### 4.6.5 Translationese: mMARCO-es vs MIRACL-es vs nativo
- **[Detalle]** Discusión + implicaciones para validez externa.
- **[Contenido]** Definición de translationese (lengua traducida tiene propiedades estadísticas distintas de lengua nativa); evidencia empírica en Jha et al.: modelos entrenados solo en mMARCO traducido sufren caída sistemática en colecciones nativas; mMARCO-es como traducción de MS MARCO al español vs MIRACL-es como anotación nativa vs MessIRve como queries nativas reales; gradiente de naturalidad creciente; implicaciones para tu evaluación: priorizar MessIRve como benchmark principal y usar MIRACL-es como complemento; advertencia sobre interpretar mejoras en mMARCO-es como evidencia de mejora en español real.
- **[Por qué]** Jina-ColBERT-v2 documenta que mMARCO traducido sufre sesgo respecto a colecciones nativas; relevante para juzgar la validez de extrapolar de mMARCO a MessIRve.
- **[Origen]** Jina-ColBERT-v2 (Jha et al. 2024).

---

## 4.7 [OPCIONAL] Posicionamiento de esta tesis
- **[Detalle]** Síntesis narrativa (2–3 páginas).
- **[Contenido]** Recapitulación de los gaps identificados a lo largo del capítulo: (1) ausencia de evaluación sistemática de la familia completa de rank-fusion sobre representaciones modernas en español; (2) falta de contraste explícito entre fusión interna (BGE-M3) y fusión externa (RRF, RBC, Borda, Condorcet); (3) ausencia de comparación rigurosa entre fusión y reranking neuronal en términos de eficiencia/efectividad; (4) escasez de evidencia sobre modelos open-source vs propietarios en español nativo; articulación de cómo cada uno de estos gaps mapea a tus objetivos específicos; pregunta de investigación refinada: *¿qué tipo de fusión (interna del modelo, externa por scores, externa por rangos) aporta más en español, y bajo qué condiciones?*; puente narrativo al capítulo de metodología.
- **[Por qué]** Cierra el capítulo articulando explícitamente los gaps que tu tesis aborda: evaluación sistemática de fusión rank-based en español sobre MessIRve, contraste fusión externa vs interna, modelos open-source vs propietarios. Útil pedagógicamente como puente al capítulo de metodología.
- **[Origen]** Síntesis transversal de los gaps identificados.

---

## Observaciones finales sobre el esqueleto

Tres notas de uso para cuando empieces a redactar:

**1. Sobre el balance de extensión.** El capítulo §3 (Marco Teórico) tiene 31 subsecciones que, a un promedio de 2–3 páginas por subsección, daría un capítulo de 60–90 páginas. El capítulo §4 (Estado del Arte) tiene aproximadamente 35 subsecciones que, a 1–2 páginas promedio, daría 40–70 páginas. Si el límite total de tu tesis lo exige, los puntos marcados como *mención + referencia* son los primeros candidatos a comprimir o mover a notas al pie. Las subsecciones que **no** debes comprimir bajo ningún concepto son: §3.4.5, §3.6.5, §3.6.6, §4.2.2, §4.2.5, §4.4.6 y §4.4.7 (son las que cargan el argumento).

**2. Sobre referencias cruzadas.** Hay un patrón consistente de referencias cruzadas que conviene mantener disciplinadamente: §3.2.4 ↔ §3.4.2 (saturación TF y log-ReLU), §3.4.5 ↔ §3.6.1 (heterogeneidad y motivación de rank-fusion), §3.6.5 ↔ §4.4.5 (RBC formal y empírico), §4.2.2 ↔ §4.4.7 (BGE-M3 y fusión interna vs externa), §4.6.3 ↔ Justificación (anomalía mE5 como motivación). Estas referencias son lo que convierte el capítulo en una argumentación coherente en lugar de una colección de subsecciones.

**3. Sobre posibles colapsos.** Si necesitas comprimir más, considera estos colapsos que **no** dañan la argumentación: (a) fusionar §4.2.3.2 con §4.2.3.1 como párrafo final; (b) fusionar §4.2.4.2 con §4.2.4.3 como antecedente histórico breve; (c) fusionar §4.5.1 y §4.5.2 en una única subsección "Benchmarks fundacionales y MS MARCO". No colapses §4.6: cada subsección de español es una pieza distinta de tu argumentación.

¿Quieres que avancemos ahora a la metodología y diseño experimental con el mismo nivel de granularidad, o prefieres revisar/ajustar algo de este esqueleto antes de continuar?