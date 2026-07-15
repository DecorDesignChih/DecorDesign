-- DECOR DESIGN — EJECUTAR UNA VEZ EN SUPABASE SQL EDITOR
create extension if not exists pgcrypto;

create or replace function public.set_updated_at()
returns trigger language plpgsql set search_path=public as $$
begin new.updated_at=now(); return new; end; $$;

create table if not exists public.admin_users(
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from public.admin_users where user_id=auth.uid());
$$;

create table if not exists public.categories(
 id uuid primary key default gen_random_uuid(), name text not null, description text, image_url text,
 sort_order integer not null default 0, active boolean not null default true,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create unique index if not exists categories_name_unique_ci on public.categories(lower(name));

create table if not exists public.products(
 id uuid primary key default gen_random_uuid(), category_id uuid not null references public.categories(id) on delete cascade,
 name text not null, description text, price numeric(12,2), image_url text,
 sort_order integer not null default 0, active boolean not null default true,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create index if not exists products_category_idx on public.products(category_id);

create table if not exists public.projects(
 id uuid primary key default gen_random_uuid(), title text not null, description text, image_url text,
 sort_order integer not null default 0, active boolean not null default true,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

drop trigger if exists categories_set_updated_at on public.categories;
create trigger categories_set_updated_at before update on public.categories for each row execute function public.set_updated_at();
drop trigger if exists products_set_updated_at on public.products;
create trigger products_set_updated_at before update on public.products for each row execute function public.set_updated_at();
drop trigger if exists projects_set_updated_at on public.projects;
create trigger projects_set_updated_at before update on public.projects for each row execute function public.set_updated_at();

alter table public.admin_users enable row level security;
alter table public.categories enable row level security;
alter table public.products enable row level security;
alter table public.projects enable row level security;

drop policy if exists "Public reads active categories" on public.categories;
create policy "Public reads active categories" on public.categories for select to anon,authenticated using(active=true or public.is_admin());
drop policy if exists "Public reads active products" on public.products;
create policy "Public reads active products" on public.products for select to anon,authenticated using(active=true or public.is_admin());
drop policy if exists "Public reads active projects" on public.projects;
create policy "Public reads active projects" on public.projects for select to anon,authenticated using(active=true or public.is_admin());

drop policy if exists "Admins manage categories" on public.categories;
create policy "Admins manage categories" on public.categories for all to authenticated using(public.is_admin()) with check(public.is_admin());
drop policy if exists "Admins manage products" on public.products;
create policy "Admins manage products" on public.products for all to authenticated using(public.is_admin()) with check(public.is_admin());
drop policy if exists "Admins manage projects" on public.projects;
create policy "Admins manage projects" on public.projects for all to authenticated using(public.is_admin()) with check(public.is_admin());
drop policy if exists "Admin reads own authorization" on public.admin_users;
create policy "Admin reads own authorization" on public.admin_users for select to authenticated using(user_id=auth.uid());

grant usage on schema public to anon,authenticated;
grant select on public.categories,public.products,public.projects to anon;
grant select,insert,update,delete on public.categories,public.products,public.projects to authenticated;
grant select on public.admin_users to authenticated;
grant execute on function public.is_admin() to anon,authenticated;

insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values('decor-images','decor-images',true,10485760,array['image/jpeg','image/png','image/webp','image/gif'])
on conflict(id) do update set public=excluded.public,file_size_limit=excluded.file_size_limit,allowed_mime_types=excluded.allowed_mime_types;

drop policy if exists "Decor admins insert images" on storage.objects;
create policy "Decor admins insert images" on storage.objects for insert to authenticated with check(bucket_id='decor-images' and public.is_admin());
drop policy if exists "Decor admins select image rows" on storage.objects;
create policy "Decor admins select image rows" on storage.objects for select to authenticated using(bucket_id='decor-images' and public.is_admin());
drop policy if exists "Decor admins update images" on storage.objects;
create policy "Decor admins update images" on storage.objects for update to authenticated using(bucket_id='decor-images' and public.is_admin()) with check(bucket_id='decor-images' and public.is_admin());
drop policy if exists "Decor admins delete images" on storage.objects;
create policy "Decor admins delete images" on storage.objects for delete to authenticated using(bucket_id='decor-images' and public.is_admin());

insert into public.categories(name,description,sort_order) values
('Lambrín','Textura y calidez para muros principales.',1),
('Panel Walnut','Apariencia nogal para interiores sofisticados.',2),
('Placas PVC','Acabados tipo mármol modernos y resistentes.',3),
('Papel Tapiz','Diseños para transformar cualquier habitación.',4),
('Persianas','Fabricadas a medida para cada ventana.',5),
('Follaje y Decor','Detalles naturales para espacios con personalidad.',6)
on conflict do nothing;

-- DESPUÉS DE CREAR EL USUARIO EN AUTHENTICATION > USERS,
-- COPIA SU UUID Y EJECUTA ESTA LÍNEA CAMBIANDO EL TEXTO:
-- insert into public.admin_users(user_id) values ('PEGA_AQUI_EL_UUID_DEL_USUARIO');
