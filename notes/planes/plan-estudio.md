# Plan de lectura bibliográfica

A continuación organizo las fuentes en **fases secuenciales de lectura**, donde cada fase asume el dominio de las anteriores. Dentro de cada fase, ordeno por dependencia conceptual (de lo más fundacional a lo más derivado).

Convenciones:
- **[INDISPENSABLE]**: lectura obligatoria, citada directamente en el manuscrito.
- **[RECOMENDADA]**: complementa el argumento; consulta selectiva.
- **[OPCIONAL]**: referencia para profundizar; consulta solo si el tiempo lo permite o si tu director lo solicita.
- **[CONSULTA]**: tipo manual/handbook; no se lee linealmente, se consulta por secciones.

---

## Fase 0 — Preliminares matemáticos y de NLP (consulta puntual)

Estas fuentes son **manuales de referencia**, no se leen linealmente. Las listo primero porque las consultarás repetidamente durante todo el proceso.

### 0.1 Manning, Raghavan & Schütze (2008). *Introduction to Information Retrieval*. Cambridge UP.
- **[CONSULTA — INDISPENSABLE]**
- **Capítulos clave**: 1 (booleano y términos), 6 (TF-IDF), 8 (evaluación), 11 (BIM y BM25 brevemente).
- **Para qué**: §3.1.1, §3.2.1, §3.7.1.
- **Tiempo estimado**: 3–4 horas de consulta selectiva.

### 0.2 Goodfellow, Bengio & Courville (2016). *Deep Learning*. MIT Press.
- **[CONSULTA — RECOMENDADA]**
- **Capítulos clave**: 3 (probabilidad), 5 (ML básico), 6.2 (entropía cruzada).
- **Para qué**: Apéndice A.1, A.2.
- **Tiempo estimado**: 2 horas si necesitas refrescar; saltar si tu base es sólida.

### 0.3 Cover & Thomas (2006). *Elements of Information Theory* (2da ed.). Wiley.
- **[CONSULTA — OPCIONAL]**
- **Capítulos clave**: 2.3 (KL divergence), 2.4 (información mutua).
- **Para qué**: Apéndice A.2.
- **Tiempo estimado**: 1 hora; saltar si Goodfellow basta.

---

## Fase 1 — Fundamentos clásicos de IR (semana 1–2)

**Objetivo**: dominar el lenguaje y formalismo del paradigma probabilístico antes de tocar nada neuronal.

### 1.1 Robertson & Zaragoza (2009). "The Probabilistic Relevance Framework: BM25 and Beyond". *Foundations and Trends in IR*, 3(4).
- **[INDISPENSABLE]**
- **Para qué**: prácticamente toda §3.2 (PRP, BIM, RSJ, eliteness, normalización por longitud, BM25, BM25F, PRF), parte de §4.1.
- **Notas de lectura**: este es **el** texto fundacional para tu §3.2. Léelo dos veces: primero rápido para mapeo, luego despacio anotando las derivaciones (§§ 3.1–3.3 del paper son críticos). El argumento del PRP (§ 2) y la derivación de BM25 (§ 3.4) son las piezas que más reusarás.
- **Tiempo estimado**: 8–10 horas.

### 1.2 Salton, Wong & Yang (1975). "A Vector Space Model for Automatic Indexing". *CACM*, 18(11).
- **[OPCIONAL]**
- **Para qué**: §3.2.1 contexto histórico.
- **Notas**: cita histórica obligatoria pero suficiente con la presentación de IIR cap. 6.
- **Tiempo estimado**: 1 hora si decides leerlo.

### 1.3 Lavrenko & Croft (2001). "Relevance-Based Language Models". *SIGIR*.
- **[OPCIONAL]**
- **Para qué**: §3.2.7, §4.1.2 (RM3).
- **Notas**: solo si decides desarrollar PRF más allá de la mención.
- **Tiempo estimado**: 1–2 horas.

### 1.4 Sanderson (2010). "Test Collection Based Evaluation of Information Retrieval Systems". *Foundations and Trends in IR*, 4(4).
- **[RECOMENDADA]**
- **Para qué**: §3.7.1, §3.7.2.
- **Notas**: la referencia moderna para evaluación; complementa IIR cap. 8 con discusión sobre juicios incompletos.
- **Tiempo estimado**: 3–4 horas (lectura selectiva).

### 1.5 Smucker, Allan & Carterette (2007). "A Comparison of Statistical Significance Tests for Information Retrieval Evaluation". *CIKM*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.5.
- **Notas**: justificación canónica del randomization test sobre paired t-test en IR. Lectura corta y muy útil.
- **Tiempo estimado**: 1–2 horas.

---

## Fase 2 — Fusión clásica de rangos (semana 3)

**Objetivo**: dominar los cuatro métodos clásicos en orden cronológico, viéndolos como respuestas progresivas al mismo problema.

### 2.1 Fox & Shaw (1994). "Combination of Multiple Searches". *TREC-2*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.2, §4.4.1.
- **Notas**: el paper fundacional. El **efecto coro** y el hallazgo "diversidad > similitud" son citas centrales para tu hipótesis. Léelo despacio.
- **Tiempo estimado**: 3–4 horas.

### 2.2 Aslam & Montague (2001). "Models for Metasearch". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.3, §4.4.2.
- **Notas**: introduce Borda-fuse y Bayes-fuse; la formalización de los modelos de votación es lo que toma tu §3.6.1.
- **Tiempo estimado**: 3–4 horas.

### 2.3 Montague & Aslam (2002). "Condorcet Fusion for Improved Retrieval". *CIKM*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.4, §4.4.3.
- **Notas**: la reducción algorítmica al sort y los teoremas de torneo son la pieza matemáticamente más rica de §3.6. Anota las demostraciones para incluirlas (esbozadas) en el manuscrito.
- **Tiempo estimado**: 3–4 horas.

### 2.4 Cormack, Clarke & Büttcher (2009). "Reciprocal Rank Fusion outperforms Condorcet and individual Rank Learning Methods". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.6, §4.4.4.
- **Notas**: paper corto pero **el método central** de tu tesis. Análisis de robustez de $k$ y comparación con Learning-to-Rank son lo que cita §4.4.4.
- **Tiempo estimado**: 2–3 horas.

### 2.5 Bailey, Moffat, Scholer & Thomas (2017). "Retrieval Consistency in the Presence of Query Variations". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.5, §3.7.3, §4.4.5, §4.5.4.
- **Notas**: introduce RBC, retrieval consistency, y el marco unificador (Borda/RBC/RRF como esperanzas bajo distintas distribuciones). Esta unificación es el clímax conceptual de tu §3.6.
- **Tiempo estimado**: 4–5 horas.

### 2.6 Webber, Moffat & Zobel (2010). "A Similarity Measure for Indefinite Rankings". *TOIS*, 28(4).
- **[RECOMENDADA]**
- **Para qué**: §3.7.3 (RBO).
- **Notas**: el paper original de RBO. Si Bailey et al. (2017) basta para tu tratamiento, OPCIONAL; si quieres formalizar RBO con rigor, INDISPENSABLE.
- **Tiempo estimado**: 2–3 horas.

---

## Fase 3 — Fundamentos neuronales (semana 4–5)

**Objetivo**: completar los prerrequisitos neuronales antes de los modelos de IR específicos.

### 3.1 Mikolov, Chen, Corrado & Dean (2013). "Efficient Estimation of Word Representations in Vector Space". *ICLR Workshop*.
- **[INDISPENSABLE]**
- **Para qué**: §3.3.1.
- **Notas**: word2vec. Lectura rápida; suficiente con CBOW y Skip-gram conceptualmente.
- **Tiempo estimado**: 2 horas.

### 3.2 Pennington, Socher & Manning (2014). "GloVe: Global Vectors for Word Representation". *EMNLP*.
- **[RECOMENDADA]**
- **Para qué**: §3.3.1.
- **Notas**: complementa word2vec con la perspectiva de factorización matricial.
- **Tiempo estimado**: 2 horas.

### 3.3 Vaswani et al. (2017). "Attention is All You Need". *NeurIPS*.
- **[INDISPENSABLE]**
- **Para qué**: §3.3.2.
- **Notas**: paper fundacional del Transformer. Atención escalada producto-punto y multi-cabeza son las piezas que cita tu §3.3.2. Léelo con cuidado.
- **Tiempo estimado**: 4–5 horas.

### 3.4 Phuong & Hutter (2022). "Formal Algorithms for Transformers". *arXiv:2207.09238*.
- **[RECOMENDADA]**
- **Para qué**: §3.3.2.
- **Notas**: pseudocódigo formal de los Transformers. Si tu redacción quiere precisión matemática extra para encoder vs decoder causal, esta es la fuente.
- **Tiempo estimado**: 3 horas.

### 3.5 Devlin, Chang, Lee & Toutanova (2019). "BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding". *NAACL*.
- **[INDISPENSABLE]**
- **Para qué**: §3.3.3, §3.4.3.
- **Notas**: BERT fundacional. CLS pooling, masked LM, y next sentence prediction son las piezas relevantes.
- **Tiempo estimado**: 3–4 horas.

### 3.6 Sennrich, Haddow & Birch (2016). "Neural Machine Translation of Rare Words with Subword Units". *ACL*.
- **[RECOMENDADA]**
- **Para qué**: Apéndice A.5.
- **Notas**: BPE original. Lectura corta.
- **Tiempo estimado**: 1 hora.

### 3.7 Kudo (2018). "Subword Regularization". *ACL*; Kudo & Richardson (2018). "SentencePiece". *EMNLP Demo*.
- **[OPCIONAL]**
- **Para qué**: Apéndice A.5.
- **Notas**: solo si profundizas en tokenización en español; si no, basta Sennrich.
- **Tiempo estimado**: 1–2 horas.

---

## Fase 4 — Modelos neuronales seminales para IR (semana 6–7)

**Objetivo**: leer en orden cronológico los modelos que definieron las cuatro familias arquitectónicas.

### 4.1 Karpukhin et al. (2020). "Dense Passage Retrieval for Open-Domain Question Answering". *EMNLP*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.1, §4.2.1.1, §4.4.6.
- **Notas**: DPR como bi-encoder canónico y la interpolación lineal BM25+DPR como baseline híbrido moderno. Doble cita.
- **Tiempo estimado**: 3 horas.

### 4.2 Khattab & Zaharia (2020). "ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.4, §4.2.4.1.
- **Notas**: paper seminal de late interaction. Las ablaciones (sustitución de MaxSim) son la evidencia que cita §3.4.4.
- **Tiempo estimado**: 4 horas.

### 4.3 Santhanam et al. (2022). "ColBERTv2: Effective and Efficient Retrieval via Lightweight Late Interaction". *NAACL*.
- **[RECOMENDADA]**
- **Para qué**: §4.2.4.2.
- **Notas**: centroid compression y residual representation. Pieza intermedia entre v1 y Jina-ColBERT-v2.
- **Tiempo estimado**: 3 horas.

### 4.4 Formal, Piwowarski & Clinchant (2021). "SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.2, §4.2.3.1.
- **Notas**: SPLADE v1 con regularización asimétrica. Pieza fundacional de los sparse encoders neuronales.
- **Tiempo estimado**: 3–4 horas.

### 4.5 Lassance, Déjean, Formal & Clinchant (2024). "SPLADE-v3: New Baselines for SPLADE". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.2.3.1, §4.3.3.
- **Notas**: documenta el salto cualitativo vía destilación de ensamble. Cita central para §4.3.3 (cascada).
- **Tiempo estimado**: 3 horas.

### 4.6 Mallia et al. (2021). "Learning Passage Impacts for Inverted Indexes". *SIGIR* (DeepImpact); Nogueira & Lin (2019). "From doc2query to docTTTTTquery"; Zhuang & Zuccon (2021). "TILDE". *SIGIR*.
- **[OPCIONAL]**
- **Para qué**: §4.2.3.2.
- **Notas**: solo si quieres dar contexto extenso a SPLADE. Una lectura rápida de DeepImpact basta para citar la línea.
- **Tiempo estimado**: 1–2 horas combinadas.

### 4.7 Nogueira & Cho (2019). "Passage Re-ranking with BERT". *arXiv*.
- **[RECOMENDADA]**
- **Para qué**: §4.3.1.
- **Notas**: monoBERT. Lectura corta; primer cross-encoder neuronal aplicado a reranking.
- **Tiempo estimado**: 1–2 horas.

### 4.8 Nogueira, Jiang, Pradeep & Lin (2020). "Document Ranking with a Pretrained Sequence-to-Sequence Model". *EMNLP Findings*.
- **[OPCIONAL]**
- **Para qué**: §4.3.1.
- **Notas**: monoT5. Solo si desarrollas el linaje T5; si no, basta con citar.
- **Tiempo estimado**: 1–2 horas.

### 4.9 Zhuang et al. (2023). "RankT5: Fine-Tuning T5 for Text Ranking with Ranking Losses". *SIGIR*.
- **[OPCIONAL]**
- **Para qué**: §4.3.1.
- **Notas**: extensión listwise de monoT5. Cita en línea breve suficiente.
- **Tiempo estimado**: 1 hora.

---

## Fase 5 — Aprendizaje contrastivo y técnicas modernas de entrenamiento (semana 8)

### 5.1 Izacard et al. (2021). "Unsupervised Dense Information Retrieval with Contrastive Learning". *TMLR* (Contriever).
- **[RECOMENDADA]**
- **Para qué**: §3.5.1, §4.2.1.2.
- **Notas**: preentrenamiento contrastivo no supervisado. Pieza intermedia entre DPR y mE5.
- **Tiempo estimado**: 2–3 horas.

### 5.2 Hu et al. (2021). "LoRA: Low-Rank Adaptation of Large Language Models". *ICLR 2022*.
- **[INDISPENSABLE]**
- **Para qué**: §3.5.2, Apéndice A.3.
- **Notas**: LoRA. Lectura corta y muy útil; central para entender jina-v5 y jina-reranker-v3.
- **Tiempo estimado**: 2 horas.

### 5.3 Kusupati et al. (2022). "Matryoshka Representation Learning". *NeurIPS*.
- **[INDISPENSABLE]**
- **Para qué**: §3.5.3.
- **Notas**: MRL. Central para Qwen3, jina-v5 y Jina-ColBERT-v2.
- **Tiempo estimado**: 2–3 horas.

### 5.4 Hofstätter et al. (2020). "Improving Efficient Neural Ranking Models with Cross-Architecture Knowledge Distillation". *arXiv* (MarginMSE).
- **[RECOMENDADA]**
- **Para qué**: §3.5.4.
- **Notas**: MarginMSE como pieza canónica. Si SPLADE-v3 lo cita explícitamente, basta con esa fuente; si no, leer aquí.
- **Tiempo estimado**: 2 horas.

### 5.5 Hinton, Vinyals & Dean (2015). "Distilling the Knowledge in a Neural Network". *NIPS Workshop*.
- **[RECOMENDADA]**
- **Para qué**: §3.5.4.
- **Notas**: paper fundacional de knowledge distillation. Lectura rápida; suficiente para fijar el formalismo KL con softmax-temperatura.
- **Tiempo estimado**: 1–2 horas.

---

## Fase 6 — Modelos multilingües y de vanguardia (semana 9)

**Objetivo**: leer los modelos que efectivamente usarás en tu evaluación experimental, ya con todo el aparato conceptual previo.

### 6.1 Wang et al. (2024). "Multilingual E5 Text Embeddings: A Technical Report". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.2.1.3, §4.6.3.
- **Notas**: documenta mE5 small/base/large/instruct. **Los resultados desglosados en español son evidencia central de tu hipótesis**; anota cuidadosamente la anomalía mE5-large vs mE5-base.
- **Tiempo estimado**: 4 horas.

### 6.2 Chen et al. (2024). "BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.2.2, §4.4.7.
- **Notas**: **pieza narrativa central** de tu tesis. La fusión interna $s_{\text{inter}}$ es el espejo conceptual de tu propuesta. Léelo dos veces.
- **Tiempo estimado**: 5–6 horas.

### 6.3 Zhang et al. (2025). "Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.2.1.4, §4.4.7.
- **Notas**: vanguardia open-source. Pipeline tres etapas + fusión SLERP de checkpoints + MRL. Pieza clave para Objetivo Específico 5.
- **Tiempo estimado**: 4 horas.

### 6.4 Akram et al. (2025). "Jina Embeddings v5". *arXiv* (verificar referencia exacta).
- **[INDISPENSABLE]**
- **Para qué**: §4.2.1.5.
- **Notas**: LoRA por tarea como solución alternativa al instruction-tuning. Importante para discusión metodológica de adaptación a español.
- **Tiempo estimado**: 3–4 horas.

### 6.5 Jha et al. (2024). "Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.2.4.3, §4.6.5.
- **Notas**: late interaction multilingüe; el hallazgo sobre weight-tying en MRL multi-vector y la documentación del fenómeno *translationese* son citas centrales.
- **Tiempo estimado**: 4 horas.

### 6.6 Wang, Li & Xiao (2025). "Jina-Reranker-v3: Last but Not Late Interaction for Document Reranking". *arXiv* (verificar referencia).
- **[INDISPENSABLE]**
- **Para qué**: §4.3.2, §4.4.7.
- **Notas**: paradigma LBNL + model merging lineal. Cita central para discusión de fusión en espacio de parámetros.
- **Tiempo estimado**: 4 horas.

### 6.7 Sun et al. (2023). "Is ChatGPT Good at Search? Investigating Large Language Models as Re-Ranking Agents". *EMNLP* (RankGPT).
- **[RECOMENDADA]**
- **Para qué**: §4.3.2.
- **Notas**: antecedente de jina-reranker-v3; primer uso de LLMs como rerankers listwise.
- **Tiempo estimado**: 2–3 horas.

### 6.8 Pradeep, Sharifymoghaddam & Lin (2023). "RankZephyr: Effective and Robust Zero-Shot Listwise Reranking is a Breeze!". *arXiv*.
- **[OPCIONAL]**
- **Para qué**: §4.3.2.
- **Notas**: destilación abierta de RankGPT. Mención + cita basta si quieres economizar tiempo.
- **Tiempo estimado**: 2 horas.

---

## Fase 7 — Fusión híbrida moderna (semana 10) ⚠️ CRÍTICA

**Objetivo**: cubrir la literatura que conecta la fusión clásica (fase 2) con los modelos modernos (fase 6). Sin esta fase tu tesis parece resucitar técnicas de los 90.

### 7.1 Bruch, Gai & Ingber (2023). "An Analysis of Fusion Functions for Hybrid Retrieval". *ICTIR*.
- **[INDISPENSABLE]**
- **Para qué**: §4.4.6.
- **Notas**: **referencia obligatoria**. Análisis crítico moderno de RRF en contexto dense+sparse. Si no leyeras nada más en esta fase, lee esta.
- **Tiempo estimado**: 4–5 horas.

### 7.2 Luan, Eisenstein, Toutanova & Collins (2021). "Sparse, Dense, and Attentional Representations for Text Retrieval". *TACL*.
- **[INDISPENSABLE]**
- **Para qué**: §4.4.6.
- **Notas**: análisis teórico-empírico de las tres familias de representación; importante para argumentar por qué la fusión heterogénea funciona.
- **Tiempo estimado**: 4 horas.

### 7.3 Lin (2022). "A Proposed Conceptual Framework for a Representational Approach to Information Retrieval". *SIGIR Forum*.
- **[RECOMENDADA]**
- **Para qué**: §4.4.6.
- **Notas**: marco conceptual unificador útil para ubicar tu tesis. Lectura corta.
- **Tiempo estimado**: 1–2 horas.

### 7.4 Ma, Shao, Shi, Han & Lu (2021). "A Replication Study of Dense Passage Retriever". *arXiv*.
- **[OPCIONAL]**
- **Para qué**: §4.4.6.
- **Notas**: discute normalización en hybrid retrieval. Cita selectiva.
- **Tiempo estimado**: 2 horas.

### 7.5 Lin, Nogueira & Yates (2021). *Pretrained Transformers for Text Ranking: BERT and Beyond*. Synthesis Lectures.
- **[CONSULTA — RECOMENDADA]**
- **Para qué**: panorama completo de IR neuronal hasta 2021.
- **Notas**: libro/monografía. Útil como manual de consulta para resolver dudas de pipeline. No leer linealmente.
- **Tiempo estimado**: 5–10 horas selectivas.

---

## Fase 8 — Benchmarks y evaluación (semana 11)

### 8.1 Bajaj et al. (2016). "MS MARCO: A Human Generated Machine Reading Comprehension Dataset". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.5.2.
- **Notas**: lectura selectiva (descripción del dataset).
- **Tiempo estimado**: 1–2 horas.

### 8.2 Craswell et al. (2019, 2020). TREC Deep Learning Track Overview papers.
- **[RECOMENDADA]**
- **Para qué**: §4.5.2.
- **Notas**: documentación de TREC DL 2019/2020. Lectura selectiva.
- **Tiempo estimado**: 2 horas combinadas.

### 8.3 Thakur et al. (2021). "BEIR: A Heterogeneous Benchmark for Zero-shot Evaluation of Information Retrieval Models". *NeurIPS Datasets*.
- **[INDISPENSABLE]**
- **Para qué**: §4.5.3.
- **Notas**: hallazgo crítico sobre dense encoders y zero-shot OOD. Cita central.
- **Tiempo estimado**: 3 horas.

### 8.4 Zhang et al. (2023). "MIRACL: A Multilingual Retrieval Dataset Covering 18 Diverse Languages". *TACL*.
- **[INDISPENSABLE]**
- **Para qué**: §4.5.3, §4.6.3, §4.6.5.
- **Notas**: incluye español; benchmark de comparación principal con MessIRve.
- **Tiempo estimado**: 3 horas.

### 8.5 Zhang, Ma, Shi & Lin (2021). "Mr. TyDi: A Multi-lingual Benchmark for Dense Retrieval". *MRL Workshop*.
- **[RECOMENDADA]**
- **Para qué**: §4.5.3.
- **Notas**: benchmark hermano de MIRACL.
- **Tiempo estimado**: 1–2 horas.

### 8.6 Muennighoff, Tazi, Magne & Reimers (2022). "MTEB: Massive Text Embedding Benchmark". *EACL 2023*.
- **[INDISPENSABLE]**
- **Para qué**: §4.5.3.
- **Notas**: métrica estándar para comparar modelos de embedding modernos. Lectura selectiva.
- **Tiempo estimado**: 2–3 horas.

### 8.7 **Paper original de MessIRve** (verificar cita exacta).
- **[INDISPENSABLE]**
- **Para qué**: §4.5.5, §4.6.4 (toda la sección sobre el benchmark central de tu tesis).
- **Notas**: **lectura obligatoria, hueco crítico de tu protocolo actual**. Documentar exhaustivamente: tamaño, juicios, dialecto, comparación con MIRACL-es. Si no lo has procesado aún, **es la prioridad inmediata**.
- **Tiempo estimado**: 4–5 horas.

### 8.8 Malkov & Yashunin (2018). "Efficient and robust approximate nearest neighbor search using Hierarchical Navigable Small World graphs". *TPAMI*.
- **[OPCIONAL]**
- **Para qué**: §3.7.4.
- **Notas**: HNSW. Solo si desarrollas profundamente la subsección de búsqueda eficiente.
- **Tiempo estimado**: 2 horas.

### 8.9 Johnson, Douze & Jégou (2019). "Billion-Scale Similarity Search with GPUs". *IEEE Transactions on Big Data*.
- **[OPCIONAL]**
- **Para qué**: §3.7.4.
- **Notas**: FAISS. Mención + referencia suele bastar.
- **Tiempo estimado**: 1–2 horas.

### 8.10 Webber, Moffat & Zobel (2010). "A Similarity Measure for Indefinite Rankings". (Ya listado en 2.6.)

---

## Fase 9 — Especificidad del español (semana 12)

### 9.1 Cañete, Chaperon, Fuentes, Ho, Kang & Pérez (2020). "Spanish Pre-Trained BERT Model and Evaluation Data". *PML4DC at ICLR*.
- **[RECOMENDADA]**
- **Para qué**: §4.6.2.
- **Notas**: BETO. Lectura corta; suficiente para justificar por qué no lo usas.
- **Tiempo estimado**: 1–2 horas.

### 9.2 Gutiérrez-Fandiño et al. (2022). "MarIA: Spanish Language Models". *Procesamiento del Lenguaje Natural*.
- **[RECOMENDADA]**
- **Para qué**: §4.6.2.
- **Notas**: MarIA/RoBERTa-bne. Análogo a BETO.
- **Tiempo estimado**: 1–2 horas.

### 9.3 Documentación de Snowball-ES, spaCy-es, Freeling.
- **[CONSULTA — RECOMENDADA]**
- **Para qué**: §4.6.1.
- **Notas**: documentación técnica, no papers académicos. Suficiente revisar capítulos sobre stemming/lematización en español.
- **Tiempo estimado**: 2–3 horas selectivas.

---

## Fase 10 — Lecturas marginales y de contexto (consulta puntual)

### 10.1 Yang, Fang & Lin (2017). "Anserini: Enabling the Use of Lucene for Information Retrieval Research". *SIGIR Demo*.
- **[OPCIONAL]**
- **Para qué**: §4.1.4.
- **Tiempo estimado**: 1 hora.

### 10.2 Lin et al. (2021). "Pyserini: A Python Toolkit for Reproducible Information Retrieval Research with Sparse and Dense Representations". *SIGIR Demo*.
- **[OPCIONAL]**
- **Para qué**: §4.1.4.
- **Tiempo estimado**: 1 hora.

### 10.3 Lv & Zhai (2011). "Lower-Bounding Term Frequency Normalization". *CIKM*.
- **[OPCIONAL]**
- **Para qué**: §4.1.3.
- **Notas**: BM25+/BM25L. Cita selectiva.
- **Tiempo estimado**: 1 hora.

### 10.4 Eckart & Young (1936). "The Approximation of One Matrix by Another of Lower Rank". *Psychometrika*.
- **[OPCIONAL]**
- **Para qué**: Apéndice A.3.
- **Notas**: histórico; basta con la presentación de cualquier libro de álgebra lineal.
- **Tiempo estimado**: saltar; usar Strang.

### 10.5 Strang. *Introduction to Linear Algebra*.
- **[CONSULTA — OPCIONAL]**
- **Para qué**: Apéndice A.3.
- **Tiempo estimado**: 1 hora consulta puntual.

### 10.6 Asai et al. mDPR (verificar paper exacto).
- **[OPCIONAL]**
- **Para qué**: §4.2.1.1.
- **Notas**: confirmar referencia exacta; muchas implementaciones referidas como "mDPR" provienen de papers distintos.
- **Tiempo estimado**: 1–2 horas.

---

## Resumen ejecutivo del plan

### Distribución temporal estimada (12 semanas)

| Fase | Semanas | Horas estimadas | Lecturas indispensables |
|---|---|---|---|
| 0 | continua | 6–8 | 1 (consulta) |
| 1 | 1–2 | 12–16 | 2 |
| 2 | 3 | 15–20 | 5 |
| 3 | 4–5 | 10–15 | 3 |
| 4 | 6–7 | 18–22 | 4 |
| 5 | 8 | 7–10 | 2 |
| 6 | 9 | 18–25 | 5 |
| 7 | 10 | 10–15 | 2 |
| 8 | 11 | 10–14 | 4 |
| 9 | 12 | 5–8 | 0 (todas RECOMENDADAS) |

**Total INDISPENSABLES**: aproximadamente 28 papers + 2 manuales de consulta (~110–130 horas de lectura).

### Tres rutas alternativas según restricciones de tiempo

**Ruta mínima (8 semanas, ~80h)**: solo INDISPENSABLES, saltar fases 5.4–5.5, reducir fase 4 a 4.1–4.5, omitir fase 9 hasta el momento de redactar §4.6.

**Ruta estándar (12 semanas, ~130h)**: el plan completo arriba descrito.

**Ruta exhaustiva (16+ semanas, ~180h)**: añadir todas las RECOMENDADAS y las OPCIONALES marcadas en fases 4, 6 y 7.

### Tres reglas de eficiencia

1. **No leas linealmente Robertson & Zaragoza (2009)**: es un *Foundations and Trends*, no un paper. Léelo en dos pasadas (mapeo + profundización).

2. **Hazte fichas de los métodos de fusión**: Fase 2 (cinco papers) sobrecarga si lees sin sintetizar. Llevá una ficha de una página por método con: formulación, complejidad, hiperparámetros, resultados de referencia, fortalezas/debilidades.

3. **Prioriza MessIRve antes que cualquier otra cosa pendiente**: si todavía no tenés procesado el paper original de MessIRve, eso es prioridad #1, anterior incluso a esta secuencia. Sin él, tu §4.5.5 y §4.6.4 son aire.

### Una recomendación final

Considera mantener un **documento vivo de citas anotadas** (formato BibTeX + nota de 100–200 palabras por entrada) durante todo el proceso de lectura. Este documento se convertirá orgánicamente en la base de tu bibliografía final y te ahorrará semanas durante la redacción. Herramientas como Zotero con plugin Better BibTeX, o un simple archivo Markdown, sirven igualmente.

¿Quieres que ahora pasemos a la metodología y diseño experimental, o prefieres ajustar este plan de lectura primero?