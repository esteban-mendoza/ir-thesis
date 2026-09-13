# Cómo determina Google los «featured snippets»

**Fecha:** 2026-09-13
**Motivo:** entender las particularidades del conjunto de datos MessIRve, cuyo documento relevante por consulta es el párrafo de Wikipedia del que Google extrajo un *featured snippet*.

## Resumen

No es un juicio humano ni un algoritmo puramente artificial. Es un **sistema automático cuyos insumos se alimentan de comportamiento humano a gran escala**: ningún editor escribe el resumen, pero los clics de los usuarios y los enlaces que la gente crea son datos que el sistema usa para decidir qué páginas son candidatas.

Conviene separar tres capas, porque la respuesta cambia en cada una:

| Capa                             | ¿Humana o artificial?                                            |
| -------------------------------- | ---------------------------------------------------------------- |
| Redacción del resumen            | Automática: se extrae de la página                               |
| Selección de la página de origen | Automática, pero con señales humanas de entrada (clics, enlaces) |
| Existencia de la consulta        | Humana: el recuadro solo aparece si mucha gente busca eso        |

## Mecanismo documentado

Fuente primaria: patente de Google **US11409748B1**, «Context scoring adjustments for answer passages» (Google LLC; prioridad 2014-01-31, concedida 2022-08-09; inventores Nitin Gupta, Srinivasan Venkatachary, Lingkun Chu y Steven D. Baker). Describe el proceso con un nivel de detalle poco habitual:

1. **Extracción de pasajes candidatos.** De una página se extraen pasajes candidatos, cada uno con una puntuación. Esa puntuación inicial se basa en tres componentes: coincidencia de los términos de la consulta con el texto del pasaje, coincidencia de los términos de la respuesta, y **«la calidad del recurso subyacente»** (*quality of the underlying resource*).
2. **Jerarquía de encabezados.** El sistema reconstruye el árbol de encabezados de la página a partir del DOM (etiquetas de título) y construye un **«vector de encabezado»**: el camino desde el encabezado raíz (el título) hasta el encabezado del que cuelga el pasaje.
3. **Puntuación de contexto.** Se calcula una puntuación de contexto y se ajusta la anterior, de forma aditiva o multiplicativa. Los factores que la patente enumera: profundidad del encabezado (los pasajes «profundos» reciben un impulso; el umbral es 2), similitud entre la consulta y el texto de los encabezados, coincidencia de conjuntos de encabezados, ratio de cobertura del pasaje, detección de listas, texto distintivo y pregunta precedente.
4. **Selección.** Gana la puntuación ajustada más alta y ese pasaje es el que se muestra en el recuadro.

Dos precisiones que la patente añade:

- La respuesta mostrada puede ser un **hecho del grafo de conocimiento** (p. ej. «238,900 miles» para *how far away is the moon*) **además de** un pasaje textual extraído. Son dos mecanismos distintos que conviven en el mismo recuadro.
- El sistema «puede utilizar modelos de lenguaje, procesos de aprendizaje automático, grafos de conocimiento, gramáticas o combinaciones de ellos» para decidir si una consulta es una pregunta y cuál es su respuesta.

## Dónde entra el comportamiento humano

1. **Registros de selección (*selection logs*).** La patente describe explícitamente que el sistema almacena registros de consulta y de selección, donde estos últimos recogen «acciones tomadas en respuesta a los resultados de búsqueda; ejemplos de tales acciones incluyen clics». El comportamiento de los usuarios es dato del sistema, no un detalle accesorio.
2. **Calidad del recurso de origen.** Es uno de los tres componentes de la puntuación inicial, y se estima con señales producidas por personas: enlaces creados por humanos y, según lo reportado, datos de clics. **[Reportado, no verificado en fuente primaria]** El sistema **NavBoost**, que usaría datos de clics como señal de ranking, aparece en la cobertura periodística del juicio antimonopolio contra Google, no en documentación publicada por Google.
3. **La demanda.** El recuadro solo existe si mucha gente formula esa consulta. La forma de las consultas populares determina qué preguntas obtienen respuesta destacada.

## Qué no es público

El texto exacto de los factores y sus pesos, qué modelo concreto decide, y cuándo se activa o desactiva el recuadro. Google documenta el *feature* y es explícito en que el propietario del sitio **no puede solicitar ni pagar** una respuesta destacada; su único control es excluirse con el atributo `data-nosnippet`.

## Implicaciones para la tesis

El «documento relevante» de cada consulta en MessIRve **no es un juicio humano de relevancia**: es el juicio de Google, materializado como el párrafo de Wikipedia del que salió el snippet. Tres consecuencias:

1. **Es un estándar de plata (*silver*), no de oro.** No hay anotadores humanos ni acuerdo entre anotadores que reportar. Conviene nombrarlo así al describir el conjunto, en lugar de presentarlo como relevancia anotada.
2. **La etiqueta depende del tiempo.** Google introdujo los *AI Overviews* (resúmenes generados por modelo) y ha ido desplazando el recuadro clásico. Un conjunto construido sobre *featured snippets* fija el comportamiento de un sistema propietario que ya cambió: es una limitación de reproducibilidad que hay que declarar.
3. **Un documento relevante por consulta.** El artículo dice «the entire Wikipedia paragraph associated with the featured snippet as the relevant document for each query», en singular. Si se confirma que hay ~1 relevante por consulta, entonces Recall@100 toma valores en {0, 1}, P@50 está acotada por 1/50 = 0.02 y MAP se comporta como MRR. **[Pendiente]** Verificar en el conjunto de datos si el parámetro `expanded_search` añade relevantes por consulta; de eso depende que la batería de métricas de §4.4 se sostenga. Es el dato que desbloquea el párrafo P3 de §4.1 en `capitulos/capitulo4.tex`.

## Fuentes

**Primarias**

- Patente de Google [US11409748B1, «Context scoring adjustments for answer passages»](https://patents.google.com/patent/US11409748B1/en) (Google LLC, 2022). Fuente del mecanismo detallado en la sección «Mecanismo documentado».
- [Google Search Central — Featured snippets and your website](https://developers.google.com/search/docs/appearance/featured-snippets). Documentación del *feature* y del control mediante `data-nosnippet`.
- [Google Search Help — How Google's featured snippets work](https://support.google.com/websearch/answer/9351707).
- [Google Search Central — A guide to Google Search ranking systems](https://developers.google.com/search/docs/appearance/ranking-systems-guide). *(Consultada sin éxito: la página devuelve solo el menú de navegación al intentar extraer su texto.)*

**Sobre NavBoost — reportado, no primario**

- [What Is Navboost, and Why Does It Matter?](https://devrix.com/tutorial/navboost/)
- [NavBoost: Google's Hidden Click Ranking System Revealed](https://hueston.co/digital-marketing/navboost-googles-hidden-click-ranking-system-revealed/)

**Del proyecto**

- Artículo de MessIRve: Valentini et al. (2025) — clave `messirve-ValentiniEtAl2025` en `biblio.bib`; PDF en `recursos/messirve-ValentiniEtAl2025.pdf`.
- `notes/fuentes.md` — mapa de fuentes y sus PDF.

## No verificado en esta sesión

- Que las valoraciones de los **evaluadores humanos de calidad** de Google (*search quality raters*) no afecten directamente al posicionamiento. Es lo que sostiene la documentación de Google, pero no se comprobó contra la fuente en esta sesión. Verificar antes de citarlo en la tesis.
