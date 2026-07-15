(function(){
"use strict";

var cfg=window.DECOR_CONFIG||{};
var sb=null;
var bucket=cfg.STORAGE_BUCKET||"decor-images";
var categories=[],subcategories=[],products=[],projects=[];

function $(id){return document.getElementById(id)}
function esc(value){
  return String(value==null?"":value).replace(/[&<>"']/g,function(ch){
    return {"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"}[ch];
  });
}
function uuid(){
  if(window.crypto&&typeof window.crypto.randomUUID==="function")return window.crypto.randomUUID();
  return"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(c){
    var r=Math.random()*16|0,v=c==="x"?r:(r&3|8);return v.toString(16);
  });
}
function money(value){
  if(value===null||value===undefined||value==="")return"Sin precio";
  return new Intl.NumberFormat("es-MX",{style:"currency",currency:"MXN"}).format(Number(value));
}
function normalizeName(value){
  return String(value||"").normalize("NFD").replace(/[\u0300-\u036f]/g,"").toLowerCase().trim();
}
function categoryFallback(name){
  var key=normalizeName(name);
  if(key.indexOf("panel walnut")>=0)return"assets/category-panel-walnut.jpg";
  if(key.indexOf("lambr")>=0)return"assets/category-lambrin.jpg";
  if(key.indexOf("placa")>=0)return"assets/category-placas-pvc.jpg";
  if(key.indexOf("persiana")>=0)return"assets/category-persianas.jpg";
  if(key.indexOf("tapiz")>=0)return"assets/category-papel-tapiz.jpg";
  if(key.indexOf("viga")>=0)return"assets/category-vigas.jpg";
  return"assets/category-decor.jpg";
}
function fallbackFor(type,item){
  if(type==="category")return categoryFallback(item.name);
  if(type==="subcategory"){
    var cat=categories.find(function(c){return c.id===item.category_id});
    return categoryFallback(item.categories&&item.categories.name||cat&&cat.name);
  }
  if(type==="product"){
    var category=categories.find(function(c){return c.id===item.category_id});
    return categoryFallback(item.categories&&item.categories.name||category&&category.name);
  }
  return"assets/hero-trabajo-1.jpg";
}
function showBoot(text,error){
  var box=$("bootMessage");
  if(!box)return;
  box.textContent=text||"";
  box.className="boot-message"+(error?" error":"");
  if(!text)box.classList.add("hidden");
}
function toast(message){
  var t=$("toast");
  t.textContent=message;
  t.classList.add("show");
  setTimeout(function(){t.classList.remove("show")},2500);
}
function message(form,text,error){
  var el=form.querySelector(".form-message");
  el.textContent=text||"";
  el.style.color=error===false?"#a9e6b2":"#ffb0b0";
}
function openLayer(id){
  $(id).classList.remove("hidden");
  document.body.style.overflow="hidden";
}
function closeLayer(node){
  node.classList.add("hidden");
  document.body.style.overflow="";
}
function showLogin(){
  $("dashboard").classList.add("hidden");
  $("authView").classList.remove("hidden");
  showBoot("",false);
}
function showDashboard(){
  $("authView").classList.add("hidden");
  $("dashboard").classList.remove("hidden");
  showBoot("",false);
}

async function init(){
  try{
    if(!cfg.SUPABASE_URL||!cfg.SUPABASE_ANON_KEY)throw new Error("Falta la configuración de Supabase en config.js.");
    if(!window.supabase||!window.supabase.createClient)throw new Error("No se pudo cargar la conexión de Supabase.");
    sb=window.supabase.createClient(cfg.SUPABASE_URL,cfg.SUPABASE_ANON_KEY);
    showBoot("Conectando con Decor Design…",false);
    var response=await sb.auth.getSession();
    var session=response&&response.data?response.data.session:null;
    if(session)await enter();
    else showLogin();
    sb.auth.onAuthStateChange(function(_event,currentSession){
      if(!currentSession)showLogin();
    });
  }catch(error){
    console.error(error);
    showLogin();
    showBoot("No se pudo cargar el panel: "+(error.message||error),true);
  }
}
async function enter(){
  var result=await sb.rpc("is_admin");
  if(result.error||!result.data){
    await sb.auth.signOut();
    $("loginMessage").textContent="Usuario no autorizado.";
    showLogin();
    return;
  }
  showDashboard();
  await loadAll();
}

$("loginForm").addEventListener("submit",async function(event){
  event.preventDefault();
  $("loginMessage").textContent="Entrando…";
  try{
    var result=await sb.auth.signInWithPassword({
      email:$("loginEmail").value.trim(),
      password:$("loginPassword").value
    });
    if(result.error)throw result.error;
    $("loginMessage").textContent="";
    await enter();
  }catch(error){
    $("loginMessage").textContent=error.message||"No se pudo iniciar sesión.";
  }
});
$("logoutButton").addEventListener("click",function(){sb.auth.signOut()});

document.querySelectorAll(".tab").forEach(function(button){
  button.addEventListener("click",function(){
    document.querySelectorAll(".tab,.tab-panel").forEach(function(node){node.classList.remove("active")});
    button.classList.add("active");
    $(button.dataset.tab+"Panel").classList.add("active");
  });
});
document.querySelectorAll("[data-open]").forEach(function(button){
  button.addEventListener("click",function(){openEmpty(button.dataset.open)});
});
document.querySelectorAll(".dialog-close").forEach(function(button){
  button.addEventListener("click",function(){closeLayer(button.closest(".mobile-dialog"))});
});
document.querySelectorAll(".mobile-dialog").forEach(function(layer){
  layer.addEventListener("click",function(event){if(event.target===layer)closeLayer(layer)});
});

async function loadAll(){
  showBoot("Cargando información…",false);
  var result=await Promise.all([
    sb.from("categories").select("*").order("sort_order").order("name"),
    sb.from("subcategories").select("*,categories(name)").order("sort_order").order("name"),
    sb.from("products").select("*,categories(name),subcategories(name)").order("sort_order").order("name"),
    sb.from("projects").select("*").order("sort_order").order("title")
  ]);
  for(var i=0;i<result.length;i++){
    if(result[i].error){
      console.error(result[i].error);
      showBoot("Error al cargar la información: "+result[i].error.message,true);
      return;
    }
  }
  categories=result[0].data||[];
  subcategories=result[1].data||[];
  products=result[2].data||[];
  projects=result[3].data||[];
  $("categoriesCount").textContent=categories.length;
  $("subcategoriesCount").textContent=subcategories.length;
  $("productsCount").textContent=products.length;
  $("projectsCount").textContent=projects.length;
  fillSelects();
  renderCategories();
  renderSubcategories();
  renderProducts();
  renderProjects();
  showBoot("",false);
}

function categoryOptions(first){
  return'<option value="">'+first+'</option>'+categories.map(function(c){
    return'<option value="'+c.id+'">'+esc(c.name)+'</option>';
  }).join("");
}
function fillSelects(){
  $("productCategory").innerHTML=categoryOptions("Selecciona una categoría");
  $("subcategoryCategory").innerHTML=categoryOptions("Selecciona una categoría");
  $("categoryFilter").innerHTML=categoryOptions("Todas las categorías");
  $("subcategoryCategoryFilter").innerHTML=categoryOptions("Todas las categorías");
  updateProductSubs("");
  updateFilterSubs();
}
function updateProductSubs(selected){
  var list=subcategories.filter(function(s){return s.category_id===$("productCategory").value});
  $("productSubcategory").innerHTML='<option value="">Sin subcategoría</option>'+list.map(function(s){
    return'<option value="'+s.id+'">'+esc(s.name)+'</option>';
  }).join("");
  $("productSubcategory").value=selected||"";
}
function updateFilterSubs(){
  var categoryId=$("categoryFilter").value;
  var list=categoryId?subcategories.filter(function(s){return s.category_id===categoryId}):subcategories;
  $("subcategoryFilterProducts").innerHTML='<option value="">Todas las subcategorías</option>'+list.map(function(s){
    return'<option value="'+s.id+'">'+esc(s.name)+'</option>';
  }).join("");
}
$("productCategory").addEventListener("change",function(){updateProductSubs("")});
$("categoryFilter").addEventListener("change",function(){updateFilterSubs();renderProducts()});
$("subcategoryFilterProducts").addEventListener("change",renderProducts);
$("productFilter").addEventListener("input",renderProducts);
$("subcategoryFilter").addEventListener("input",renderSubcategories);
$("subcategoryCategoryFilter").addEventListener("change",renderSubcategories);

function row(item,type,title,description,image,meta){
  var fallback=fallbackFor(type,item);
  var source=String(image||"").trim()||fallback;
  return'<article class="admin-row" data-type="'+type+'" data-id="'+item.id+'">'+
    '<img src="'+esc(source)+'" onerror="this.onerror=null;this.src=\''+fallback+'\'" alt="'+esc(title)+'">'+
    '<div><h3>'+esc(title)+'</h3><p>'+esc(description||"Sin descripción")+'</p></div>'+
    '<div class="meta"><p>'+esc(meta||"")+'</p><span class="badge '+(item.active?"":"off")+'">'+(item.active?"Visible":"Oculto")+'</span><p>Orden: '+(item.sort_order||0)+'</p></div>'+
    '<div class="row-actions"><button class="edit" type="button">Editar</button><button class="toggle" type="button">'+(item.active?"Ocultar":"Mostrar")+'</button><button class="delete" type="button">Eliminar</button></div>'+
  '</article>';
}
function bindRows(){
  document.querySelectorAll(".admin-row").forEach(function(r){
    r.querySelector(".edit").onclick=function(){edit(r.dataset.type,r.dataset.id)};
    r.querySelector(".toggle").onclick=function(){toggle(r.dataset.type,r.dataset.id)};
    r.querySelector(".delete").onclick=function(){remove(r.dataset.type,r.dataset.id)};
  });
}
function renderCategories(){
  $("categoriesTable").innerHTML=categories.map(function(c){return row(c,"category",c.name,c.description,c.image_url,"")}).join("")||"<p>No hay categorías.</p>";
  bindRows();
}
function renderSubcategories(){
  var q=$("subcategoryFilter").value.toLowerCase();
  var cat=$("subcategoryCategoryFilter").value;
  var list=subcategories.filter(function(s){
    return(!cat||s.category_id===cat)&&(!q||(s.name+" "+(s.description||"")).toLowerCase().indexOf(q)>=0);
  });
  $("subcategoriesTable").innerHTML=list.map(function(s){return row(s,"subcategory",s.name,s.description,s.image_url,s.categories&&s.categories.name||"")}).join("")||"<p>No hay subcategorías.</p>";
  bindRows();
}
function renderProducts(){
  var q=$("productFilter").value.toLowerCase();
  var cat=$("categoryFilter").value;
  var sub=$("subcategoryFilterProducts").value;
  var list=products.filter(function(p){
    return(!cat||p.category_id===cat)&&(!sub||p.subcategory_id===sub)&&(!q||(p.name+" "+(p.description||"")).toLowerCase().indexOf(q)>=0);
  });
  $("productsTable").innerHTML=list.map(function(p){
    var meta=(p.categories&&p.categories.name||"")+(p.subcategories&&p.subcategories.name?" · "+p.subcategories.name:"")+" · "+money(p.price);
    return row(p,"product",p.name,p.description,p.image_url,meta);
  }).join("")||"<p>No hay productos.</p>";
  bindRows();
}
function renderProjects(){
  $("projectsTable").innerHTML=projects.map(function(p){return row(p,"project",p.title,p.description,p.image_url,"")}).join("")||"<p>No hay proyectos.</p>";
  bindRows();
}

function resetForm(dialogId){
  var layer=$(dialogId);
  var form=layer.querySelector("form");
  form.reset();
  form.querySelector('input[type="hidden"]').value="";
  message(form,"",true);
  var preview=form.querySelector(".image-preview");
  if(preview)preview.innerHTML="";
  var check=form.querySelector('input[type="checkbox"]');
  if(check)check.checked=true;
}
function openEmpty(dialogId){
  resetForm(dialogId);
  if(dialogId==="categoryDialog")$("categoryFormTitle").textContent="Agregar categoría";
  if(dialogId==="subcategoryDialog")$("subcategoryFormTitle").textContent="Agregar subcategoría";
  if(dialogId==="productDialog"){$("productFormTitle").textContent="Agregar producto";updateProductSubs("")}
  if(dialogId==="projectDialog")$("projectFormTitle").textContent="Agregar proyecto";
  openLayer(dialogId);
}
function edit(type,key){
  var item;
  if(type==="category"){
    item=categories.find(function(x){return x.id===key});
    resetForm("categoryDialog");
    $("categoryId").value=item.id;$("categoryName").value=item.name;$("categoryDescription").value=item.description||"";$("categoryOrder").value=item.sort_order||0;$("categoryActive").checked=item.active;
    if(item.image_url)$("categoryPreview").innerHTML='<img src="'+esc(item.image_url)+'">';
    $("categoryFormTitle").textContent="Editar categoría";openLayer("categoryDialog");
  }else if(type==="subcategory"){
    item=subcategories.find(function(x){return x.id===key});
    resetForm("subcategoryDialog");
    $("subcategoryId").value=item.id;$("subcategoryCategory").value=item.category_id;$("subcategoryName").value=item.name;$("subcategoryDescription").value=item.description||"";$("subcategoryOrder").value=item.sort_order||0;$("subcategoryActive").checked=item.active;
    if(item.image_url)$("subcategoryPreview").innerHTML='<img src="'+esc(item.image_url)+'">';
    $("subcategoryFormTitle").textContent="Editar subcategoría";openLayer("subcategoryDialog");
  }else if(type==="product"){
    item=products.find(function(x){return x.id===key});
    resetForm("productDialog");
    $("productId").value=item.id;$("productCategory").value=item.category_id;updateProductSubs(item.subcategory_id||"");$("productName").value=item.name;$("productDescription").value=item.description||"";$("productPrice").value=item.price==null?"":item.price;$("productOrder").value=item.sort_order||0;$("productActive").checked=item.active;
    if(item.image_url)$("productPreview").innerHTML='<img src="'+esc(item.image_url)+'">';
    $("productFormTitle").textContent="Editar producto";openLayer("productDialog");
  }else{
    item=projects.find(function(x){return x.id===key});
    resetForm("projectDialog");
    $("projectId").value=item.id;$("projectTitle").value=item.title;$("projectDescription").value=item.description||"";$("projectOrder").value=item.sort_order||0;$("projectActive").checked=item.active;
    if(item.image_url)$("projectPreview").innerHTML='<img src="'+esc(item.image_url)+'">';
    $("projectFormTitle").textContent="Editar proyecto";openLayer("projectDialog");
  }
}

function bindPreview(inputId,previewId){
  $(inputId).addEventListener("change",function(){
    var file=this.files&&this.files[0];
    if(!file){$(previewId).innerHTML="";return}
    var reader=new FileReader();
    reader.onload=function(){$(previewId).innerHTML='<img src="'+reader.result+'" alt="Vista previa">'};
    reader.readAsDataURL(file);
  });
}
bindPreview("categoryImage","categoryPreview");
bindPreview("subcategoryImage","subcategoryPreview");
bindPreview("productImage","productPreview");
bindPreview("projectImage","projectPreview");

async function uploadImage(file,folder){
  if(!file)return null;
  if(file.size>10*1024*1024)throw new Error("La imagen supera 10 MB.");
  var ext=(file.name.split(".").pop()||"jpg").toLowerCase().replace(/[^a-z0-9]/g,"");
  var path=folder+"/"+Date.now()+"-"+uuid()+"."+ext;
  var result=await sb.storage.from(bucket).upload(path,file,{cacheControl:"3600",upsert:false,contentType:file.type});
  if(result.error)throw result.error;
  return sb.storage.from(bucket).getPublicUrl(path).data.publicUrl;
}
async function save(form,table,key,payload,file,folder,dialogId){
  try{
    message(form,"Guardando…",false);
    if(file)payload.image_url=await uploadImage(file,folder);
    var result=key?await sb.from(table).update(payload).eq("id",key):await sb.from(table).insert(payload);
    if(result.error)throw result.error;
    closeLayer($(dialogId));
    toast("Guardado correctamente");
    await loadAll();
  }catch(error){
    console.error(error);
    message(form,error.message||"No se pudo guardar.",true);
  }
}
async function toggle(type,key){
  var map={category:["categories",categories],subcategory:["subcategories",subcategories],product:["products",products],project:["projects",projects]};
  var table=map[type][0],item=map[type][1].find(function(x){return x.id===key});
  var result=await sb.from(table).update({active:!item.active}).eq("id",key);
  if(result.error){toast("No se pudo cambiar.");return}
  await loadAll();
}
async function remove(type,key){
  if(!window.confirm("¿Seguro que deseas eliminar este elemento?"))return;
  var table={category:"categories",subcategory:"subcategories",product:"products",project:"projects"}[type];
  var result=await sb.from(table).delete().eq("id",key);
  if(result.error){toast("No se pudo eliminar.");return}
  toast("Eliminado");
  await loadAll();
}

$("categoryForm").addEventListener("submit",function(e){
  e.preventDefault();
  save(this,"categories",$("categoryId").value,{
    name:$("categoryName").value.trim(),
    description:$("categoryDescription").value.trim()||null,
    sort_order:Number($("categoryOrder").value)||0,
    active:$("categoryActive").checked
  },$("categoryImage").files[0],"categories","categoryDialog");
});
$("subcategoryForm").addEventListener("submit",function(e){
  e.preventDefault();
  save(this,"subcategories",$("subcategoryId").value,{
    category_id:$("subcategoryCategory").value,
    name:$("subcategoryName").value.trim(),
    description:$("subcategoryDescription").value.trim()||null,
    sort_order:Number($("subcategoryOrder").value)||0,
    active:$("subcategoryActive").checked
  },$("subcategoryImage").files[0],"subcategories","subcategoryDialog");
});
$("productForm").addEventListener("submit",function(e){
  e.preventDefault();
  save(this,"products",$("productId").value,{
    category_id:$("productCategory").value,
    subcategory_id:$("productSubcategory").value||null,
    name:$("productName").value.trim(),
    description:$("productDescription").value.trim()||null,
    price:$("productPrice").value===""?null:Number($("productPrice").value),
    sort_order:Number($("productOrder").value)||0,
    active:$("productActive").checked
  },$("productImage").files[0],"products","productDialog");
});
$("projectForm").addEventListener("submit",function(e){
  e.preventDefault();
  save(this,"projects",$("projectId").value,{
    title:$("projectTitle").value.trim(),
    description:$("projectDescription").value.trim()||null,
    sort_order:Number($("projectOrder").value)||0,
    active:$("projectActive").checked
  },$("projectImage").files[0],"projects","projectDialog");
});

window.addEventListener("error",function(event){
  console.error(event.error||event.message);
  showBoot("Ocurrió un error al cargar el panel. Actualiza la página y vuelve a intentarlo.",true);
});
window.addEventListener("unhandledrejection",function(event){
  console.error(event.reason);
  showBoot("No se pudo completar la conexión. Revisa internet y vuelve a intentarlo.",true);
});

init();
})();