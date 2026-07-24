-- DECOR DESIGN — CORRECCIÓN COMPLETA DE CATÁLOGO, RELACIONES E IMÁGENES
-- Ejecutar una sola vez en Supabase > SQL Editor. Conserva Persianas y Proyectos.
begin;
alter table public.products add column if not exists sku text;
delete from public.products where category_id in (select id from public.categories where lower(name) in ('lambrín','placas','tapiz','accesorios para muros','pisos','deck','pasto sintético','placas pvc','papel tapiz','panel walnut','vigas','follaje y decor'));
delete from public.subcategories where category_id in (select id from public.categories where lower(name) in ('lambrín','placas','tapiz','accesorios para muros','pisos','deck','pasto sintético','placas pvc','papel tapiz','panel walnut','vigas','follaje y decor'));
delete from public.categories where lower(name) in ('placas pvc','papel tapiz','panel walnut','vigas','follaje y decor');
insert into public.categories(name,description,image_url,sort_order,active) values ('Lambrín','Revestimientos decorativos para interiores y exteriores con acabados tipo madera, relieves y diseños que aportan textura, calidez y profundidad.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-teak.html&embed=image.url',1,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Placas','Paneles decorativos de gran formato con acabados tipo mármol, madera, metal, espejo, piedra y texturas para transformar muros.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tronco-pu-cafe-replica.html&embed=image.url',2,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Tapiz','Revestimientos autoadheribles en rollo, disponibles en acabados glossy, matte, acanalados y especiales para renovar espacios.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-metal-mombasa.html&embed=image.url',3,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Accesorios para muros','Complementos para instalar, rematar y terminar proyectos de lambrín, placas, vigas, follaje y revestimientos decorativos.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fvigas-pu-interior-castano.html&embed=image.url',4,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Pisos','Pisos laminados, vinílicos y de madera para proyectos residenciales y comerciales, con diferentes estilos y niveles de resistencia.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-wpc-norwell.html&embed=image.url',5,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Deck','Soluciones para exteriores que incluyen deck sintético, Wall Cladding y accesorios de instalación resistentes al clima.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-wenge.html&embed=image.url',6,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.categories(name,description,image_url,sort_order,active) values ('Pasto sintético','Pastos sintéticos recreativos y deportivos de apariencia natural, fáciles de mantener y adecuados para distintos espacios.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-tulum-25mx3.html&embed=image.url',7,true) on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Lambrín Exterior','Revestimientos WPC resistentes a humedad, sol e intemperie para fachadas, bardas y muros exteriores.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-teak.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Lambrín') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Lambrín Media Luna PS','Paneles ligeros de poliestireno con perfil curvo tipo media luna y apariencia de madera para interiores.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-ps-media-luna-gold-gildara.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Lambrín') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Lambrín Media Luna','Paneles decorativos con relieve curvo que estilizan muros y techos y aportan profundidad visual.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-lunha-azeitona.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Lambrín') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Lambrín Interior','Lambrines WPC para interiores con apariencia tipo madera, instalación práctica y bajo mantenimiento.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-teak-aracaju.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Lambrín') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Lambrín Desigual','Revestimientos con listones de diferentes proporciones que crean un efecto arquitectónico moderno.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-sao-paulo.html&embed=image.url',5,true from public.categories c where lower(c.name)=lower('Lambrín') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Placas PU réplica','Paneles ligeros de poliuretano que reproducen piedra, ladrillo o tronco con instalación rápida.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tronco-pu-cafe-replica.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Placas tipo espejo y metal','Placas decorativas con efectos reflejantes y metálicos para muros modernos y llamativos.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-metal.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Placas tipo mármol','Placas de gran formato con vetas inspiradas en mármol para muros elegantes y continuos.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-bright-black.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Placas tipo madera','Paneles decorativos con vetas y tonos de madera para aportar calidez sin usar madera natural.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madeta-adler.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Placas texturizadas','Placas con relieve y acabados tridimensionales para crear muros de acento.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-wenge.html&embed=image.url',5,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Panel PVC laminado','Paneles PVC laminados tipo madera, ligeros y prácticos para revestir muros interiores.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-wild-teak.html&embed=image.url',6,true from public.categories c where lower(c.name)=lower('Placas') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Tapiz Especial','Conoce los modelos disponibles de tapiz especial, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-metal-mombasa.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Tapiz') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Tapiz Matte','Conoce los modelos disponibles de tapiz matte, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-zinzabar.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Tapiz') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Tapiz Glossy','Conoce los modelos disponibles de tapiz glossy, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-luxor.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Tapiz') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Tapiz Acanalado','Conoce los modelos disponibles de tapiz acanalado, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-acanalado-zira.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Tapiz') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Vigas decorativas','Conoce los modelos disponibles de vigas decorativas, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fvigas-pu-interior-castano.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Complementos para vigas','Conoce los modelos disponibles de complementos para vigas, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapa-para-viga-wpc-exterior-teak.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Perfiles Wall Cladding','Conoce los modelos disponibles de perfiles wall cladding, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-tasmania.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Otros accesorios de muro','Conoce los modelos disponibles de otros accesorios de muro, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmalla-sombra.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Follaje sintético','Conoce los modelos disponibles de follaje sintético, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-trebol.html&embed=image.url',5,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Cercas expandibles','Conoce los modelos disponibles de cercas expandibles, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcerca-expandible-medellin10-7cmx37cm.html&embed=image.url',6,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Ángulos para lambrín interior','Conoce los modelos disponibles de ángulos para lambrín interior, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-wild-teak.html&embed=image.url',7,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Ángulos para lambrín exterior','Conoce los modelos disponibles de ángulos para lambrín exterior, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-teak.html&embed=image.url',8,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Perfiles para placas','Conoce los modelos disponibles de perfiles para placas, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placas-perfil-plateado.html&embed=image.url',9,true from public.categories c where lower(c.name)=lower('Accesorios para muros') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico WPC','Conoce los modelos disponibles de piso vinílico wpc, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-wpc-norwell.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico LVT Urbana','Conoce los modelos disponibles de piso vinílico lvt urbana, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-viena.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico SPC','Conoce los modelos disponibles de piso vinílico spc, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-sillverstone.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico LVT Woodstock','Conoce los modelos disponibles de piso vinílico lvt woodstock, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-vermillion.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico LVT Woodstock 2','Conoce los modelos disponibles de piso vinílico lvt woodstock 2, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-tecton.html&embed=image.url',5,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso vinílico LVT Woodlane','Conoce los modelos disponibles de piso vinílico lvt woodlane, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-rochester.html&embed=image.url',6,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso laminado','Conoce los modelos disponibles de piso laminado, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-walnut.html&embed=image.url',7,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso laminado Vintage','Conoce los modelos disponibles de piso laminado vintage, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-shades-titanium-oak.html&embed=image.url',8,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Piso de madera','Conoce los modelos disponibles de piso de madera, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-vitare-oak.html&embed=image.url',9,true from public.categories c where lower(c.name)=lower('Pisos') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Wall Cladding','Revestimiento arquitectónico para fachadas y techos exteriores con apariencia de madera y alta durabilidad.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-wenge.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Deck') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Accesorios para deck','Conoce los modelos disponibles de accesorios para deck, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplastic-clip-para-decks-de-wpc.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Deck') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Deck residencial','Conoce los modelos disponibles de deck residencial, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-residencial-wenge.html&embed=image.url',3,true from public.categories c where lower(c.name)=lower('Deck') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Deck comercial','Conoce los modelos disponibles de deck comercial, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-comercial-teak-ipe.html&embed=image.url',4,true from public.categories c where lower(c.name)=lower('Deck') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Pasto recreativo','Conoce los modelos disponibles de pasto recreativo, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-tulum-25mx3.html&embed=image.url',1,true from public.categories c where lower(c.name)=lower('Pasto sintético') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.subcategories(category_id,name,description,image_url,sort_order,active) select c.id,'Pasto deportivo','Conoce los modelos disponibles de pasto deportivo, sus acabados, medidas y aplicaciones recomendadas.','https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-sport-25mx3.html&embed=image.url',2,true from public.categories c where lower(c.name)=lower('Pasto sintético') on conflict (category_id,(lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Wenge 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Wenge 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-wenge.html&embed=image.url',1,true,'M-CLAD-6-005W'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Teak 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Teak 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-teak.html&embed=image.url',2,true,'M-CLAD-6-003T'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Tasmania 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Tasmania 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-tasmania.html&embed=image.url',3,true,'M-CLAD-6-5402T'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Redwood 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Redwood 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-redwood.html&embed=image.url',4,true,'M-CLAD-6-002R'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Merbau 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Merbau 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-merbau.html&embed=image.url',5,true,'M-CLAD-6-5403M'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Maple 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Maple 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-maple.html&embed=image.url',6,true,'M-CLAD-6-004M'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Wall Cladding Hickory 2.90X11.9X1.4 (Caja 12 Piezas)','Revestimiento exterior tipo madera en piezas ligeras y resistentes, ideal para fachadas, bardas y muros de acento. Modelo Wall Cladding Hickory 2.90X11.9X1.4 (Caja 12 Piezas). Medida indicada: 2.90X11.9X1.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',2500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fwall-cladding-hickory.html&embed=image.url',7,true,'M-CLAD-6-5401H'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Vigas PU Interior Castaño 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Vigas PU Interior Castaño 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fvigas-pu-interior-castano.html&embed=image.url',1,true,'M-VIGAPU-02'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Wenge 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Wenge 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-pu-interior-wenge.html&embed=image.url',2,true,'M-VIGAPU-07'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Nogal 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Nogal 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-pu-interior-nogal.html&embed=image.url',3,true,'M-VIGAPU-03'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga PU Interior Ipe 2.90X15.2X7.5','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga PU Interior Ipe 2.90X15.2X7.5. Medida indicada: 2.90X15.2X7.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',465.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-pu-interior-ipe.html&embed=image.url',4,true,'M-VIGAPU-04'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Sao Paulo 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Sao Paulo 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-sao-paulo.html&embed=image.url',5,true,'M-VIGA2-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Sao Paulo 2.90X10X5 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Sao Paulo 2.90X10X5 2. Medida indicada: 2.90X10X5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-sao-paulo.html&embed=image.url',6,true,'M-VIGA1-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Rio 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Rio 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-rio.html&embed=image.url',7,true,'M-VIGA2-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Rio 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Rio 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-rio.html&embed=image.url',8,true,'M-VIGA1-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Brasilia 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Brasilia 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-brasilia.html&embed=image.url',9,true,'M-VIGA2-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Brasilia 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Brasilia 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-brasilia.html&embed=image.url',10,true,'M-VIGA1-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Bahia 2.90X5X5Cm','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Bahia 2.90X5X5Cm. Medida indicada: 2.90X5X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',85.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-bahia.html&embed=image.url',11,true,'M-VIGA2-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Interior Bahia 2.90X10X5Cm 2','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Interior Bahia 2.90X10X5Cm 2. Medida indicada: 2.90X10X5CM. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-interior-bahia.html&embed=image.url',12,true,'M-VIGA1-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Teak 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Teak 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-exterior-teak.html&embed=image.url',13,true,'TD-VIGA-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Redwood 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Redwood 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-exterior-redwood.html&embed=image.url',14,true,'TD-VIGA-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Viga Exterior Dark Black 2.85X12X7','Vigas ligeras para interiores y exteriores que aportan volumen y apariencia tipo madera. Modelo Viga Exterior Dark Black 2.85X12X7. Medida indicada: 2.85X12X7. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',399.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fviga-exterior-dark-black.html&embed=image.url',15,true,'TD-VIGA-T8'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Vigas decorativas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Metal Mombasa 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Metal Mombasa 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-metal-mombasa.html&embed=image.url',1,true,'M-TAPIZ-R012'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Zinzabar 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Zinzabar 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-zinzabar.html&embed=image.url',1,true,'M-TAPIZ-M067'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Marrakech 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Marrakech 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-marrakech.html&embed=image.url',2,true,'M-TAPIZ-M071'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Kigali 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Kigali 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-kigali.html&embed=image.url',3,true,'M-TAPIZ-M038'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Kampala 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Kampala 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-kampala.html&embed=image.url',4,true,'M-TAPIZ-M040'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Bahir 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Bahir 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-bahir.html&embed=image.url',5,true,'M-TAPIZ-M099'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Asmara 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Asmara 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-asmara.html&embed=image.url',6,true,'M-TAPIZ-M009'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Matte Algiers 2.40X1.20','Tapiz autoadherible de acabado mate para una apariencia sobria y elegante. Modelo Tapiz PVC Autoadherible En Rollo Matte Algiers 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-matte-algiers.html&embed=image.url',7,true,'M-TAPIZ-004'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Matte');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Luxor 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Luxor 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-luxor.html&embed=image.url',1,true,'M-TAPIZ-G459'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Luanda 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Luanda 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-luanda.html&embed=image.url',2,true,'M-TAPIZ-G301'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Johannesburg 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Johannesburg 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-johannesburg.html&embed=image.url',3,true,'M-TAPIZ-G503'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Jinja 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Jinja 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-jinja.html&embed=image.url',4,true,'M-TAPIZ-G025'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Gabrorne 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Gabrorne 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-gabrorne.html&embed=image.url',5,true,'M-TAPIZ-G887'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Fes 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Fes 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-fes.html&embed=image.url',6,true,'M-TAPIZ-G005'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Dakar 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Dakar 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-dakar.html&embed=image.url',7,true,'M-TAPIZ-G188'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Cape Town 2.40X2.40','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Cape Town 2.40X2.40. Medida indicada: 2.40X2.40. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-cape-town.html&embed=image.url',8,true,'M-TAPIZ-G210'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Glossy Cairo 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Glossy Cairo 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-cairo.html&embed=image.url',9,true,'M-TAPIZ-G152'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Gllossy Agadir 2.40X1.20','Tapiz autoadherible con acabado brillante que realza colores, vetas y reflejos. Modelo Tapiz PVC Autoadherible En Rollo Gllossy Agadir 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-glossy-agadir.html&embed=image.url',10,true,'M-TAPIZ-G886'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Glossy');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Espejo Constantine 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Espejo Constantine 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-espejo-constantine.html&embed=image.url',2,true,'M-TAPIZ-R028'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Espejo Alexandria 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Espejo Alexandria 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-espejo-alexandria.html&embed=image.url',3,true,'M-TAPIZ-R025'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz PVC Autoadherible En Rollo Agua Accra 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz PVC Autoadherible En Rollo Agua Accra 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-pvc-autoadherible-en-rollo-agua-accra.html&embed=image.url',4,true,'M-TAPIZ-R003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Urban Asphalt 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Urban Asphalt 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-urban-asphalt.html&embed=image.url',5,true,'M-TAPIZ-GT005'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Silver Drift 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Silver Drift 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-silver-drift.html&embed=image.url',6,true,'M-TAPIZ-GT011'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Sand Rally 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Sand Rally 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-sand-rally.html&embed=image.url',7,true,'M-TAPIZ-GT003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Midnight Track 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Midnight Track 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-midnight-track.html&embed=image.url',8,true,'M-TAPIZ-GT007'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Golden Circuit 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Golden Circuit 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-golden-circuit.html&embed=image.url',9,true,'M-TAPIZ-GT013'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Autoadherible En Rollo GT Chrome PUlse 2.40X1.20','Diseños con efectos espejo, metálicos, acuosos o gráficos para muros de acento. Modelo Tapiz Autoadherible En Rollo GT Chrome PUlse 2.40X1.20. Medida indicada: 2.40X1.20. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-autoadherible-en-rollo-gt-chrome-pulse.html&embed=image.url',10,true,'M-TAPIZ-GT009'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Especial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Zira','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Zira. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-acanalado-zira.html&embed=image.url',1,true,'M-TAPIZ-A004'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Siltar','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Siltar. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-acanalado-siltar.html&embed=image.url',2,true,'M-TAPIZ-A003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Emira','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Emira. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-acanalado-emira.html&embed=image.url',3,true,'M-TAPIZ-A002'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapiz Acanalado Ashra','Revestimiento autoadherible con líneas en relieve que aportan textura y profundidad. Modelo Tapiz Acanalado Ashra. Consulta disponibilidad, presentación y recomendaciones de instalación.',279.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapiz-acanalado-ashra.html&embed=image.url',4,true,'M-TAPIZ-A001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Tapiz') and lower(s.name)=lower('Tapiz Acanalado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapa Para Viga WPC Exterior Teak','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Tapa Para Viga WPC Exterior Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapa-para-viga-wpc-exterior-teak.html&embed=image.url',1,true,'TD-TAPA-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Tapa Para Viga Exterior Redwwod','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Tapa Para Viga Exterior Redwwod. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ftapa-para-viga-exterior-redwood.html&embed=image.url',2,true,'TD-TAPA-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Interior','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Interior. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fsoporte-giratorio-para-viga-interior.html&embed=image.url',3,true,'AUTO-SOPORTE-GIRATORIO-PARA-VIGA-INTERIOR'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Exterior','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Exterior. Consulta disponibilidad, presentación y recomendaciones de instalación.',90.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fsoporte-giratorio-para-viga-exterior.html&embed=image.url',4,true,'TD-VIGA-SOPORTE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Soporte Giratorio Para Viga Exterior 10X5','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Soporte Giratorio Para Viga Exterior 10X5. Medida indicada: 10X5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',65.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fsoporte-giratorio-para-viga-exterior.html&embed=image.url',5,true,'M-VIGA-SOPORTE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Plastic Clip Para Decks De WPC','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Plastic Clip Para Decks De WPC. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplastic-clip-para-decks-de-wpc.html&embed=image.url',1,true,'CLIPDECK'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tronco PU Cafe Replica','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa Tronco PU Cafe Replica. Consulta disponibilidad, presentación y recomendaciones de instalación.',1068.65,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tronco-pu-cafe-replica.html&embed=image.url',1,true,'M-REPLICA-010'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Metal 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Tipo Metal 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-metal.html&embed=image.url',1,true,'M-ESPEJO-02'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marol Bright Black 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marol Bright Black 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-bright-black.html&embed=image.url',1,true,'M-MARMOL-002'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Zafiro 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Zafiro 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-zafiro.html&embed=image.url',2,true,'M-MARMOL-006'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Topacio 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Topacio 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-topacio.html&embed=image.url',3,true,'M-MARMOL-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Perla 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Perla 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-perla.html&embed=image.url',4,true,'Perla M-MARMOL-042'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Opalo 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Opalo 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-opalo.html&embed=image.url',5,true,'M-MARMOL-104'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Onix 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Onix 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-onix.html&embed=image.url',6,true,'M-MARMOL-102'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Obsidiana 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Obsidiana 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-obsidiana.html&embed=image.url',7,true,'M-MARMOL-017'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Jasper','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Jasper. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-jasper.html&embed=image.url',8,true,'M-MARMOL-108'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Zafiro 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Zafiro 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grande-zafiro.html&embed=image.url',9,true,'M-MARMOLXX-006'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Opalo 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Opalo 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grande-opalo.html&embed=image.url',10,true,'M-MARMOLXX-104'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Onix 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Onix 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grande-onix.html&embed=image.url',11,true,'M-MARMOLXX-102'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Grafito 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Grafito 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grande-grafito.html&embed=image.url',12,true,'M-MARMOLXX-014'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grande Agata 1.22X2.80','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grande Agata 1.22X2.80. Medida indicada: 1.22X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grande-agata.html&embed=image.url',13,true,'M-MARMOLXX-059'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Grafito 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Grafito 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-grafito.html&embed=image.url',14,true,'M-MARMOL-014'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Caurzo 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Caurzo 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-caurzo.html&embed=image.url',15,true,'M-MARMOL-048'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Carrara Oscuro 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Carrara Oscuro 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-carrara-oscuro.html&embed=image.url',16,true,'M-MARMOL-110'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Bright White 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Bright White 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-bright-white.html&embed=image.url',17,true,'M-MARMOL-001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Aurora Dorada 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Aurora Dorada 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-aurora-dorada.html&embed=image.url',18,true,'M-MARMOL-100'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Arena','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Arena. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-arena.html&embed=image.url',19,true,'M-MARMOL-020'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol Agata 2.44X1.22','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol Agata 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol-agata.html&embed=image.url',20,true,'M-MARMOL-059'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Marmol 1.22X2.44','Placas decorativas con vetas y apariencia de piedra natural para muros elegantes y de gran formato. Modelo Placa Tipo Marmol 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-marmol.html&embed=image.url',21,true,'AUTO-PLACA-TIPO-MARMOL'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo mármol');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madeta Adler 1.22X2.44','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madeta Adler 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madeta-adler.html&embed=image.url',1,true,'M-MADERA-029'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Solden 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Solden 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madera-solden.html&embed=image.url',2,true,'M-MADERA-027'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Solaria 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Solaria 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madera-solaria.html&embed=image.url',3,true,'M-MADERA-021'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Anton 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Anton 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madera-anton.html&embed=image.url',4,true,'M-MADERA-023'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Anton 1.22X2.44','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Anton 1.22X2.44. Medida indicada: 1.22X2.44. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madera-anton.html&embed=image.url',5,true,'AUTO-PLACA-TIPO-MADERA-ANTON'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Madera Alpina 2.44X1.22','Paneles con acabados inspirados en madera para crear ambientes cálidos y modernos. Modelo Placa Tipo Madera Alpina 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-madera-alpina.html&embed=image.url',6,true,'M-MADERA-025'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Tipo Espejo 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Tipo Espejo 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-tipo-espejo.html&embed=image.url',2,true,'M-ESPEJO-01'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Wenge','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Wenge. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-wenge.html&embed=image.url',1,true,'M-TEXTURA-023'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Jatoba','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-jatoba.html&embed=image.url',2,true,'M-TEXTURA-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Ipe','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Ipe. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-ipe.html&embed=image.url',3,true,'M-TEXTURA-017'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Encino','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Encino. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-encino.html&embed=image.url',4,true,'M-TEXTURA-015'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Cedar','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Cedar. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-cedar.html&embed=image.url',5,true,'AUTO-PLACA-TEXTURIZADA-TIPO-MADERA-CEDAR'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Brasilia','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Brasilia. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-brasilia.html&embed=image.url',6,true,'AUTO-PLACA-TEXTURIZADA-TIPO-MADERA-BRASILIA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo Madera Ash','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo Madera Ash. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-madera-ash.html&embed=image.url',7,true,'M-TEXTURA-011'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Tipo De Madera Nogal','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Tipo De Madera Nogal. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-tipo-de-madera-nogal.html&embed=image.url',8,true,'M-TEXTURA-021'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Texturizada Madera Rio','Placas con relieve visible que aportan profundidad y un acabado táctil a los muros. Modelo Placa Texturizada Madera Rio. Consulta disponibilidad, presentación y recomendaciones de instalación.',850.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-texturizada-madera-rio.html&embed=image.url',9,true,'M-TEXTURA-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas texturizadas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa PU Rocca Gray 1.20X0.60X3.5','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa PU Rocca Gray 1.20X0.60X3.5. Medida indicada: 1.20X0.60X3.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',430.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-pu-rocca-gray.html&embed=image.url',2,true,'M-ROCCA-005'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa PU Rocca Black 1.20X0.60X3.5','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa PU Rocca Black 1.20X0.60X3.5. Medida indicada: 1.20X0.60X3.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',430.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-pu-rocca-black.html&embed=image.url',3,true,'M-ROCCA-001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Piedra PU Replica Negra','Paneles ligeros de poliuretano que reproducen texturas de piedra, roca o tronco con fácil instalación. Modelo Placa Piedra PU Replica Negra. Consulta disponibilidad, presentación y recomendaciones de instalación.',1635.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-piedra-pu-replica-negra.html&embed=image.url',4,true,'M-REPLICA-015'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas PU réplica');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Placa Espejo Dorado 2.44X1.22','Acabados reflejantes o metálicos para acentos decorativos contemporáneos. Modelo Placa Espejo Dorado 2.44X1.22. Medida indicada: 2.44X1.22. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fplaca-espejo-dorado.html&embed=image.url',3,true,'M-ESPEJO-03'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Placas tipo espejo y metal');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Norwell','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Norwell. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-wpc-norwell.html&embed=image.url',1,true,'LC-LVTW-8710'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Canberra','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Canberra. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-wpc-canberra.html&embed=image.url',2,true,'LC-LVTW-0512'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico WPC Albany Creek','Piso vinílico con núcleo WPC que combina confort, estabilidad y apariencia tipo madera. Modelo Piso Vinilico WPC Albany Creek. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-wpc-albany-creek.html&embed=image.url',3,true,'LC-LVTW-0628'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico WPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Viena','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Viena. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-viena.html&embed=image.url',1,true,'LC-LVT3-DW3222'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Rowe','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Rowe. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-rowe.html&embed=image.url',2,true,'LC-LVT-DW3113'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Roma','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Roma. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-roma.html&embed=image.url',3,true,'LC-LVT3-DW3252'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Praga','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Praga. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-praga.html&embed=image.url',4,true,'AUTO-PISO-VINILICO-URBANA-LVT-PRAGA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Londres','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Londres. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-londres.html&embed=image.url',5,true,'LC-LVT3-DW3212'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico Urbana LVT Berlin','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico Urbana LVT Berlin. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-urbana-lvt-berlin.html&embed=image.url',6,true,'LC-LVT3-DW3260'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Sillverstone','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Sillverstone. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-sillverstone.html&embed=image.url',1,true,'TS-SPC5-8858'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Parklan','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Parklan. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-parklan.html&embed=image.url',2,true,'TS-SPC5-8103'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Sterling Silvester','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Sterling Silvester. Consulta disponibilidad, presentación y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-futura-deluxe-sterling-silvester.html&embed=image.url',3,true,'TS-SPC5F-0412'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Sterling Oak','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Sterling Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-futura-deluxe-sterling-oak.html&embed=image.url',4,true,'TS-SPC4-1969'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Nomadic','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Nomadic. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-futura-deluxe-nomadic.html&embed=image.url',5,true,'TS-SPC4-8852'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Mineral Gray','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Mineral Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-futura-deluxe-mineral-gray.html&embed=image.url',6,true,'TS-SPC5F-6818'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Futura Deluxe Expresso','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Futura Deluxe Expresso. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-futura-deluxe-expresso.html&embed=image.url',7,true,'TS-SPC4-8012'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Yodemite','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Yodemite. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-forest-yodemite.html&embed=image.url',8,true,'TS-SPC6.A0813'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Tongass','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Tongass. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-forest-tongass.html&embed=image.url',9,true,'TS-SPC6.5A0231'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Jasper','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Jasper. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-forest-jasper.html&embed=image.url',10,true,'TS-SPC6.A0224'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Delamere','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Delamere. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-forest-delamere.html&embed=image.url',11,true,'TS-SPC6.5-A0217'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Forest Dalby','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Forest Dalby. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-forest-dalby.html&embed=image.url',12,true,'TS-SPC6.5-A0173'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Concrete','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Concrete. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-concrete.html&embed=image.url',13,true,'TS-SPC6.5C-O1709'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Concrete Lite','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Concrete Lite. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-concrete-lite.html&embed=image.url',14,true,'TS-SPC6.5C-V2307'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Colorado Rush','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Colorado Rush. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-colorado-rush.html&embed=image.url',15,true,'TS-SPC5-0210'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Banff','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Banff. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-banff.html&embed=image.url',16,true,'TS-SPC5-8856'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Ashlar Gray','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Ashlar Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-ashlar-gray.html&embed=image.url',17,true,'TS-SPC4-9163'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico SPC Amazon','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Vinilico SPC Amazon. Consulta disponibilidad, presentación y recomendaciones de instalación.',950.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-spc-amazon.html&embed=image.url',18,true,'TS-SPC5-9221'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Vermillion','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Vermillion. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-vermillion.html&embed=image.url',1,true,'LC-LVT-DW1331'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Storm Lake','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Storm Lake. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-storm-lake.html&embed=image.url',2,true,'LC-LVT-DW1502'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Shelby','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Shelby. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-shelby.html&embed=image.url',3,true,'LC-LVT-DW3161'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Norfolk','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Norfolk. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-norfolk.html&embed=image.url',4,true,'LC-LVT2-DW3154'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Luverne','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Luverne. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-luverne.html&embed=image.url',5,true,'LC-LVT-DW8114'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Loess Hills','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Loess Hills. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-loess-hills.html&embed=image.url',6,true,'LC-LVT-DW1902'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Chariton','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Chariton. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-chariton.html&embed=image.url',7,true,'LC-LVT-DW1351'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Aurora','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Aurora. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-aurora.html&embed=image.url',8,true,'LC-LVT-DW3170'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Auburn','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Auburn. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-auburn.html&embed=image.url',9,true,'LC-LVT-DW1401'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Ames','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Ames. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-ames.html&embed=image.url',10,true,'LC-LVT-DW1904'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Albia','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Albia. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-albia.html&embed=image.url',11,true,'LC-LVT-DW1341'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock Adel','Piso LVT de apariencia tipo madera, práctico para espacios residenciales o comerciales. Modelo Piso Vinilico LVT Woodstock Adel. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock-adel.html&embed=image.url',12,true,'LC-LVT-DW1906'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Tecton','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Tecton. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-tecton.html&embed=image.url',1,true,'LC-LVT-DW3301'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Sonder','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Sonder. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-sonder.html&embed=image.url',2,true,'LC-LVT-DW3210'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Pristine','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Pristine. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-pristine.html&embed=image.url',3,true,'LC-LVT-DW3401'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Nifty','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Nifty. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-nifty.html&embed=image.url',4,true,'LC-LVT-DW3300'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Epoch','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Epoch. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-epoch.html&embed=image.url',5,true,'LC-LVT-DW3324'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodstock2 Elixir','Segunda colección Woodstock con tonos modernos y formato vinílico de fácil cuidado. Modelo Piso Vinilico LVT Woodstock2 Elixir. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodstock2-elixir.html&embed=image.url',6,true,'LC-LVT-DW3340'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodstock 2');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Rochester','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Rochester. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-rochester.html&embed=image.url',1,true,'LC-LVT2-DW3153'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Davenport','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Davenport. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-davenport.html&embed=image.url',2,true,'LC-LVT2-DW1794'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Columbia','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Columbia. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-columbia.html&embed=image.url',3,true,'LC-LVT2-DW1170'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Autin','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Autin. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-autin.html&embed=image.url',4,true,'LC-LVT2-DW3111'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Woodlane Aberdeen','Colección vinílica con diseños inspirados en madera y una superficie práctica para uso diario. Modelo Piso Vinilico LVT Woodlane Aberdeen. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-woodlane-aberdeen.html&embed=image.url',5,true,'LC-LVT2-DW2702'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Woodlane');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Vinilico LVT Urbana Madrid','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Vinilico LVT Urbana Madrid. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-vinilico-lvt-urbana-madrid.html&embed=image.url',7,true,'LC-LVT3-DW2221'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Viniilico Urbana Ltv Paris','Losetas vinílicas de la colección Urbana con diseños contemporáneos y fácil mantenimiento. Modelo Piso Viniilico Urbana Ltv Paris. Consulta disponibilidad, presentación y recomendaciones de instalación.',1200.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-viniilico-urbana-ltv-paris.html&embed=image.url',8,true,'LC-LVT3-DW3230'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico LVT Urbana');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Venilico SPC Forest Alberta','Piso de núcleo rígido SPC, estable y resistente, ideal para áreas de uso frecuente. Modelo Piso Venilico SPC Forest Alberta. Consulta disponibilidad, presentación y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-venilico-spc-forest-alberta.html&embed=image.url',19,true,'TS-SPC6.5-A0060'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso vinílico SPC');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Walnut','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-walnut.html&embed=image.url',1,true,'TS4CL7-7652'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Walnut Sabo 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Walnut Sabo 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-walnut-sabo.html&embed=image.url',2,true,'TS4DS7-4367-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Titanium Oak 1.38X1.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Titanium Oak 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-shades-titanium-oak.html&embed=image.url',1,true,'TS4SH7-7718'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Oak Cabana Lagos 1.38X.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Oak Cabana Lagos 1.38X.93. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-shades-oak-cabana-lagos-1-38x-93.html&embed=image.url',2,true,'TS4SH7-2217-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Shades Hickory Carolina 1.38X1.93','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Shades Hickory Carolina 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-shades-hickory-carolina.html&embed=image.url',3,true,'TS4SH7-5756-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Revolution Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Revolution Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-heritage-revolution-oak.html&embed=image.url',4,true,'TS4HE10-34029'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Plantation Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Plantation Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-heritage-plantation-oak.html&embed=image.url',5,true,'TS4HE10-34074'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Independence Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Independence Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-heritage-independence-oak.html&embed=image.url',6,true,'TS4HE10-34054'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Heritage Colonial Oak','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Heritage Colonial Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-heritage-colonial-oak.html&embed=image.url',7,true,'TS4HE10-34073'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Geritage Democracy Oak 1.38X1.59','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Geritage Democracy Oak 1.38X1.59. Medida indicada: 1.38X1.59. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-geritage-democracy-oak.html&embed=image.url',8,true,'TS4HE10-34135'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Tahoe','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Tahoe. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-aspen-tahoe.html&embed=image.url',9,true,'TS4AS8-7658'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Oak Fresco','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Oak Fresco. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-aspen-oak-fresco.html&embed=image.url',10,true,'TS4AS8-4381-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Oak Breeze','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Oak Breeze. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-aspen-oak-breeze.html&embed=image.url',11,true,'TS4AS8-4382-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Vintage Aspen Boulder','Pisos laminados con diseños de inspiración clásica y vetas marcadas. Modelo Piso Laminado Vintage Aspen Boulder. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-vintage-aspen-boulder.html&embed=image.url',12,true,'TS4AS8-7293'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado Vintage');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Utrillas 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Utrillas 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-utrillas.html&embed=image.url',3,true,'TS4TE8-1903-4'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Ternasco 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Ternasco 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-ternasco.html&embed=image.url',4,true,'TS4TE8-1903-5'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Spruce Antique','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Spruce Antique. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-spruce-antique.html&embed=image.url',5,true,'TS4CL7-3346'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Vienna','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Vienna. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-vienna.html&embed=image.url',6,true,'TS4PS7 4369'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Trend 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Trend 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-trend.html&embed=image.url',7,true,'TS4PS7 4424'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Thunder 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Thunder 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-thunder.html&embed=image.url',8,true,'TS4PS7 4009'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Soul','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Soul. Consulta disponibilidad, presentación y recomendaciones de instalación.',700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-soul.html&embed=image.url',9,true,'TS4DS7-3709'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Silea 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Silea 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-silea.html&embed=image.url',10,true,'TS4CL7-7527-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Natural','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Natural. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-natural.html&embed=image.url',11,true,'TS4PS7 4420'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Evoke Crystal','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Evoke Crystal. Consulta disponibilidad, presentación y recomendaciones de instalación.',650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-evoke-crystal.html&embed=image.url',12,true,'TS4CL7-4423-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Oak Epic Apulien 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Oak Epic Apulien 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-oak-epic-apulien.html&embed=image.url',13,true,'TS4DS7-5845-A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Nogal Americano','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Nogal Americano. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-nogal-americano.html&embed=image.url',14,true,'TS4PS7 7671'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Mountain Beech','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Mountain Beech. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-mountain-beech.html&embed=image.url',15,true,'TS4PS7-2535'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Mountain Beech Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Mountain Beech Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-mountain-beech-splash.html&embed=image.url',16,true,'TS4SP8-2535'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kilimanjaro 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kilimanjaro 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-kilimanjaro.html&embed=image.url',17,true,'TS4MA8-1019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kiefer Storm 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kiefer Storm 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-kiefer-storm.html&embed=image.url',18,true,'TS4PS7 4075'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Kiefer 1.38X19.3','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Kiefer 1.38X19.3. Medida indicada: 1.38X19.3. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-kiefer.html&embed=image.url',19,true,'TS4PS7 4075'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Ivory White','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Ivory White. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-ivory-white.html&embed=image.url',20,true,'TS4PS7-7582'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Gudar 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Gudar 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-gudar.html&embed=image.url',21,true,'TS4TE8-1903-6'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Golden Oak','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Golden Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-golden-oak.html&embed=image.url',22,true,'TS4PS7-4898'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Golden Oak Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Golden Oak Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-golden-oak-splash.html&embed=image.url',23,true,'TS4SP8-4898'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Everest 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Everest 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-everest.html&embed=image.url',24,true,'TS4MA8-1017'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Elbrus 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Elbrus 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-elbrus.html&embed=image.url',25,true,'TS4MA8-1015'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Denali 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Denali 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-denali.html&embed=image.url',26,true,'TS4MA8-1012'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Calanda 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Calanda 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-calanda.html&embed=image.url',27,true,'TS4TE8-1903-3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Australian Walnut','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Australian Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-australian-walnut.html&embed=image.url',28,true,'TS4PS7-7503'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Australian Walnut Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Australian Walnut Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-australian-walnut-splash.html&embed=image.url',29,true,'TS4SP8-7503'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Artic Oak Splash 1.38X1.93','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Artic Oak Splash 1.38X1.93. Medida indicada: 1.38X1.93. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-artic-oak-splash.html&embed=image.url',30,true,'TS4SP8-4011'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Arcito Oak','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Arcito Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-arcito-oak.html&embed=image.url',31,true,'TS4PS7-4011'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Alcañiz 1.21X1.98','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Alcañiz 1.21X1.98. Medida indicada: 1.21X1.98. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-alcaniz.html&embed=image.url',32,true,'TS4TE8-1903-2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Laminado Aconcagua 2.20X2.39','Pisos laminados en variedad de tonos y texturas, de instalación práctica y mantenimiento sencillo. Modelo Piso Laminado Aconcagua 2.20X2.39. Medida indicada: 2.20X2.39. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1300.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-laminado-aconcagua.html&embed=image.url',33,true,'TS4MA8-1010'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Vitare Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Vitare Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-vitare-oak.html&embed=image.url',1,true,'TMVI12-GONV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Valhala','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Valhala. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-utopia-oak-valhala.html&embed=image.url',2,true,'TMUT12-OVAB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Shambala','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Shambala. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-utopia-oak-shambala.html&embed=image.url',3,true,'TMUT12-OSHB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Panadu','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Panadu. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-utopia-oak-panadu.html&embed=image.url',4,true,'TMUT12-OPAB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Camelot','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Camelot. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-utopia-oak-camelot.html&embed=image.url',5,true,'TMUT12-OCAB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Utopia Oak Avalon','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Utopia Oak Avalon. Consulta disponibilidad, presentación y recomendaciones de instalación.',1100.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-utopia-oak-avalon.html&embed=image.url',6,true,'TMUT12-OAVB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera True Toro American Walnut Cepillado','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera True Toro American Walnut Cepillado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-true-toro-american-walnut-cepillado.html&embed=image.url',7,true,'TMTT15-AWNB'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Lotf Mate Quartz','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Lotf Mate Quartz. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-lotf-mate-quartz.html&embed=image.url',8,true,'TMLM10-QONO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate White Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate White Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-mate-white-oak.html&embed=image.url',9,true,'TMLM10-WONO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Teak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-mate-teak.html&embed=image.url',10,true,'TMLO10-TENO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Jatoba','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-mate-jatoba.html&embed=image.url',11,true,'TMLM10-JANO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate Gravel','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate Gravel. Consulta disponibilidad, presentación y recomendaciones de instalación.',1650.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-mate-gravel.html&embed=image.url',12,true,'TMLM10-GONO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Mate American Walnut','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Mate American Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-mate-american-walnut.html&embed=image.url',13,true,'TMLM10-AWNO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life White Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life White Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-white-oak.html&embed=image.url',14,true,'TMLO10-WONV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Teak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1800.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-teak.html&embed=image.url',15,true,'TMLO10-TENV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Jatoba','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Jatoba. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-jatoba.html&embed=image.url',16,true,'TMLO10-JANV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Gray Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Gray Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-gray-oak.html&embed=image.url',17,true,'TMLO10-GONV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life Anthracite Oak','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life Anthracite Oak. Consulta disponibilidad, presentación y recomendaciones de instalación.',1700.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-anthracite-oak.html&embed=image.url',18,true,'TMLO10-AONV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso De Madera Loft Life American Walnut','Pisos de madera natural o multicapa que aportan calidez, autenticidad y elegancia. Modelo Piso De Madera Loft Life American Walnut. Consulta disponibilidad, presentación y recomendaciones de instalación.',1600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-de-madera-loft-life-american-walnut.html&embed=image.url',19,true,'TMLO10-AWNV'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pisos') and lower(s.name)=lower('Piso de madera');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Wenge 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Wenge 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-residencial-wenge.html&embed=image.url',1,true,'TDCE22.5-R-WENGE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Teak 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Teak 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-residencial-teak.html&embed=image.url',2,true,'TDCE2.55-R-TEAK'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Maple 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Maple 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-residencial-maple.html&embed=image.url',3,true,'TDCE22.5-R-MAPLE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Residencial Ligth Gray 2.2X14.5','Tablas de deck sintético para terrazas y patios residenciales con apariencia tipo madera. Modelo Piso Deck Residencial Ligth Gray 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-residencial-ligth-gray.html&embed=image.url',4,true,'TDCE22.5-R-LIGTH GRAY'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Deck residencial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Piso Deck Comercial Teak/Ipe 2.2X14.5','Deck sintético de mayor desempeño para áreas de tránsito frecuente y proyectos comerciales. Modelo Piso Deck Comercial Teak/Ipe 2.2X14.5. Medida indicada: 2.2X14.5. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',1600.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpiso-deck-comercial-teak-ipe.html&embed=image.url',1,true,'TDCE22.5-TEAK/IPE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Deck comercial');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Tasmania 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Tasmania 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-tasmania.html&embed=image.url',1,true,'M-CLAD-P-5402T'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Wenge 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Wenge 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-wenge.html&embed=image.url',2,true,'M-CLAD-P-005W'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Teak 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Teak 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-teak.html&embed=image.url',3,true,'M-CLAD-P-003T'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Redwood 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Redwood 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-redwood.html&embed=image.url',4,true,'M-CLAD-P-002R'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Merbau 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Merbau 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-merbau.html&embed=image.url',5,true,'M-CLAD-P-5403M'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Maple 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Maple 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-maple.html&embed=image.url',6,true,'M-CLAD-P-004M'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Perfil Plano Wall Cladding Hichory 3X25.4','Perfiles de remate que dan continuidad y un acabado limpio a instalaciones de wall cladding. Modelo Perfil Plano Wall Cladding Hichory 3X25.4. Medida indicada: 3X25.4. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',20.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fperfil-plano-wall-cladding-hichory.html&embed=image.url',7,true,'M-CLAD-P-5401H'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles Wall Cladding');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Tulum 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Tulum 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-tulum-25mx3.html&embed=image.url',1,true,'TG-35-TULUM'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Summer 30Mx3.98M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Summer 30Mx3.98M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-summer-30mx3.html&embed=image.url',2,true,'TG-18-SUMMER'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Maui 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Maui 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-maui-25mx3.html&embed=image.url',3,true,'TG-30-MAUI'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Gulhi 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Gulhi 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-gulhi-25mx3.html&embed=image.url',4,true,'TG-45-GULHI'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Cancun 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Cancun 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-cancun-25mx3.html&embed=image.url',5,true,'TG-25-CANCUN'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Bermuda 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Bermuda 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-bermuda-25mx3.html&embed=image.url',6,true,'TG-20-BERMUDA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Bali 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Bali 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-bali-25mx3.html&embed=image.url',7,true,'TG-40-BALI'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Aruba 30Mx3.98M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Aruba 30Mx3.98M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-aruba-30mx3.html&embed=image.url',8,true,'TG-07-ARUBA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Anakena 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Anakena 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-anakena-25mx3.html&embed=image.url',9,true,'TG-50-ANAKENA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Recreativo Aca 25Mx3.75M','Pasto sintético para jardines, patios y áreas de convivencia con apariencia natural. Modelo Pasto Sintetico Recreativo Aca 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-recreativo-aca-25mx3.html&embed=image.url',10,true,'TG-10-ACA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto recreativo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Sport 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Sport 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-sport-25mx3.html&embed=image.url',1,true,'TGS-40-SPORT'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Sport-2 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Sport-2 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-sport-2-25mx3.html&embed=image.url',2,true,'TGS-40-SPORT-2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Rojo 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Rojo 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-rojo-25mx3.html&embed=image.url',3,true,'TGS-40-ROJO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Blanco 40Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Blanco 40Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-blanco-40mx3.html&embed=image.url',4,true,'TGS-40-BLANCO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Blanco 20.2Mx2M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Blanco 20.2Mx2M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-blanco-20-2mx2m.html&embed=image.url',5,true,'TGS-12-BLANCO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Azul 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Azul 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-azul-25mx3.html&embed=image.url',6,true,'TGS-40-AZUL'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Azul-2 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Azul-2 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-azul-2-25mx3.html&embed=image.url',7,true,'TGS-12-AZUL'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Pasto Sintetico Deportivo Amarillo 25Mx3.75M','Pasto sintético desarrollado para canchas, entrenamiento y superficies de uso deportivo. Modelo Pasto Sintetico Deportivo Amarillo 25Mx3.75M. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpasto-sintetico-deportivo-amarillo-25mx3.html&embed=image.url',8,true,'TGS-40-AMARILLO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Pasto sintético') and lower(s.name)=lower('Pasto deportivo');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Wild Teak (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Wild Teak (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-wild-teak.html&embed=image.url',1,true,'M-PVC-V77'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Walnut Elipse (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Walnut Elipse (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-walnut-elipse.html&embed=image.url',2,true,'M-PVC-V79'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Rio- (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Rio- (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-rio.html&embed=image.url',3,true,'M-PVC-V01'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Maple Dusk (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Maple Dusk (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-maple-dusk.html&embed=image.url',4,true,'M-PVC-V71'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Ivory Elm (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Ivory Elm (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-ivory-elm.html&embed=image.url',5,true,'M-PVC-V70'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Cocoa Ash (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Cocoa Ash (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-cocoa-ash.html&embed=image.url',6,true,'M-PVC-V75'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Brasilia (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Brasilia (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-brasilia.html&embed=image.url',7,true,'M-PVC-V06'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Birch Ember (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Birch Ember (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-birch-ember.html&embed=image.url',8,true,'M-PVC-V73'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Panel PVC Laminado Interior Ash Nomad (Caja Con 10Pz 8.40M2)','Panel decorativo interior de formato práctico, diseñado para cubrir muros con acabados tipo madera y una instalación limpia. Modelo Panel PVC Laminado Interior Ash Nomad (Caja Con 10Pz 8.40M2). Consulta disponibilidad, presentación y recomendaciones de instalación.',999.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fpanel-pvc-laminado-interior-ash-nomad.html&embed=image.url',9,true,'M-PVC-V80'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Placas') and lower(s.name)=lower('Panel PVC laminado');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Teak 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Teak 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-teak.html&embed=image.url',1,true,'TD-FWPC-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Silver Gray 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Silver Gray 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-silver-gray.html&embed=image.url',2,true,'TD-FWPC-T5'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Redwood 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Redwood 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-redwood.html&embed=image.url',3,true,'TD-FWPC-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Dark Black 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Dark Black 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-dark-black.html&embed=image.url',4,true,'TD-FWPC(2.85)-T8'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Muro Lambrin WPC Exterior Charcoal 2.85X20X2.6','Revestimiento WPC para exterior, pensado para soportar condiciones ambientales con bajo mantenimiento. Modelo Muro Lambrin WPC Exterior Charcoal 2.85X20X2.6. Medida indicada: 2.85X20X2.6. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',550.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmuro-lambrin-wpc-exterior-charcoal.html&embed=image.url',5,true,'TD-FWPC-T7'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Malla Sombra','Complementos diversos para instalaciones decorativas en muros y exteriores. Modelo Malla Sombra. Consulta disponibilidad, presentación y recomendaciones de instalación.',500.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fmalla-sombra.html&embed=image.url',1,true,'MALLASOMBRA'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Otros accesorios de muro');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Gildara 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Gildara 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-ps-media-luna-gold-gildara.html&embed=image.url',1,true,'M-LUNA-008'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Elara 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Elara 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-ps-media-luna-gold-elara.html&embed=image.url',2,true,'M-LUNA-006'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Cressida 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Cressida 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-ps-media-luna-gold-cressida.html&embed=image.url',3,true,'M-LUNA-004'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Ps Media Luna Gold Aureli 15.2X2.90','Lambrín de poliestireno con perfil curvo y detalles decorativos que crean profundidad en muros interiores. Modelo Lambrin Ps Media Luna Gold Aureli 15.2X2.90. Medida indicada: 15.2X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-ps-media-luna-gold-aureli.html&embed=image.url',4,true,'M-LUNA-002'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna PS');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Lunha Azeitona 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Lunha Azeitona 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-lunha-azeitona.html&embed=image.url',1,true,'M-LUNA-M001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Sao Paulo 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Sao Paulo 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-luna-sao-paulo.html&embed=image.url',2,true,'M-LUNA-M019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Rio 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Rio 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-luna-rio.html&embed=image.url',3,true,'M-LUNA-M201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Brasilia 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Brasilia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-luna-brasilia.html&embed=image.url',4,true,'M-LUNA-M106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Media Luna Bahia 16X2.90','Panel decorativo de PVC con perfil curvo tipo media luna, ideal para añadir textura y ritmo visual. Modelo Lambrin Media Luna Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-media-luna-bahia.html&embed=image.url',5,true,'M-LUNA-M003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Media Luna');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Teak Aracaju 2.90X16','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Teak Aracaju 2.90X16. Medida indicada: 2.90X16. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-teak-aracaju.html&embed=image.url',1,true,'M-WPC-49B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sonho 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sonho 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-sonho.html&embed=image.url',2,true,'M-WPC-212'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sao Paulo 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sao Paulo 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-sao-paulo.html&embed=image.url',3,true,'M-WPC-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Sabeiro 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Sabeiro 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-sabeiro.html&embed=image.url',4,true,'M-WPC-303'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Rodeiro 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Rodeiro 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-rodeiro.html&embed=image.url',5,true,'M-WPC-301'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Rio 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Rio 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-rio.html&embed=image.url',6,true,'M-WPC-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Ribeira 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Ribeira 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',185.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-ribeira.html&embed=image.url',7,true,'M-WPC-305'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Ouro Preto 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Ouro Preto 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-ouro-preto.html&embed=image.url',8,true,'M-WPC-090'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Nuvem 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Nuvem 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-nuvem.html&embed=image.url',9,true,'M-WPC-008'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Nogal Olinda','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Nogal Olinda. Consulta disponibilidad, presentación y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-nogal-olinda.html&embed=image.url',10,true,'M-WPC-45B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Manaos 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Manaos 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-manaos.html&embed=image.url',11,true,'M-WPC-205'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Fortaleza Rayado 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Fortaleza Rayado 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-fortaleza-rayado.html&embed=image.url',12,true,'M-WPC-020'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Estrelado 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Estrelado 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-estrelado.html&embed=image.url',13,true,'M-WPC-256'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Sao Paulo 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Sao Paulo 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-sao-paulo.html&embed=image.url',1,true,'M-DESIGUAL-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Rio 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Rio 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-rio.html&embed=image.url',2,true,'M-DESIGUAL-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Parota 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Parota 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-parota.html&embed=image.url',3,true,'M-DESIGUAL-502B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Brasilia 14X2.80','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Brasilia 14X2.80. Medida indicada: 14X2.80. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-brasilia.html&embed=image.url',4,true,'M-DESIGUAL-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Desigual Bahia 16X2.90','Revestimiento de diseño asimétrico que combina relieves y separaciones para un acabado contemporáneo. Modelo Lambrin Interior Desigual Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-desigual-bahia.html&embed=image.url',5,true,'M-DESIGUAL-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Desigual');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Cerezo Macapa 2.90X16','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Cerezo Macapa 2.90X16. Medida indicada: 2.90X16. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',199.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-cerezo-macapa.html&embed=image.url',14,true,'M-WPC-38B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Brasilia 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Brasilia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-brasilia.html&embed=image.url',15,true,'M-WPC-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Bahia 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Bahia 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',165.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-bahia.html&embed=image.url',16,true,'M-WPC-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Amizade','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Amizade. Consulta disponibilidad, presentación y recomendaciones de instalación.',179.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-amizade.html&embed=image.url',17,true,'M-WPC-214'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Lambrin Interior Amanhecer 16X2.90','Lambrín decorativo para interiores con apariencia tipo madera, fácil mantenimiento y aplicación en muros o plafones. Modelo Lambrin Interior Amanhecer 16X2.90. Medida indicada: 16X2.90. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',175.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Flambrin-interior-amanhecer.html&embed=image.url',18,true,'M-WPC-252'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Lambrín') and lower(s.name)=lower('Lambrín Interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Trebol 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Trebol 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-trebol.html&embed=image.url',1,true,'SG-FGF012'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Siberia 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Siberia 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-siberia.html&embed=image.url',2,true,'SG-FGF017'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Milan 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Milan 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-milan.html&embed=image.url',3,true,'SG-FSA013'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Menta 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Menta 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-menta.html&embed=image.url',4,true,'SG-FSA019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Grecia 50X50','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Grecia 50X50. Medida indicada: 50X50. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-grecia.html&embed=image.url',5,true,'SG-FGA-156'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Brusela 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Brusela 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',280.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-brusela.html&embed=image.url',6,true,'SG-FGF087'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetico Amazonas-C 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetico Amazonas-C 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetico-amazonas-c.html&embed=image.url',7,true,'SG-FGK004C'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Sevilla 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Sevilla 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetica-sevilla.html&embed=image.url',8,true,'SG-FSA009'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Jazmin 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Jazmin 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetica-jazmin.html&embed=image.url',9,true,'SG-FSA036'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Amazonas-B 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Amazonas-B 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetica-amazonas-b.html&embed=image.url',10,true,'SG-FGK004B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Sintetica Amazonas-A 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Sintetica Amazonas-A 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',350.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-sintetica-amazonas-a.html&embed=image.url',11,true,'SG-FGK004A'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Persia 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Persia 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-persia.html&embed=image.url',12,true,'SG-FSA017'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Laurel Dorado 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Laurel Dorado 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-laurel-dorado.html&embed=image.url',13,true,'SG-FSA003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Verde 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Verde 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-arrayan-verde.html&embed=image.url',14,true,'SG-FSA006-G'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Rojo 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Rojo 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-arrayan-rojo.html&embed=image.url',15,true,'SG-FSA006-R'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Natural 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Natural 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-arrayan-natural.html&embed=image.url',16,true,'SG-FSA001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Morado 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Morado 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-arrayan-morado.html&embed=image.url',17,true,'SG-FSA006-P'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Arrayan Amarillo 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Arrayan Amarillo 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-arrayan-amarillo.html&embed=image.url',18,true,'SG-FSA006-Y'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Follaje Amsterdan 50X50Cm','Módulos decorativos de follaje para crear muros verdes de fácil mantenimiento. Modelo Follaje Amsterdan 50X50Cm. Medida indicada: 50X50cm. Consulta disponibilidad, cobertura por caja y recomendaciones de instalación.',250.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Ffollaje-amsterdan.html&embed=image.url',19,true,'SG-FGF044'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Follaje sintético');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cople Para Viga','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Cople Para Viga. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcople-para-viga.html&embed=image.url',6,true,'M-VIGA1-COPLE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cople Para Viga2','Tapas, soportes y coples para completar y asegurar la instalación de vigas decorativas. Modelo Cople Para Viga2. Consulta disponibilidad, presentación y recomendaciones de instalación.',50.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcople-para-viga2.html&embed=image.url',7,true,'M-VIGA2-COPLE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Complementos para vigas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Clip Sistema De Fijacion Para Deck','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Clip Sistema De Fijacion Para Deck. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fclip-sistema-de-fijacion-para-deck.html&embed=image.url',2,true,'CLIPSINOX'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Clip Inicio Para Fila De Tabla En Sistema Deck','Clips y piezas de fijación para lograr una instalación firme y uniforme del deck. Modelo Clip Inicio Para Fila De Tabla En Sistema Deck. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fclip-inicio-para-fila-de-tabla-en-sistema-deck.html&embed=image.url',3,true,'CLIPINICIO'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Deck') and lower(s.name)=lower('Accesorios para deck');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Medellin10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Medellin10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcerca-expandible-medellin10-7cmx37cm.html&embed=image.url',1,true,'SG-CGD010'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Bogota 10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Bogota 10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcerca-expandible-bogota-10-7cmx37cm.html&embed=image.url',2,true,'SG-CGD023'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Cerca Expandible Barranquilla 10.7Cmx37Cm','Paneles decorativos expandibles para cubrir muros, divisiones y áreas verdes. Modelo Cerca Expandible Barranquilla 10.7Cmx37Cm. Consulta disponibilidad, presentación y recomendaciones de instalación.',900.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fcerca-expandible-barranquilla-10-7cmx37cm.html&embed=image.url',3,true,'SG-CGD036'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Cercas expandibles');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Wild Teak','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Wild Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-wild-teak.html&embed=image.url',1,true,'M-WPC-A077'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Walnut Elipse','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Walnut Elipse. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-walnut-elipse.html&embed=image.url',2,true,'M-WPC-A079'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior.html&embed=image.url',3,true,'M-WPC-A303'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Teak Aracaju','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Teak Aracaju. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-teak-aracaju.html&embed=image.url',4,true,'M-WPC-A49B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Sonho','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Sonho. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-sonho.html&embed=image.url',5,true,'M-WPC-A212'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Sao Paulo','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Sao Paulo. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-sao-paulo.html&embed=image.url',6,true,'M-WPC-A019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Rodeiro','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Rodeiro. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-rodeiro.html&embed=image.url',7,true,'M-WPC-A301'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Rio','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Rio. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-rio.html&embed=image.url',8,true,'M-WPC-A201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ribeira','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ribeira. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-ribeira.html&embed=image.url',9,true,'M-WPC-A305'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Parota','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Parota. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-parota.html&embed=image.url',10,true,'M-WPC-A502B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ouro Preto','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ouro Preto. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-ouro-preto.html&embed=image.url',11,true,'M-WPC-A090'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Nuvem','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Nuvem. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-nuvem.html&embed=image.url',12,true,'M-WPC-A008'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Nogal Olinda','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Nogal Olinda. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-nogal-olinda.html&embed=image.url',13,true,'M-WPC-A45B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Maple Dusk','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Maple Dusk. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-maple-dusk.html&embed=image.url',14,true,'M-WPC-A071'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Manaos','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Manaos. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-manaos.html&embed=image.url',15,true,'M-WPC-A205'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ivoy Elm','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ivoy Elm. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-ivoy-elm.html&embed=image.url',16,true,'M-WPC-A070'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Fortaleza Rayado','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Fortaleza Rayado. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-fortaleza-rayado.html&embed=image.url',17,true,'M-WPC-A020'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Estrelado','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Estrelado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-estrelado.html&embed=image.url',18,true,'M-WPC-A256'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Cocoa Ash','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Cocoa Ash. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-cocoa-ash.html&embed=image.url',19,true,'M-WPC-A075'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Cerezo Macapa','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Cerezo Macapa. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-cerezo-macapa.html&embed=image.url',20,true,'M-WPC-A38B'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Brasilia','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Brasilia. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-brasilia.html&embed=image.url',21,true,'M-WPC-A106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Birch Ember','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Birch Ember. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-birch-ember.html&embed=image.url',22,true,'M-WPC-A073'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Bahia','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Bahia. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-bahia.html&embed=image.url',23,true,'M-WPC-A003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Azeitona','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Azeitona. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-azeitona.html&embed=image.url',24,true,'M-WPC-A001'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Ash Nomad','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Ash Nomad. Consulta disponibilidad, presentación y recomendaciones de instalación.',140.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-ash-nomad.html&embed=image.url',25,true,'M-WPC-A080'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Amizade','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Amizade. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-amizade.html&embed=image.url',26,true,'M-WPC-A214'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo Lambrin WPC Interior Amanhecer','Piezas de terminación para proteger esquinas y cerrar instalaciones de lambrín interior. Modelo Angulo Lambrin WPC Interior Amanhecer. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-lambrin-wpc-interior-amanhecer.html&embed=image.url',27,true,'M-WPC-A252'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín interior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Teak','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Teak. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-teak.html&embed=image.url',1,true,'TD-FANG-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Silver Gray','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Silver Gray. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-silver-gray.html&embed=image.url',2,true,'TD-FANG-T6'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Redwood','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Redwood. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-redwood.html&embed=image.url',3,true,'TD-FANG-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Dark Black','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Dark Black. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-dark-black.html&embed=image.url',4,true,'TD-FANG-T8'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Angulo De Lambrin WPC Exterior Charcoal','Piezas de terminación para rematar esquinas en instalaciones de lambrín WPC exterior. Modelo Angulo De Lambrin WPC Exterior Charcoal. Consulta disponibilidad, presentación y recomendaciones de instalación.',400.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Fangulo-de-lambrin-wpc-exterior-charcoal.html&embed=image.url',5,true,'TD-FANG-T7'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Ángulos para lambrín exterior');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Perfil Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Perfil Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',81.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placas-perfil-plateado.html&embed=image.url',1,true,'M-PERFIL-TP-1'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Angulo Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Angulo Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',0.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placas-angulo-plateado.html&embed=image.url',2,true,'M-PRFIL-AP-1'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placas Angulo Negro','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placas Angulo Negro. Consulta disponibilidad, presentación y recomendaciones de instalación.',89.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placas-angulo-negro.html&embed=image.url',3,true,'M-PERFIL-AN-1'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placa Perfil Negro','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placa Perfil Negro. Consulta disponibilidad, presentación y recomendaciones de instalación.',81.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placa-perfil-negro.html&embed=image.url',4,true,'M-PERFIL-TN-1'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles para placas');
insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'Aluminio Para Placa Angulo Plateado','Perfiles y ángulos de aluminio para rematar, unir y proteger los bordes de placas decorativas. Modelo Aluminio Para Placa Angulo Plateado. Consulta disponibilidad, presentación y recomendaciones de instalación.',89.0,'https://api.microlink.io/?url=https%3A%2F%2Ftekno-step.com%2Faluminio-para-placa-angulo-plateado.html&embed=image.url',5,true,'M-PERFIL-AP-1'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Accesorios para muros') and lower(s.name)=lower('Perfiles para placas');
commit;
select c.name as categoria,s.name as subcategoria,count(p.id) as productos from public.categories c join public.subcategories s on s.category_id=c.id left join public.products p on p.subcategory_id=s.id where lower(c.name) in ('lambrín','placas','tapiz','accesorios para muros','pisos','deck','pasto sintético') group by c.sort_order,c.name,s.sort_order,s.name order by c.sort_order,s.sort_order;