-- DECOR DESIGN — ACTUALIZACIÓN PARA SUBCATEGORÍAS
-- Ejecuta TODO una sola vez en Supabase > SQL Editor.
-- No borra tus datos actuales.

create table if not exists public.subcategories(
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references public.categories(id) on delete cascade,
  name text not null,
  description text,
  image_url text,
  sort_order integer not null default 0,
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists subcategories_category_name_unique_ci
on public.subcategories(category_id, lower(name));

create index if not exists subcategories_category_idx
on public.subcategories(category_id);

alter table public.products
add column if not exists subcategory_id uuid
references public.subcategories(id) on delete set null;

create index if not exists products_subcategory_idx
on public.products(subcategory_id);

drop trigger if exists subcategories_set_updated_at on public.subcategories;
create trigger subcategories_set_updated_at
before update on public.subcategories
for each row execute function public.set_updated_at();

alter table public.subcategories enable row level security;

drop policy if exists "Public reads active subcategories" on public.subcategories;
create policy "Public reads active subcategories"
on public.subcategories for select to anon,authenticated
using(active=true or public.is_admin());

drop policy if exists "Admins manage subcategories" on public.subcategories;
create policy "Admins manage subcategories"
on public.subcategories for all to authenticated
using(public.is_admin()) with check(public.is_admin());

grant select on public.subcategories to anon;
grant select,insert,update,delete on public.subcategories to authenticated;

insert into public.categories(name,description,sort_order,active)
values
('Lambrín','Opciones de lambrín para interiores y exteriores.',1,true),
('Placas PVC','Placas decorativas con diferentes acabados.',2,true),
('Vigas','Vigas decorativas para interiores.',3,true),
('Persianas','Persianas fabricadas y ajustadas a cada espacio.',4,true),
('Papel Tapiz','Diseños de papel tapiz para hogar y negocio.',5,true)
on conflict do nothing;

insert into public.subcategories(category_id,name,description,sort_order,active)
select c.id,v.name,v.description,v.sort_order,true
from public.categories c
cross join (values
  ('Lambrín Media Luna','Modelos con perfil tipo media luna.',1),
  ('Lambrín Desigual','Diseños con relieves y separaciones desiguales.',2),
  ('Lambrín Tradicional','Modelos clásicos y versátiles para interiores.',3),
  ('Lambrín Exterior','Opciones adecuadas para áreas exteriores.',4)
) as v(name,description,sort_order)
where lower(c.name)=lower('Lambrín')
on conflict do nothing;

insert into public.subcategories(category_id,name,description,sort_order,active)
select c.id,v.name,v.description,v.sort_order,true
from public.categories c
cross join (values
  ('Placas Brillantes','Acabado brillante y reflejante.',1),
  ('Placas Mate','Acabado mate y elegante.',2),
  ('Placas con Textura','Superficies con relieve y textura decorativa.',3)
) as v(name,description,sort_order)
where lower(c.name)=lower('Placas PVC')
on conflict do nothing;

insert into public.subcategories(category_id,name,description,sort_order,active)
select c.id,'Personalizada','Persianas fabricadas a la medida de tu ventana.',1,true
from public.categories c
where lower(c.name)=lower('Persianas')
on conflict do nothing;
