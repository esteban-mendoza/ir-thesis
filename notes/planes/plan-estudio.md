# Plan de lectura bibliográfica

A continuación presento la versión revisada del plan, alineada con el nuevo esqueleto del marco teórico y estado del arte. Los cambios principales reflejan: (a) la eliminación del apéndice (preliminares matemáticos integrados en el marco teórico); (b) la nueva organización por fichas técnicas en §3.6; (c) la incorporación de ISR como algoritmo independiente; (d) el énfasis en fusión léxico-semántica neuronal (§4.4.5); (e) la nueva §4.4.7 sobre fusión en español/otras lenguas; (f) la nueva §4.5 sobre comparaciones empíricas fusión vs. reranking neuronal.

Convenciones:
- **[INDISPENSABLE]**: lectura obligatoria, citada directamente en el manuscrito.
- **[RECOMENDADA]**: complementa el argumento; consulta selectiva.
- **[OPCIONAL]**: referencia para profundizar.
- **[CONSULTA]**: tipo manual/handbook; no se lee linealmente.

---

## Fase 0 — Manuales de consulta permanente

Estas fuentes son **manuales de referencia**. Las listo primero porque las consultarás repetidamente.

### 0.1 Manning, Raghavan & Schütze (2008). *Introduction to Information Retrieval*. Cambridge UP.
- **[CONSULTA — INDISPENSABLE]**
- **Capítulos clave**: 1 (booleano y términos), 6 (TF-IDF), 8 (evaluación), 11 (BIM y BM25 brevemente).
- **Para qué**: §3.1.1, §3.2.1, §3.8.1.
- **Tiempo estimado**: 3–4 horas de consulta selectiva.

### 0.2 Lin, Nogueira & Yates (2021). *Pretrained Transformers for Text Ranking: BERT and Beyond*. Synthesis Lectures.
- **[CONSULTA — RECOMENDADA]**
- **Para qué**: panorama completo de IR neuronal hasta 2021; útil como manual transversal para §3.4, §3.6, §4.3.
- **Notas**: leer selectivamente cuando surjan dudas de pipeline.
- **Tiempo estimado**: 5–10 horas selectivas.

### 0.3 Goodfellow, Bengio & Courville (2016). *Deep Learning*. MIT Press.
- **[CONSULTA — OPCIONAL]**
- **Capítulos clave**: 3 (probabilidad), 5 (ML básico), 6.2 (entropía cruzada).
- **Para qué**: prerrequisitos asumidos en §3.5.1, §3.5.5.
- **Notas**: saltar si tu base es sólida; consultar puntualmente para refrescar entropía cruzada/softmax.
- **Tiempo estimado**: 2 horas si necesitas refrescar.

### 0.4 Strang. *Introduction to Linear Algebra*.
- **[CONSULTA — OPCIONAL]**
- **Para qué**: SVD/Eckart-Young dentro de §3.5.2 (LoRA).
- **Notas**: consulta puntual de 1 hora si necesitas revisar SVD.

---

## Fase 1 — Fundamentos clásicos de IR (semana 1–2)

**Objetivo**: dominar el lenguaje y formalismo del paradigma probabilístico antes de tocar nada neuronal.

### 1.1 Robertson & Zaragoza (2009). "The Probabilistic Relevance Framework: BM25 and Beyond". *Foundations and Trends in IR*, 3(4).
- **[INDISPENSABLE]**
- **Para qué**: prácticamente toda §3.2 (PRP, BIM, RSJ, eliteness, normalización por longitud, BM25, BM25F, PRF).
- **Notas**: este es **el** texto fundacional para tu §3.2. Léelo dos veces: primero rápido para mapeo, luego despacio anotando las derivaciones (§§ 3.1–3.3 del paper son críticos). El argumento del PRP (§ 2) y la derivación de BM25 (§ 3.4) son las piezas que más reusarás.
- **Tiempo estimado**: 8–10 horas.

### 1.2 Salton, Wong & Yang (1975). "A Vector Space Model for Automatic Indexing". *CACM*, 18(11).
- **[OPCIONAL]**
- **Para qué**: §3.2.1 contexto histórico.
- **Notas**: cita histórica obligatoria pero suficiente con la presentación de IIR cap. 6.
- **Tiempo estimado**: 1 hora si decides leerlo.

### 1.3 Sanderson (2010). "Test Collection Based Evaluation of Information Retrieval Systems". *Foundations and Trends in IR*, 4(4).
- **[RECOMENDADA]**
- **Para qué**: §3.8.1, §3.8.2.
- **Notas**: la referencia moderna para evaluación; complementa IIR cap. 8 con discusión sobre juicios incompletos.
- **Tiempo estimado**: 3–4 horas (lectura selectiva).

### 1.4 Smucker, Allan & Carterette (2007). "A Comparison of Statistical Significance Tests for Information Retrieval Evaluation". *CIKM*.
- **[INDISPENSABLE]**
- **Para qué**: §3.8.5.
- **Notas**: justificación canónica del randomization test sobre paired t-test en IR. Lectura corta y muy útil.
- **Tiempo estimado**: 1–2 horas.

### 1.5 Webber, Moffat & Zobel (2010). "A Similarity Measure for Indefinite Rankings". *TOIS*, 28(4).
- **[RECOMENDADA]**
- **Para qué**: §3.8.3 (RBO).
- **Notas**: paper original de RBO. Si Bailey et al. (2017, fase 2) basta para tu tratamiento, OPCIONAL; si quieres formalizar RBO con rigor matemático, INDISPENSABLE.
- **Tiempo estimado**: 2–3 horas.

---

## Fase 2 — Fusión clásica de rangos (semana 3)

**Objetivo**: dominar los algoritmos de fusión en orden cronológico, viéndolos como respuestas progresivas al mismo problema.

### 2.1 Fox & Shaw (1994). "Combination of Multiple Searches". *TREC-2*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.2, §4.4.1.
- **Notas**: el paper fundacional. El **efecto coro** y el hallazgo "diversidad > similitud" son citas centrales para tu hipótesis. Léelo despacio.
- **Tiempo estimado**: 3–4 horas.

### 2.2 Aslam & Montague (2001). "Models for Metasearch". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.3, §4.4.2.
- **Notas**: introduce Borda-fuse y Bayes-fuse; la formalización de los modelos de votación es lo que toma tu §3.7.1.
- **Tiempo estimado**: 3–4 horas.

### 2.3 Montague & Aslam (2002). "Condorcet Fusion for Improved Retrieval". *CIKM*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.4, §4.4.2.
- **Notas**: la reducción algorítmica al sort y los teoremas de torneo son la pieza matemáticamente más rica de §3.7. Anota las demostraciones para incluirlas (esbozadas) en el manuscrito.
- **Tiempo estimado**: 3–4 horas.

### 2.4 Cormack, Clarke & Büttcher (2009). "Reciprocal Rank Fusion outperforms Condorcet and individual Rank Learning Methods". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.6, §4.4.3.
- **Notas**: paper corto pero **el método central** de tu tesis. Análisis de robustez de $k$ y comparación con Learning-to-Rank son lo que cita §4.4.3.
- **Tiempo estimado**: 2–3 horas.

### 2.5 Bailey, Moffat, Scholer & Thomas (2017). "Retrieval Consistency in the Presence of Query Variations". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.5, §3.8.3, §4.1.6, §4.4.4.
- **Notas**: introduce RBC, retrieval consistency, y el marco unificador (Borda/RBC/RRF como esperanzas bajo distintas distribuciones). Esta unificación es el clímax conceptual de tu §3.7.
- **Tiempo estimado**: 4–5 horas.

### 2.6 Mourão, Martins & Magalhães (2015). "Multimodal medical information retrieval with unsupervised rank fusion". *Computerized Medical Imaging and Graphics*, 39, 35–45.
- **[INDISPENSABLE]**
- **Para qué**: §3.7.7 (ISR).
- **Notas**: **NUEVO en este plan**. Paper original donde se introduce Inverse Square Rank fusion. Lectura corta enfocada en la formulación matemática y la justificación del decaimiento cuadrático.
- **Tiempo estimado**: 2 horas.

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
- **Para qué**: §3.3.4.
- **Notas**: BPE original. Lectura corta. Relevante para §4.2.1 (morfología del español).
- **Tiempo estimado**: 1 hora.

### 3.7 Kudo (2018). "Subword Regularization". *ACL*; Kudo & Richardson (2018). "SentencePiece". *EMNLP Demo*.
- **[OPCIONAL]**
- **Para qué**: §3.3.4.
- **Notas**: solo si profundizas en tokenización en español; si no, basta Sennrich.
- **Tiempo estimado**: 1–2 horas.

### 3.8 Cover & Thomas (2006). *Elements of Information Theory* (2da ed.). Wiley.
- **[CONSULTA — OPCIONAL]**
- **Capítulos clave**: 2.3 (KL divergence).
- **Para qué**: KL integrada en §3.5.5 (destilación).
- **Notas**: consulta puntual de 1 hora si necesitas refrescar KL; saltar si Goodfellow basta.

---

## Fase 4 — Aprendizaje contrastivo y técnicas modernas de entrenamiento (semana 6)

**Objetivo**: dominar las técnicas transversales (InfoNCE, LoRA, MRL, destilación, model merging) antes de leer los modelos que las aplican.

### 4.1 Karpukhin et al. (2020). "Dense Passage Retrieval for Open-Domain Question Answering". *EMNLP*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.1, §3.5.1, §4.4.5.
- **Notas**: DPR como bi-encoder canónico y la interpolación lineal BM25+DPR como baseline híbrido moderno. Doble cita.
- **Tiempo estimado**: 3 horas.

### 4.2 Izacard et al. (2021). "Unsupervised Dense Information Retrieval with Contrastive Learning". *TMLR* (Contriever).
- **[RECOMENDADA]**
- **Para qué**: §3.5.1.
- **Notas**: preentrenamiento contrastivo no supervisado. Pieza intermedia entre DPR y mE5.
- **Tiempo estimado**: 2–3 horas.

### 4.3 Hu et al. (2021). "LoRA: Low-Rank Adaptation of Large Language Models". *ICLR 2022*.
- **[INDISPENSABLE]**
- **Para qué**: §3.5.2.
- **Notas**: LoRA. Lectura corta y muy útil; central para entender jina-v5 y jina-reranker-v3. La discusión sobre aproximación de bajo rango aquí reemplaza al apéndice eliminado.
- **Tiempo estimado**: 2 horas.

### 4.4 Kusupati et al. (2022). "Matryoshka Representation Learning". *NeurIPS*.
- **[INDISPENSABLE]**
- **Para qué**: §3.5.4.
- **Notas**: MRL. Central para Qwen3, jina-v5 y Jina-ColBERT-v2.
- **Tiempo estimado**: 2–3 horas.

### 4.5 Hinton, Vinyals & Dean (2015). "Distilling the Knowledge in a Neural Network". *NIPS Workshop*.
- **[RECOMENDADA]**
- **Para qué**: §3.5.5.
- **Notas**: paper fundacional de knowledge distillation. Lectura rápida; suficiente para fijar el formalismo KL con softmax-temperatura. Como eliminaste el apéndice, esta lectura cubre la formalización de KL que antes estaba en A.2.
- **Tiempo estimado**: 1–2 horas.

### 4.6 Hofstätter et al. (2020). "Improving Efficient Neural Ranking Models with Cross-Architecture Knowledge Distillation". *arXiv* (MarginMSE).
- **[RECOMENDADA]**
- **Para qué**: §3.5.5.
- **Notas**: MarginMSE como pieza canónica. Si SPLADE-v3 lo cita explícitamente, basta con esa fuente; si no, leer aquí.
- **Tiempo estimado**: 2 horas.

### 4.7 Wortsman et al. (2022). "Model soups: averaging weights of multiple fine-tuned models improves accuracy without increasing inference time". *ICML*.
- **[RECOMENDADA]**
- **Para qué**: §3.5.6 (model merging).
- **Notas**: **NUEVO en este plan**. Pieza fundacional para entender model merging lineal/SLERP. Lectura selectiva del marco conceptual; suficiente para citar el linaje del que derivan Qwen3 (SLERP) y jina-reranker-v3 (linear merging).
- **Tiempo estimado**: 2 horas.

---

## Fase 5 — Modelos neuronales seminales para IR (semana 7–8)

**Objetivo**: leer en orden cronológico los modelos que definieron las cuatro familias arquitectónicas que sustentan tu §3.4.

### 5.1 Khattab & Zaharia (2020). "ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.4 (paradigma late interaction).
- **Notas**: paper seminal de late interaction. Las ablaciones (sustitución de MaxSim) son la evidencia que cita §3.4.4. Aunque el modelo que usas es Jina-ColBERT-v2, esta lectura es fundacional.
- **Tiempo estimado**: 4 horas.

### 5.2 Santhanam et al. (2022). "ColBERTv2: Effective and Efficient Retrieval via Lightweight Late Interaction". *NAACL*.
- **[RECOMENDADA]**
- **Para qué**: §3.4.4 (linaje hacia Jina-ColBERT-v2).
- **Notas**: centroid compression y residual representation. Pieza intermedia entre v1 y Jina-ColBERT-v2.
- **Tiempo estimado**: 3 horas.

### 5.3 Formal, Piwowarski & Clinchant (2021). "SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking". *SIGIR*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.2 (paradigma sparse encoder), §3.6.5 (linaje del modelo).
- **Notas**: SPLADE v1 con regularización asimétrica. Pieza fundacional para la conexión axiomática entre saturación TF (§3.2.4) y sparse encoders neuronales.
- **Tiempo estimado**: 3–4 horas.

### 5.4 Nogueira & Cho (2019). "Passage Re-ranking with BERT". *arXiv*.
- **[RECOMENDADA]**
- **Para qué**: §3.4.3 (paradigma cross-encoder), §4.3.1.
- **Notas**: monoBERT. Lectura corta; primer cross-encoder neuronal aplicado a reranking.
- **Tiempo estimado**: 1–2 horas.

### 5.5 Nogueira, Jiang, Pradeep & Lin (2020). "Document Ranking with a Pretrained Sequence-to-Sequence Model". *EMNLP Findings*.
- **[OPCIONAL]**
- **Para qué**: §4.3.1.
- **Notas**: monoT5. Solo si desarrollas el linaje T5; si no, basta con citar.
- **Tiempo estimado**: 1–2 horas.

### 5.6 Zhuang et al. (2023). "RankT5: Fine-Tuning T5 for Text Ranking with Ranking Losses". *SIGIR*.
- **[OPCIONAL]**
- **Para qué**: §4.3.1.
- **Notas**: extensión listwise de monoT5. Cita en línea breve suficiente.
- **Tiempo estimado**: 1 hora.

### 5.7 Sun et al. (2023). "Is ChatGPT Good at Search? Investigating Large Language Models as Re-Ranking Agents". *EMNLP* (RankGPT).
- **[RECOMENDADA]**
- **Para qué**: §3.4.5, §4.3.2.
- **Notas**: antecedente directo de jina-reranker-v3; primer uso de LLMs como rerankers listwise zero-shot. Necesario para entender el paradigma "Last but Not Late" como evolución del listwise.
- **Tiempo estimado**: 2–3 horas.

### 5.8 Pradeep, Sharifymoghaddam & Lin (2023). "RankZephyr: Effective and Robust Zero-Shot Listwise Reranking is a Breeze!". *arXiv*.
- **[OPCIONAL]**
- **Para qué**: §4.3.2.
- **Notas**: destilación abierta de RankGPT. Mención + cita basta si quieres economizar tiempo.
- **Tiempo estimado**: 2 horas.

---

## Fase 6 — Modelos de tu evaluación experimental (semana 9–10)

**Objetivo**: leer cuidadosamente cada uno de los modelos que tienen ficha técnica en §3.6, ya con todo el aparato conceptual previo.

### 6.1 Wang et al. (2024). "Multilingual E5 Text Embeddings: A Technical Report". *arXiv:2402.05672*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.1, §4.2.4.
- **Notas**: documenta mE5 small/base/large/instruct. **Los resultados desglosados en español son evidencia central de tu hipótesis**; anota cuidadosamente la anomalía mE5-large vs mE5-base.
- **Tiempo estimado**: 4 horas.

### 6.2 Chen et al. (2024). "BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation". *arXiv:2402.03216*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.2, §4.2.4, §4.4.6.
- **Notas**: **pieza narrativa central** de tu tesis. La fusión interna $s_{\text{inter}}$ es el espejo conceptual de tu propuesta de fusión externa. Léelo dos veces.
- **Tiempo estimado**: 5–6 horas.

### 6.3 Zhang et al. (2025). "Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models". *arXiv:2506.05176*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.3, §3.5.6, §4.2.4.
- **Notas**: vanguardia open-source. Pipeline tres etapas + fusión SLERP de checkpoints + MRL. Pieza clave para Objetivo Específico 5.
- **Tiempo estimado**: 4 horas.

### 6.4 Akram, Sturua, Havriushenko, Herreros, Günther, Werk & Xiao (2026). "jina-embeddings-v5-text: Task-Targeted Embedding Distillation". *arXiv:2602.15547*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.4, §4.2.4.
- **Notas**: LoRA por tarea como solución alternativa al instruction-tuning. Importante para discusión metodológica de adaptación a español. Es además el mejor retriever individual de tus experimentos preliminares (nDCG@10 = 0.5115).
- **Tiempo estimado**: 3–4 horas.

### 6.5 Lassance, Déjean, Formal & Clinchant (2024). "SPLADE-v3: New Baselines for SPLADE". *arXiv:2403.06789*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.5, §4.2.4, §4.3.4.
- **Notas**: documenta el salto cualitativo vía destilación de ensamble. Cita central para §4.3.4 (cascada SPLADE→DeBERTaV3 como sweet spot).
- **Tiempo estimado**: 3 horas.

### 6.6 Jha, Wang, Günther, Mastrapas, Sturua, Mohr, Koukounas, Akram, Wang & Xiao (2024). "Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever". *ACL/EMNLP*.
- **[INDISPENSABLE]**
- **Para qué**: §3.6.6, §4.2.3, §4.2.4.
- **Notas**: late interaction multilingüe; el hallazgo sobre weight-tying en MRL multi-vector y la documentación del fenómeno *translationese* son citas centrales.
- **Tiempo estimado**: 4 horas.

### 6.7 BAAI (2024). bge-reranker-v2-m3 (referencia técnica/model card).
- **[INDISPENSABLE]**
- **Para qué**: §3.6.7, §4.3.3.
- **Notas**: cross-encoder multilingüe que evalúas. Si no existe paper formal, usar la documentación oficial del repositorio HuggingFace + el paper de BGE-M3 como base. Verificar referencia exacta.
- **Tiempo estimado**: 1–2 horas.

### 6.8 Wang, Li & Xiao (2025). "jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking". *arXiv:2509.25085*.
- **[INDISPENSABLE]**
- **Para qué**: §3.4.5, §3.6.8, §3.5.6, §4.3.3.
- **Notas**: paradigma LBNL + model merging lineal. Cita central para §3.4.5 (paradigma propio) y para §3.5.6 (model merging). Es el reranker neuronal con mejor desempeño en tus experimentos preliminares (nDCG@10 = 0.5792).
- **Tiempo estimado**: 4 horas.

---

## Fase 7 — Fusión léxico-semántica neuronal (semana 11) ⚠️ CRÍTICA

**Objetivo**: cubrir la literatura que conecta la fusión clásica (fase 2) con los modelos modernos (fase 6). Sin esta fase tu tesis parece resucitar técnicas de los 90.

### 7.1 Bruch, Gai & Ingber (2023). "An Analysis of Fusion Functions for Hybrid Retrieval". *ICTIR*.
- **[INDISPENSABLE]**
- **Para qué**: §4.4.5, §4.5.1.
- **Notas**: **referencia obligatoria**. Análisis crítico moderno de RRF en contexto dense+sparse. Si no leyeras nada más en esta fase, lee esta. Provee la mayor parte del andamiaje conceptual de §4.4.5.
- **Tiempo estimado**: 4–5 horas.

### 7.2 Luan, Eisenstein, Toutanova & Collins (2021). "Sparse, Dense, and Attentional Representations for Text Retrieval". *TACL*.
- **[INDISPENSABLE]**
- **Para qué**: §4.4.5.
- **Notas**: análisis teórico-empírico de las tres familias de representación; importante para argumentar por qué la fusión heterogénea funciona.
- **Tiempo estimado**: 4 horas.

### 7.3 Lin (2022). "A Proposed Conceptual Framework for a Representational Approach to Information Retrieval". *SIGIR Forum*.
- **[RECOMENDADA]**
- **Para qué**: §4.4.5, §4.4.6.
- **Notas**: marco conceptual unificador útil para ubicar tu tesis. Lectura corta.
- **Tiempo estimado**: 1–2 horas.

### 7.4 Ma, Shao, Shi, Han & Lu (2021). "A Replication Study of Dense Passage Retriever". *arXiv*.
- **[OPCIONAL]**
- **Para qué**: §4.4.5.
- **Notas**: discute normalización en hybrid retrieval. Cita selectiva.
- **Tiempo estimado**: 2 horas.

### 7.5 Chen, Wang, Liu, Cui, Sun & Wen (2022). "Salient Phrase Aware Dense Retrieval: Can a Dense Retriever Imitate a Sparse One?". *Findings of EMNLP*. [verificar]
- **[OPCIONAL]**
- **Para qué**: §4.4.5.
- **Notas**: trabajo complementario sobre coordinación entre dense y sparse.
- **Tiempo estimado**: 2 horas.

---

## Fase 8 — Benchmarks y MessIRve (semana 12) ⚠️ PRIORITARIA

**Objetivo**: dominar los benchmarks y, sobre todo, el conjunto de datos central de tu tesis.

### 8.1 **Valentini et al. (2025). "MessIRve: A Large-Scale Spanish Information Retrieval Dataset"** (verificar cita exacta).
- **[INDISPENSABLE — PRIORIDAD ABSOLUTA]**
- **Para qué**: §4.1.7 (descripción exhaustiva), §4.2.4 (líneas base), §4.6 (posicionamiento).
- **Notas**: **lectura obligatoria, prioridad #1 de todo el plan**. Documentar exhaustivamente: tamaño, queries, juicios, dialecto, comparación con MIRACL-es, y especialmente las **líneas base de modelos propietarios** (text-embedding-3-large) que son objeto explícito de tu Objetivo Específico 5. Si todavía no lo procesaste, esta es la prioridad inmediata, anterior incluso al resto de la fase 8.
- **Tiempo estimado**: 4–5 horas.

### 8.2 Bajaj et al. (2016). "MS MARCO: A Human Generated Machine Reading Comprehension Dataset". *arXiv*.
- **[INDISPENSABLE]**
- **Para qué**: §4.1.2.
- **Notas**: lectura selectiva (descripción del dataset).
- **Tiempo estimado**: 1–2 horas.

### 8.3 Craswell et al. (2019, 2020). TREC Deep Learning Track Overview papers.
- **[RECOMENDADA]**
- **Para qué**: §4.1.2.
- **Notas**: documentación de TREC DL 2019/2020. Lectura selectiva.
- **Tiempo estimado**: 2 horas combinadas.

### 8.4 Thakur et al. (2021). "BEIR: A Heterogeneous Benchmark for Zero-shot Evaluation of Information Retrieval Models". *NeurIPS Datasets*.
- **[INDISPENSABLE]**
- **Para qué**: §4.1.3.
- **Notas**: hallazgo crítico sobre dense encoders y zero-shot OOD. Cita central.
- **Tiempo estimado**: 3 horas.

### 8.5 Zhang et al. (2023). "MIRACL: A Multilingual Retrieval Dataset Covering 18 Diverse Languages". *TACL*.
- **[INDISPENSABLE]**
- **Para qué**: §4.1.4, §4.2.4, §4.2.3.
- **Notas**: incluye español; benchmark de comparación principal con MessIRve. Provee la mayor parte de las cifras de §4.2.4.
- **Tiempo estimado**: 3 horas.

### 8.6 Zhang, Ma, Shi & Lin (2021). "Mr. TyDi: A Multi-lingual Benchmark for Dense Retrieval". *MRL Workshop*.
- **[RECOMENDADA]**
- **Para qué**: §4.1.4.
- **Notas**: benchmark hermano de MIRACL, usado en SFT por varios modelos del §3.6.
- **Tiempo estimado**: 1–2 horas.

### 8.7 Muennighoff, Tazi, Magne & Reimers (2022). "MTEB: Massive Text Embedding Benchmark". *EACL 2023*.
- **[INDISPENSABLE]**
- **Para qué**: §4.1.5.
- **Notas**: métrica estándar para comparar modelos de embedding modernos. Lectura selectiva. Justifica la elección de MAP en tu batería de métricas.
- **Tiempo estimado**: 2–3 horas.

### 8.8 Malkov & Yashunin (2018). "Efficient and robust approximate nearest neighbor search using Hierarchical Navigable Small World graphs". *TPAMI*.
- **[OPCIONAL]**
- **Para qué**: §3.8.4.
- **Notas**: HNSW. Solo si desarrollas profundamente la subsección de búsqueda eficiente.
- **Tiempo estimado**: 2 horas.

### 8.9 Johnson, Douze & Jégou (2019). "Billion-Scale Similarity Search with GPUs". *IEEE Transactions on Big Data*.
- **[OPCIONAL]**
- **Para qué**: §3.8.4.
- **Notas**: FAISS. Mención + referencia suele bastar.
- **Tiempo estimado**: 1–2 horas.

---

## Fase 9 — Especificidad del español y fusión en lenguas no inglesas (semana 13) ⚠️ NUEVA Y CRÍTICA

**Objetivo**: documentar las particularidades del español y, especialmente, recopilar la literatura de fusión en español/otras lenguas (§4.4.7) que es respuesta directa a la instrucción de tu asesora.

### 9.1 Documentación de Snowball-ES, spaCy-es, Freeling.
- **[CONSULTA — RECOMENDADA]**
- **Para qué**: §4.2.1.
- **Notas**: documentación técnica, no papers académicos. Suficiente revisar capítulos sobre stemming/lematización en español.
- **Tiempo estimado**: 2–3 horas selectivas.

### 9.2 Búsqueda bibliográfica activa: fusión de rangos en CLEF Ad-Hoc Track (ediciones con español).
- **[INDISPENSABLE]**
- **Para qué**: §4.4.7.
- **Notas**: **NUEVA EN ESTE PLAN**. Buscar en proceedings de CLEF (especialmente 2001–2008) los trabajos que aplicaron fusión a IR en español. Búsqueda en la biblioteca digital de CLEF y en SpringerLink.
- **Tiempo estimado**: 3–4 horas de búsqueda + lectura selectiva.

### 9.3 Búsqueda bibliográfica activa: trabajos en SEPLN/IberLEF sobre IR en español.
- **[RECOMENDADA]**
- **Para qué**: §4.4.7, §4.2.
- **Notas**: revisar los proceedings recientes (2018–2025) de la Sociedad Española para el Procesamiento del Lenguaje Natural (SEPLN). Probablemente encuentres poco sobre fusión específicamente, pero puedes documentar el contraste entre el volumen de literatura en NLP español y la escasez en fusión, lo cual fortalece el gap de tu tesis.
- **Tiempo estimado**: 2–3 horas.

### 9.4 Búsqueda bibliográfica activa: trabajos de fusión en otras lenguas no inglesas (chino, árabe, hindi).
- **[RECOMENDADA]**
- **Para qué**: §4.4.7.
- **Notas**: buscar en ACL Anthology y en proceedings de NTCIR (chino/japonés) trabajos de fusión sobre los idiomas de MIRACL/Mr.TyDi distintos del inglés.
- **Tiempo estimado**: 2–3 horas.

### 9.5 [Eliminado del plan original] Cañete et al. BETO; Gutiérrez-Fandiño et al. MarIA.
- **[ELIMINADO]**: tu asesora pidió ignorar la sección sobre backbones específicos en español; estas referencias ya no son necesarias.

---

## Fase 10 — Lecturas marginales y de contexto (consulta puntual)

### 10.1 Yang, Fang & Lin (2017). "Anserini". *SIGIR Demo*.
- **[OPCIONAL]**
- **Para qué**: mención de infraestructura en §3.2.6.
- **Tiempo estimado**: 1 hora.

### 10.2 Lin et al. (2021). "Pyserini". *SIGIR Demo*.
- **[OPCIONAL]**
- **Para qué**: mención de infraestructura en §3.2.6.
- **Tiempo estimado**: 1 hora.

### 10.3 Lv & Zhai (2011). "Lower-Bounding Term Frequency Normalization". *CIKM*.
- **[OPCIONAL]**
- **Para qué**: mención de BM25+/BM25L en §3.2.6.
- **Tiempo estimado**: 1 hora.

### 10.4 Mallia et al. (2021). "DeepImpact"; Nogueira & Lin (2019). "doc2query"; Zhuang & Zuccon (2021). "TILDE".
- **[OPCIONAL]**
- **Para qué**: contexto adicional para sparse encoders alternativos a SPLADE (no incluidos formalmente en tu nuevo esqueleto).
- **Notas**: si tu asesora no exige discutir esta línea hermana, puedes omitirlas.
- **Tiempo estimado**: 1–2 horas combinadas si decides incluirlas.

---

## Resumen ejecutivo del plan actualizado

### Distribución temporal estimada (13 semanas)

| Fase | Semanas | Horas estimadas | Lecturas indispensables |
|---|---|---|---|
| 0 | continua | 6–8 | 1 (consulta) |
| 1 | 1–2 | 12–16 | 2 |
| 2 | 3 | 17–22 | 6 |
| 3 | 4–5 | 12–17 | 3 |
| 4 | 6 | 14–20 | 3 |
| 5 | 7–8 | 16–22 | 2 |
| 6 | 9–10 | 22–28 | 7 |
| 7 | 11 | 12–17 | 2 |
| 8 | 12 | 14–18 | 5 |
| 9 | 13 | 7–10 | 1 (búsqueda CLEF) |

**Total INDISPENSABLES**: aproximadamente **32 papers + 2 manuales de consulta + búsqueda bibliográfica activa** (~135–155 horas de lectura).

### Cambios principales respecto al plan original

| Cambio | Razón |
|---|---|
| **Mourão et al. (2015) añadido como INDISPENSABLE** (Fase 2) | ISR es ahora un algoritmo formal con su propia subsección §3.7.7. |
| **Wortsman et al. (2022) añadido como RECOMENDADA** (Fase 4) | Nueva §3.5.6 sobre model merging requiere fundamentación de SLERP/linear merging. |
| **Apéndice eliminado**: las lecturas A.1, A.2, A.3, A.4 ya no requieren tratamiento independiente | Sus contenidos se integraron en §3.5.2 (LoRA/SVD), §3.5.5 (KL/destilación), §3.7.5 (geométrica/RBC), §3.3.4 (tokenización). |
| **Cañete (BETO) y Gutiérrez-Fandiño (MarIA) eliminados** | Tu asesora pidió ignorar backbones monolingües específicos. |
| **Nueva Fase 9 con búsqueda bibliográfica activa** sobre CLEF/SEPLN/IberLEF y fusión en lenguas no inglesas | Respuesta directa a la instrucción 2.2(a) de tu asesora; alimenta §4.4.7. |
| **MessIRve elevado a "PRIORIDAD ABSOLUTA"** | Es ahora el centro narrativo del estado del arte; sin él no se puede escribir §4.1.7, §4.2.4 ni §4.6. |
| **Fase 7 reenfocada como "Fusión léxico-semántica neuronal"** | §4.4.5 es subsección crítica del nuevo esqueleto. |

### Tres rutas alternativas según restricciones de tiempo

**Ruta mínima (10 semanas, ~95h)**: solo INDISPENSABLES, saltar Fase 4.6 (Hofstätter), reducir Fase 5 a 5.1, 5.3, 5.4, omitir Fase 9.4 (otras lenguas), priorizar Fase 8.1 (MessIRve).

**Ruta estándar (13 semanas, ~145h)**: el plan completo arriba descrito.

**Ruta exhaustiva (16+ semanas, ~190h)**: añadir todas las RECOMENDADAS y las OPCIONALES marcadas en fases 5, 6, 7 y 10.

### Cuatro reglas de eficiencia (actualizadas)

1. **MessIRve es prioridad absoluta**: si todavía no procesaste el paper de Valentini et al. (2025), ese es el siguiente paso, anterior incluso a Robertson & Zaragoza. Sin MessIRve, §4.1.7, §4.2.4 y §4.6 son aire.

2. **No leas linealmente Robertson & Zaragoza (2009)**: es un *Foundations and Trends*, no un paper. Léelo en dos pasadas (mapeo + profundización).

3. **Hazte fichas de los métodos de fusión**: la Fase 2 (seis papers, ahora con ISR) sobrecarga si lees sin sintetizar. Llevá una ficha de una página por método con: formulación, complejidad, hiperparámetros, resultados de referencia, fortalezas/debilidades, conexión con el marco unificador de Bailey.

4. **Programa la búsqueda bibliográfica de Fase 9 desde el inicio**: las búsquedas en CLEF y SEPLN tienen latencia (a veces hay que pedir acceso institucional o navegar bibliotecas digitales lentas). Empieza la búsqueda en Semana 1 en paralelo con Fase 1, así para Semana 13 ya tienes los resultados procesados.

### Recomendación operativa final

Mantén un **documento vivo de citas anotadas** (formato BibTeX + nota de 100–200 palabras por entrada) durante todo el proceso de lectura. Sugiero estructurar cada nota así:

```
@article{key,
  ...
}
% Notas:
% - Idea central: [una frase]
% - Aporte para la tesis: [§3.X o §4.X específicas]
% - Cifras citables: [tabla con métricas relevantes]
% - Conexiones: [otros papers que dialogan con éste]
% - Citas literales potenciales: [dos o tres pasajes textuales]
```

Este documento se convertirá orgánicamente en la base de tu bibliografía final y te ahorrará semanas durante la redacción del manuscrito. Herramientas como Zotero con plugin Better BibTeX, o un simple archivo Markdown, sirven igualmente.

---

¿Quieres que profundicemos en alguna fase específica, o pasamos a discutir la estructura de la metodología y resultados?