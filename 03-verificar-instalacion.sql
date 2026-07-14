-- Esta consulta no modifica nada. Solo verifica que todo exista.
select 'categories' as tabla, count(*) as registros from public.categories
union all
select 'products', count(*) from public.products
union all
select 'projects', count(*) from public.projects
union all
select 'admin_users', count(*) from public.admin_users;

select id, name, public, file_size_limit
from storage.buckets
where id = 'decor-images';
