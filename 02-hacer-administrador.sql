-- EJECUTA ESTE ARCHIVO DESPUÉS DE CREAR TU USUARIO EN:
-- Supabase > Authentication > Users > Add user
--
-- Cambia el correo de ejemplo por el correo real del administrador.

insert into public.admin_users (user_id)
select id
from auth.users
where lower(email) = lower('TU_CORREO@gmail.com')
on conflict (user_id) do nothing;

-- Verificación: debe aparecer una fila.
select au.user_id, u.email, au.created_at
from public.admin_users au
join auth.users u on u.id = au.user_id;
