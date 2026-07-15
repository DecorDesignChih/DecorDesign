DECOR DESIGN — PÁGINA + PANEL DE ADMINISTRACIÓN

ESTA VERSIÓN INCLUYE
- Página pública profesional.
- Panel privado admin.html.
- Inicio de sesión con Supabase Auth.
- Agregar, editar, ocultar, mostrar y eliminar categorías.
- Agregar, editar, ocultar, mostrar y eliminar productos.
- Nombre, descripción, precio, categoría, orden e imagen por producto.
- Agregar, editar, ocultar, mostrar y eliminar proyectos.
- Subida de imágenes a Supabase Storage.
- Catálogo y proyectos actualizados automáticamente en la página pública.
- Seguridad RLS: el público solo ve contenido activo; únicamente administradores pueden modificar.

PASO 1 — CONFIGURAR SUPABASE
1. Abre Supabase.
2. SQL Editor > New query.
3. Copia todo el archivo 01-supabase-setup.sql y presiona Run.
4. Debe terminar sin errores.

PASO 2 — CREAR EL USUARIO ADMINISTRADOR
1. Supabase > Authentication > Users > Add user.
2. Crea el correo y contraseña del administrador.
3. Copia el UUID del usuario.
4. En SQL Editor ejecuta:
   insert into public.admin_users(user_id) values ('UUID_DEL_USUARIO');
5. Usa ese correo y contraseña para entrar en admin.html.

PASO 3 — CONECTAR LA PÁGINA
1. Supabase > Project Settings > API.
2. Copia Project URL.
3. Copia anon / public key. NUNCA uses service_role.
4. Abre config.js.
5. Sustituye los dos textos PEGA_AQUI.
6. Guarda.

PASO 4 — SUBIR A GITHUB
1. Descomprime el ZIP.
2. Sube TODO lo que está dentro.
3. index.html debe quedar en la raíz.
4. GitHub > Settings > Pages > Deploy from branch > main > /(root).
5. La página pública será /index.html y el panel /admin.html.

IMPORTANTE
- No compartas públicamente el correo y contraseña del administrador.
- La anon public key sí puede estar en el navegador; la seguridad depende de RLS.
- Nunca pongas la service_role key en config.js.
- Si ya ejecutaste antes el SQL de Decor Design, puedes ejecutar este otra vez; no borra datos.
