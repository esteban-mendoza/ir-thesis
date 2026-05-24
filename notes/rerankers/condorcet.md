A continuación se presenta la extracción, clasificación y estructuración del contenido del artículo seminal *"Condorcet Fusion for Improved Retrieval"* (Montague y Aslam, 2002)  mapeado exactamente a las secciones de tu tesis de la UNAM.

---

## Lista 1: Contenido para Marco Teórico (Atemporal y Formal)

Esta lista contiene los fundamentos matemáticos y conceptuales que son generalizables y deben presentarse en su forma canónica.

### 1. El modelo de votación de la Teoría de Elección Social (Social Choice Theory)

* 
**Concepto:** Analogía formal entre la fusión de búsquedas (*metasearch*) y los sistemas de votación, mapeando documentos a candidatos y sistemas de recuperación de información (IR) a votantes.


* 
**Sección del Marco Teórico:** **3.6 Fundamentos matemáticos de la fusión de rangos**.


* 
**Justificación:** Establece el marco conceptual abstracto donde se definen matemáticamente los perfiles de votación y las funciones de elección social aplicados a IR.


* **Formalismo / Ecuación (LaTeX):**
Un perfil de votación (*voting profile*) para $n$ candidatos y $k$ votantes se define como el conjunto de ordenamientos de preferencias sobre el conjunto de candidatos $\mathcal{D}$. Una función de elección social (*social choice function*) $f$ mapea dicho perfil a un subconjunto de ganadores:

$$f : \mathcal{P}^k \rightarrow \mathcal{P}(\mathcal{D})$$


* 
**Nivel de detalle recomendado:** Desarrollo formal completo (definiendo perfil de votación, anonimato, neutralidad y monotonía).



### 2. Algoritmos Posicionales vs. Algoritmos Mayoritarios

* 
**Concepto:** Clasificación dicotómica de los métodos de agregación de ordenamientos: métodos posicionales (basados en puntuaciones asignadas a los rangos) y métodos mayoritarios (basados en comparaciones por pares).


* **Sección del Marco Teórico:** **3.6 Fundamentos matemáticos de la fusión de rangos**.
* 
**Justificación:** Es la taxonomía matemática fundamental necesaria para agrupar algoritmos como Borda y Condorcet antes de discutir implementaciones.


* **Formalismo / Ecuación (LaTeX):**
Para el conteo de Borda (algoritmo posicional canónico), dado un sistema con $n$ candidatos, la puntuación de un candidato $c$ bajo el votante $v$ es:

$$\text{Score}_v(c) = n - \text{Rank}_v(c)$$


* 
**Nivel de detalle recomendado:** Desarrollo formal completo.



### 3. El Grafo de Condorcet y Relaciones Semicompletas

* 
**Concepto:** Modelado de una elección mediante un grafo dirigido donde los nodos son candidatos y las aristas dirigidas representan la dominancia en confrontaciones directas (*head-to-head*).


* **Sección del Marco Teórico:** **3.6 Fundamentos matemáticos de la fusión de rangos**.
* 
**Justificación:** Proporciona la estructura de datos matemática abstracta de la cual se derivan los algoritmos de ordenamiento mayoritarios.


* **Formalismo / Ecuación (LaTeX):**
Dado un grafo de Condorcet $G = (V, E)$, existe una arista dirigida $x \rightarrow y$ si y solo si:

$$|\{S_i : \text{Rank}_{S_i}(x) < \text{Rank}_{S_i}(y)\}| \ge |\{S_i : \text{Rank}_{S_i}(y) < \text{Rank}_{S_i}(x)\}|$$


Donde el grafo resultante es *semicompleto* porque contiene al menos una arista entre cualquier par de nodos.


* 
**Nivel de detalle recomendado:** Desarrollo formal completo.



### 4. La Paradoja de la Votación (Teorema de Imposibilidad de Arrow / Paradoja de Condorcet)

* 
**Concepto:** La no transitividad de las preferencias mayoritarias en un grupo, lo que genera la presencia de ciclos dirigidos en el grafo (por ejemplo, $a \rightarrow b \rightarrow c \rightarrow a$).


* **Sección del Marco Teórico:** **3.6 Fundamentos matemáticos de la fusión de rangos**.
* 
**Justificación:** Explica la limitación teórica subyacente a los métodos mayoritarios y justifica matemáticamente la necesidad de algoritmos de aproximación.


* **Formalismo / Ecuación (LaTeX):** Ver ilustración lógica de transitividad rota:

$$x \rightarrow y \land y \rightarrow z \nRightarrow x \rightarrow z$$


* 
**Nivel de detalle recomendado:** Desarrollo formal completo (mencionando brevemente el Teorema de Arrow como contexto de la imposibilidad de una función perfecta).



### 5. Descomposición en Componentes Fuertemente Conexas (SCC) y Caminos Hamiltonianos

* 
**Concepto:** Mapeo de ciclos a clases de equivalencia (empates) mediante Componentes Fuertemente Conexas y la demostración de la existencia de un Camino Hamiltoniano en grafos semicompletos para inducir un orden total.


* **Sección del Marco Teórico:** **3.6 Fundamentos matemáticos de la fusión de rangos**.
* 
**Justificación:** Es el núcleo de la prueba de correctitud que demuestra que un ordenamiento basado en torneos directos respeta la jerarquía global eliminando las inconsistencias de los ciclos.


* **Formalismo / Ecuación (LaTeX):**


**Teorema 1:** Todo grafo semicompleto contiene un camino Hamiltoniano.
**Teorema 2:** Si $x \in X$ e $y \in Y$, donde $X$ e $Y$ son componentes fuertemente conexas tales que $X$ precede a $Y$ en el grafo de componentes (SCCG), entonces $x$ precede a $y$ en *cualquier* camino Hamiltoniano.


* 
**Nivel de detalle recomendado:** Desarrollo formal completo (incluyendo el esbozo de la demostración por inducción del Teorema 1, ya que es puramente matemático).



---

## Lista 2: Contenido para Estado del Arte (Temporal y Específico)

Esta lista detalla las aportaciones del artículo como un hito dentro de la literatura científica, analizando el software, algoritmos prácticos e hitos experimentales.

```diagram

```

### 1. El algoritmo Condorcet-fuse

* 
**Aporte:** Propuesta de reducción del problema gráfico de Condorcet a un problema de ordenamiento clásico ($O(nk \log n)$) utilizando funciones de comparación basadas en elecciones de mayoría simple (*runoff*).


* **Sección del Estado del Arte:** **4.4 Estrategias de fusión y reranking en la literatura**.
* 
**Resumen para la tesis:** Montague y Aslam (2002) introducen *Condorcet-fuse*, demostrando que se puede calcular un camino Hamiltoniano consistente sobre el grafo de Condorcet sin construir la matriz completa de $O(n^2)$. Al utilizar algoritmos de ordenamiento como QuickSort o MergeSort e implementar las votaciones por pares como la función de comparación básica, logran una eficiencia escalable para sistemas de recuperación de información.


* 
**Resultados numéricos clave:** Complejidad algorítmica temporal de $O(nk \log n)$ frente al modelo teórico ingenuo de $O(n^2k)$.


* 
**Contraparte en Marco Teórico:** Mapea directamente con la teoría de Caminos Hamiltonianos en grafos semicompletos y algoritmos de ordenamiento por comparación (Sección 3.6).



### 2. Taxonomía de Metasearch (Fusión de Datos)

* 
**Aporte:** Clasificación bidimensional de las técnicas de fusión basada en: (1) Requerimiento de datos (Solo rangos vs. Puntuaciones de relevancia) y (2) Requerimiento de entrenamiento (Con entrenamiento vs. Sin entrenamiento).


* **Sección del Estado del Arte:** **4.4 Estrategias de fusión y reranking en la literatura**.
* 
**Resumen para la tesis:** El trabajo establece una taxonomía clara para categorizar estrategias de fusión de rangos. Posiciona a *Condorcet-fuse* y *Borda-fuse* como métodos que operan estrictamente bajo la restricción de "solo rangos" y "sin entrenamiento", haciéndolos ideales para escenarios donde las puntuaciones de los motores heterogéneos (como BM25 y embeddings densos) no son directamente comparables o legibles.


* 
**Resultados numéricos clave:** N/A (Aporte taxonómico, ver Fig. 1 del paper).



### 3. Evaluación empírica en TREC (Líneas base: CombMNZ y Borda)

* 
**Aporte:** Validación empírica del rendimiento de algoritmos basados en votaciones frente a los estándares de la industria de la época (*CombSum* y *CombMNZ* de Fox y Shaw).


* **Sección del Estado del Arte:** **4.4 Estrategias de fusión y reranking en la literatura** o **4.5 Benchmarks de IR**.
* 
**Resumen para la tesis:** Los autores demuestran experimentalmente sobre las colecciones de TREC (TREC-3, TREC-5) que los métodos de la teoría de elección social superan consistentemente a las técnicas tradicionales. Específicamente, *Condorcet-fuse* supera significativamente a *Borda-fuse*, demostrando la superioridad empírica de los enfoques mayoritarios sobre los posicionales cuando los sistemas de entrada tienen calidades dispares.


* 
**Resultados numéricos clave:** Demostración de que *Condorcet-fuse* supera a *Borda-fuse* y rCombMNZ en la gran mayoría de los ambientes de evaluación sin requerir calibración de puntuaciones (*scores*).



---

## Lista 3: Contenido descartable o periférico

Partes del artículo que **no** aportan valor directo al enfoque de tu tesis (Fusión de rangos en español sobre MessIRve):

1. 
**Metabúsqueda Externa en la Web (Sección 3 / Págs. 1-2):** Las discusiones sobre MetaCrawler, SavvySearch o el procesamiento de motores de búsqueda comerciales web son irrelevantes, ya que tu enfoque es la fusión interna de arquitecturas léxicas y densas controladas.


2. 
**Teorema de May (Sección 5.1 / Pág. 3):** Aunque es formalmente elegante, el Teorema de May está restringido a elecciones estrictas de *dos alternativas*. Dado que en IR manejas miles de documentos concurrentes, el desarrollo exhaustivo de este teorema satura el texto sin aportar utilidad práctica.


3. 
**Detalles de entrenamiento del Weighted Condorcet-fuse (Pág. 1 / Tabla 1):** El artículo menciona variantes ponderadas que requieren datos de entrenamiento previos. Si tu objetivo en MessIRve se enfoca en estrategias de fusión *cero disparos* (zero-shot/unsupervised) como RRF o Condorcet estándar, la formulación supervisada distrae del núcleo de la comparación.



---

## Sugerencia de reestructuración del Marco Teórico

Dado que tu estructura original cuenta con la subsección genérica:

* *3.6 Fundamentos matemáticos de la fusión de rangos*

El análisis de este paper demuestra que para una tesis de **Matemáticas Aplicadas**, necesitas estructurar de forma mucho más rigurosa dicha sección. Te sugiero la siguiente subdivisión interna para el punto 3.6:

* **3.6 Fundamentos matemáticos de la fusión de rangos**
* 
**3.6.1 Teoría de Elección Social y funciones de agregación** (Definición formal de perfiles de votación, axiomas de Arrow y May).


* 
**3.6.2 Métodos Posicionales** (Formalización matemática del Conteo de Borda y extensiones lineales).


* 
**3.6.3 Métodos Mayoritarios y Teoría de Grafos Semicompletos** (Definición del Grafo de Condorcet, paradojas de transitividad, Componentes Fuertemente Conexas y teoremas de existencia de Caminos Hamiltonianos).


* 
**3.6.4 Métodos probabilisticos y recíprocos modernos** (Espacio ideal para introducir formalmente *Reciprocal Rank Fusion* (RRF), conectándolo con los límites de las aproximaciones por ordenamiento).