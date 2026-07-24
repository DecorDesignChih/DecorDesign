-- DECOR DESIGN — VIGAS, FOTOS LOCALES Y ORGANIZACIÓN FINAL
-- Ejecutar una sola vez en Supabase > SQL Editor después de subir el ZIP a GitHub.
-- Se puede volver a ejecutar: elimina y vuelve a crear únicamente la sección de vigas.
begin;
alter table public.products add column if not exists sku text;

-- Elimina la clasificación anterior de vigas dentro de Accesorios para muros para evitar duplicados.
delete from public.products where subcategory_id in (
  select s.id from public.subcategories s join public.categories c on c.id=s.category_id
  where lower(c.name)=lower('Accesorios para muros') and lower(s.name) in (lower('Vigas decorativas'),lower('Complementos para vigas'))
);
delete from public.subcategories where category_id in (select id from public.categories where lower(name)=lower('Accesorios para muros')) and lower(name) in (lower('Vigas decorativas'),lower('Complementos para vigas'));

-- Oculta categorías antiguas equivalentes, pero conserva/actualiza la categoría final.
update public.categories set active=false where lower(name) in (lower('Vigas'),lower('Vigas interior y exterior')) and lower(name)<>lower('Vigas interior y exterior PVC');

insert into public.categories(name,description,image_url,sort_order,active)
values ('Vigas interior y exterior PVC','Vigas decorativas ligeras para interiores y soluciones WPC para exteriores, con acabados tipo madera y complementos de instalación.','assets/productos/vigas/m-vigapu-02-castano.jpg',5,true)
on conflict ((lower(name))) do update set description=excluded.description,image_url=excluded.image_url,sort_order=excluded.sort_order,active=true;

-- Ajusta el orden de las categorías principales.
update public.categories set sort_order=4 where lower(name)=lower('Accesorios para muros');
update public.categories set sort_order=6 where lower(name)=lower('Pisos');
update public.categories set sort_order=7 where lower(name)=lower('Deck');
update public.categories set sort_order=8 where lower(name)=lower('Pasto sintético');

-- Limpia solo el contenido previo de la categoría de vigas para que no se duplique al volver a ejecutar.
delete from public.products where category_id in (select id from public.categories where lower(name)=lower('Vigas interior y exterior PVC'));
delete from public.subcategories where category_id in (select id from public.categories where lower(name)=lower('Vigas interior y exterior PVC'));

insert into public.subcategories(category_id,name,description,image_url,sort_order,active)
select c.id,'Vigas PU interior','Vigas ligeras de poliuretano con textura tipo madera para techos, muros y plafones interiores.','assets/productos/vigas/m-vigapu-02-castano.jpg',1,true from public.categories c where lower(c.name)=lower('Vigas interior y exterior PVC');

insert into public.subcategories(category_id,name,description,image_url,sort_order,active)
select c.id,'Vigas WPC interior 5 × 5 cm','Perfiles decorativos WPC de sección compacta para diseños lineales en interiores.','assets/productos/vigas/m-viga2-019-sao-paulo-50x50.jpg',2,true from public.categories c where lower(c.name)=lower('Vigas interior y exterior PVC');

insert into public.subcategories(category_id,name,description,image_url,sort_order,active)
select c.id,'Vigas WPC interior 10 × 5 cm','Vigas WPC interiores de mayor presencia para techos, muros y plafones.','assets/productos/vigas/m-viga1-019-sao-paulo-100x50.jpg',3,true from public.categories c where lower(c.name)=lower('Vigas interior y exterior PVC');

insert into public.subcategories(category_id,name,description,image_url,sort_order,active)
select c.id,'Vigas WPC exterior','Vigas sintéticas para pérgolas, fachadas y terrazas, disponibles en acabados tipo madera.','assets/productos/vigas/td-viga-t3-teak.jpg',4,true from public.categories c where lower(c.name)=lower('Vigas interior y exterior PVC');

insert into public.subcategories(category_id,name,description,image_url,sort_order,active)
select c.id,'Complementos para vigas','Tapas, soportes giratorios y coples para completar la instalación de las vigas.','assets/productos/vigas/td-viga-soporte-exterior.jpg',5,true from public.categories c where lower(c.name)=lower('Vigas interior y exterior PVC');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGAS PU INTERIOR CASTAÑO 2.90X15.2X7.5 TEKNO','Viga decorativa ligera de poliuretano con acabado tipo madera color castaño. Medida aproximada: 2.90 m × 15.2 cm × 7.5 cm; recomendada para techos, muros y plafones interiores.',465.00,'assets/productos/vigas/m-vigapu-02-castano.jpg',1,true,'M-VIGAPU-02'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas PU interior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA PU INTERIOR WENGE 2.90X15.2X7.5 TEKNO','Viga decorativa ligera de poliuretano con acabado tipo madera color wengué. Medida aproximada: 2.90 m × 15.2 cm × 7.5 cm; ideal para proyectos interiores modernos.',465.00,'assets/productos/vigas/m-vigapu-07-wenge.jpg',2,true,'M-VIGAPU-07'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas PU interior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA PU INTERIOR NOGAL 2.90X15.2X7.5 TEKNO','Viga decorativa ligera de poliuretano con acabado tipo madera color nogal. Medida aproximada: 2.90 m × 15.2 cm × 7.5 cm; aporta calidez sin el peso de una viga sólida.',465.00,'assets/productos/vigas/m-vigapu-03-nogal.jpg',3,true,'M-VIGAPU-03'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas PU interior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA PU INTERIOR IPE 2.90X15.2X7.5 TEKNO','Viga decorativa ligera de poliuretano con acabado tipo madera ipé. Medida aproximada: 2.90 m × 15.2 cm × 7.5 cm; práctica para techos y detalles arquitectónicos interiores.',465.00,'assets/productos/vigas/m-vigapu-04-ipe.jpg',4,true,'M-VIGAPU-04'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas PU interior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR SAO PAULO 2.90X5X5CM','Viga decorativa WPC para interior en tono Sao Paulo. Medida aproximada: 2.90 m × 5 cm × 5 cm; adecuada para plafones, muros y diseños con listones.',85.00,'assets/productos/vigas/m-viga2-019-sao-paulo-50x50.jpg',5,true,'M-VIGA2-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 5 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR SAO PAULO 2.90X10X5','Viga decorativa WPC para interior en tono Sao Paulo. Medida aproximada: 2.90 m × 10 cm × 5 cm; crea volumen y líneas arquitectónicas marcadas.',100.00,'assets/productos/vigas/m-viga1-019-sao-paulo-100x50.jpg',6,true,'M-VIGA1-019'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 10 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR RIO 2.90X5X5CM','Viga decorativa WPC para interior en tono Río. Medida aproximada: 2.90 m × 5 cm × 5 cm; ligera, decorativa y de bajo mantenimiento.',85.00,'assets/productos/vigas/m-viga2-201-rio-50x50.jpg',7,true,'M-VIGA2-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 5 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR RIO 2.90X10X5CM','Viga decorativa WPC para interior en tono Río. Medida aproximada: 2.90 m × 10 cm × 5 cm; ideal para techos, plafones y muros de acento.',100.00,'assets/productos/vigas/m-viga1-201-rio-100x50.jpg',8,true,'M-VIGA1-201'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 10 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR BRASILIA 2.90X5X5CM','Viga decorativa WPC para interior en tono Brasilia. Medida aproximada: 2.90 m × 5 cm × 5 cm; combina apariencia tipo madera y mantenimiento sencillo.',85.00,'assets/productos/vigas/m-viga2-106-brasilia-50x50.jpg',9,true,'M-VIGA2-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 5 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR BRASILIA 2.90X10X5CM','Viga decorativa WPC para interior en tono Brasilia. Medida aproximada: 2.90 m × 10 cm × 5 cm; recomendada para composiciones decorativas de mayor presencia.',100.00,'assets/productos/vigas/m-viga1-106-brasilia-100x50.jpg',10,true,'M-VIGA1-106'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 10 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR BAHIA 2.90X5X5CM','Viga decorativa WPC para interior en tono Bahía. Medida aproximada: 2.90 m × 5 cm × 5 cm; apropiada para diseños lineales y modernos.',85.00,'assets/productos/vigas/m-viga2-003-bahia-50x50.jpg',11,true,'M-VIGA2-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 5 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA INTERIOR BAHIA 2.90X10X5CM','Viga decorativa WPC para interior en tono Bahía. Medida aproximada: 2.90 m × 10 cm × 5 cm; aporta profundidad a techos y muros interiores.',100.00,'assets/productos/vigas/m-viga1-003-bahia-100x50.jpg',12,true,'M-VIGA1-003'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC interior 10 × 5 cm');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA EXTERIOR TEAK 2.85X12X7','Viga decorativa WPC para exterior en acabado Teak. Medida aproximada: 2.85 m × 12 cm × 7 cm; pensada para pérgolas, fachadas y terrazas.',399.00,'assets/productos/vigas/td-viga-t3-teak.jpg',13,true,'TD-VIGA-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC exterior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA EXTERIOR REDWOOD 2.85X12X7','Viga decorativa WPC para exterior en acabado Redwood. Medida aproximada: 2.85 m × 12 cm × 7 cm; adecuada para estructuras decorativas expuestas al clima.',399.00,'assets/productos/vigas/td-viga-t2-redwood.jpg',14,true,'TD-VIGA-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC exterior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'VIGA EXTERIOR DARK BLACK 2.85X12X7','Viga decorativa WPC para exterior en acabado Dark Black. Medida aproximada: 2.85 m × 12 cm × 7 cm; ofrece un aspecto contemporáneo para pérgolas y fachadas.',399.00,'assets/productos/vigas/td-viga-t8-dark-black.jpg',15,true,'TD-VIGA-T8'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Vigas WPC exterior');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'TAPA PARA VIGA WPC EXTERIOR TEAK','Tapa de terminación para viga WPC exterior en acabado Teak. Ayuda a cerrar los extremos y mejorar el acabado visual de la instalación.',50.00,'assets/productos/vigas/td-tapa-t3-teak.jpg',16,true,'TD-TAPA-T3'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'TAPA PARA VIGA EXTERIOR REDWOOD','Tapa de terminación para viga exterior en acabado Redwood. Diseñada para cubrir extremos y dar una apariencia más limpia.',50.00,'assets/productos/vigas/td-tapa-t2-redwood.jpg',17,true,'TD-TAPA-T2'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'SOPORTE GIRATORIO PARA VIGA INTERIOR','Soporte giratorio para montaje de vigas decorativas interiores. Permite ajustar la orientación de la pieza; precio disponible por cotización.',null,'assets/productos/vigas/soporte-viga-interior.jpg',18,true,null
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'SOPORTE GIRATORIO PARA VIGA EXTERIOR','Soporte giratorio para viga exterior, pensado para fijar y orientar vigas en pérgolas y estructuras decorativas.',90.00,'assets/productos/vigas/td-viga-soporte-exterior.jpg',19,true,'TD-VIGA-SOPORTE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'SOPORTE GIRATORIO PARA VIGA EXTERIOR 10X5','Soporte giratorio compatible con vigas de sección aproximada de 10 × 5 cm. Facilita el montaje y ajuste de proyectos decorativos.',65.00,'assets/productos/vigas/m-viga-soporte-100x50.jpg',20,true,'M-VIGA-SOPORTE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'COPLE PARA VIGA','Cople para unir tramos de viga WPC interior de 10 × 5 cm y mantener continuidad en instalaciones largas.',50.00,'assets/productos/vigas/m-viga1-cople.jpg',21,true,'M-VIGA1-COPLE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

insert into public.products(category_id,subcategory_id,name,description,price,image_url,sort_order,active,sku)
select c.id,s.id,'COPLE PARA VIGA2','Cople para unir tramos de viga WPC interior de 5 × 5 cm y lograr una terminación continua.',50.00,'assets/productos/vigas/m-viga2-cople.jpg',22,true,'M-VIGA2-COPLE'
from public.categories c join public.subcategories s on s.category_id=c.id
where lower(c.name)=lower('Vigas interior y exterior PVC') and lower(s.name)=lower('Complementos para vigas');

commit;

-- Verificación: debe mostrar 22 productos en total.
select c.name as categoria,s.name as subcategoria,count(p.id) as productos
from public.categories c
join public.subcategories s on s.category_id=c.id
left join public.products p on p.subcategory_id=s.id and p.active=true
where lower(c.name)=lower('Vigas interior y exterior PVC')
group by c.sort_order,c.name,s.sort_order,s.name
order by s.sort_order;
