# Mostrar código en la tesis

Cómo usar las utilidades de `estilos/codigo.tex`. Escrito el 2026-09-14, tras
verificar todo lo que dice aquí con compilaciones reales (ver «Qué se verificó»).

## Qué hay y por qué

`estilos/codigo.tex` se carga desde el preámbulo (`tesis.tex:53`) con
`\input{estilos/codigo}`, antes de `hyperref`. El motor es doble:

- **`listings`** — resaltado de sintaxis. Viene con TeX Live, no depende de nada externo.
- **`tcolorbox`** — el marco, la barra de título y el partido entre páginas.

Los dos **ya estaban instalados** en esta máquina, así que no hay nada que
instalar y **no** hace falta compilar con `--shell-escape`. El catálogo visual
de todos los estilos es `notes/codigo-ejemplos.tex`: es un documento
independiente, compílalo con `latexmk -pdf codigo-ejemplos.tex` (funciona desde
`tesis/` y desde `tesis/notes/`).

## Interfaz

| Quieres                                                 | Escribe                                                                            |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Listado con marco, numerado, que se parte entre páginas | `\begin{codigo}[py]{Título} … \end{codigo}`                                        |
| Listado flotante (LaTeX lo coloca donde quepa)          | `\begin{codigoflotante}[sh]{Título} … \end{codigoflotante}`                        |
| Incluir un archivo real, total o por rango de líneas    | `\archivocodigo[py, lineas={40}{58}]{../ir-spanish/rerankers/fuse.py}{Fusión RRF}` |
| Código en línea                                         | `\py{revision="1.2"}` · `\sh{ssh iimas}` · `\cod{top-100}`                         |
| Referenciar un listado                                  | `[py, label={lst:carga}]` y luego `\cref{lst:carga}` → «listado 4.1»               |

Los alias de estilo disponibles son `py` (Python), `sh` (bash), `sql`,
`js` (JSON), `seudo` (pseudocódigo con palabras clave en español) y `sal`
(salida de consola: sin números de línea ni resaltado). Los tres entornos
comparten un contador que se reinicia en cada capítulo, así que en el capítulo 4
salen «Listado 4.1», «Listado 4.2», …

### Ejemplos

```latex
\begin{codigo}[py]{Carga del split de prueba}
datos = load_dataset("spanish-ir/messirve", "full", revision="1.2")["test"]
\end{codigo}

\begin{codigo}[seudo]{Fusión RRF}
algoritmo RRF(listas, k = 60):
    para cada documento d en la unión de las listas:
        puntuacion(d) = suma sobre cada lista L de 1 / (k + rango_L(d))
    devolver los documentos ordenados por puntuacion descendente
\end{codigo}

\begin{codigoflotante}[sal]{Evaluación}
$ python -m ir_spanish.evaluate --metrica ndcg@10
nDCG@10 = 0.4123   Recall@100 = 0.8910
\end{codigoflotante}

\archivocodigo[py, lineas={1}{20}]{../ir-spanish/rerankers/fuse.py}{Fusión con ranx}

El modelo se cargó con \py{revision="1.2"} y se evaluó el \cod{top-100}.
```

### Referencias a un listado (flotante o no)

Los tres entornos aceptan la clave `label`, así que se referencian como una
figura o una tabla. Un listado flotante con etiqueta y su referencia:

```latex
\begin{codigoflotante}[py, label={lst:carga}]{Carga del split de prueba}
datos = load_dataset("spanish-ir/messirve", "full", revision="1.2")["test"]
\end{codigoflotante}

En el listado~\ref{lst:carga} se carga el conjunto de datos.   % -> «listado 5.1»
```

| Comando | Imprime | Requiere |
| --- | --- | --- |
| `\ref{lst:carga}` | 5.1 | nada |
| `\autoref{lst:carga}` | Listado 5.1 | `hyperref` (ya está cargado) |
| `\cref{lst:carga}` | listado 5.1 | `cleveref` |

`\cref` acierta con el plural y la conjunción (`\cref{lst:carga,lst:rrf}` →
«listados 5.1 y 5.2») y `\Cref` da la mayúscula inicial, para empezar oración.
Mejor `\cref{...}` que escribir «el listado~\ref{...}» a mano: si cambia la
numeración o el orden, el texto se actualiza solo.

**`cleveref` está cargado** (versión 0.21.4, con `refcount`). Se activó durante la
redacción de §4.1, cuando el texto ya usaba `\cref{}`. Estas son las tres líneas
del preámbulo de `tesis.tex`, inmediatamente después de `hyperref`:

```latex
\usepackage[spanish]{cleveref}
\crefname{table}{tabla}{tablas}
\Crefname{table}{Tabla}{Tablas}
```

Dos avisos sobre ellas, ambos comprobados:

1. **Conviene el `[spanish]` explícito.** Sin él, `\cref` de un capítulo imprime
   «chapter 5»; con él, «capítulo 5». cleveref intenta detectar el idioma de
   babel, pero lee `\languagename` antes de que babel lo fije, así que en la
   práctica no lo detecta.
2. **Con `es-tabla` hay que unificar el nombre de las tablas.** cleveref dice
   «cuadro» y la tesis dice «Tabla»; para que no se contradigan, añade junto a
   la línea anterior:

```latex
\crefname{table}{tabla}{tablas}
\Crefname{table}{Tabla}{Tablas}
```

(El enganche de los listados con cleveref vive en `estilos/codigo.tex` y no hay
que añadir nada: registra el tipo del contador `tcb@cnt@codigo` mediante
`\AddToHook{package/cleveref/after}`. Tiene que ser ahí y no en
`\AtBeginDocument`, porque cleveref construye los formatos de referencia al
terminar de cargarse y una definición posterior llega tarde: `\cref` imprime
«??» y avisa «reference format for label type … undefined».)

### Pasar opciones de `listings`

Todo lo que sea una opción de `listings` (numeración, rango, estilo) va **dentro**
de `listing options={…}`:

```latex
\begin{codigo}[listing options={style=python, numbers=none, firstnumber=20}]{Título}
```

Para el caso frecuente del rango de líneas hay un atajo propio: `lineas={40}{58}`.

### Añadir un lenguaje nuevo

Dos líneas en `estilos/codigo.tex`, junto a los demás:

```latex
\lstdefinelanguage{micodigo}{morekeywords={...}, morecomment=[l]{\#}}
\lstdefinestyle{micodigo}{language=micodigo}
```

Y, si quieres el alias corto, una línea más en el `\tcbset`:
`mc/.style={listing style=micodigo},`.

### Índice de listados

Ya está activado: `tesis.tex` llama a `\lstlistoflistings` justo después de
`\listoftables`, y las entradas se registran solas (con número y título). Como
`tocbibind` solo conoce las listas de figuras y de tablas, `estilos/codigo.tex`
engancha también esta con el mecanismo del propio `tocbibind` (`\tocfile`), de
modo que aparece en el índice general con la página correcta.

## Recomendación de uso

Para código que ya existe en `ir-spanish/`, usa **`\archivocodigo` con rango de
líneas** en vez de copiar y pegar: así la tesis no puede desincronizarse del
código que realmente se ejecutó. Las rutas son relativas al directorio de
compilación (`tesis/`), de modo que el repositorio de experimentos se alcanza
como `../ir-spanish/...`. Contrapartida: si el archivo de origen cambia, el rango
hay que reajustarlo.

## Trampas (todas comprobadas al construir esto)

1. **Las opciones de `listings` no van sueltas en los corchetes.** tcolorbox es
   el dueño de `[...]` y solo reenvía lo que va dentro de `listing options={…}`.
   Un `[firstnumber=7]` suelto aborta con
   `I do not know the key '/tcb/firstnumber'`.
2. **`\py`, `\sh` y `\cod` se definen sin argumento** (`\newcommand{\py}{\lstinline[style=python]}`).
   El delimitador es el carácter que sigue a la llamada, y por eso `\py{…}` y
   `\sh|…|` funcionan. Definirlas con `#1` y pasarlo a `\lstinline` falla con
   «lstinline ended by EOL».
3. **Los acentos y las comillas latinas funcionan dentro de los listados** gracias
   al mapa `literate` de `estilos/codigo.tex` (listings no entiende UTF-8
   multibyte con pdflatex). Si algún día hace falta un carácter raro que no esté
   en ese mapa, se añade ahí: `{→}{{$\rightarrow$}}1`.
4. **El título es la barra superior, no un pie con `\caption`.** Es lo normal en
   listados de código y evita pelear con flotantes que se parten entre páginas.
5. **El título es obligatorio, y es texto normal (no verbatim).** `codigo` y
   `codigoflotante` exigen `{Título}`; `\archivocodigo` exige la ruta **y** el
   título. Si se omite, tcolorbox se come lo que venga después: si el cuerpo
   empieza con `{` —un JSON, por ejemplo— se traga el cuerpo entero como título y
   los `#` de dentro abortan la compilación (`Illegal parameter number in
   definition of \kvtcb@title`, y después `macro parameter character #`). Como el
   título se compone como texto, ahí los especiales van escapados (`\#`, `\_`,
   `\%`, `\&`); el **cuerpo** del listado sí es verbatim y no necesita nada:
   `"docid": "129493#38"` se escribe tal cual.
6. **Si un listado falla, borra `tesis.lol` y `tesis.listing`.** El índice de
   listados (`tesis.lol`) y el archivo temporal que usa `listings` para leer el
   cuerpo (`tesis.listing`) **se releen en compilaciones posteriores**: una corrida
   rota deja el `.lol` con una entrada inválida y el error **persiste aunque ya
   hayas arreglado el `.tex`**. Perdí una vuelta por eso. Los dos están en
   `.gitignore` y se regeneran solos, así que borrarlos no cuesta nada.

## Alternativas evaluadas (y por qué no)

1. **`minted` (Pygments)** — el resaltado de mejor calidad, y `pygmentize` sí
   existe en esta máquina (2.20.0). Pero **no está instalado**: `kpsewhich
   minted.sty` y `fvextra.sty` no devuelven nada, y tampoco existe el ejecutable
   `latexminted` que exigen las versiones recientes. Además obliga a compilar con
   `--shell-escape` (hay que tocar TeXstudio y `latexmk`) y a que **cualquiera**
   que compile la tesis tenga Python, Pygments y `latexminted`. Lo que haría
   falta: `sudo tlmgr install minted fvextra`, `pip install latexminted` y activar
   el *shell escape*. Solo vale la pena si se acepta esa dependencia en el
   entorno de quien compile (asesora, imprenta); el resaltado de `listings` es
   suficiente para fragmentos cortos.
2. **`algorithm2e` / `algpseudocode`** — los paquetes estándar para «Algoritmo 1»
   numerado con entrada/salida formales. **No están instalados**
   (`sudo tlmgr install algorithm2e`). Mientras no se instalen, el alias `seudo`
   cubre el pseudocódigo sin añadir dependencias.
3. **`listings` sin `tcolorbox`** — más simple, pero sin marco ni título. No
   aporta nada aquí: `tcolorbox` ya está instalado.
4. **`verbatim`** (lo único que había antes, `tesis.tex:40`) — sin resaltado, sin
   acentos dentro del listado y sin título. Sigue disponible para casos raros,
   igual que `\verb|...|` en línea.

## Qué se verificó (2026-09-14)

- **Prueba de integración con el preámbulo real**, en copia aislada
  (`/tmp/tesis-verif`, un `rsync` de `tesis/` más un capítulo de demostración):
  `latexmk` terminó con **exit 0**, 30 páginas, **0 errores**, y `pdftotext`
  confirmó los listados numerados 5.1–5.7 (los tres entornos comparten contador),
  los acentos dentro del código, el corte de línea con flecha, la numeración por
  capítulo y la inclusión de un archivo de 40 líneas.
- **La tesis real sin tocar** (solo con el `\input` nuevo): exit 0, 0 errores.
- **Catálogo** `notes/codigo-ejemplos.tex` compilado desde `tesis/notes/` y desde
  `tesis/` (las dos ramas de la ruta del `\input`): exit 0 en ambos casos.
- **Índice de listados**: comprobado que `\lstlistoflistings` produce
  «5.1. Carga del conjunto de datos», con número y sin repetir el «Listado 5.1 ·»,
  y que la entrada «Índice de listados» aparece en el índice general en la página
  del encabezado (xiii, entre «Índice de tablas xi» y «Resumen xiv»).
- **Referencias** (copia con `\usepackage[spanish]{cleveref}` y un listado
  flotante etiquetado): `\ref` → «5.1»; `\autoref` → «Listado 5.1»; `\cref` →
  «listado 5.1»; `\cref` de dos → «listados 5.1 y 5.2»; `\Cref` → «Listado 5.3»;
  `\cref` de una tabla → «tabla 5.1» (con el `\crefname{table}` de arriba) y de
  un capítulo → «capítulo 5». **0 avisos** de «reference format … undefined».
- **No se recompiló `tesis/tesis.pdf`**: TeXstudio estaba abierto y compilar en
  paralelo trunca `tesis.aux` (ver «Compilación» en `AGENTS.md`). La verificación
  se hizo siempre en copias aisladas.
- **Primer listado real de la tesis** (§4.1, la instancia de MessIRve en JSON):
  tras corregir el título que faltaba y cargar `cleveref`, la copia limpia compila
  con **exit 0 y 0 errores** (29 páginas), el texto dice «Refiérase al listado
  4.1», el `#` de `"129493#38"` se imprime tal cual, el índice general tiene
  «Índice de listados» y la entrada del índice de listados es la correcta.

## Pendiente de tu decisión

- **Dónde usar listados** en los capítulos: §4.1 ya tiene uno (la instancia de
  MessIRve en JSON, `lst:entrada-ej`); los sitios naturales que quedan son §4.1 P4
  (la línea de `load_dataset`), §4.2 P5 (pila de software y semillas) y el futuro
  `apendices/software`.
