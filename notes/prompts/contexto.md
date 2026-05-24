# Contexto

Estoy escribiendo mi tesis de licenciatura en Matemáticas Aplicadas 
en la UNAM. El título tentativo es:

"Evaluación de estrategias de fusión de rangos (rank fusion) en la 
recuperación de información en español: un análisis sobre el conjunto 
de datos MessIRve."

# Objetivo de la tesis

Evaluar y comparar la eficacia de algoritmos de fusión de rangos 
aplicados a la combinación de resultados recuperados por modelos de 
código abierto léxicos (BM25) y semánticos (dense/sparse encoders, 
cross-encoders, late interaction) sobre el conjunto de datos MessIRve, 
contrastándolos con modelos de reordenamiento neuronal y con líneas 
base propietarias.

# Estructura objetivo de la tesis (relevante para esta tarea)

La tesis tiene dos grandes secciones expositivas:

## 3. Marco teórico — atemporal, formal, conceptual
Su función es dotar al lector de las herramientas matemáticas y 
conceptuales necesarias. Presenta conceptos en su forma canónica, 
sin discutir trabajos específicos. Subsecciones:

   3.1 Fundamentos de recuperación de información
   3.2 Modelos léxicos: fundamentos (TF-IDF, BM25, PRF)
   3.3 Representaciones vectoriales del lenguaje
       3.3.1 Hipótesis distribucional y embeddings estáticos
       3.3.2 Arquitectura Transformer y atención
       3.3.3 Embeddings contextuales
   3.4 Paradigmas de modelos neuronales para IR
       (definiciones formales de dual-encoder, sparse-encoder, 
        cross-encoder, late interaction — SIN modelos concretos)
   3.5 Aprendizaje de representaciones
       3.5.1 Funciones de pérdida contrastivas
       3.5.2 Fine-tuning y aproximaciones de bajo rango
       3.5.3 Representaciones jerárquicas y truncables
   3.6 Fundamentos matemáticos de la fusión de rangos
   3.7 Evaluación en recuperación de información

## 4. Estado del arte — temporal, comparativo, específico
Discute trabajos concretos, sus resultados y limitaciones. 
Posiciona la tesis en la conversación científica vigente. 
Subsecciones:

   4.1 Modelos léxicos modernos y variantes de BM25
   4.2 Modelos semánticos representativos
       (modelos concretos: E5, BGE, Jina, mDPR, SPLADE, ColBERT, etc.,
        explicando cómo aplican las técnicas del cap. 3: LoRA, 
        Matryoshka, esquemas de entrenamiento específicos)
   4.3 Modelos de reranking neuronal
   4.4 Estrategias de fusión y reranking en la literatura
   4.5 Benchmarks de IR (multilingües y en español)
   4.6 Particularidades del español en IR

# Principio rector

- Marco teórico: el "qué es" en forma canónica y atemporal. 
  Si una idea se puede explicar sin citar a quién la propuso, 
  va aquí.
- Estado del arte: el "qué hizo cada quién" y "cómo se compara". 
  Si una idea es indisociable de un trabajo específico o requiere 
  comparación con otros, va aquí.

Ejemplo: la aproximación matricial de bajo rango va en marco teórico 
(3.5.2); LoRA como técnica concreta y sus resultados empíricos van 
en estado del arte (4.2).