# Jornadas extraordinarias

Aplicación estática hecha con Astro para organizar las guardias del equipo y exportar los registros mensuales como documentos Word imprimibles.

## Requisitos

- Node.js 18.17.1 o posterior
- npm

## Desarrollo

Desde esta carpeta:

```sh
npm install
npm run dev
```

Para generar el sitio estático en `dist/`:

```sh
npm run build
```

## Uso

- Cambia de mes con las flechas o vuelve al mes actual con «Hoy».
- En cada fecha puedes asignar una persona y escribir una nota.
- Descarga documentos DOCX para tardes y sabados y festivos. El informe de tardes usa una cuadricula de lunes a viernes; el de sabados y festivos incluye una columna para la firma.
- Para incluir un festivo entre semana en el documento «Sábados y festivos», escribe la palabra «festivo» en las notas de esa fecha.
- Los registros se guardan en el almacenamiento local del navegador. Para conservarlos, usa el mismo navegador y dispositivo.
