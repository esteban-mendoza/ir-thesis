# Changelog

Registro cronológico **autoritativo** de cambios y decisiones del proyecto de tesis.

El trabajo se realiza con varios agentes que se alternan: **asume que tu contexto de conversación puede estar descontinuado**. Ante cualquier duda entre tu memoria y este archivo (o el contenido real del repositorio), este archivo y el repositorio mandan.

Protocolo obligatorio para todo agente:

1. Leer este archivo (y `AGENTS.md`) al **inicio** de cada sesión.
2. Contrastar tu contexto con el changelog y los archivos del repositorio antes de actuar.
3. Al terminar un cambio **importante**, **añadir una entrada al inicio** (orden cronológico inverso) con: archivos tocados, decisiones tomadas y estado/pendientes.

**Qué es «importante».** Una entrada se justifica cuando una sesión futura necesitaría leerla para no repetir trabajo, no deshacer una decisión o no malinterpretar el estado del proyecto: decisiones de contenido o de método, cambios de estructura, archivos nuevos o reescritos, y correcciones que alteran lo que dice la tesis. **No** hace falta anotar erratas, typos, reformateos, renombrados internos sin consecuencias ni el detalle de las verificaciones: el historial de git ya los guarda y el changelog debe seguir siendo corto para poder leerse entero.

## Plantilla de entrada

## YYYY-MM-DD — Título breve
- **Cambios:** archivos modificados y qué se hizo.
- **Decisiones:** qué se decidió y por qué.
- **Estado / pendientes:** qué quedó por hacer.

---

## 2026-09-13 — Nueva carpeta `knowledge/` para resúmenes de referencia
- **Cambios:** creada `tesis/knowledge/` con `google-featured-snippets.md`: cómo determina Google los *featured snippets* (mecanismo documentado en la patente US11409748B1, dónde entra el comportamiento humano, qué no es público y qué implica para las etiquetas de MessIRve). `AGENTS.md` — `knowledge/` documentado en «Estructura de `tesis/`».
- **Decisiones:** `knowledge/` alberga explicaciones de conceptos y mecanismos **externos** al proyecto, un archivo por tema, cada uno con su sección de fuentes y marcando qué está documentado, qué es reportado y qué quedó sin verificar. Se separa de `notes/`, que son notas de trabajo del proyecto.
- **Estado / pendientes:** el resumen deja dos cabos sueltos. (1) Verificar en el conjunto de datos la distribución de documentos relevantes por consulta: si es 1, Recall@100 solo toma valores en {0, 1}, P@50 queda acotada por 0.02 y MAP se comporta como MRR, lo que afecta a la justificación de la batería de métricas de §4.4 y al párrafo P3 de §4.1. (2) Confirmar en la documentación de Google que las valoraciones de sus evaluadores humanos de calidad no afectan directamente al posicionamiento.

## 2026-09-13 — Migración a biblatex + biber con APA 7 en español
- **Cambios:** `tesis/tesis.tex` — fuera `natbib` y `\bibliographystyle{abbrv}`; entra `\usepackage[backend=biber,style=apa]{biblatex}`, `\addbibresource{biblio.bib}`, `\usepackage{csquotes}` y `\printbibliography[heading=bibintoc]`. `tesis/capitulos/capitulo4.tex:10` — `(\parencite{...})` → `\parencite{...}`, porque los paréntesis manuales duplicaban la cita. `AGENTS.md` — reescrita «Compilación» (obligación del punto 4).
- **Decisiones:** se migró para tener el aparato de citas en **español** y **APA 7** real, que natbib + BibTeX no alcanzaba sin `apacite` (APA 6 y en inglés) ni parchear el `.bst` a mano. `style=apa` (paquete `biblatex-apa`, instalado con `sudo tlmgr install biblatex-apa`) en lugar de `style=authoryear`, que no pone coma antes del año ni invierte todos los apellidos. `csquotes` es obligatorio para ese estilo y ya estaba instalado. Además, el `biber` de TeX Live está **roto** en esta máquina (envoltorio autoextraíble que falla al llamar a `/usr/bin/lipo`): se sustituyó por la slice arm64 extraída en `~/bin/biber` (v2.21), que gana en el `PATH` y que TeXstudio usa porque invoca `biber %` sin ruta absoluta.
- **Estado / pendientes:** verificado en **copia aislada** (27 páginas, 0 errores, 0 citas sin resolver, `spanish-apa.lbx` cargado): cita en el texto `(Valentini et al., 2025)` y referencia `Valentini, F., Cotik, V., … & Pérez, J. M. (2025). …`. **Falta recompilar in situ**: la verificación se hizo en `/tmp` porque TeXstudio estaba corriendo y truncó `tesis.aux` al compilar en paralelo (LaTeX aborta con `! Extra }, or forgotten \endgroup`). En el cuerpo, `\citep`/`\citet` ya **no existen**: usar `\parencite`/`\textcite`. Un `.bbl` generado por BibTeX hace fallar a biblatex (`not created by biblatex`): limpiar con `latexmk -C tesis.tex`.

## 2026-09-13 — Claves de cita normalizadas en `biblio.bib`
- **Cambios:** `tesis/biblio.bib` — las 18 claves renombradas a la convención `<modelo-o-tema>-<AutoresEnPascalCase><Año>`, idéntica al nombre base del PDF en `recursos/`. Solo cambiaron las líneas de apertura `@tipo{clave,`; ningún campo se tocó. Verificado con bibtex (18 entradas, 0 errores) y `latexmk -g -pdf` (exit 0). `AGENTS.md` — punto 3 del protocolo alineado con el criterio nuevo, añadido el punto 4 (una decisión que contradiga el archivo obliga a actualizarlo en la misma sesión, verificando antes cuál de los dos tiene razón), y «Advertencias conocidas» reescritas: las dos que avisaban de entradas heredadas de PLN y de claves inconsistentes quedaron falsas al vaciar el archivo. `tesis/notes/changelog.md` — añadido el criterio de qué merece entrada.
- **Decisiones:** 2 autores → ambos apellidos (`KhattabZaharia`, `FoxShaw`); 3 o más → primer apellido + `EtAl`. El prefijo de tema conserva la capitalización del PDF (`bm25-` en minúsculas; `mE5-`, `spladeV3-` tal cual) y va sin tildes (`isr-MouraoEtAl2014`). La clave es el nombre del PDF: clave ↔ archivo ↔ fuente son el mismo identificador. **La sección «Compilación» de `AGENTS.md` no se tocó:** se pidió cambiarla a biber, pero `tesis/` usa natbib + BibTeX (`tesis.tex:53` y `:213-214`; `tesis.blg` = «This is BibTeX»; sin `.bcf`); el subproyecto con biblatex + biber es `protocolo/`.
- **Estado / pendientes:** `biblio.bib` ya tiene las fuentes principales de `fuentes.md`. Las secundarias se agregarán solo si hacen falta. El cuerpo aún no tiene ningún `\cite`, así que la bibliografía se imprime vacía: es esperado.

## 2026-09-12 — Cap. 4: plan de párrafos (nivel 4) en capitulo4.tex
- **Cambios:** `tesis/capitulos/capitulo4.tex` — añadido el nivel 4 (plan párrafo-por-párrafo) como comentarios `% P<n>:` bajo cada (sub)sección, conservando las viñetas de nivel 3 espejo del índice. `AGENTS.md` — documentada la convención en «Dónde vive el plan». Esta entrada en el changelog.
- **Decisiones:** el nivel 4 vive en cada archivo `.tex` para no contaminar `notes/indice.md`; una línea `% P<n>:` por párrafo que indica qué debe cubrir y qué valores/citas/tablas/figuras insertar, con marcadores `[PENDIENTE: …]` para lo que falta. Desglose: §4.1 (4 párrafos), §4.2 (5), §4.3 (3), §4.4 protocolo común (4), E1/E2/E4 (1 c/u), E3 (2). Valores anclados a `ir-spanish/`: top-100 por modelo en primera etapa, semilla 42, RRF k=60 (default de ranx), ~100 candidatos al reranking, hardware 2× RTX A5000 de 24 GB.
- **Estado / pendientes:** el usuario redacta los párrafos. Pendientes señalados en las notas: distribución de relevantes por consulta (§4.1), Fig. 4.1 del pipeline (§4.2), normalización exacta usada antes de CombMNZ (ver `ir-spanish/rerankers/fuse.py`), medida de eficiencia del E3, entradas de Urbano et al. (2019) y Smucker et al. (2007) en `biblio.bib`, y precisar si E3 incluye jina-colbert-v2.

---

## 2026-09-12 — Índice: protocolo de significancia estadística definido
- **Cambios:** `tesis/notes/indice.md` — §2.5.2 (marco) con cinco viñetas sobre pruebas de significancia; §4.4 desglosa el protocolo de evaluación (métricas, prueba, justificación, comparaciones múltiples); §4.4.4 y §5.4 marcan el E4 como comparación descriptiva sin prueba; §5.2 referencia Tukey HSD. Comentarios de `capitulos/capitulo2.tex`, `capitulo4.tex` y `capitulo5.tex` re-sincronizados con el índice.
- **Decisiones:** prueba principal = **t pareada (Student) de dos colas, α = 0.05** para las hipótesis de efectividad media; **test de permutación** como alternativa robusta (ambas disponibles en `ranx.compare`). Justificación: Urbano et al. (2019) como fuente principal, Smucker et al. (2007) como antecedente. Comparaciones múltiples con **Tukey HSD** (E2). E4 queda como **comparación descriptiva** (los sistemas propietarios no publican puntuaciones por consulta).
- **Estado / pendientes:** falta implementar las pruebas en `ir-spanish/` (hoy solo se usan métricas de `ranx`; la API es `ranx.compare`) y crear las entradas de `biblio.bib` para UrbanoEtAl2019 y SmuckerEtAl2007.

## 2026-09-12 — Fuente de significancia estadística: Urbano et al. (2019)
- **Cambios:** renombrado `recursos/3331184.3331259.pdf` → `recursos/significancia-UrbanoEtAl2019.pdf`; entrada añadida en `tesis/notes/fuentes.md` (**en negrita**: fuente principal del tema); Smucker et al. (2007) queda como fuente de apoyo.
- **Decisiones:** Urbano, Lima y Hanjalic (2019, SIGIR '19) tiene conclusiones más fuertes que Smucker et al. (2007): recomienda **t pareada para hipótesis de efectividad media** (permutación como alternativa), desaconseja **bootstrap-shift** (sesgo hacia p-valores pequeños) y a Wilcoxon/signo para diferencias de medias. Por eso es la fuente principal del aparato de significancia.
- **Estado / pendientes:** falta crear las entradas de `biblio.bib` para UrbanoEtAl2019 y SmuckerEtAl2007 (no existen hoy). Los cambios al índice derivados de esta decisión están en la entrada más reciente (arriba).

## 2026-09-12 — Paso 0: esqueletos sincronizados con el índice
- **Cambios:** reescritos `tesis/capitulos/capitulo1.tex`…`capitulo5.tex` y `conclusiones.tex` con la estructura exacta de `tesis/notes/indice.md` (viñetas de nivel 3 como comentarios `%`); eliminados los epígrafes placeholder y las secciones «Resumen» (no están en el índice); etiquetas uniformes (`sec:…`/`subsec:…`, renombradas las viejas sin referencias); cap. 4 titulado «Metodología»; comentario de `tesis.tex` actualizado.
- **Decisiones:** orden de escritura recomendado y acordado: 0) sincronizar esqueletos (hecho) → 1) cap. 4 Metodología → 2) cap. 5 Resultados (en paralelo con los experimentos pendientes) → 3) cap. 2 Marco teórico → 4) cap. 3 Estado del arte → 5) cap. 1 Introducción → 6) cap. 6 Conclusiones. Método *top-down*: convertir las viñetas en plan párrafo-por-párrafo antes de redactar.
- **Estado / pendientes:** compilación verificada (`latexmk -pdf`, exit 0, 27 páginas). Pendientes para el cap. 4: distribución de relevantes por consulta de MessIRve (§4.1) y nota del límite de 0.6B (§4.2). Discrepancia menor: `indice.md` dice que el cap. 2 tiene 14 subsecciones pero lista 13. Precaución: no compilar en paralelo con el compilador automático del editor (borra los `.aux` a mitad de corrida).
