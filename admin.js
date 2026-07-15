(() => {
  const cfg=window.DECOR_CONFIG||{};
  const sb=supabase.createClient(cfg.SUPABASE_URL,cfg.SUPABASE_ANON_KEY);
  const bucket=cfg.STORAGE_BUCKET||"decor-images";
  let categories=[],subcategories=[],products=[],projects=[];
  const $=id=>document.getElementById(id);
  const esc=s=>String(s??"").replace(/[&<>"']/g,m=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"}[m]));
  const money=v=>v===null||v===""?"Sin precio":new Intl.NumberFormat("es-MX",{style:"currency",currency:"MXN"}).format(Number(v));
  const toast=m=>{const t=$("toast");t.textContent=m;t.classList.add("show");setTimeout(()=>t.classList.remove("show"),2500)};
  const message=(form,text,error=true)=>{const el=form.querySelector(".form-message");el.textContent=text;el.style.color=error?"#ffb0b0":"#a9e6b2"};

  async function init(){
    const {data:{session}}=await sb.auth.getSession();
    if(session)await enter();
    sb.auth.onAuthStateChange((_e,s)=>{if(!s){$("dashboard").classList.add("hidden");$("authView").classList.remove("hidden")}});
  }
  async function enter(){
    const {data,error}=await sb.rpc("is_admin");
    if(error||!data){await sb.auth.signOut();$("loginMessage").textContent="Usuario no autorizado.";return}
    $("authView").classList.add("hidden");$("dashboard").classList.remove("hidden");await loadAll();
  }
  $("loginForm").addEventListener("submit",async e=>{
    e.preventDefault();$("loginMessage").textContent="Entrando…";
    const {error}=await sb.auth.signInWithPassword({email:$("loginEmail").value.trim(),password:$("loginPassword").value});
    if(error){$("loginMessage").textContent=error.message;return}await enter();
  });
  $("logoutButton").addEventListener("click",()=>sb.auth.signOut());

  document.querySelectorAll(".tab").forEach(b=>b.addEventListener("click",()=>{
    document.querySelectorAll(".tab,.tab-panel").forEach(x=>x.classList.remove("active"));
    b.classList.add("active");$(b.dataset.tab+"Panel").classList.add("active");
  }));
  document.querySelectorAll("[data-open]").forEach(b=>b.addEventListener("click",()=>openEmpty(b.dataset.open)));
  document.querySelectorAll(".dialog-close").forEach(b=>b.addEventListener("click",()=>b.closest("dialog").close()));

  async function loadAll(){
    const [c,s,p,j]=await Promise.all([
      sb.from("categories").select("*").order("sort_order").order("name"),
      sb.from("subcategories").select("*,categories(name)").order("sort_order").order("name"),
      sb.from("products").select("*,categories(name),subcategories(name)").order("sort_order").order("name"),
      sb.from("projects").select("*").order("sort_order").order("title")
    ]);
    if(c.error||s.error||p.error||j.error){console.error(c.error,s.error,p.error,j.error);toast("Ejecuta primero el SQL nuevo.");return}
    categories=c.data||[];subcategories=s.data||[];products=p.data||[];projects=j.data||[];
    $("categoriesCount").textContent=categories.length;$("subcategoriesCount").textContent=subcategories.length;
    $("productsCount").textContent=products.length;$("projectsCount").textContent=projects.length;
    fillSelects();renderCategories();renderSubcategories();renderProducts();renderProjects();
  }

  function options(){return '<option value="">Selecciona una categoría</option>'+categories.map(c=>`<option value="${c.id}">${esc(c.name)}</option>`).join("")}
  function fillSelects(){
    $("productCategory").innerHTML=options();$("subcategoryCategory").innerHTML=options();
    const all='<option value="">Todas las categorías</option>'+categories.map(c=>`<option value="${c.id}">${esc(c.name)}</option>`).join("");
    $("categoryFilter").innerHTML=all;$("subcategoryCategoryFilter").innerHTML=all;
    updateProductSubs();updateFilterSubs();
  }
  function updateProductSubs(selected=""){
    const list=subcategories.filter(s=>s.category_id===$("productCategory").value);
    $("productSubcategory").innerHTML='<option value="">Sin subcategoría</option>'+list.map(s=>`<option value="${s.id}">${esc(s.name)}</option>`).join("");
    $("productSubcategory").value=selected||"";
  }
  function updateFilterSubs(){
    const cat=$("categoryFilter").value;
    const list=cat?subcategories.filter(s=>s.category_id===cat):subcategories;
    $("subcategoryFilterProducts").innerHTML='<option value="">Todas las subcategorías</option>'+list.map(s=>`<option value="${s.id}">${esc(s.name)}</option>`).join("");
  }
  $("productCategory").addEventListener("change",()=>updateProductSubs());
  $("categoryFilter").addEventListener("change",()=>{updateFilterSubs();renderProducts()});
  $("subcategoryFilterProducts").addEventListener("change",renderProducts);
  $("productFilter").addEventListener("input",renderProducts);
  $("subcategoryFilter").addEventListener("input",renderSubcategories);
  $("subcategoryCategoryFilter").addEventListener("change",renderSubcategories);

  function row(x,type,title,desc,img,meta=""){
    return `<article class="admin-row" data-type="${type}" data-id="${x.id}"><img src="${img||"assets/hero.jpg"}"><div><h3>${esc(title)}</h3><p>${esc(desc||"Sin descripción")}</p></div><div class="meta"><p>${esc(meta)}</p><span class="badge ${x.active?"":"off"}">${x.active?"Visible":"Oculto"}</span><p>Orden: ${x.sort_order||0}</p></div><div class="row-actions"><button class="edit">Editar</button><button class="toggle">${x.active?"Ocultar":"Mostrar"}</button><button class="delete">Eliminar</button></div></article>`;
  }
  function bind(){
    document.querySelectorAll(".admin-row").forEach(r=>{
      r.querySelector(".edit").onclick=()=>edit(r.dataset.type,r.dataset.id);
      r.querySelector(".toggle").onclick=()=>toggle(r.dataset.type,r.dataset.id);
      r.querySelector(".delete").onclick=()=>remove(r.dataset.type,r.dataset.id);
    });
  }
  function renderCategories(){$("categoriesTable").innerHTML=categories.map(c=>row(c,"category",c.name,c.description,c.image_url)).join("")||"<p>No hay categorías.</p>";bind()}
  function renderSubcategories(){
    const q=$("subcategoryFilter").value.toLowerCase(),cat=$("subcategoryCategoryFilter").value;
    const list=subcategories.filter(s=>(!cat||s.category_id===cat)&&(!q||`${s.name} ${s.description||""}`.toLowerCase().includes(q)));
    $("subcategoriesTable").innerHTML=list.map(s=>row(s,"subcategory",s.name,s.description,s.image_url,s.categories?.name||"")).join("")||"<p>No hay subcategorías.</p>";bind()
  }
  function renderProducts(){
    const q=$("productFilter").value.toLowerCase(),cat=$("categoryFilter").value,sub=$("subcategoryFilterProducts").value;
    const list=products.filter(p=>(!cat||p.category_id===cat)&&(!sub||p.subcategory_id===sub)&&(!q||`${p.name} ${p.description||""}`.toLowerCase().includes(q)));
    $("productsTable").innerHTML=list.map(p=>row(p,"product",p.name,p.description,p.image_url,`${p.categories?.name||""}${p.subcategories?.name?" · "+p.subcategories.name:""} · ${money(p.price)}`)).join("")||"<p>No hay productos.</p>";bind()
  }
  function renderProjects(){$("projectsTable").innerHTML=projects.map(p=>row(p,"project",p.title,p.description,p.image_url)).join("")||"<p>No hay proyectos.</p>";bind()}

  function openEmpty(id){
    const d=$(id),form=d.querySelector("form");form.reset();form.querySelector('input[type="hidden"]').value="";
    d.querySelectorAll(".image-preview").forEach(x=>x.innerHTML="");
    if(id==="categoryDialog")$("categoryActive").checked=true;
    if(id==="subcategoryDialog")$("subcategoryActive").checked=true;
    if(id==="productDialog"){$("productActive").checked=true;updateProductSubs()}
    if(id==="projectDialog")$("projectActive").checked=true;
    d.showModal();
  }
  function edit(type,id){
    if(type==="category"){const x=categories.find(v=>v.id===id);$("categoryId").value=x.id;$("categoryName").value=x.name;$("categoryDescription").value=x.description||"";$("categoryOrder").value=x.sort_order||0;$("categoryActive").checked=x.active;$("categoryPreview").innerHTML=x.image_url?`<img src="${x.image_url}">`:"";$("categoryDialog").showModal()}
    if(type==="subcategory"){const x=subcategories.find(v=>v.id===id);$("subcategoryId").value=x.id;$("subcategoryCategory").value=x.category_id;$("subcategoryName").value=x.name;$("subcategoryDescription").value=x.description||"";$("subcategoryOrder").value=x.sort_order||0;$("subcategoryActive").checked=x.active;$("subcategoryPreview").innerHTML=x.image_url?`<img src="${x.image_url}">`:"";$("subcategoryDialog").showModal()}
    if(type==="product"){const x=products.find(v=>v.id===id);$("productId").value=x.id;$("productCategory").value=x.category_id;updateProductSubs(x.subcategory_id);$("productName").value=x.name;$("productDescription").value=x.description||"";$("productPrice").value=x.price??"";$("productOrder").value=x.sort_order||0;$("productActive").checked=x.active;$("productPreview").innerHTML=x.image_url?`<img src="${x.image_url}">`:"";$("productDialog").showModal()}
    if(type==="project"){const x=projects.find(v=>v.id===id);$("projectId").value=x.id;$("projectTitle").value=x.title;$("projectDescription").value=x.description||"";$("projectOrder").value=x.sort_order||0;$("projectActive").checked=x.active;$("projectPreview").innerHTML=x.image_url?`<img src="${x.image_url}">`:"";$("projectDialog").showModal()}
  }
  async function upload(file,folder){
    if(!file)return null;
    if(file.size>10*1024*1024)throw new Error("La imagen supera 10 MB.");
    const ext=(file.name.split(".").pop()||"jpg").toLowerCase(),path=`${folder}/${crypto.randomUUID()}.${ext}`;
    const {error}=await sb.storage.from(bucket).upload(path,file,{cacheControl:"3600"});
    if(error)throw error;
    return sb.storage.from(bucket).getPublicUrl(path).data.publicUrl;
  }
  async function save(form,table,id,payload,file,folder,dialog){
    try{message(form,"Guardando…",false);if(file)payload.image_url=await upload(file,folder);
      const {error}=await(id?sb.from(table).update(payload).eq("id",id):sb.from(table).insert(payload));
      if(error)throw error;dialog.close();toast("Guardado");await loadAll()
    }catch(e){console.error(e);message(form,e.message||"No se pudo guardar.")}
  }
  $("categoryForm").addEventListener("submit",e=>{e.preventDefault();save(e.currentTarget,"categories",$("categoryId").value,{name:$("categoryName").value.trim(),description:$("categoryDescription").value.trim()||null,sort_order:Number($("categoryOrder").value)||0,active:$("categoryActive").checked},$("categoryImage").files[0],"categories",$("categoryDialog"))});
  $("subcategoryForm").addEventListener("submit",e=>{e.preventDefault();save(e.currentTarget,"subcategories",$("subcategoryId").value,{category_id:$("subcategoryCategory").value,name:$("subcategoryName").value.trim(),description:$("subcategoryDescription").value.trim()||null,sort_order:Number($("subcategoryOrder").value)||0,active:$("subcategoryActive").checked},$("subcategoryImage").files[0],"subcategories",$("subcategoryDialog"))});
  $("productForm").addEventListener("submit",e=>{e.preventDefault();save(e.currentTarget,"products",$("productId").value,{category_id:$("productCategory").value,subcategory_id:$("productSubcategory").value||null,name:$("productName").value.trim(),description:$("productDescription").value.trim()||null,price:$("productPrice").value===""?null:Number($("productPrice").value),sort_order:Number($("productOrder").value)||0,active:$("productActive").checked},$("productImage").files[0],"products",$("productDialog"))});
  $("projectForm").addEventListener("submit",e=>{e.preventDefault();save(e.currentTarget,"projects",$("projectId").value,{title:$("projectTitle").value.trim(),description:$("projectDescription").value.trim()||null,sort_order:Number($("projectOrder").value)||0,active:$("projectActive").checked},$("projectImage").files[0],"projects",$("projectDialog"))});

  async function toggle(type,id){
    const map={category:["categories",categories],subcategory:["subcategories",subcategories],product:["products",products],project:["projects",projects]};
    const [table,list]=map[type],x=list.find(v=>v.id===id);const {error}=await sb.from(table).update({active:!x.active}).eq("id",id);
    if(error)return toast("No se pudo cambiar");await loadAll()
  }
  async function remove(type,id){
    const labels={category:"esta categoría y todo lo relacionado",subcategory:"esta subcategoría",product:"este producto",project:"este proyecto"};
    if(!confirm(`¿Eliminar ${labels[type]}?`))return;
    const table={category:"categories",subcategory:"subcategories",product:"products",project:"projects"}[type];
    const {error}=await sb.from(table).delete().eq("id",id);if(error)return toast("No se pudo eliminar");await loadAll()
  }
  ["categoryImage","subcategoryImage","productImage","projectImage"].forEach(id=>$(id).addEventListener("change",e=>{
    const file=e.target.files[0];$(id.replace("Image","Preview")).innerHTML=file?`<img src="${URL.createObjectURL(file)}">`:"";
  }));
  init();
})();