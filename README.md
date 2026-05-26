# PruebasGrafica

Proyecto desarrollado con GameMaker Studio. Contiene recursos, objetos, scripts y configuraciones para pruebas gráficas y de coordenadas.

## Estructura del repositorio

La organización principal del proyecto es la siguiente:

- `datafiles/` : archivos de datos generados por el IDE.
- `objects/` : carpetas con objetos del juego. Cada objeto tiene su archivo `.yy` y los eventos exportados en archivos `.gml`.
  - `obj_control/` : objeto controlador principal con eventos Create, Step y Draw.
- `options/` : opciones de compilación y configuración por plataforma (windows, html5, android, ios, mac, linux, etc.).
- `rooms/` : salas del proyecto (por ejemplo `Room1/Room1.yy`).
- `scripts/` : scripts GML organizados en carpetas por nombre. Incluye utilidades para manejo de expresiones y coordenadas:
  - `coordToPlanoX` : conversión de coordenadas de pantalla al plano usado por la aplicación.
  - `infixToPostfix`, `evaluatePostfix`, `tokenize`, `parseEquation` : análisis y evaluación de expresiones matemáticas.
  - `isNumber`, `isOperator`, `isVariable`, `SplitByOperadores` : funciones auxiliares para tokenización y validación.
- `sprites/` : recursos gráficos y subcarpetas de capas exportadas por GameMaker.
- `*.yyp`, `*.resource_order` : archivos de proyecto y orden de recursos generados por GameMaker.

## Requisitos

- GameMaker Studio (versión compatible según la configuracion del proyecto en `PruebasGrafica.yyp`).

## Cómo abrir el proyecto

1. Abrir GameMaker Studio.
2. Seleccionar "Open Project" y navegar hasta la carpeta del proyecto.
3. Abrir `PruebasGrafica.yyp`.

## Convenciones de código

- Los scripts están en GML y exportados en la carpeta `scripts/` con nombres de carpeta que coinciden con el nombre del script.
- Los objetos se encuentran en `objects/` en subcarpetas por objeto. Cada carpeta contiene el archivo `.yy` del objeto y los scripts de evento (`Create_0.gml`, `Step_0.gml`, `Draw_0.gml`, etc.).
- Mantener los nombres de archivos y carpetas tal como los exporta GameMaker para asegurar compatibilidad en reimportaciones.

## Descripción de componentes importantes

- `obj_control`:
  - Create: inicializaciones globales y configuración de parámetros.
  - Step: lógica de actualización por frame.
  - Draw: llamadas para renderizado que pueden usar funciones de conversión de coordenadas.

## Variables de configuración en `obj_control`

El objeto `obj_control` expone variables que permiten ajustar el comportamiento y la apariencia de la gráfica:

- `contadorX` (o nombre equivalente en el objeto): controla la frecuencia de muestreo o la separación entre puntos que forman la gráfica. Valores mayores reducen la cantidad de puntos; valores menores aumentan la densidad.
- Colores: no existen variables `color_linea` o `color_puntos` por defecto. El color debe establecerse directamente en el evento Draw usando la función `draw_set_color(color)` antes de dibujar la línea o los puntos.
- `escala` (o nombre equivalente): factor de escala aplicado al plano cartesiano dibujado, afectando la conversión de unidades del plano a la pantalla.

Estas variables suelen inicializarse en el evento Create de `obj_control` y pueden modificarse en tiempo de ejecución para ajustar la visualización.

## Scripts de coordenadas

- `coordToPlanoX`: convierte coordenadas de pantalla a la coordenada X en el sistema de referencia del plano usado por la aplicación.

- Scripts de expresión matemática:
  - `tokenize`: separa una expresión en tokens.
  - `infixToPostfix`: transforma una expresión infija a postfix (RPN).
  - `evaluatePostfix`: evalúa una expresión en postfix.
  - `parseEquation`: procesa y prepara expresiones para evaluación.

## Flujo de ejecución general

1. Al iniciar la sala `Room1`, el objeto `obj_control` realiza la inicialización en su evento Create.
2. En cada frame, `obj_control` ejecuta su evento Step para actualizar estados y procesar entradas.
3. El renderizado se realiza en los eventos Draw de los objetos, utilizando los scripts de conversión de coordenadas cuando es necesario.
4. Las expresiones matemáticas son procesadas mediante la secuencia `tokenize` -> `infixToPostfix` -> `evaluatePostfix`.

## Buenas prácticas para desarrolladores

- No modificar manualmente los archivos `.yy` salvo que se comprenda el formato y riesgos de corrupción del proyecto.
- Usar GameMaker para editar sprites, objetos y recursos; los archivos exportados en este repositorio sirven para control de versiones y revisión.
- Mantener funciones puras y documentadas dentro de los scripts para facilitar pruebas unitarias y reutilización.

## Restauración y reimportación

- Para reimportar recursos en GameMaker, abrir el proyecto en el IDE y usar las opciones de importación si corresponde.

## Licencia

Este proyecto no especifica una licencia en el repositorio. Añadir un archivo `LICENSE` si se desea definir términos de uso y contribución.

## Contacto

Para preguntas sobre el proyecto o contribuciones, contactar al mantenedor principal del repositorio.
