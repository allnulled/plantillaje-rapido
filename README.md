# plantillaje-rapido

Plantillaje rápido es una app para hacer plantillas de 2 niveles rápidamente.

## Versión online

Para ir a la versión online puedes dirigirte directamente aquí:

 - [https://allnulled.github.io/plantillaje-rapido]

## Uso

Cada app tiene sus plantillas. Cada plantilla tiene su contenido. OK.

La sintaxis es la siguiente:

`#{  PREGUNTA  =  VALOR POR DEFECTO  }#`

Los espacios laterales tanto de la pregunta como del valor por defecto desaparecerán. Más adelante, puede que se habilite una sintaxis para preservarlos.

La idea es que antes de renderizarse la plantilla con EJS, se abrirán tantos diálogos como preguntas en esta sintaxis. Una vez resueltos los valores, se renderizará la plantilla resultante con EJS.

Además, el valor de cada PREGUNTA se guardará en `param.PREGUNTA` para que se pueda acceder desde el EJS.

Es un poco lioso, pero puede resultar muy útil para crear código rápidamente personalizable. Además, puedes usar los diálogos para generar **variables de texto en el código del EJS** que luego puedes usar para generar código dinámicamente.

## Ejemplo

```
- Hola, #{ nombre = Carlos }#. ¿Cómo estás?
- #{ estado = Bien }#.
- <%- param.estado === 'Bien' ? '¡Me alegro!' : '¿Qué te pasa?' %>
```

Esta plantilla producirá lo siguiente:

  1. Abre un diálogo con:
     - 'nombre' como pregunta y variable de plantilla.
     - 'Carlos' como valor por defecto.
  2. Abre un diálogo con:
     - 'estado' como pregunta y variable de plantilla.
     - 'Bien' como valor por defecto.
  3. Renderiza la plantilla EJS resultante. En ella, si el `estado` (accesible desde `param.estado` en la plantilla EJS) es `Bien`, entonces imprimirá `'¡Me alegro!'`. De lo contrario, preguntará `'¿Qué te pasa?'`.

Este segundo ejemplo hace lo mismo:

```
- Hola, #{ nombre = Carlos }#. ¿Cómo estás?
- #{ estado = Bien }#.
- <%
if( param.estado === 'Bien' ) {
  __append('¡Me alegro!');
} else {
  __append('¿Qué te pasa?');
}
%>
```

Eso es todo, espero que se entienda el concepto.