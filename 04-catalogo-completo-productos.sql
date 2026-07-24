-- DECOR DESIGN — CATÁLOGO COMPLETO DESDE EL EXCEL DE PRODUCTOS
-- Generado el 24 de julio de 2026.
-- Ejecuta este archivo en Supabase > SQL Editor DESPUÉS de 01-supabase-setup.sql y 02-supabase-subcategorias.sql.
-- Es repetible: reemplaza únicamente las categorías administradas por este catálogo.
begin;

alter table public.products add column if not exists sku text;

-- Retira las versiones anteriores de estas categorías para evitar duplicados.
delete from public.categories
where lower(name) in (
  'lambrín',
  'placas',
  'tapiz',
  'accesorios para muros',
  'pisos',
  'deck',
  'pasto sintético',
  'placas pvc',
  'papel tapiz',
  'panel walnut',
  'follaje y decor',
  'vigas'
);
update public.categories set sort_order=8 where lower(name)=lower('Persianas');
insert into public.categories(name,description,image_url,sort_order,active)
values ('Lambrín','Revestimientos decorativos para muros interiores y exteriores, con acabados tipo madera, relieves y formatos que aportan textura y profundidad.','assets/category-lambrin.jpg',1,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Placas','Paneles decorativos para muros interiores en formatos tipo mármol, madera, piedra, metal, espejo, texturizados y PVC laminado.','assets/category-placas-pvc.jpg',2,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Tapiz','Revestimientos autoadheribles de PVC en rollo, disponibles en acabados brillantes, mate, acanalados y especiales.','assets/category-papel-tapiz.jpg',3,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Accesorios para muros','Complementos para rematar, fijar y terminar instalaciones de lambrín, placas, vigas, wall cladding y follaje.','assets/category-decor.jpg',4,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Pisos','Opciones laminadas, vinílicas y de madera para proyectos residenciales y comerciales con distintos estilos y niveles de resistencia.','assets/proyecto-walnut.jpg',5,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Deck','Soluciones para exterior que incluyen deck sintético residencial y comercial, accesorios de instalación y Wall Cladding para fachadas, bardas y plafones.','assets/proyecto-piedra.jpg',6,true);
insert into public.categories(name,description,image_url,sort_order,active)
values ('Pasto sintético','Soluciones decorativas y deportivas de apariencia natural, fáciles de mantener y aptas para diferentes tipos de uso.','assets/category-decor.jpg',7,true);
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Wall Cladding','Revestimiento arquitectónico exterior tipo madera, ideal para fachadas, bardas, plafones y muros de acento.',1,true
from public.categories where lower(name)=lower('Deck');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Panel PVC laminado','Panel decorativo interior de PVC con acabado tipo madera, ligero, resistente y de instalación limpia.',6,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Lambrín Exterior','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento.',1,true
from public.categories where lower(name)=lower('Lambrín');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Lambrín Media Luna PS','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores.',2,true
from public.categories where lower(name)=lower('Lambrín');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Lambrín Media Luna','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual.',3,true
from public.categories where lower(name)=lower('Lambrín');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Lambrín Interior','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones.',4,true
from public.categories where lower(name)=lower('Lambrín');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Lambrín Desigual','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo.',5,true
from public.categories where lower(name)=lower('Lambrín');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Placas PU réplica','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación.',1,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Placas tipo espejo y metal','Acabados reflejantes o metálicos para acentos decorativos contemporáneos.',2,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Placas tipo mármol','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato.',3,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Placas tipo madera','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos.',4,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Placas texturizadas','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros.',5,true
from public.categories where lower(name)=lower('Placas');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Tapiz Especial','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento.',1,true
from public.categories where lower(name)=lower('Tapiz');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Tapiz Matte','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante.',2,true
from public.categories where lower(name)=lower('Tapiz');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Tapiz Glossy','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos.',3,true
from public.categories where lower(name)=lower('Tapiz');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Tapiz Acanalado','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad.',4,true
from public.categories where lower(name)=lower('Tapiz');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Vigas decorativas','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera.',1,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Complementos para vigas','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas.',2,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Perfiles Wall Cladding','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding.',3,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Otros accesorios de muro','Complementos diversos para instalaciones decorativas en muros y exteriores.',4,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Follaje sintético','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento.',5,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Cercas expandibles','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes.',6,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Ángulos para lambrín interior','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior.',7,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Ángulos para lambrín exterior','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior.',8,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Perfiles para placas','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas.',9,true
from public.categories where lower(name)=lower('Accesorios para muros');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico WPC','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera.',1,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico LVT Urbana','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento.',2,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico SPC','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente.',3,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico LVT Woodstock','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales.',4,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico LVT Woodstock 2','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado.',5,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso vinílico LVT Woodlane','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario.',6,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso laminado','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo.',7,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso laminado Vintage','Pisos laminados con diseños de inspiración clásica y vetas marcadas.',8,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Piso de madera','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia.',9,true
from public.categories where lower(name)=lower('Pisos');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Accesorios para deck','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck.',2,true
from public.categories where lower(name)=lower('Deck');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Deck residencial','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera.',3,true
from public.categories where lower(name)=lower('Deck');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Deck comercial','Deck sintético de mayor desempeño para áreas de tránsito frecuente y proyectos comerciales.',4,true
from public.categories where lower(name)=lower('Deck');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Pasto recreativo','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural.',1,true
from public.categories where lower(name)=lower('Pasto sintético');
insert into public.subcategories(category_id,name,description,sort_order,active)
select id,'Pasto deportivo','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo.',2,true
from public.categories where lower(name)=lower('Pasto sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Wenge 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Wenge 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',1,true,'M-CLAD-6-005W'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Teak 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Teak 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',2,true,'M-CLAD-6-003T'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Tasmania 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Tasmania 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',3,true,'M-CLAD-6-5402T'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Redwood 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Redwood 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',4,true,'M-CLAD-6-002R'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Merbau 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Merbau 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',5,true,'M-CLAD-6-5403M'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Maple 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Maple 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',6,true,'M-CLAD-6-004M'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Hickory 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Hickory 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.00,'assets/proyecto-walnut.jpg',7,true,'M-CLAD-6-5401H'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Vigas PU Interior Castaño 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Vigas PU Interior Castaño 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.00,'assets/category-vigas.jpg',8,true,'M-VIGAPU-02'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Wenge 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Wenge 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.00,'assets/category-vigas.jpg',9,true,'M-VIGAPU-07'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Nogal 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Nogal 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.00,'assets/category-vigas.jpg',10,true,'M-VIGAPU-03'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Ipe 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Ipe 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.00,'assets/category-vigas.jpg',11,true,'M-VIGAPU-04'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Sao Paulo 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Sao Paulo 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.00,'assets/category-vigas.jpg',12,true,'M-VIGA2-019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Sao Paulo 2.90X10X5 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Sao Paulo 2.90X10X5 2. Medida indicada: 2.90X10X5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.00,'assets/category-vigas.jpg',13,true,'M-VIGA1-019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Rio 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Rio 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.00,'assets/category-vigas.jpg',14,true,'M-VIGA2-201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Rio 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Rio 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.00,'assets/category-vigas.jpg',15,true,'M-VIGA1-201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Brasilia 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Brasilia 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.00,'assets/category-vigas.jpg',16,true,'M-VIGA2-106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Brasilia 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Brasilia 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.00,'assets/category-vigas.jpg',17,true,'M-VIGA1-106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Bahia 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Bahia 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.00,'assets/category-vigas.jpg',18,true,'M-VIGA2-003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Bahia 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Bahia 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.00,'assets/category-vigas.jpg',19,true,'M-VIGA1-003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Teak 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Teak 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.00,'assets/category-vigas.jpg',20,true,'TD-VIGA-T3'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Redwood 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Redwood 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.00,'assets/category-vigas.jpg',21,true,'TD-VIGA-T2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Dark Black 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Dark Black 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.00,'assets/category-vigas.jpg',22,true,'TD-VIGA-T8'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Metal Mombasa 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Metal Mombasa 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',23,true,'M-TAPIZ-R012'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Zinzabar 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Zinzabar 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',24,true,'M-TAPIZ-M067'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Marrakech 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Marrakech 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',25,true,'M-TAPIZ-M071'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Kigali 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Kigali 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',26,true,'M-TAPIZ-M038'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Kampala 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Kampala 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',27,true,'M-TAPIZ-M040'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Bahir 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Bahir 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',28,true,'M-TAPIZ-M099'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Asmara 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Asmara 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',29,true,'M-TAPIZ-M009'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Algiers 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Algiers 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/category-papel-tapiz.jpg',30,true,'M-TAPIZ-004'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Luxor 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Luxor 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',31,true,'M-TAPIZ-G459'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Luanda 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Luanda 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',32,true,'M-TAPIZ-G301'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Johannesburg 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Johannesburg 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',33,true,'M-TAPIZ-G503'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Jinja 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Jinja 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',34,true,'M-TAPIZ-G025'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Gabrorne 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Gabrorne 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',35,true,'M-TAPIZ-G887'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Fes 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Fes 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',36,true,'M-TAPIZ-G005'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Dakar 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Dakar 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',37,true,'M-TAPIZ-G188'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Cape Town 2.40X2.40','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Cape Town 2.40X2.40. Medida indicada: 2.40X2.40. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',38,true,'M-TAPIZ-G210'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Cairo 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Cairo 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',39,true,'M-TAPIZ-G152'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Gllossy Agadir 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Gllossy Agadir 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',40,true,'M-TAPIZ-G886'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Espejo Constantine 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Espejo Constantine 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.00,'assets/category-papel-tapiz.jpg',41,true,'M-TAPIZ-R028'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Espejo Alexandria 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Espejo Alexandria 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.00,'assets/category-papel-tapiz.jpg',42,true,'M-TAPIZ-R025'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Agua Accra 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Agua Accra 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/category-papel-tapiz.jpg',43,true,'M-TAPIZ-R003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Urban Asphalt 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Urban Asphalt 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',44,true,'M-TAPIZ-GT005'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Silver Drift 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Silver Drift 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',45,true,'M-TAPIZ-GT011'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Sand Rally 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Sand Rally 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',46,true,'M-TAPIZ-GT003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Midnight Track 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Midnight Track 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',47,true,'M-TAPIZ-GT007'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Golden Circuit 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Golden Circuit 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',48,true,'M-TAPIZ-GT013'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Chrome PUlse 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Chrome PUlse 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.00,'assets/category-papel-tapiz.jpg',49,true,'M-TAPIZ-GT009'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Zira','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Zira. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.00,'assets/category-papel-tapiz.jpg',50,true,'M-TAPIZ-A004'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Siltar','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Siltar. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.00,'assets/category-papel-tapiz.jpg',51,true,'M-TAPIZ-A003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Emira','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Emira. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.00,'assets/category-papel-tapiz.jpg',52,true,'M-TAPIZ-A002'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Ashra','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Ashra. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.00,'assets/category-papel-tapiz.jpg',53,true,'M-TAPIZ-A001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz')
  and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapa Para Viga WPC Exterior Teak','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Tapa Para Viga WPC Exterior Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.00,'assets/category-vigas.jpg',54,true,'TD-TAPA-T3'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapa Para Viga Exterior Redwwod','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Tapa Para Viga Exterior Redwwod. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.00,'assets/category-vigas.jpg',55,true,'TD-TAPA-T2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Interior','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Interior. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,null,56,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Exterior','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Exterior. Consulta disponibilidad, presentación y recomendaciones de instalación.',90.00,'assets/category-vigas.jpg',57,true,'TD-VIGA-SOPORTE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Exterior 10X5','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Exterior 10X5. Medida indicada: 10X5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',65.00,'assets/category-vigas.jpg',58,true,'M-VIGA-SOPORTE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Plastic Clip Para Decks De WPC','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Plastic Clip Para Decks De WPC. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-piedra.jpg',59,true,'CLIPDECK'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tronco PU Cafe Replica','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa Tronco PU Cafe Replica. Consulta disponibilidad, presentación y recomendaciones de instalación.',1068.65,'assets/proyecto-piedra.jpg',60,true,'M-REPLICA-010'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Metal 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Tipo Metal 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.00,'assets/category-placas-pvc.jpg',61,true,'M-ESPEJO-02'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marol Bright Black 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marol Bright Black 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',62,true,'M-MARMOL-002'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Zafiro 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Zafiro 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',63,true,'M-MARMOL-006'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Topacio 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Topacio 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',64,true,'M-MARMOL-106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Perla 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Perla 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',65,true,'Perla M-MARMOL-042'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Opalo 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Opalo 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',66,true,'M-MARMOL-104'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Onix 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Onix 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',67,true,'M-MARMOL-102'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Obsidiana 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Obsidiana 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',68,true,'M-MARMOL-017'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Jasper','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Jasper. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',69,true,'M-MARMOL-108'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Zafiro 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Zafiro 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/category-placas-pvc.jpg',70,true,'M-MARMOLXX-006'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Opalo 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Opalo 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/category-placas-pvc.jpg',71,true,'M-MARMOLXX-104'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Onix 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Onix 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/category-placas-pvc.jpg',72,true,'M-MARMOLXX-102'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Grafito 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Grafito 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',950.00,'assets/category-placas-pvc.jpg',73,true,'M-MARMOLXX-014'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Agata 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Agata 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',950.00,'assets/category-placas-pvc.jpg',74,true,'M-MARMOLXX-059'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grafito 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grafito 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',75,true,'M-MARMOL-014'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Caurzo 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Caurzo 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',76,true,'M-MARMOL-048'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Carrara Oscuro 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Carrara Oscuro 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',77,true,'M-MARMOL-110'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Bright White 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Bright White 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',78,true,'M-MARMOL-001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Aurora Dorada 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Aurora Dorada 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',79,true,'M-MARMOL-100'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Arena','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Arena. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',80,true,'M-MARMOL-020'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Agata 2.44X1.22','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Agata 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/category-placas-pvc.jpg',81,true,'M-MARMOL-059'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,null,82,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madeta Adler 1.22X2.44','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madeta Adler 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/proyecto-walnut.jpg',83,true,'M-MADERA-029'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Solden 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Solden 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/proyecto-walnut.jpg',84,true,'M-MADERA-027'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Solaria 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Solaria 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/proyecto-walnut.jpg',85,true,'M-MADERA-021'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Anton 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Anton 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/proyecto-walnut.jpg',86,true,'M-MADERA-023'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Anton 1.22X2.44','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Anton 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,null,87,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Alpina 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Alpina 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.00,'assets/proyecto-walnut.jpg',88,true,'M-MADERA-025'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Espejo 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Tipo Espejo 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.00,'assets/category-placas-pvc.jpg',89,true,'M-ESPEJO-01'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Wenge','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Wenge. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',90,true,'M-TEXTURA-023'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Jatoba','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',91,true,'M-TEXTURA-019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Ipe','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Ipe. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',92,true,'M-TEXTURA-017'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Encino','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Encino. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',93,true,'M-TEXTURA-015'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Cedar','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Cedar. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,null,94,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Brasilia','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Brasilia. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,null,95,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Ash','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Ash. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',96,true,'M-TEXTURA-011'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo De Madera Nogal','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo De Madera Nogal. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',97,true,'M-TEXTURA-021'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Madera Rio','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Madera Rio. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.00,'assets/proyecto-piedra.jpg',98,true,'M-TEXTURA-201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa PU Rocca Gray 1.20X0.60X3.5','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa PU Rocca Gray 1.20X0.60X3.5. Medida indicada: 1.20X0.60X3.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',430.00,'assets/proyecto-piedra.jpg',99,true,'M-ROCCA-005'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa PU Rocca Black 1.20X0.60X3.5','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa PU Rocca Black 1.20X0.60X3.5. Medida indicada: 1.20X0.60X3.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',430.00,'assets/proyecto-piedra.jpg',100,true,'M-ROCCA-001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Piedra PU Replica Negra','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa Piedra PU Replica Negra. Consulta disponibilidad, presentación y recomendaciones de instalación.',1635.00,'assets/proyecto-piedra.jpg',101,true,'M-REPLICA-015'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Espejo Dorado 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Espejo Dorado 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.00,'assets/category-placas-pvc.jpg',102,true,'M-ESPEJO-03'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Norwell','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Norwell. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',103,true,'LC-LVTW-8710'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Canberra','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Canberra. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',104,true,'LC-LVTW-0512'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Albany Creek','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Albany Creek. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',105,true,'LC-LVTW-0628'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Viena','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Viena. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',106,true,'LC-LVT3-DW3222'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Rowe','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Rowe. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',107,true,'LC-LVT-DW3113'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Roma','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Roma. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',108,true,'LC-LVT3-DW3252'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Praga','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Praga. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,null,109,true,null
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Londres','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Londres. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',110,true,'LC-LVT3-DW3212'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Berlin','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Berlin. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',111,true,'LC-LVT3-DW3260'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Sillverstone','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Sillverstone. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.00,'assets/proyecto-walnut.jpg',112,true,'TS-SPC5-8858'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Parklan','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Parklan. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.00,'assets/proyecto-walnut.jpg',113,true,'TS-SPC5-8103'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Sterling Silvester','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Sterling Silvester. Consulta disponibilidad, presentación y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',114,true,'TS-SPC5F-0412'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Sterling Oak','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Sterling Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',115,true,'TS-SPC4-1969'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Nomadic','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Nomadic. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',116,true,'TS-SPC4-8852'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Mineral Gray','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Mineral Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',117,true,'TS-SPC5F-6818'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Expresso','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Expresso. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',118,true,'TS-SPC4-8012'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Yodemite','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Yodemite. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',119,true,'TS-SPC6.A0813'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Tongass','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Tongass. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',120,true,'TS-SPC6.5A0231'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Jasper','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Jasper. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',121,true,'TS-SPC6.A0224'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Delamere','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Delamere. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',122,true,'TS-SPC6.5-A0217'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Dalby','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Dalby. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',123,true,'TS-SPC6.5-A0173'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Concrete','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Concrete. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',124,true,'TS-SPC6.5C-O1709'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Concrete Lite','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Concrete Lite. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',125,true,'TS-SPC6.5C-V2307'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Colorado Rush','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Colorado Rush. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.00,'assets/proyecto-walnut.jpg',126,true,'TS-SPC5-0210'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Banff','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Banff. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.00,'assets/proyecto-walnut.jpg',127,true,'TS-SPC5-8856'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Ashlar Gray','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Ashlar Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',128,true,'TS-SPC4-9163'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Amazon','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Amazon. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.00,'assets/proyecto-walnut.jpg',129,true,'TS-SPC5-9221'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Vermillion','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Vermillion. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',130,true,'LC-LVT-DW1331'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Storm Lake','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Storm Lake. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',131,true,'LC-LVT-DW1502'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Shelby','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Shelby. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',132,true,'LC-LVT-DW3161'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Norfolk','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Norfolk. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',133,true,'LC-LVT2-DW3154'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Luverne','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Luverne. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',134,true,'LC-LVT-DW8114'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Loess Hills','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Loess Hills. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',135,true,'LC-LVT-DW1902'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Chariton','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Chariton. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',136,true,'LC-LVT-DW1351'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Aurora','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Aurora. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',137,true,'LC-LVT-DW3170'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Auburn','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Auburn. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',138,true,'LC-LVT-DW1401'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Ames','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Ames. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',139,true,'LC-LVT-DW1904'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Albia','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Albia. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',140,true,'LC-LVT-DW1341'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Adel','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Adel. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',141,true,'LC-LVT-DW1906'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Tecton','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Tecton. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',142,true,'LC-LVT-DW3301'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Sonder','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Sonder. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',143,true,'LC-LVT-DW3210'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Pristine','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Pristine. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',144,true,'LC-LVT-DW3401'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Nifty','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Nifty. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',145,true,'LC-LVT-DW3300'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Epoch','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Epoch. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',146,true,'LC-LVT-DW3324'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Elixir','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Elixir. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',147,true,'LC-LVT-DW3340'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Rochester','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Rochester. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',148,true,'LC-LVT2-DW3153'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Davenport','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Davenport. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',149,true,'LC-LVT2-DW1794'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Columbia','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Columbia. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',150,true,'LC-LVT2-DW1170'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Autin','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Autin. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',151,true,'LC-LVT2-DW3111'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Aberdeen','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Aberdeen. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',152,true,'LC-LVT2-DW2702'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Urbana Madrid','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico LVT Urbana Madrid. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',153,true,'LC-LVT3-DW2221'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Viniilico Urbana Ltv Paris','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Viniilico Urbana Ltv Paris. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.00,'assets/proyecto-walnut.jpg',154,true,'LC-LVT3-DW3230'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Venilico SPC Forest Alberta','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Venilico SPC Forest Alberta. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',155,true,'TS-SPC6.5-A0060'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Walnut','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.00,'assets/proyecto-walnut.jpg',156,true,'TS4CL7-7652'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Walnut Sabo 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Walnut Sabo 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',700.00,'assets/proyecto-walnut.jpg',157,true,'TS4DS7-4367-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Titanium Oak 1.38X1.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Titanium Oak 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',158,true,'TS4SH7-7718'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Oak Cabana Lagos 1.38X.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Oak Cabana Lagos 1.38X.93. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',159,true,'TS4SH7-2217-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Hickory Carolina 1.38X1.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Hickory Carolina 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',160,true,'TS4SH7-5756-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Revolution Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Revolution Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',161,true,'TS4HE10-34029'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Plantation Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Plantation Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',162,true,'TS4HE10-34074'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Independence Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Independence Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',163,true,'TS4HE10-34054'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Colonial Oak','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Colonial Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',164,true,'TS4HE10-34073'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Geritage Democracy Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Geritage Democracy Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',165,true,'TS4HE10-34135'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Tahoe','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Tahoe. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',166,true,'TS4AS8-7658'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Oak Fresco','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Oak Fresco. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',167,true,'TS4AS8-4381-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Oak Breeze','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Oak Breeze. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',168,true,'TS4AS8-4382-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Boulder','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Boulder. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',169,true,'TS4AS8-7293'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Utrillas 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Utrillas 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',170,true,'TS4TE8-1903-4'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Ternasco 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Ternasco 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',171,true,'TS4TE8-1903-5'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Spruce Antique','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Spruce Antique. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.00,'assets/proyecto-walnut.jpg',172,true,'TS4CL7-3346'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Vienna','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Vienna. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',173,true,'TS4PS7 4369'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Trend 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Trend 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',174,true,'TS4PS7 4424'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Thunder 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Thunder 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',175,true,'TS4PS7 4009'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Soul','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Soul. Consulta disponibilidad, presentación y recomendaciones de instalación.',700.00,'assets/proyecto-walnut.jpg',176,true,'TS4DS7-3709'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Silea 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Silea 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.00,'assets/proyecto-walnut.jpg',177,true,'TS4CL7-7527-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Natural','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Natural. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',178,true,'TS4PS7 4420'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Evoke Crystal','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Evoke Crystal. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.00,'assets/proyecto-walnut.jpg',179,true,'TS4CL7-4423-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Epic Apulien 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Epic Apulien 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',700.00,'assets/proyecto-walnut.jpg',180,true,'TS4DS7-5845-A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Nogal Americano','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Nogal Americano. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',181,true,'TS4PS7 7671'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Mountain Beech','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Mountain Beech. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',182,true,'TS4PS7-2535'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Mountain Beech Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Mountain Beech Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',183,true,'TS4SP8-2535'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kilimanjaro 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kilimanjaro 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',184,true,'TS4MA8-1019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kiefer Storm 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kiefer Storm 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',185,true,'TS4PS7 4075'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kiefer 1.38X19.3','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kiefer 1.38X19.3. Medida indicada: 1.38X19.3. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',186,true,'TS4PS7 4075'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Ivory White','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Ivory White. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',187,true,'TS4PS7-7582'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Gudar 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Gudar 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',188,true,'TS4TE8-1903-6'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Golden Oak','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Golden Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',189,true,'TS4PS7-4898'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Golden Oak Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Golden Oak Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',190,true,'TS4SP8-4898'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Everest 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Everest 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',191,true,'TS4MA8-1017'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Elbrus 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Elbrus 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',192,true,'TS4MA8-1015'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Denali 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Denali 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',193,true,'TS4MA8-1012'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Calanda 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Calanda 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',194,true,'TS4TE8-1903-3'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Australian Walnut','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Australian Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',195,true,'TS4PS7-7503'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Australian Walnut Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Australian Walnut Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',196,true,'TS4SP8-7503'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Artic Oak Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Artic Oak Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.00,'assets/proyecto-walnut.jpg',197,true,'TS4SP8-4011'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Arcito Oak','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Arcito Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',198,true,'TS4PS7-4011'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Alcañiz 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Alcañiz 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.00,'assets/proyecto-walnut.jpg',199,true,'TS4TE8-1903-2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Aconcagua 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Aconcagua 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.00,'assets/proyecto-walnut.jpg',200,true,'TS4MA8-1010'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Vitare Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Vitare Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',201,true,'TMVI12-GONV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Valhala','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Valhala. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',202,true,'TMUT12-OVAB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Shambala','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Shambala. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',203,true,'TMUT12-OSHB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Panadu','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Panadu. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',204,true,'TMUT12-OPAB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Camelot','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Camelot. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',205,true,'TMUT12-OCAB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Avalon','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Avalon. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.00,'assets/proyecto-walnut.jpg',206,true,'TMUT12-OAVB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera True Toro American Walnut Cepillado','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera True Toro American Walnut Cepillado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',207,true,'TMTT15-AWNB'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Lotf Mate Quartz','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Lotf Mate Quartz. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.00,'assets/proyecto-walnut.jpg',208,true,'TMLM10-QONO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate White Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate White Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.00,'assets/proyecto-walnut.jpg',209,true,'TMLM10-WONO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Teak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1800.00,'assets/proyecto-walnut.jpg',210,true,'TMLO10-TENO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Jatoba','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.00,'assets/proyecto-walnut.jpg',211,true,'TMLM10-JANO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Gravel','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Gravel. Consulta disponibilidad, presentación y recomendaciones de instalación.',1650.00,'assets/proyecto-walnut.jpg',212,true,'TMLM10-GONO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate American Walnut','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate American Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.00,'assets/proyecto-walnut.jpg',213,true,'TMLM10-AWNO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life White Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life White Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.00,'assets/proyecto-walnut.jpg',214,true,'TMLO10-WONV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Teak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1800.00,'assets/proyecto-walnut.jpg',215,true,'TMLO10-TENV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Jatoba','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.00,'assets/proyecto-walnut.jpg',216,true,'TMLO10-JANV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Gray Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Gray Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.00,'assets/proyecto-walnut.jpg',217,true,'TMLO10-GONV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Anthracite Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Anthracite Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.00,'assets/proyecto-walnut.jpg',218,true,'TMLO10-AONV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life American Walnut','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life American Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.00,'assets/proyecto-walnut.jpg',219,true,'TMLO10-AWNV'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos')
  and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Wenge 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Wenge 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',220,true,'TDCE22.5-R-WENGE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Teak 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Teak 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.00,'assets/proyecto-walnut.jpg',221,true,'TDCE2.55-R-TEAK'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Maple 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Maple 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',222,true,'TDCE22.5-R-MAPLE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Ligth Gray 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Ligth Gray 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.00,'assets/proyecto-walnut.jpg',223,true,'TDCE22.5-R-LIGTH GRAY'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Comercial Teak/Ipe 2.2X14.5','Deck sintético de mayor desempeño para áreas de tránsito frecuente y proyectos comerciales. Modelo Piso Deck Comercial Teak/Ipe 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1600.00,'assets/proyecto-walnut.jpg',224,true,'TDCE22.5-TEAK/IPE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Deck comercial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Tasmania 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Tasmania 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',225,true,'M-CLAD-P-5402T'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Wenge 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Wenge 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',226,true,'M-CLAD-P-005W'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Teak 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Teak 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',227,true,'M-CLAD-P-003T'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Redwood 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Redwood 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',228,true,'M-CLAD-P-002R'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Merbau 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Merbau 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',229,true,'M-CLAD-P-5403M'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Maple 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Maple 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',230,true,'M-CLAD-P-004M'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Hichory 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Hichory 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.00,'assets/category-decor.jpg',231,true,'M-CLAD-P-5401H'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Tulum 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Tulum 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',232,true,'TG-35-TULUM'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Summer 30Mx3.98M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Summer 30Mx3.98M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',233,true,'TG-18-SUMMER'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Maui 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Maui 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',234,true,'TG-30-MAUI'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Gulhi 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Gulhi 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',235,true,'TG-45-GULHI'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Cancun 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Cancun 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',236,true,'TG-25-CANCUN'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Bermuda 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Bermuda 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',237,true,'TG-20-BERMUDA'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Bali 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Bali 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',238,true,'TG-40-BALI'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Aruba 30Mx3.98M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Aruba 30Mx3.98M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',239,true,'TG-07-ARUBA'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Anakena 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Anakena 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',240,true,'TG-50-ANAKENA'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Aca 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Aca 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',241,true,'TG-10-ACA'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Sport 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Sport 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',242,true,'TGS-40-SPORT'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Sport-2 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Sport-2 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',243,true,'TGS-40-SPORT-2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Rojo 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Rojo 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',244,true,'TGS-40-ROJO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Blanco 40Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Blanco 40Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',245,true,'TGS-40-BLANCO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Blanco 20.2Mx2M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Blanco 20.2Mx2M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',246,true,'TGS-12-BLANCO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Azul 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Azul 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',247,true,'TGS-40-AZUL'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Azul-2 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Azul-2 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',248,true,'TGS-12-AZUL'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Amarillo 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Amarillo 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',249,true,'TGS-40-AMARILLO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético')
  and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Wild Teak (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Wild Teak (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',250,true,'M-PVC-V77'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Walnut Elipse (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Walnut Elipse (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',251,true,'M-PVC-V79'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Rio- (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Rio- (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',252,true,'M-PVC-V01'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Maple Dusk (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Maple Dusk (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',253,true,'M-PVC-V71'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Ivory Elm (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Ivory Elm (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',254,true,'M-PVC-V70'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Cocoa Ash (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Cocoa Ash (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',255,true,'M-PVC-V75'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Brasilia (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Brasilia (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',256,true,'M-PVC-V06'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Birch Ember (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Birch Ember (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',257,true,'M-PVC-V73'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Ash Nomad (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Ash Nomad (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.00,'assets/category-panel-walnut.jpg',258,true,'M-PVC-V80'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas')
  and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Teak 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Teak 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.00,'assets/category-lambrin.jpg',259,true,'TD-FWPC-T3'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Silver Gray 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Silver Gray 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.00,'assets/category-lambrin.jpg',260,true,'TD-FWPC-T5'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Redwood 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Redwood 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.00,'assets/category-lambrin.jpg',261,true,'TD-FWPC-T2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Dark Black 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Dark Black 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.00,'assets/category-lambrin.jpg',262,true,'TD-FWPC(2.85)-T8'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Charcoal 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Charcoal 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.00,'assets/category-lambrin.jpg',263,true,'TD-FWPC-T7'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Malla Sombra','Complementos diversos para instalaciones decorativas en muros y exteriores. Modelo Malla Sombra. Consulta disponibilidad, presentación y recomendaciones de instalación.',500.00,'assets/category-decor.jpg',264,true,'MALLASOMBRA'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Otros accesorios de muro');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Gildara 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Gildara 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',265,true,'M-LUNA-008'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Elara 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Elara 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',266,true,'M-LUNA-006'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Cressida 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Cressida 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',267,true,'M-LUNA-004'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Aureli 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Aureli 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',268,true,'M-LUNA-002'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Lunha Azeitona 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Lunha Azeitona 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',269,true,'M-LUNA-M001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Sao Paulo 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Sao Paulo 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',270,true,'M-LUNA-M019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Rio 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Rio 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',271,true,'M-LUNA-M201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Brasilia 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Brasilia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',272,true,'M-LUNA-M106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Bahia 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-panel-walnut.jpg',273,true,'M-LUNA-M003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Teak Aracaju 2.90X16','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Teak Aracaju 2.90X16. Medida indicada: 2.90X16. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-lambrin.jpg',274,true,'M-WPC-49B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sonho 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sonho 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.00,'assets/category-lambrin.jpg',275,true,'M-WPC-212'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sao Paulo 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sao Paulo 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.00,'assets/category-lambrin.jpg',276,true,'M-WPC-019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sabeiro 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sabeiro 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.00,'assets/category-lambrin.jpg',277,true,'M-WPC-303'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Rodeiro 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Rodeiro 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.00,'assets/category-lambrin.jpg',278,true,'M-WPC-301'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Rio 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Rio 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-lambrin.jpg',279,true,'M-WPC-201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Ribeira 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Ribeira 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.00,'assets/category-lambrin.jpg',280,true,'M-WPC-305'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Ouro Preto 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Ouro Preto 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-lambrin.jpg',281,true,'M-WPC-090'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Nuvem 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Nuvem 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.00,'assets/category-lambrin.jpg',282,true,'M-WPC-008'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Nogal Olinda','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Nogal Olinda. Consulta disponibilidad, presentación y recomendaciones de instalación.',199.00,'assets/category-lambrin.jpg',283,true,'M-WPC-45B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Manaos 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Manaos 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.00,'assets/category-lambrin.jpg',284,true,'M-WPC-205'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Fortaleza Rayado 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Fortaleza Rayado 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.00,'assets/category-lambrin.jpg',285,true,'M-WPC-020'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Estrelado 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Estrelado 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.00,'assets/category-lambrin.jpg',286,true,'M-WPC-256'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Sao Paulo 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Sao Paulo 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-panel-walnut.jpg',287,true,'M-DESIGUAL-019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Rio 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Rio 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-panel-walnut.jpg',288,true,'M-DESIGUAL-201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Parota 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Parota 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-panel-walnut.jpg',289,true,'M-DESIGUAL-502B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Brasilia 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Brasilia 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-panel-walnut.jpg',290,true,'M-DESIGUAL-106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Bahia 16X2.90','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-panel-walnut.jpg',291,true,'M-DESIGUAL-003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Cerezo Macapa 2.90X16','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Cerezo Macapa 2.90X16. Medida indicada: 2.90X16. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.00,'assets/category-lambrin.jpg',292,true,'M-WPC-38B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Brasilia 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Brasilia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.00,'assets/category-lambrin.jpg',293,true,'M-WPC-106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Bahia 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.00,'assets/category-lambrin.jpg',294,true,'M-WPC-003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Amizade','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Amizade. Consulta disponibilidad, presentación y recomendaciones de instalación.',179.00,'assets/category-lambrin.jpg',295,true,'M-WPC-214'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Amanhecer 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Amanhecer 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.00,'assets/category-lambrin.jpg',296,true,'M-WPC-252'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín')
  and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Trebol 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Trebol 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',297,true,'SG-FGF012'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Siberia 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Siberia 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',298,true,'SG-FGF017'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Milan 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Milan 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',299,true,'SG-FSA013'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Menta 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Menta 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',300,true,'SG-FSA019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Grecia 50X50','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Grecia 50X50. Medida indicada: 50X50. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',301,true,'SG-FGA-156'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Brusela 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Brusela 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',280.00,'assets/category-decor.jpg',302,true,'SG-FGF087'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Amazonas-C 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Amazonas-C 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.00,'assets/category-decor.jpg',303,true,'SG-FGK004C'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Sevilla 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Sevilla 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',304,true,'SG-FSA009'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Jazmin 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Jazmin 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',305,true,'SG-FSA036'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Amazonas-B 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Amazonas-B 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.00,'assets/category-decor.jpg',306,true,'SG-FGK004B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Amazonas-A 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Amazonas-A 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.00,'assets/category-decor.jpg',307,true,'SG-FGK004A'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Persia 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Persia 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',308,true,'SG-FSA017'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Laurel Dorado 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Laurel Dorado 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',309,true,'SG-FSA003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Verde 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Verde 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',310,true,'SG-FSA006-G'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Rojo 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Rojo 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',311,true,'SG-FSA006-R'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Natural 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Natural 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',312,true,'SG-FSA001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Morado 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Morado 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',313,true,'SG-FSA006-P'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Amarillo 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Amarillo 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',314,true,'SG-FSA006-Y'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Amsterdan 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Amsterdan 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.00,'assets/category-decor.jpg',315,true,'SG-FGF044'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cople Para Viga','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Cople Para Viga. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.00,'assets/category-vigas.jpg',316,true,'M-VIGA1-COPLE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cople Para Viga2','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Cople Para Viga2. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.00,'assets/category-vigas.jpg',317,true,'M-VIGA2-COPLE'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Clip Sistema De Fijacion Para Deck','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Clip Sistema De Fijacion Para Deck. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-piedra.jpg',318,true,'CLIPSINOX'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Clip Inicio Para Fila De Tabla En Sistema Deck','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Clip Inicio Para Fila De Tabla En Sistema Deck. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/proyecto-piedra.jpg',319,true,'CLIPINICIO'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck')
  and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Medellin10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Medellin10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.00,'assets/category-decor.jpg',320,true,'SG-CGD010'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Bogota 10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Bogota 10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.00,'assets/category-decor.jpg',321,true,'SG-CGD023'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Barranquilla 10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Barranquilla 10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.00,'assets/category-decor.jpg',322,true,'SG-CGD036'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Wild Teak','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Wild Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',323,true,'M-WPC-A077'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Walnut Elipse','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Walnut Elipse. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',324,true,'M-WPC-A079'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',325,true,'M-WPC-A303'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Teak Aracaju','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Teak Aracaju. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',326,true,'M-WPC-A49B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Sonho','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Sonho. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',327,true,'M-WPC-A212'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Sao Paulo','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Sao Paulo. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',328,true,'M-WPC-A019'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Rodeiro','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Rodeiro. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',329,true,'M-WPC-A301'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Rio','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Rio. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',330,true,'M-WPC-A201'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ribeira','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ribeira. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',331,true,'M-WPC-A305'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Parota','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Parota. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',332,true,'M-WPC-A502B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ouro Preto','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ouro Preto. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',333,true,'M-WPC-A090'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Nuvem','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Nuvem. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',334,true,'M-WPC-A008'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Nogal Olinda','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Nogal Olinda. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',335,true,'M-WPC-A45B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Maple Dusk','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Maple Dusk. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',336,true,'M-WPC-A071'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Manaos','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Manaos. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',337,true,'M-WPC-A205'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ivoy Elm','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ivoy Elm. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',338,true,'M-WPC-A070'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Fortaleza Rayado','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Fortaleza Rayado. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',339,true,'M-WPC-A020'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Estrelado','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Estrelado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',340,true,'M-WPC-A256'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Cocoa Ash','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Cocoa Ash. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',341,true,'M-WPC-A075'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Cerezo Macapa','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Cerezo Macapa. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',342,true,'M-WPC-A38B'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Brasilia','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Brasilia. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',343,true,'M-WPC-A106'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Birch Ember','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Birch Ember. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',344,true,'M-WPC-A073'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Bahia','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Bahia. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',345,true,'M-WPC-A003'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Azeitona','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Azeitona. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',346,true,'M-WPC-A001'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ash Nomad','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ash Nomad. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.00,'assets/category-decor.jpg',347,true,'M-WPC-A080'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Amizade','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Amizade. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',348,true,'M-WPC-A214'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Amanhecer','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Amanhecer. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',349,true,'M-WPC-A252'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Teak','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.00,'assets/category-decor.jpg',350,true,'TD-FANG-T3'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Silver Gray','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Silver Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.00,'assets/category-decor.jpg',351,true,'TD-FANG-T6'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Redwood','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Redwood. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.00,'assets/category-decor.jpg',352,true,'TD-FANG-T2'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Dark Black','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Dark Black. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.00,'assets/category-decor.jpg',353,true,'TD-FANG-T8'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Charcoal','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Charcoal. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.00,'assets/category-decor.jpg',354,true,'TD-FANG-T7'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Perfil Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Perfil Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',81.00,'assets/category-decor.jpg',355,true,'M-PERFIL-TP-1'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Angulo Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Angulo Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.00,'assets/category-decor.jpg',356,true,'M-PRFIL-AP-1'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Angulo Negro','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Angulo Negro. Consulta disponibilidad, presentación y recomendaciones de instalación.',89.00,'assets/category-decor.jpg',357,true,'M-PERFIL-AN-1'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placa Perfil Negro','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placa Perfil Negro. Consulta disponibilidad, presentación y recomendaciones de instalación.',81.00,'assets/category-decor.jpg',358,true,'M-PERFIL-TN-1'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placa Angulo Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placa Angulo Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',89.00,'assets/category-decor.jpg',359,true,'M-PERFIL-AP-1'
from public.categories c
join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros')
  and lower(s.name)=lower('Perfiles para placas');
commit;
