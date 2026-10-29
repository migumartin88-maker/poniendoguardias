# Jornadas extraordinarias

Aplicación estática hecha con Astro para organizar las guardias del equipo y exportar los registros mensuales como documentos Word imprimibles. Los registros se sincronizan con Supabase para que el equipo vea los mismos datos desde distintos dispositivos.

## Requisitos

- Node.js 18.17.1 o posterior
- npm

## Desarrollo

Desde esta carpeta:

```sh
npm install
npm run dev
```

Antes de arrancar, copia `.env.example` a `.env` y rellena las variables de Supabase:

```powershell
Copy-Item .env.example .env
```

Para generar el sitio estático en `dist/`:

```sh
npm run build
```

## Configuración de Supabase

1. Crea un proyecto en Supabase.
2. En **SQL Editor**, ejecuta el contenido de [`supabase/schema.sql`](./supabase/schema.sql).
3. Copia `.env.example` a `.env` y sustituye los valores por la URL del proyecto y la clave pública `anon` (o `publishable`) de **Project Settings → API**.
4. Reinicia el servidor de desarrollo o vuelve a generar el sitio después de cambiar las variables.

Al desplegar el sitio, configura `PUBLIC_SUPABASE_URL` y `PUBLIC_SUPABASE_ANON_KEY` como variables de entorno del proceso de compilación. La clave pública se incluye en el sitio generado; nunca pongas una clave `service_role` en estas variables.

El calendario está configurado para acceso compartido sin inicio de sesión: cualquiera que acceda a la aplicación puede leer y modificar los registros. La URL y la clave pública de Supabase se incluyen en el sitio y no son contraseñas; las políticas de acceso están en `supabase/schema.sql`. No uses esta modalidad para información confidencial. Los datos guardados previamente en el navegador se importan al calendario compartido cuando no existe ya una entrada para esa fecha. Mientras la aplicación permanece abierta, consulta los cambios de otros usuarios cada cinco segundos.

## Uso

- Cambia de mes con las flechas o vuelve al mes actual con «Hoy».
- En cada fecha puedes asignar una persona y escribir una nota.
- Los cambios se guardan automáticamente; no hay que pulsar ningún botón para guardar. En el mismo navegador se conserva una copia local y, con Supabase configurado, se comparten entre dispositivos.
- Descarga documentos DOCX para tardes y sabados y festivos. El informe de tardes usa una cuadricula de lunes a viernes; el de sabados y festivos incluye una columna para la firma.
- Para incluir un festivo entre semana en el documento «Sábados y festivos», escribe la palabra «festivo» en las notas de esa fecha.
- Los registros se guardan en Supabase y se comparten entre quienes usan la aplicación. También se conserva una copia local en el navegador.
