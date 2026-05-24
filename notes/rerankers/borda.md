Aquí tienes la extracción y clasificación del contenido del artículo seminal de Aslam y Montague (2001) sobre metabúsqueda, estructurado bajo el principio rector y las necesidades específicas de tu tesis de Matemáticas Aplicadas en la UNAM.

---

### Lista 1: Contenido para Marco Teórico (Atemporal y Formal)

Esta lista contiene el formalismo abstracto y generalizable del paper, desprovisto de marcas comerciales o nombres específicos de sistemas de recuperación.

| Concepto | Subsección del Marco Teórico | Justificación | Nivel de Detalle Matemático Recomendado | Formalismo / Ecuación en LaTeX |
| --- | --- | --- | --- | --- |
| **La analogía del problema de Metabúsqueda como un Proceso de Votación** | `3.6 Fundamentos matemáticos de la fusión de rangos` | Define formalmente el problema de la fusión de rangos asignando a los documentos devueltos el rol de *candidatos* ($c$) y a los sistemas de recuperación de información el rol de *votantes* ($v$).

 | Desarrollo conceptual y formal continuo. | Sea $\mathcal{D} = \{d_1, d_2, \dots, d_m\}$ el conjunto de candidatos (documentos) y $\mathcal{S} = \{S_1, S_2, \dots, S_n\}$ el conjunto de votantes (sistemas de recuperación).

 |
| **Método de Conteo Borda Canónico** | `3.6 Fundamentos matemáticos de la fusión de rangos` | Presenta la definición clásica de la regla de votación posicional por puntos (Borda Count) en presencia de listas completas o truncadas.

 | Desarrollo formal completo. Demostrar cómo se distribuyen los puntos uniformemente. | Para $c$ candidatos, cada sistema asigna al elemento de rango $r$ una puntuación de: 

<br>

<br>$$P_i(d) = c - r(d) + 1$$

<br>

<br>

<br>Si un subconjunto de candidatos queda sin ordenar, los puntos restantes se dividen equitativamente entre los candidatos no ordenados.

 |
| **Fusión de Rangos Lineal Ponderada** | `3.6 Fundamentos matemáticos de la fusión de rangos` | Extensión del Conteo Borda que rompe la hipótesis democrática estricta para dar peso asimétrico a los expertos basándose en una métrica de desempeño previa.

 | Desarrollo formal completo. | Sean $\alpha_i \geq 0$ los pesos asignados a cada sistema $S_i$. El puntaje final fusionado para el documento $d$ es:

<br>

<br>$$\text{Score}_{\text{WeightedBorda}}(d) = \sum_{i=1}^{n} \alpha_i \cdot P_i(d)$$

<br>

 |
| **Inferencia Bayesiana en el Espacio de Rangos** | `3.6 Fundamentos matemáticos de la fusión de rangos` | Formalización probabilística de las posibilidades de relevancia de un documento condicionado a los rangos asignados por múltiples motores de búsqueda.

 | Desarrollo formal completo (derivación de log-odds). | Sea $r_i(d)$ el rango asignado a $d$ por el sistema $i$. Se define la razón de probabilidades de relevancia (*odds of relevance*) como:

<br>

<br>$$O_{\text{rel}}(d) = \frac{\Pr(\text{rel} \mid r_1, r_2, \dots, r_n)}{\Pr(\text{irr} \mid r_1, r_2, \dots, r_n)}$$

<br>

 |
| **La Regla CombMNZ e Hipótesis de Intersección Asimétrica** | `3.6 Fundamentos matemáticos de la fusión de rangos` | Fundamento del fenómeno de la "intersección desigual" o *efecto coro*: los sistemas independientes tienden a coincidir en documentos relevantes pero divergen en los irrelevantes.

 | Desarrollo formal completo y su justificación geométrica/estadística. | Sean $rel_i(d)$ los puntajes normalizados y $n_d$ el número de sistemas que retornaron el documento $d$. La regla de combinación es:

<br>

<br>$$\text{CombMNZ}(d) = n_d \cdot \sum_{i=1}^{n} rel_i(d)$$

<br>

 |
| **Límites Superiores de Rendimiento mediante Oráculos Restringidos** | `3.7 Evaluación en recuperación de información` | Formaliza cómo calcular el límite teórico superior (*upper bound*) que una estrategia de fusión óptima podría lograr dadas las restricciones físicas de las listas de entrada.

 | Desarrollo conceptual y matemático intermedio. | Concepto de un *oráculo omnisciente restringido*: un modelo teórico ideal que conoce la relevancia a priori de cada documento pero está acotado por las permutaciones posibles de las listas nativas.

 |

---

### Lista 2: Contenido para Estado del Arte (Trabajos Concretos y Comparativas)

Esta lista detalla los aportes contextualizados empíricamente y los modelos que llevan el sello autoral de los investigadores.

* 
**Aporte**: Introducción de los algoritmos **Borda-fuse** y **Bayes-fuse** como frameworks prácticos de metasearch que operan estrictamente sobre vectores de rangos, eliminando la necesidad de calibrar puntajes (*relevance scores*).


* *Subsección sugerida*: `4.4 Estrategias de fusión y reranking en la literatura`
* 
*Resumen para la tesis*: El trabajo de Aslam y Montague (2001) establece un hito al demostrar que las técnicas de fusión basadas exclusivamente en rangos ordenados (*ranks*) pueden igualar o superar a las técnicas basadas en puntajes crudos (*scores*), solventando el problema clásico de la falta de homogeneidad y escala entre las puntuaciones de motores heterogéneos.


* 
*Resultados numéricos clave*: En colecciones estándar de TREC (como TREC 3, 5 y 9), *Weighted Borda-fuse* obtuvo un desempeño equiparable a *CombMNZ* y superó sistemáticamente al mejor de los sistemas individuales de entrada en la gran mayoría de las combinaciones aleatorias de sistemas.


* *Vínculo con el Marco Teórico*: Implementa de forma directa las reglas de agregación por votación posicional y estimación bayesiana estructuradas en la sección `3.6`.


* 
**Aporte**: Evaluación empírica en el dataset **Vogt (subset de TREC 5)** estructurado intencionalmente para maximizar la diversidad.


* *Subsección sugerida*: `4.5 Benchmarks de IR (multilingües y en español)`
* *Resumen para la tesis*: Al analizar el subconjunto propuesto por Vogt (10 sistemas diversos y 10 queries de alta densidad de relevancia), los autores demuestran experimentalmente que el éxito de la fusión de rangos es altamente sensible a la diversidad e independencia de los sistemas combinados. Cuando los sistemas poseen un desempeño promedio similar pero un ordenamiento diverso, los rendimientos de la fusión aumentan de manera exponencial.


* 
*Resultados numéricos clave*: En el dataset de Vogt, donde los sistemas base promediaban una precisión de 0.288, todas las estrategias de fusión analizadas superaron con creces las líneas base monomodelo.




* 
**Aporte**: Discusión y contraste con el modelo **CEO (Combination of Expert Opinion) de Thompson**.


* *Subsección sugerida*: `4.4 Estrategias de fusión y reranking en la literatura`
* *Resumen para la tesis*: El enfoque bayesiano del paper se diferencia críticamente del modelo de opinión experta (CEO) de Thompson. A diferencia de este último, que requiere modelar distribuciones de probabilidad completas para cada documento y que históricamente careció de una implementación práctica, *Bayes-fuse* simplifica la arquitectura al operar sobre los *odds* de relevancia condicionados a los rangos observados.





---

### Lista 3: Contenido descartable o periférico

Elementos presentes en el texto que **no** aportan al objetivo específico de tu tesis (fusión de rangos en español sobre el corpus MessIRve):

1. 
**Herramientas de indexación de la Web primitiva (Sección 1)**: Las menciones explícitas a motores comerciales obsoletos de los años 2000 como *AltaVista, Lycos, HotBot, MetaCrawler* o *ProFusion*. Para tu tesis, el foco está en motores léxicos modernos y codificadores densos/dispersos neuronales abiertos.


2. 
**Detalles de tareas específicas de TREC antiguos (Ad-hoc y Web track de TREC 9) (Sección 3.2.1)**: La discusión sobre cómo el Ad-hoc de TREC 9 fue sustituido por el *Web track* y las minucias de la recolección de páginas de internet de finales del siglo XX. Deberás rescatar la metodología de la combinación de sistemas, mas no la naturaleza del contenido indexado en dichos benchmarks angloparlantes.


3. 
**Variantes aplicadas a Reconocimiento de Escritura (Handwriting Recognition) (Sección 3.1)**: La referencia al trabajo de Van Erp y Schomaker (2000) sobre datos de clasificadores simulados para lectura de caligrafía. Es tangencial y distrae del dominio lingüístico e informático de la tesis.



---

### Sugerencia de reestructuración del Marco Teórico

Dado que el paper expone con rigurosidad matemática un cisma metodológico importante, te sugiero ajustar o abrir una subdivisión dentro de tus **Fundamentos matemáticos de la fusión de rangos (3.6)**:

* 
**3.6.1 Métodos basados exclusivamente en Rangos (Rank-based)**: Aquí desarrollarás el Conteo Borda (*Borda-fuse*), permutaciones y el análisis combinatorio/probabilístico de la posición ordinal. Es ideal para justificar por qué usarás algoritmos sobre el dataset *MessIRve* cuando las magnitudes de las puntuaciones de un *Cross-Encoder* y un *BM25* no sean comparables nativamente o las APIs propietarias no expongan sus *scores*.


* 
**3.6.2 Métodos basados en Puntuaciones (Score-based)**: Aquí se integrará la derivación canónica de *CombSUM*, *CombMNZ* y combinaciones lineales, explicando matemáticamente la necesidad de usar funciones de normalización (como Min-Max o escalamiento sigmoide) para llevar las puntuaciones a la vecindad $[0, 1]$ antes de la agregación.