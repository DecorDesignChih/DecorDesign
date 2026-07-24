DECOR DESIGN — ACTUALIZACIÓN DE VIGAS Y PANEL ADMINISTRADOR

ARCHIVO DE EXCEL UTILIZADO
- Productos-2026-07-24-16-25.xlsx
- 22 registros: 15 vigas y 7 complementos.

QUÉ CORRIGE ESTA ENTREGA
1. Agrega la categoría "Vigas interior y exterior PVC" con cinco subcategorías.
2. Carga los 22 productos con precio, SKU, descripción e imagen individual.
3. Las 22 fotografías de vigas quedan guardadas dentro de assets/productos/vigas/ y no dependen de Microlink.
4. El producto sin precio en el Excel se muestra como "Consultar precio", nunca como $0.00.
5. El texto de categorías, subcategorías y productos aparece debajo de las imágenes.
6. El administrador conserva visible el formulario de acceso y muestra un mensaje útil si Supabase o admin.js no cargan.
7. Las imágenes rotas del resto del catálogo muestran una tarjeta identificada con el nombre del producto, en lugar de quedar en blanco o repetirse.

ORDEN CORRECTO
A. Sube primero todo el contenido de este proyecto a GitHub y reemplaza los archivos anteriores.
B. Espera a que GitHub Pages termine de publicar.
C. En Supabase > SQL Editor ejecuta completo: 06-vigas-imagenes-y-admin.sql
D. El resultado debe mostrar cinco filas y sumar 22 productos.
E. Abre la página con Ctrl + F5. En celular, cierra la pestaña y vuelve a abrirla.

ADMINISTRADOR
- La cuenta debe existir en Authentication > Users.
- El UUID de esa cuenta también debe existir en public.admin_users.
- Si dice "usuario no autorizado", ejecuta en SQL Editor:
  insert into public.admin_users(user_id) values ('UUID_DEL_USUARIO') on conflict do nothing;

IMPORTANTE
Esta entrega instala fotografías oficiales individuales para los 22 productos de vigas incluidos en el Excel nuevo. Para los demás productos, se mantiene su URL actual; cuando esa URL falla, la página muestra un respaldo único con el nombre del producto para evitar cuadros blancos o imágenes repetidas.
