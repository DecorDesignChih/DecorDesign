(function(){
  "use strict";

  var cfg = window.DECOR_CONFIG || {};
  var client = null;
  var bucket = cfg.STORAGE_BUCKET || "decor-images";
  var data = {categories:[], subcategories:[], products:[], projects:[]};

  function el(id){ return document.getElementById(id); }
  function esc(value){
    return String(value == null ? "" : value).replace(/[&<>"']/g,function(ch){
      return {"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"}[ch];
    });
  }
  function uuid(){
    if(window.crypto && typeof window.crypto.randomUUID === "function") return window.crypto.randomUUID();
    return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(c){
      var r=Math.random()*16|0, v=c==="x"?r:(r&3|8); return v.toString(16);
    });
  }
  function money(v){
    if(v === null || v === undefined || v === "") return "Sin precio";
    try{return new Intl.NumberFormat("es-MX",{style:"currency",currency:"MXN"}).format(Number(v));}
    catch(e){return "$"+Number(v).toFixed(2);}
  }
  function status(text,type){
    var box=el("appStatus"); box.textContent=text || "";
    box.className="status-banner"+(type?" "+type:"");
  }
  function toast(text){
    var box=el("toast"); box.textContent=text; box.classList.add("show");
    setTimeout(function(){box.classList.remove("show");},2500);
  }
  function showLogin(){
    el("loginView").classList.remove("hidden");
    el("dashboardView").classList.add("hidden");
    status("", "ok");
  }
  function showDashboard(){
    el("loginView").classList.add("hidden");
    el("dashboardView").classList.remove("hidden");
    status("", "ok");
  }
  function openModal(id){el(id).classList.remove("hidden");document.body.style.overflow="hidden";}
  function closeModal(node){node.classList.add("hidden");document.body.style.overflow="";}
  function formError(form,text){form.querySelector(".form-error").textContent=text || "";}
  function imagePreview(input,preview){
    var file=input.files && input.files[0];
    if(!file){preview.innerHTML="";return;}
    var reader=new FileReader();
    reader.onload=function(){preview.innerHTML='<img src="'+reader.result+'" alt="Vista previa">';};
    reader.readAsDataURL(file);
  }

  function setupClient(){
    if(!cfg.SUPABASE_URL || !cfg.SUPABASE_ANON_KEY) throw new Error("Falta configuración de Supabase.");
    if(!window.supabase || !window.supabase.createClient) throw new Error("No se cargó la biblioteca de Supabase.");
    client=window.supabase.createClient(cfg.SUPABASE_URL,cfg.SUPABASE_ANON_KEY);
  }

  async function init(){
    try{
      setupClient();
      status("Conectando con Decor Design…");
      var response=await client.auth.getSession();
      var session=response.data ? response.data.session : null;
      if(session) await authorizeAndLoad();
      else showLogin();
      client.auth.onAuthStateChange(function(event,sessionNow){
        if(!sessionNow) showLogin();
      });
    }catch(error){
      console.error(error);
      status("No se pudo cargar el panel: "+(error.message || error), "error");
      showLogin();
    }
  }

  async function authorizeAndLoad(){
    var check=await client.rpc("is_admin");
    if(check.error || !check.data){
      await client.auth.signOut();
      el("loginError").textContent="Este usuario no tiene permiso de administrador.";
      showLogin();
      return;
    }
    showDashboard();
    await loadAll();
  }

  async function loadAll(){
    status("Cargando información…");
    var results=await Promise.all([
      client.from("categories").select("*").order("sort_order").order("name"),
      client.from("subcategories").select("*,categories(name)").order("sort_order").order("name"),
      client.from("products").select("*,categories(name),subcategories(name)").order("sort_order").order("name"),
      client.from("projects").select("*").order("sort_order").order("title")
    ]);
    for(var i=0;i<results.length;i++){
      if(results[i].error){console.error(results[i].error);status("Error al cargar datos: "+results[i].error.message,"error");return;}
    }
    data.categories=results[0].data || [];
    data.subcategories=results[1].data || [];
    data.products=results[2].data || [];
    data.projects=results[3].data || [];
    renderAll(); status("","ok");
  }

  function categoryOptions(emptyText){
    var html='<option value="">'+emptyText+'</option>';
    data.categories.forEach(function(c){html+='<option value="'+c.id+'">'+esc(c.name)+'</option>';});
    return html;
  }
  function fillSelects(){
    el("subcategoryCategory").innerHTML=categoryOptions("Selecciona una categoría");
    el("productCategory").innerHTML=categoryOptions("Selecciona una categoría");
    el("subCategoryFilter").innerHTML=categoryOptions("Todas las categorías");
    el("productCategoryFilter").innerHTML=categoryOptions("Todas las categorías");
    updateProductSubSelect("");
    updateProductFilterSubs();
  }
  function updateProductSubSelect(selected){
    var cat=el("productCategory").value;
    var html='<option value="">Sin subcategoría</option>';
    data.subcategories.filter(function(s){return s.category_id===cat;}).forEach(function(s){
      html+='<option value="'+s.id+'">'+esc(s.name)+'</option>';
    });
    el("productSubcategory").innerHTML=html;
    el("productSubcategory").value=selected || "";
  }
  function updateProductFilterSubs(){
    var cat=el("productCategoryFilter").value;
    var list=cat?data.subcategories.filter(function(s){return s.category_id===cat;}):data.subcategories;
    var html='<option value="">Todas las subcategorías</option>';
    list.forEach(function(s){html+='<option value="'+s.id+'">'+esc(s.name)+'</option>';});
    el("productSubFilter").innerHTML=html;
  }
  function record(item,type,title,desc,image,meta){
    return '<article class="record" data-type="'+type+'" data-id="'+item.id+'">'+
      '<img src="'+esc(image || "assets/hero.jpg")+'" alt="">'+
      '<div><h3>'+esc(title)+'</h3><p>'+esc(desc || "Sin descripción")+'</p></div>'+
      '<div class="record-meta"><p>'+esc(meta || "")+'</p><span class="badge '+(item.active?"":"off")+'">'+(item.active?"Visible":"Oculto")+'</span><p>Orden: '+(item.sort_order || 0)+'</p></div>'+
      '<div class="record-actions"><button class="edit" type="button">Editar</button><button class="toggle" type="button">'+(item.active?"Ocultar":"Mostrar")+'</button><button class="delete" type="button">Eliminar</button></div></article>';
  }
  function renderAll(){
    el("countCategories").textContent=data.categories.length;
    el("countSubcategories").textContent=data.subcategories.length;
    el("countProducts").textContent=data.products.length;
    el("countProjects").textContent=data.projects.length;
    fillSelects(); renderCategories(); renderSubcategories(); renderProducts(); renderProjects();
  }
  function renderCategories(){
    el("categoriesList").innerHTML=data.categories.map(function(c){return record(c,"category",c.name,c.description,c.image_url,"");}).join("") || "<p>No hay categorías.</p>";
    bindRecords();
  }
  function renderSubcategories(){
    var q=el("subSearch").value.toLowerCase(), cat=el("subCategoryFilter").value;
    var list=data.subcategories.filter(function(s){
      return (!cat || s.category_id===cat) && (!q || (s.name+" "+(s.description||"")).toLowerCase().indexOf(q)>=0);
    });
    el("subcategoriesList").innerHTML=list.map(function(s){return record(s,"subcategory",s.name,s.description,s.image_url,s.categories?s.categories.name:"");}).join("") || "<p>No hay subcategorías.</p>";
    bindRecords();
  }
  function renderProducts(){
    var q=el("productSearch").value.toLowerCase(), cat=el("productCategoryFilter").value, sub=el("productSubFilter").value;
    var list=data.products.filter(function(p){
      return (!cat || p.category_id===cat) && (!sub || p.subcategory_id===sub) && (!q || (p.name+" "+(p.description||"")).toLowerCase().indexOf(q)>=0);
    });
    el("productsList").innerHTML=list.map(function(p){
      var meta=(p.categories?p.categories.name:"")+(p.subcategories?" · "+p.subcategories.name:"")+" · "+money(p.price);
      return record(p,"product",p.name,p.description,p.image_url,meta);
    }).join("") || "<p>No hay productos.</p>";
    bindRecords();
  }
  function renderProjects(){
    el("projectsList").innerHTML=data.projects.map(function(p){return record(p,"project",p.title,p.description,p.image_url,"");}).join("") || "<p>No hay proyectos.</p>";
    bindRecords();
  }
  function bindRecords(){
    var rows=document.querySelectorAll(".record");
    Array.prototype.forEach.call(rows,function(row){
      row.querySelector(".edit").onclick=function(){editEntity(row.getAttribute("data-type"),row.getAttribute("data-id"));};
      row.querySelector(".toggle").onclick=function(){toggleEntity(row.getAttribute("data-type"),row.getAttribute("data-id"));};
      row.querySelector(".delete").onclick=function(){deleteEntity(row.getAttribute("data-type"),row.getAttribute("data-id"));};
    });
  }

  function resetForm(modalId){
    var modal=el(modalId), form=modal.querySelector("form"); form.reset();
    form.querySelector('input[type="hidden"]').value="";
    formError(form,""); var preview=form.querySelector(".preview"); if(preview)preview.innerHTML="";
    var check=form.querySelector('input[type="checkbox"]'); if(check)check.checked=true;
  }
  function editEntity(type,id){
    var x;
    if(type==="category"){
      x=data.categories.find(function(v){return v.id===id;}); resetForm("categoryModal");
      el("categoryId").value=x.id;el("categoryName").value=x.name;el("categoryDescription").value=x.description||"";el("categoryOrder").value=x.sort_order||0;el("categoryActive").checked=x.active;
      if(x.image_url)el("categoryPreview").innerHTML='<img src="'+esc(x.image_url)+'">'; el("categoryModalTitle").textContent="Editar categoría";openModal("categoryModal");
    }else if(type==="subcategory"){
      x=data.subcategories.find(function(v){return v.id===id;}); resetForm("subcategoryModal");
      el("subcategoryId").value=x.id;el("subcategoryCategory").value=x.category_id;el("subcategoryName").value=x.name;el("subcategoryDescription").value=x.description||"";el("subcategoryOrder").value=x.sort_order||0;el("subcategoryActive").checked=x.active;
      if(x.image_url)el("subcategoryPreview").innerHTML='<img src="'+esc(x.image_url)+'">'; el("subcategoryModalTitle").textContent="Editar subcategoría";openModal("subcategoryModal");
    }else if(type==="product"){
      x=data.products.find(function(v){return v.id===id;}); resetForm("productModal");
      el("productId").value=x.id;el("productCategory").value=x.category_id;updateProductSubSelect(x.subcategory_id||"");el("productName").value=x.name;el("productDescription").value=x.description||"";el("productPrice").value=x.price==null?"":x.price;el("productOrder").value=x.sort_order||0;el("productActive").checked=x.active;
      if(x.image_url)el("productPreview").innerHTML='<img src="'+esc(x.image_url)+'">'; el("productModalTitle").textContent="Editar producto";openModal("productModal");
    }else{
      x=data.projects.find(function(v){return v.id===id;}); resetForm("projectModal");
      el("projectId").value=x.id;el("projectTitle").value=x.title;el("projectDescription").value=x.description||"";el("projectOrder").value=x.sort_order||0;el("projectActive").checked=x.active;
      if(x.image_url)el("projectPreview").innerHTML='<img src="'+esc(x.image_url)+'">'; el("projectModalTitle").textContent="Editar proyecto";openModal("projectModal");
    }
  }

  async function uploadImage(file,folder){
    if(!file)return null;
    if(file.size>10*1024*1024)throw new Error("La imagen supera 10 MB.");
    var ext=(file.name.split(".").pop()||"jpg").toLowerCase().replace(/[^a-z0-9]/g,"");
    var path=folder+"/"+Date.now()+"-"+uuid()+"."+ext;
    var result=await client.storage.from(bucket).upload(path,file,{cacheControl:"3600",upsert:false,contentType:file.type});
    if(result.error)throw result.error;
    return client.storage.from(bucket).getPublicUrl(path).data.publicUrl;
  }
  async function saveEntity(form,table,id,payload,file,folder,modalId){
    try{
      formError(form,"Guardando…");
      if(file)payload.image_url=await uploadImage(file,folder);
      var result=id?await client.from(table).update(payload).eq("id",id):await client.from(table).insert(payload);
      if(result.error)throw result.error;
      closeModal(el(modalId));toast("Guardado correctamente");await loadAll();
    }catch(error){console.error(error);formError(form,error.message || "No se pudo guardar.");}
  }
  async function toggleEntity(type,id){
    var map={category:["categories",data.categories],subcategory:["subcategories",data.subcategories],product:["products",data.products],project:["projects",data.projects]};
    var table=map[type][0], list=map[type][1], item=list.find(function(v){return v.id===id;});
    var result=await client.from(table).update({active:!item.active}).eq("id",id);
    if(result.error){toast("No se pudo cambiar.");return;}await loadAll();
  }
  async function deleteEntity(type,id){
    var labels={category:"esta categoría y todo lo relacionado",subcategory:"esta subcategoría",product:"este producto",project:"este proyecto"};
    if(!window.confirm("¿Seguro que deseas eliminar "+labels[type]+"?"))return;
    var table={category:"categories",subcategory:"subcategories",product:"products",project:"projects"}[type];
    var result=await client.from(table).delete().eq("id",id);
    if(result.error){toast("No se pudo eliminar.");return;}toast("Eliminado");await loadAll();
  }

  function bind(){
    el("loginForm").onsubmit=async function(event){
      event.preventDefault();el("loginError").textContent="Ingresando…";
      try{
        var result=await client.auth.signInWithPassword({email:el("loginEmail").value.trim(),password:el("loginPassword").value});
        if(result.error)throw result.error;el("loginError").textContent="";await authorizeAndLoad();
      }catch(error){el("loginError").textContent=error.message || "No se pudo iniciar sesión.";}
    };
    el("logoutBtn").onclick=function(){client.auth.signOut();};
    Array.prototype.forEach.call(document.querySelectorAll(".tab"),function(btn){
      btn.onclick=function(){
        Array.prototype.forEach.call(document.querySelectorAll(".tab"),function(x){x.classList.remove("active");});
        Array.prototype.forEach.call(document.querySelectorAll(".panel"),function(x){x.classList.remove("active");});
        btn.classList.add("active");el(btn.getAttribute("data-panel")).classList.add("active");
      };
    });
    Array.prototype.forEach.call(document.querySelectorAll(".open-modal"),function(btn){
      btn.onclick=function(){
        var id=btn.getAttribute("data-modal");resetForm(id);
        if(id==="categoryModal")el("categoryModalTitle").textContent="Agregar categoría";
        if(id==="subcategoryModal")el("subcategoryModalTitle").textContent="Agregar subcategoría";
        if(id==="productModal"){el("productModalTitle").textContent="Agregar producto";updateProductSubSelect("");}
        if(id==="projectModal")el("projectModalTitle").textContent="Agregar proyecto";
        openModal(id);
      };
    });
    Array.prototype.forEach.call(document.querySelectorAll(".close-modal"),function(btn){btn.onclick=function(){closeModal(btn.closest(".modal"));};});
    Array.prototype.forEach.call(document.querySelectorAll(".modal"),function(modal){modal.onclick=function(e){if(e.target===modal)closeModal(modal);};});
    el("productCategory").onchange=function(){updateProductSubSelect("");};
    el("subSearch").oninput=renderSubcategories;el("subCategoryFilter").onchange=renderSubcategories;
    el("productSearch").oninput=renderProducts;el("productCategoryFilter").onchange=function(){updateProductFilterSubs();renderProducts();};el("productSubFilter").onchange=renderProducts;
    [["categoryImage","categoryPreview"],["subcategoryImage","subcategoryPreview"],["productImage","productPreview"],["projectImage","projectPreview"]].forEach(function(pair){
      el(pair[0]).onchange=function(){imagePreview(el(pair[0]),el(pair[1]));};
    });
    el("categoryForm").onsubmit=function(e){e.preventDefault();saveEntity(this,"categories",el("categoryId").value,{name:el("categoryName").value.trim(),description:el("categoryDescription").value.trim()||null,sort_order:Number(el("categoryOrder").value)||0,active:el("categoryActive").checked},el("categoryImage").files[0],"categories","categoryModal");};
    el("subcategoryForm").onsubmit=function(e){e.preventDefault();saveEntity(this,"subcategories",el("subcategoryId").value,{category_id:el("subcategoryCategory").value,name:el("subcategoryName").value.trim(),description:el("subcategoryDescription").value.trim()||null,sort_order:Number(el("subcategoryOrder").value)||0,active:el("subcategoryActive").checked},el("subcategoryImage").files[0],"subcategories","subcategoryModal");};
    el("productForm").onsubmit=function(e){e.preventDefault();saveEntity(this,"products",el("productId").value,{category_id:el("productCategory").value,subcategory_id:el("productSubcategory").value||null,name:el("productName").value.trim(),description:el("productDescription").value.trim()||null,price:el("productPrice").value===""?null:Number(el("productPrice").value),sort_order:Number(el("productOrder").value)||0,active:el("productActive").checked},el("productImage").files[0],"products","productModal");};
    el("projectForm").onsubmit=function(e){e.preventDefault();saveEntity(this,"projects",el("projectId").value,{title:el("projectTitle").value.trim(),description:el("projectDescription").value.trim()||null,sort_order:Number(el("projectOrder").value)||0,active:el("projectActive").checked},el("projectImage").files[0],"projects","projectModal");};
  }

  document.addEventListener("DOMContentLoaded",function(){bind();init();});
})();