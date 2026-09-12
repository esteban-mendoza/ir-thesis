# Changelog

Registro cronológico **autoritativo** de cambios y decisiones del proyecto de tesis.

El trabajo se realiza con varios agentes que se alternan: **asume que tu contexto de conversación puede estar descontinuado**. Ante cualquier duda entre tu memoria y este archivo (o el contenido real del repositorio), este archivo y el repositorio mandan.

Protocolo obligatorio para todo agente:

1. Leer este archivo (y `AGENTS.md`) al **inicio** de cada sesión.
2. Contrastar tu contexto con el changelog y los archivos del repositorio antes de actuar.
3. Al terminar cualquier cambio significativo, **añadir una entrada al inicio** (orden cronológico inverso) con: archivos tocados, decisiones tomadas y estado/pendientes.

## Plantilla de entrada

## YYYY-MM-DD — Título breve
- **Cambios:** archivos modificados y qué se hizo.
- **Decisiones:** qué se decidió y por qué.
- **Estado / pendientes:** qué quedó por hacer.

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
