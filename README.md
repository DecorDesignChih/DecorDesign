# Decor Design Premium V3

Sitio público + panel de administración conectado a Supabase y listo para GitHub Pages.

## Ya está configurado
- URL y clave pública de Supabase en `config.js`.
- Categorías, productos y trabajos se cargan automáticamente desde Supabase.
- Panel protegido mediante Supabase Auth + tabla `admin_users`.
- Subida de imágenes a Supabase Storage.

## Cómo instalar esta actualización en GitHub
1. Descomprime `decor-design-premium-v3.zip`.
2. Entra al repositorio de GitHub donde está tu página.
3. Selecciona **Add file → Upload files**.
4. Sube todos los archivos y la carpeta `assets`.
5. Acepta reemplazar los archivos anteriores.
6. Presiona **Commit changes**.
7. Espera de 1 a 3 minutos.
8. Abre tu página y pulsa `Ctrl + F5` para ver la versión nueva.

## Direcciones
- Página pública: `https://decordesignchih.github.io/DecorDesign/`
- Panel: `https://decordesignchih.github.io/DecorDesign/admin.html`

## Cómo usar el panel
1. Abre `admin.html`.
2. Inicia sesión con el correo administrador creado en Supabase.
3. En **Categorías** crea, edita, oculta o elimina colecciones.
4. En **Productos** agrega cada modelo y asígnalo a una categoría.
5. En **Trabajos realizados** sube tus instalaciones.

## Importante
- No subas claves `sb_secret_` o `service_role` a GitHub.
- La clave incluida es pública y la protección real está en las políticas RLS.
- No hace falta volver a ejecutar el SQL si la base ya quedó creada y tu administrador ya aparece en `admin_users`.
