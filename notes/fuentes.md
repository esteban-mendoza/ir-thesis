# Fuentes

Este archivo lista las fuentes de la tesis y las asocia con el archivo PDF
correspondiente en `recursos/`. Las fuentes **en negrita** son las principales
(la referencia canónica de cada modelo o método). Las demás son fuentes de
apoyo o antecedentes.

## Modelos de recuperación

### Léxicos — BM25

- **Robertson, S., & Zaragoza, H. (2009). The Probabilistic Relevance Framework: BM25 and Beyond. Foundations and Trends in Information Retrieval.**
  → `recursos/bm25-RobertsonZaragoza2009.pdf`
- Robertson, S. E., & Walker, S. (1994). Some simple effective approximations to the 2-Poisson model for probabilistic weighted retrieval. SIGIR '94.
  → `recursos/bm25-RobertsonWalker1994.pdf`
- Robertson, S. E., Walker, S., Jones, S., Hancock-Beaulieu, M., & Gatford, M. (1994). Okapi at TREC-3. TREC-3.
  → `recursos/bm25-RobertsonEtAl1994.pdf`

### Densos (dual-encoders)

- **Wang, L., Yang, N., Huang, X., Yang, L., Majumder, R., & Wei, F. (2024). Multilingual E5 Text Embeddings: A Technical Report. arXiv:2402.05672.** — `intfloat/multilingual-e5-large-instruct`
  → `recursos/mE5-WangEtAl2024.pdf`
- **Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding: Multi-Lingual, Multi-Functionality, Multi-Granularity Text Embeddings Through Self-Knowledge Distillation. arXiv:2402.03216.** — `BAAI/bge-m3`
  → `recursos/bgeM3-ChenEtAl2024.pdf`
- **Zhang, Y., et al. (2025). Qwen3 Embedding: Advancing Text Embedding and Reranking Through Foundation Models. arXiv:2506.05176.** — `Qwen/Qwen3-Embedding-0.6B`
  → `recursos/qwen3Embedding-ZhangEtAl2025.pdf`
- **Akram, M. K., Sturua, S., Havriushenko, N., Herreros, Q., Günther, M., Werk, M., & Xiao, H. (2026). jina-embeddings-v5-text: Task-Targeted Embedding Distillation. arXiv:2602.15547.** — `jinaai/jina-embeddings-v5-text-small`
  → `recursos/jinaEmbeddingsV5-AkramEtAl2026.pdf`

### Dispersos (learned sparse)

- **Formal, T., Lassance, C., Piwowarski, B., & Clinchant, S. (2021). SPLADE: Sparse Lexical and Expansion Model for First Stage Ranking. SIGIR '21.**
  → `recursos/splade-FormalEtAl2021.pdf`
- **Lassance, C., Déjean, H., Formal, T., & Clinchant, S. (2024). SPLADE-v3: New baselines for SPLADE. arXiv:2403.06789.** — `naver/splade-v3`
  → `recursos/spladeV3-LassanceEtAl2024.pdf`

### Interacción tardía

- **Khattab, O., & Zaharia, M. (2020). ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT. SIGIR '20.**
  → `recursos/colbert-KhattabZaharia2020.pdf`
- **Jha, R., Wang, B., Günther, M., Mastrapas, G., Sturua, S., Mohr, I., Koukounas, A., Akram, M. K., Wang, N., & Xiao, H. (2024). Jina-ColBERT-v2: A General-Purpose Multilingual Late Interaction Retriever. ACL/EMNLP 2024.** — `jinaai/jina-colbert-v2`
  → `recursos/jinaColbertV2-JhaEtAl2024.pdf`

### Cross-encoders (rerankers)

- **Wang, F., Li, Y., & Xiao, H. (2025). jina-reranker-v3: Last but Not Late Interaction for Listwise Document Reranking. arXiv:2509.25085.** — `jinaai/jina-reranker-v3`
  → `recursos/jinaRerankerV3-WangEtAl2025.pdf`
- Chen, J., Xiao, S., Zhang, P., Luo, K., Lian, D., & Wang, J. (2024). BGE M3-Embedding... arXiv:2402.03216. — `BAAI/bge-reranker-v2-m3` (arquitectura del ecosistema BGE M3 / Reranker-v2).
  → `recursos/bgeM3-ChenEtAl2024.pdf` (mismo PDF que BGE-M3)
- Li, C., Liu, Z., Xiao, S., & Shao, Y. (2023). Making Large Language Models A Better Foundation For Dense Retrieval. arXiv:2312.15503. — proceso LLaRA del ecosistema BGE.
  → `recursos/llara-LiEtAl2023.pdf`

## Algoritmos de fusión de rangos

- CombMNZ — Fox, E. A., & Shaw, J. A. (1994). Combination of multiple searches. NIST Special Publication SP 243.
  → `recursos/combmnz-FoxShaw1994.pdf`
- BordaFuse — Aslam, J. A., & Montague, M. (2001). Models for metasearch. SIGIR '01. doi:10.1145/383952.384007
  → `recursos/bordafuse-AslamMontague2001.pdf`
- Condorcet — Montague, M., & Aslam, J. A. (2002). Condorcet fusion for improved retrieval. CIKM '02. doi:10.1145/584792.584881
  → `recursos/condorcet-MontagueAslam2002.pdf`
- RRF — Cormack, G. V., Clarke, C. L. A., & Buettcher, S. (2009). Reciprocal rank fusion outperforms condorcet and individual rank learning methods. SIGIR '09. doi:10.1145/1571941.1572114
  → `recursos/rrf-CormackEtAl2009.pdf`
- RBC — Bailey, P., Moffat, A., Scholer, F., & Thomas, P. (2017). Retrieval consistency in the presence of query variations. SIGIR '17. doi:10.1145/3077136.3080839
  → `recursos/rbc-BaileyEtAl2017.pdf`
- ISR — Mourão, A., Martins, F., & Magalhães, J. (2014). Inverse Square Rank Fusion for Multimodal Search.
  → `recursos/isr-MouraoEtAl2014.pdf`

## Conjunto de datos

- **Valentini, F., et al. (2025). MessIRve: A Large-Scale Spanish Information Retrieval Dataset. arXiv:2409.05994.**
  → `recursos/messirve-ValentiniEtAl2025.pdf`

## Otras fuentes (fundamentos y evaluación)

- Bruch, S., Gai, S., & Ingber, A. (2023). An Analysis of Fusion Functions for Hybrid Retrieval. ACM Trans. Inf. Syst. 42(1), Art. 20. doi:10.1145/3596512
  → `recursos/fusion-BruchEtAl2023.pdf`
- Tyomkin, L., & Kurland, O. (2023). Revisiting Condorcet Fusion. ICTIR '23. doi:10.1145/3578337.3605140
  → `recursos/condorcet-TyomkinKurland2023.pdf`
- Smucker, M. D., Allan, J., & Carterette, B. (2007). A Comparison of Statistical Significance Tests for Information Retrieval Evaluation. CIKM '07. doi:10.1145/1321440.1321528
  → `recursos/significancia-SmuckerEtAl2007.pdf`
- Whiteley, N., Gray, A., & Rubin-Delanchy, P. (2026). Statistical exploration of the manifold hypothesis. J. R. Stat. Soc. Ser. B, 88, 353–385. doi:10.1093/jrsssb/qkag055
  → `recursos/variedad-WhiteleyEtAl2026.pdf`
- Modell, A., Rubin-Delanchy, P., & Whiteley, N. (2025). The Origins of Representation Manifolds in Large Language Models. arXiv:2505.18235.
  → `recursos/variedad-ModellEtAl2025.pdf`
