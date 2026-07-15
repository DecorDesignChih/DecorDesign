-- DECOR DESIGN CHIH — REPARAR FOTOS DE CATEGORÍAS Y SUBIDA DE IMÁGENES
-- Ejecuta todo en Supabase > SQL Editor > New query > Run.

insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values(
  'decor-images','decor-images',true,10485760,
  array['image/jpeg','image/png','image/webp','image/gif']
)
on conflict(id) do update set
  public=true,
  file_size_limit=10485760,
  allowed_mime_types=array['image/jpeg','image/png','image/webp','image/gif'];

drop policy if exists "Decor admins insert images" on storage.objects;
create policy "Decor admins insert images"
on storage.objects for insert to authenticated
with check(bucket_id='decor-images' and public.is_admin());

drop policy if exists "Decor admins select image rows" on storage.objects;
create policy "Decor admins select image rows"
on storage.objects for select to authenticated
using(bucket_id='decor-images' and public.is_admin());

drop policy if exists "Decor admins update images" on storage.objects;
create policy "Decor admins update images"
on storage.objects for update to authenticated
using(bucket_id='decor-images' and public.is_admin())
with check(bucket_id='decor-images' and public.is_admin());

drop policy if exists "Decor admins delete images" on storage.objects;
create policy "Decor admins delete images"
on storage.objects for delete to authenticated
using(bucket_id='decor-images' and public.is_admin());

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-lambrin.jpg'
where lower(name) in ('lambrín','lambrin');

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-panel-walnut.jpg'
where lower(name)='panel walnut';

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-placas-pvc.jpg'
where lower(name) in ('placas pvc','placas');

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-vigas.jpg'
where lower(name)='vigas';

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-persianas.jpg'
where lower(name)='persianas';

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-papel-tapiz.jpg'
where lower(name)='papel tapiz';

update public.categories set image_url='https://decordesignchih.github.io/DecorDesign/assets/category-decor.jpg'
where lower(name) in ('follaje y decor','decor');

update public.subcategories s
set image_url=c.image_url
from public.categories c
where s.category_id=c.id and (s.image_url is null or trim(s.image_url)='');
