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

# Tarea

Te voy a proporcionar un paper seminal de un modelo o técnica que 
usaré en mi tesis. Tu tarea es extraer y clasificar el contenido 
del paper en dos listas:

## Lista 1: Contenido para Marco Teórico
Identifica todos los conceptos, formalismos, definiciones, 
ecuaciones, teoremas o ideas matemáticas presentes en el paper 
que sean GENERALIZABLES y ATEMPORALES, es decir, que puedan 
presentarse sin atarlos a este paper específico. Para cada uno:

- Indica el concepto.
- Sugiere la subsección exacta del marco teórico donde encaja 
  (3.1 a 3.7, con sub-subsección si aplica).
- Da una breve justificación (1-2 líneas) de por qué pertenece ahí.
- Extrae las ecuaciones o formalismos clave en LaTeX si los hay.
- Indica el nivel de detalle matemático que recomiendas (definición 
  básica / desarrollo formal completo / sólo intuición).

## Lista 2: Contenido para Estado del Arte
Identifica los aportes ESPECÍFICOS del paper: el modelo concreto, 
sus decisiones de diseño, resultados experimentales, comparaciones, 
limitaciones reconocidas. Para cada uno:

- Indica el aporte.
- Sugiere la subsección del estado del arte donde encaja (4.1 a 4.6).
- Resume en 2-4 líneas qué debería decir mi tesis sobre este punto.
- Si aplica, indica resultados numéricos clave (datasets, métricas, 
  scores) que valga la pena citar.
- Indica si el paper introduce una técnica que ya tiene contraparte 
  formal en marco teórico (e.g., "LoRA = aproximación de bajo rango 
  aplicada a actualizaciones de pesos, ver 3.5.2").

## Lista 3 (opcional): Contenido descartable o periférico
Indica qué partes del paper, en tu opinión, NO deberían entrar en 
mi tesis porque son tangenciales al objetivo (fusión de rangos en 
español sobre MessIRve).

# Formato de salida

Usa formato markdown, con tablas cuando sea útil. Sé conciso pero 
exhaustivo: prefiero una lista larga de elementos cortos a párrafos 
extensos. Cita números de sección o página del paper cuando sea 
relevante.

# Antes de empezar

Si el paper es muy extenso o tiene contribuciones múltiples, 
puedes pedirme que te aclare el alcance antes de procesarlo. 
Si detectas que el paper introduce una técnica que merecería su 
propia subsección en mi marco teórico (algo no contemplado en mi 
estructura actual), señálalo explícitamente al final como 
"Sugerencia de reestructuración".