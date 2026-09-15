# Índice de la tesis

> **Índice autoritativo.** Este archivo define la estructura de la tesis.
> `notes.md` queda como notas personales de referencia (no autoritativo).
>
> Estado del refinamiento (*top-down*):
> - Nivel 0 (capítulos): **fijado** — 6 capítulos, sin fusiones.
> - Nivel 1 (secciones): **fijado** — caps. 2 y 3 reorganizados y podados
>   (7→5 secciones c/u), cap. 4 con una fusión (5→4), cap. 5 definido
>   (4 bloques por experimento + análisis transversal), caps. 1 y 6 sin cambios.
> - Nivel 2 (subsecciones): **fijado** para caps. 2 (34→14) y 3 (29→12).
>   Caps. 1, 5 y 6: secciones planas, sin subsecciones. Cap. 4: subsecciones solo
>   en §4.4 (los cuatro experimentos).
> - Nivel 3 (bullets por subsección): **fijado** para los seis capítulos.

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
   - RI neuronal dominada por el inglés; el español desatendido
   - Rerankers efectivos pero costosos; la fusión de rangos como alternativa sin cómputo neuronal adicional
   - MessIRve habilita la evaluación nativa en español
2. Objetivos
   - Objetivo general y los seis objetivos específicos del protocolo, cada uno mapeado a su capítulo/experimento
3. Hipótesis
   - Una hipótesis por pregunta de investigación, derivadas del protocolo
4. Preguntas de investigación
   - Las cuatro (P1–P4), mapeadas a los experimentos E1–E4
5. Contribución
   - Evidencia sistemática de fusión de rangos en español
   - Comparación de seis algoritmos de fusión
   - Análisis de complementariedad léxico-semántica
   - Sistema abierto y reproducible
6. Organización de la tesis
   - Un párrafo por capítulo

## 2. Marco teórico

Organizado por etapa del pipeline de recuperación. Podas acordadas respecto a la
versión anterior: se eliminan «Embeddings guiados por instrucciones», «Búsqueda
eficiente (ANN/HNSW/IVF)», la sección puente «Funciones de puntuación» (absorbida
por §2.4) y «Aprendizaje de representaciones» como sección (solo menciones donde
el argumento lo requiera). BM25 y SPLADE comparten sección (§2.2).

1. Fundamentos de recuperación de información
   1. El problema de la recuperación de información
      - Definición informal: consulta + corpus → ranking de documentos
      - Definiciones formales: consulta, documento, corpus, relevancia, ranking como permutación
      - El sistema de RI como función de puntuación y el orden que induce
      - Relevancia binaria vs. graduada (anticipo para §2.5)
   2. El principio de ordenación por probabilidad (PRP)
      - Enunciado: ordenar por P(relevante | d, q) es óptimo bajo sus supuestos
      - Consecuencia: los modelos de RI como estimadores (puente hacia el BIM)
2. Modelos de recuperación de primera etapa
   1. Modelos léxicos probabilísticos: del BIM a BM25
      - Bolsa de palabras y TF-IDF como heurística clásica
      - BIM y peso RSJ: derivación desde el PRP
      - 2-Poisson: saturación de la frecuencia de término
      - Normalización por longitud del documento
      - BM25 canónico: fórmula final, papel de k₁ y b
   2. Representaciones dispersas aprendidas (SPLADE)
      - Misma idea que BM25 (vector sobre el vocabulario) con pesos aprendidos
      - SPLADE: proyección sobre vocabulario vía MLM, expansión aprendida, regularización de dispersión
      - Lectura conceptual: «BM25 aprendido» → léxico moderno de esta tesis
   3. Representaciones densas y codificadores duales
      - Hipótesis distribucional; de embeddings estáticos a contextuales
      - Tokenización y autoatención: lo mínimo del Transformer (encoder bidireccional)
      - Codificador dual: definición formal (dos torres + similitud), pooling
      - Qué captura lo semántico frente a lo léxico (motiva la complementariedad)
      - Mención breve: variantes guiadas por instrucciones (mE5-instruct) y entrenamiento contrastivo (InfoNCE)
   4. Interacción tardía (MaxSim)
      - Representación multi-vector: un vector por token
      - Definición formal del operador MaxSim
      - Punto intermedio: más fino que denso, más barato que cross-encoder
3. Reordenamiento neuronal
   1. La arquitectura en cascada: recuperación y reordenamiento
      - Por qué en etapas: el costo prohíbe aplicar modelos pesados a todo el corpus
      - Primera etapa (recall) vs. segunda etapa (precisión); el recall inicial como cota
   2. Cross-encoders
      - Definición: consulta y documento concatenados, puntuación conjunta
      - Interacción completa → más precisión; costo por par → no escala
      - Taxonomía pointwise / pairwise / listwise (listwise enlaza al cap. 3)
4. Fusión de rangos
   1. Formalización
      - Ranking como permutación; notación formal
      - Equivalencia de rango bajo transformaciones monótonas → justifica la fusión de rangos
      - Fusión de puntuaciones vs. de rangos: el problema de las escalas incompatibles
      - Analogía con teoría de elección social (sistemas = votantes, documentos = candidatos)
   2. Métodos basados en puntuaciones (CombMNZ)
      - Normalización de puntuaciones como prerrequisito
      - CombSUM y CombMNZ; el factor MNZ que premia la presencia en varias listas
   3. Métodos posicionales (BordaFuse, RRF, ISR)
      - BordaFuse: puntos por posición, conexión con el conteo de Borda
      - RRF: 1/(k+r), papel del parámetro k
      - ISR (Inverse Square Rank): definición (peso 1/r²) y propiedades
   4. Comparaciones por pares y modelos de usuario (Condorcet, RBC)
      - Condorcet: mayoría por pares, grafo de preferencias y manejo de ciclos
      - RBC (Rank-Biased Centroids): modelo de usuario con profundidad de escaneo; fusión como utilidad esperada
5. Evaluación en recuperación de información
   1. Métricas de evaluación
      - P@k y Recall@k: precisión y cobertura a profundidad fija
      - MAP y MRR
      - nDCG: ganancia graduada con descuento; por qué es la métrica primaria
   2. Pruebas de significancia estadística
      - El problema: promedios de métrica vs. variabilidad por consulta; comparaciones pareadas por consulta
      - Los cinco candidatos: t pareada, Wilcoxon, signo, bootstrap y permutación (randomization)
      - Evidencia empírica consolidada: t pareada y permutación mantienen el error tipo I nominal; bootstrap sesgado hacia p-valores pequeños; Wilcoxon y signo poco fiables para diferencias de medias (anticipa la elección del cap. 4)
      - Errores tipo I, II y III; pruebas de una y dos colas
      - Corrección por comparaciones múltiples (Bonferroni / Tukey HSD)

## 3. Estado del arte

Secciones alineadas con los cuatro experimentos. Podas acordadas: «Benchmarks» y
«Particularidades del español» se fusionan (§3.4); el posicionamiento deja de ser
opcional (§3.5).

1. Líneas base de recuperación: de BM25 a los modelos neuronales modernos
   1. Modelos léxicos: BM25 y variantes modernas
      - Okapi BM25 como línea base omnipresente en benchmarks
      - Variantes (BM25+, BM25L): qué deficiencia corrige cada una
      - Infraestructura reproducible: Anserini/Pyserini (mención)
   2. Codificadores duales multilingües
      - Línea evolutiva: mDPR → mContriever → mE5 → mE5-instruct
      - Generación reciente: Qwen3-Embedding, jina-embeddings-v5
      - Qué reportan en multilingüe y en español (MIRACL, MTEB)
      - Cierre: criterio de selección de los modelos de esta tesis
   3. Modelos multifuncionales y dispersos aprendidos (BGE-M3, SPLADE)
      - SPLADE: v1 → v3, qué mejora cada versión y resultados reportados
      - BGE-M3: denso + disperso + multi-vector en un solo modelo
      - Anticipación de la fusión interna (enlaza con §3.3.3)
   4. Interacción tardía (de ColBERT a jina-colbert-v2)
      - ColBERT: la propuesta original de interacción tardía
      - ColBERTv2: compresión y destilación
      - jina-colbert-v2: variante multilingüe; resultados reportados
2. Reordenamiento neuronal en la literatura
   1. Cross-encoders (monoBERT, monoT5, bge-reranker-v2-m3)
      - monoBERT y monoT5: reranking punto a punto con Transformers
      - bge-reranker-v2-m3: el cross-encoder multilingüe de esta tesis
      - Efectividad reportada y costo computacional
   2. Rerankers listwise con LLMs (RankGPT, jina-reranker-v3)
      - RankGPT/RankZephyr: reranking como generación de ordenaciones
      - jina-reranker-v3: el listwise de esta tesis
      - Cierre de la sección: trade-offs efectividad/eficiencia en la cascada
3. Fusión de rangos en la literatura
   1. Los métodos clásicos
      - Fox & Shaw 1994: CombSUM/CombMNZ en TREC
      - Aslam & Montague 2001: Borda-fuse (y Bayes-fuse)
      - Montague & Aslam 2002: Condorcet-fuse
      - Cormack et al. 2009: RRF
      - Bailey et al. 2017: RBC
      - Hallazgo transversal: la fusión suele superar a los componentes individuales
   2. Fusión léxico-semántica en la era neuronal
      - Karpukhin et al. 2020 (DPR): el denso supera a BM25, pero la combinación ayuda
      - Luan et al. 2021: combinaciones sparse/dense
      - Bruch et al. 2023 y Lin et al. 2021: análisis de cuándo aporta la fusión
      - Síntesis crítica: condiciones bajo las que la fusión léxico-semántica ayuda y cuándo no
   3. Fusión interna del modelo vs. fusión externa de listas (BGE-M3)
      - BGE-M3 como caso de estudio de fusión interna
      - Qué pierde la fusión interna frente a fusionar listas de sistemas especializados
      - Motivación directa de las preguntas de investigación de la tesis
4. Benchmarks de IR y el español
   1. De TREC a MS MARCO y BEIR
      - TREC: pooling y juicios incompletos
      - MS MARCO: escala web
      - BEIR: evaluación *zero-shot* heterogénea
   2. Benchmarks multilingües y particularidades del español
      - MIRACL, Mr. TyDi, MTEB Multilingual: cobertura del español
      - Morfología del español y sus efectos en modelos léxicos y tokenización
      - Backbones en español (BETO, RoBERTa-bne, MARIA): mención
      - *Translationese*: mMARCO-es vs. MIRACL-es vs. datos nativos
   3. MessIRve
      - Descripción: origen, tamaño, variedades dialectales del español (incl. rioplatense)
      - Qué lo distingue: consultas nativas, no traducidas
      - Resultados previos reportados (incluidas las líneas base propietarias)
5. Posicionamiento de esta tesis
   - Gap 1: la fusión se evalúa sobre todo en inglés; falta evidencia sistemática en español
   - Gap 2: no hay comparación sistemática de algoritmos de fusión frente a rerankers modernos
   - Gap 3: abiertos vs. propietarios sin resolver en español
   - Puente al cap. 4: los cuatro experimentos responden a estos gaps

## 4. Metodología

«Arquitectura del sistema» y «Modelos de recuperación base» se fusionan en §4.2.

1. El conjunto de datos MessIRve
   - Cifras: consultas, documentos, juicios, variedades dialectales
   - Distribución de relevantes por consulta (calculada en el análisis de distribuciones; justifica la batería de métricas)
   - Partición usada (entrenamiento/prueba por artículo de Wikipedia; restricciones del conjunto de prueba)
2. Sistema de recuperación
   - Arquitectura del pipeline: primera etapa + fusión + reordenamiento (figura)
   - Configuración de cada modelo base; nota sobre el límite de 0.6B
   - Rerankers y profundidad de reordenamiento
   - Implementación y reproducibilidad (ir-spanish, hardware, semillas)
3. Algoritmos de fusión
   - Los seis con sus parámetros: CombMNZ, BordaFuse, Condorcet, RRF, ISR (Inverse Square Rank), RBC (Rank-Biased Centroids)
   - Qué listas se fusionan y profundidad de corte
   - Normalización de puntuaciones para CombMNZ
4. Diseño experimental
   - Protocolo común de evaluación:
     - Métricas: nDCG@10 primaria; Recall@100, MRR@10, MAP, P@10/50
     - Prueba de significancia: t pareada (Student) de dos colas, α = 0.05, para las hipótesis de efectividad media; test de permutación como alternativa robusta (ambos en ranx.compare)
     - Justificación de la elección: Urbano et al. (2019) — t y permutación mantienen el error tipo I nominal, bootstrap sesgado, Wilcoxon y signo poco fiables; Smucker et al. (2007) como antecedente
     - Comparaciones múltiples: Tukey HSD para la comparación cruzada de los seis algoritmos (E2)
   1. Experimento 1: fusión vs. modelos individuales
      - Cada fusión vs. cada modelo individual
   2. Experimento 2: comparación de algoritmos de fusión
      - Comparación cruzada de los seis algoritmos, por métrica y por familia
   3. Experimento 3: fusión vs. reordenamiento neuronal
      - Mejor fusión vs. ambos rerankers, con análisis de eficiencia
   4. Experimento 4: modelos abiertos vs. propietarios
      - Sistemas de la tesis vs. líneas base propietarias reportadas en MessIRve
      - Comparación descriptiva con valores reportados (sin prueba de significancia: los sistemas propietarios no publican puntuaciones por consulta)

## 5. Resultados experimentales

Un bloque por experimento, más el análisis de complementariedad (§5.5, objetivo
específico 6 del protocolo). Secciones planas, sin subsecciones.

1. Experimento 1: fusión vs. modelos individuales
   - Tabla principal de modelos base y fusiones
   - Qué fusiones superan a qué modelos, con significancia
   - Lectura por familia (léxico vs. semántico)
2. Experimento 2: comparación de algoritmos de fusión
   - Tabla comparativa de los seis algoritmos
   - Ranking de algoritmos y diferencias significativas (Tukey HSD, §4.4)
   - Sensibilidad a parámetros (k de RRF) si aplica
3. Experimento 3: fusión vs. reordenamiento neuronal
   - Tabla: mejor fusión vs. rerankers
   - Costo/beneficio: relevancia ganada vs. costo
   - Significancia
4. Experimento 4: modelos abiertos vs. propietarios
   - Tabla vs. líneas base propietarias
   - Posición relativa alcanzada
   - Sin prueba de significancia (comparación descriptiva con valores reportados)
5. Análisis de complementariedad léxico-semántica
   - Medida de complementariedad: RBO (Rank-Biased Overlap; Webber, Moffat y Zobel, 2010) — misma familia de pesos que RBC
   - Por qué no Kendall τ: exige listas conjuntas y no pondera por profundidad; RBO admite listas no conjuntas (lo habitual entre familias) y pondera el tope
   - Consultas donde gana cada familia, con ejemplos
   - Relación entre complementariedad y ganancia de fusión (responde al objetivo específico 6)

## 6. Conclusiones y trabajo futuro

1. Conclusiones finales
   - Respuesta a P1–P4, una por una, con la evidencia obtenida
2. Contribuciones del trabajo
   - Recuento de lo entregado, mapeado a §1.5
3. Trabajo futuro
   - Más benchmarks en español
   - Fusión ponderada o aprendida
   - Análisis de eficiencia más fino
