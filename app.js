const cfg=window.DECOR_CONFIG;
const sb=window.supabase.createClient(cfg.supabaseUrl,cfg.supabaseKey);
const $=s=>document.querySelector(s), $$=s=>[...document.querySelectorAll(s)];
const fallbackImages=['assets/trabajo-walnut.jpg','assets/trabajo-placa-gris.jpg','assets/trabajo-marco.jpg'];
let allProducts=[],currentCategory=null;
const esc=(v='')=>String(v).replace(/[&<>'"]/g,m=>({'&':'&amp;','<':'&lt;','>':'&gt;',"'":'&#39;','"':'&quot;'}[m]));
const wa=(text='Hola, quiero solicitar información de Decor Design.')=>`https://wa.me/${cfg.whatsapp}?text=${encodeURIComponent(text)}`;
['topWhatsapp','heroWhatsapp','storyWhatsapp','ctaWhatsapp','contactWhatsapp','floatingWhatsapp'].forEach(id=>{const el=$('#'+id);if(el)el.href=wa()});
$('#projectQuote').href=wa('Hola, vi uno de sus trabajos realizados y quiero cotizar algo similar.');

const menu=$('#mainNav'),toggle=$('#menuToggle');
toggle?.addEventListener('click',()=>{const open=menu.classList.toggle('open');toggle.setAttribute('aria-expanded',open)});
menu?.querySelectorAll('a').forEach(a=>a.addEventListener('click',()=>menu.classList.remove('open')));
window.addEventListener('scroll',()=>$('#siteHeader').classList.toggle('scrolled',scrollY>40));
const observer=new IntersectionObserver(entries=>entries.forEach(e=>e.isIntersecting&&e.target.classList.add('visible')),{threshold:.14});$$('.reveal').forEach(el=>observer.observe(el));

async function loadCategories(){
 const grid=$('#categoryGrid');
 const {data,error}=await sb.from('categories').select('*').eq('active',true).order('sort_order');
 if(error){console.error(error);grid.innerHTML='<div class="empty">No se pudieron cargar las categorías.</div>';return}
 if(!data?.length){grid.innerHTML='<div class="empty">Próximamente publicaremos nuestro catálogo.</div>';return}
 grid.innerHTML=data.map((c,i)=>`<article class="category-card" data-id="${c.id}" data-name="${esc(c.name)}" data-description="${esc(c.description||'')}"><span class="category-number">${String(i+1).padStart(2,'0')}</span><img src="${esc(c.image_url||fallbackImages[i%fallbackImages.length])}" alt="${esc(c.name)}"><div class="category-info"><span class="kicker">COLECCIÓN</span><h3>${esc(c.name)}</h3><p>${esc(c.description||'')}</p><b>Ver modelos →</b></div></article>`).join('');
 grid.querySelectorAll('.category-card').forEach(card=>card.addEventListener('click',()=>openModels(card.dataset.id,card.dataset.name,card.dataset.description)));
}
async function openModels(categoryId,name,description){
 currentCategory={id:categoryId,name};$('#modalTitle').textContent=name;$('#modalDescription').textContent=description||'';$('#modelsGrid').innerHTML='<div class="empty">Cargando modelos…</div>';$('#modelSearch').value='';$('#modelsModal').showModal();document.body.classList.add('modal-open');
 const {data,error}=await sb.from('products').select('*').eq('category_id',categoryId).eq('active',true).order('sort_order');
 if(error){console.error(error);$('#modelsGrid').innerHTML='<div class="empty">No se pudieron cargar los modelos.</div>';return}
 allProducts=data||[];renderModels(allProducts);
}
function renderModels(rows){const grid=$('#modelsGrid');if(!rows.length){grid.innerHTML='<div class="empty">Todavía no hay modelos publicados en esta categoría.</div>';return}grid.innerHTML=rows.map((p,i)=>`<article class="model-card"><img src="${esc(p.image_url||fallbackImages[i%fallbackImages.length])}" alt="${esc(p.name)}"><div><h3>${esc(p.name)}</h3><p>${esc(p.description||'Solicita colores, medidas y disponibilidad.')}</p>${p.price?`<div class="price">$${Number(p.price).toLocaleString('es-MX',{minimumFractionDigits:2})}</div>`:''}<a href="${wa(`Hola, quiero información del modelo ${p.name} de la categoría ${currentCategory?.name||''}.`)}" target="_blank" rel="noopener">Pedir información</a></div></article>`).join('')}
$('#modelSearch')?.addEventListener('input',e=>{const q=e.target.value.toLowerCase().trim();renderModels(allProducts.filter(p=>(p.name+' '+(p.description||'')).toLowerCase().includes(q)))});
$('.models-modal .modal-close')?.addEventListener('click',()=>{$('#modelsModal').close();document.body.classList.remove('modal-open')});

async function loadProjects(){
 const grid=$('#projectGrid');
 const {data,error}=await sb.from('projects').select('*').eq('active',true).order('sort_order');
 if(error){console.error(error);grid.innerHTML='<div class="empty">No se pudieron cargar los proyectos.</div>';return}
 const defaults=[{title:'Placa decorativa gris',description:'Instalación de placa de gran formato para un acabado moderno.',image_url:'assets/trabajo-placa-gris.jpg'},{title:'Panel Walnut y placa',description:'Combinación de madera y acabado tipo mármol.',image_url:'assets/trabajo-walnut.jpg'},{title:'Marco decorativo',description:'Diseño envolvente para resaltar el espacio principal.',image_url:'assets/trabajo-marco.jpg'}];
 const rows=data?.length?data:defaults;
 grid.innerHTML=rows.map((p,i)=>`<article class="project-card" data-title="${esc(p.title)}" data-description="${esc(p.description||'')}" data-image="${esc(p.image_url||fallbackImages[i%fallbackImages.length])}"><img src="${esc(p.image_url||fallbackImages[i%fallbackImages.length])}" alt="${esc(p.title)}"><div><h3>${esc(p.title)}</h3><p>Ver proyecto →</p></div></article>`).join('');
 grid.querySelectorAll('.project-card').forEach(card=>card.addEventListener('click',()=>{$('#projectModalImage').src=card.dataset.image;$('#projectModalTitle').textContent=card.dataset.title;$('#projectModalDescription').textContent=card.dataset.description;$('#projectModal').showModal();document.body.classList.add('modal-open')}));
}
$('.project-close')?.addEventListener('click',()=>{$('#projectModal').close();document.body.classList.remove('modal-open')});
$$('dialog').forEach(d=>d.addEventListener('click',e=>{if(e.target===d){d.close();document.body.classList.remove('modal-open')}}));
Promise.all([loadCategories(),loadProjects()]);
