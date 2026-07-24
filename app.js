(() => {
  const cfg = window.DECOR_CONFIG || {};
  const sb = supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY);
  const fallbackImage = "assets/hero.jpg";

  const HERO_FALLBACK = "assets/hero-trabajo-1.jpg";
  const CATEGORY_IMAGES = {
    "lambrin":"assets/category-lambrin.jpg",
    "placas":"assets/category-placas-pvc.jpg",
    "tapiz":"assets/category-papel-tapiz.jpg",
    "papel tapiz":"assets/category-papel-tapiz.jpg",
    "persianas":"assets/category-persianas.jpg",
    "accesorios para muros":"assets/category-vigas.jpg",
    "pisos":"assets/category-decor.jpg",
    "deck":"assets/proyecto-walnut.jpg",
    "pasto sintetico":"assets/category-decor.jpg",
    "decor":"assets/category-decor.jpg"
  };
  const normalizeName = value => String(value || "")
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
  const categoryFallback = name => {
    const key = normalizeName(name);
    return CATEGORY_IMAGES[key] ||
      (key.includes("lambrin") ? CATEGORY_IMAGES["lambrin"] :
       key.includes("placa") ? CATEGORY_IMAGES["placas"] :
       key.includes("persiana") ? CATEGORY_IMAGES["persianas"] :
       key.includes("tapiz") ? CATEGORY_IMAGES["tapiz"] :
       key.includes("piso") ? CATEGORY_IMAGES["pisos"] :
       key.includes("deck") ? CATEGORY_IMAGES["deck"] :
       key.includes("pasto") ? CATEGORY_IMAGES["pasto sintetico"] :
       key.includes("accesorio") ? CATEGORY_IMAGES["accesorios para muros"] :
       key.includes("viga") ? CATEGORY_IMAGES["vigas"] :
       CATEGORY_IMAGES["decor"]);
  };
  const preferredImage = (url, fallback) => {
    const value = String(url || "").trim();
    return value && value !== "null" && value !== "undefined" ? value : fallback;
  };
  const imageError = fallback => `this.onerror=null;this.src='${fallback}'`;

  let categories = [], subcategories = [], products = [], projects = [];

  const esc = s => String(s ?? "").replace(/[&<>"']/g, m => ({
    "&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"
  }[m]));
  const money = v => v === null || v === ""
    ? "Consultar precio"
    : new Intl.NumberFormat("es-MX",{style:"currency",currency:"MXN"}).format(Number(v));
  const wa = text => `https://wa.me/${cfg.WHATSAPP_NUMBER || "526563420737"}?text=${encodeURIComponent(text)}`;

  document.querySelectorAll(".js-whatsapp").forEach(a => {
    a.href = wa("Hola, vi la página de Decor Design y quiero solicitar una cotización.");
    a.target = "_blank"; a.rel = "noopener";
  });

  const menuToggle = document.getElementById("menuToggle");
  const nav = document.getElementById("mainNav");
  menuToggle?.addEventListener("click", () => {
    const open = nav.classList.toggle("open");
    menuToggle.textContent = open ? "×" : "☰";
  });


  const heroSlides = [...document.querySelectorAll(".hero-slide")];
  const heroDots = [...document.querySelectorAll(".hero-dots span")];
  let heroSlideIndex = 0;
  let heroTimer = null;

  function showHeroSlide(index){
    if(!heroSlides.length)return;
    heroSlideIndex = (index + heroSlides.length) % heroSlides.length;
    heroSlides.forEach((slide,i)=>slide.classList.toggle("active",i===heroSlideIndex));
    heroDots.forEach((dot,i)=>dot.classList.toggle("active",i===heroSlideIndex));
  }

  function startHeroSlideshow(){
    if(heroSlides.length < 2 || window.matchMedia("(prefers-reduced-motion: reduce)").matches)return;
    clearInterval(heroTimer);
    heroTimer = setInterval(()=>showHeroSlide(heroSlideIndex + 1),5500);
  }

  heroDots.forEach((dot,i)=>dot.addEventListener("click",()=>{
    showHeroSlide(i);
    startHeroSlideshow();
  }));
  document.addEventListener("visibilitychange",()=>{
    if(document.hidden)clearInterval(heroTimer);
    else startHeroSlideshow();
  });
  showHeroSlide(0);
  startHeroSlideshow();

  const observer = new IntersectionObserver(entries => entries.forEach(e => {
    if(e.isIntersecting){ e.target.classList.add("visible"); observer.unobserve(e.target); }
  }), {threshold:.1});
  document.querySelectorAll(".reveal").forEach(el => observer.observe(el));

  async function loadData(){
    const [c,s,p,j] = await Promise.all([
      sb.from("categories").select("*").eq("active",true).order("sort_order").order("name"),
      sb.from("subcategories").select("*").eq("active",true).order("sort_order").order("name"),
      sb.from("products").select("*").eq("active",true).order("sort_order").order("name"),
      sb.from("projects").select("*").eq("active",true).order("sort_order").order("title")
    ]);
    if(c.error || s.error || p.error || j.error){
      console.error(c.error,s.error,p.error,j.error);
      document.getElementById("categoryGrid").innerHTML =
        '<div class="empty-state">Primero ejecuta el archivo SQL de subcategorías en Supabase.</div>';
      return;
    }
    categories=c.data||[]; subcategories=s.data||[]; products=p.data||[]; projects=j.data||[];
    renderCategories(); renderProjects();
  }

  function renderCategories(){
    const el=document.getElementById("categoryGrid");
    if(!categories.length){el.innerHTML='<div class="empty-state">Todavía no hay categorías.</div>';return;}
    el.innerHTML=categories.map(c=>`
      <article class="category-card" data-id="${c.id}">
        <img src="${preferredImage(c.image_url, categoryFallback(c.name))}" onerror="${imageError(categoryFallback(c.name))}" alt="${esc(c.name)}">
        <div class="category-card-content">
          <h3>${esc(c.name)}</h3>
          <p>${esc(c.description||"Conoce nuestras opciones disponibles.")}</p>
          <span class="text-link">Ver opciones →</span>
        </div>
      </article>`).join("");
    el.querySelectorAll(".category-card").forEach(card =>
      card.addEventListener("click",()=>openCategory(card.dataset.id))
    );
  }

  function openCategory(categoryId){
    const category=categories.find(c=>c.id===categoryId);
    const list=subcategories.filter(s=>s.category_id===categoryId);
    if(!list.length){
      openProducts(categoryId,null,category?.name||"Productos",category?.description||"");
      return;
    }
    document.getElementById("subcategoryCategoryTitle").textContent=category.name;
    document.getElementById("subcategoryCategoryDescription").textContent=category.description||"";
    const grid=document.getElementById("subcategoriesGrid");
    grid.innerHTML=list.map(s=>`
      <article class="subcategory-card" data-id="${s.id}">
        <img src="${preferredImage(s.image_url, preferredImage(category.image_url, categoryFallback(category.name)))}" onerror="${imageError(categoryFallback(category.name))}" alt="${esc(s.name)}">
        <div><h3>${esc(s.name)}</h3><p>${esc(s.description||"Consulta productos, modelos y precios.")}</p>
        <span class="text-link">Ver productos →</span></div>
      </article>`).join("");
    grid.querySelectorAll(".subcategory-card").forEach(card =>
      card.addEventListener("click",()=>{
        const sub=list.find(s=>s.id===card.dataset.id);
        document.getElementById("subcategoriesModal").close();
        openProducts(categoryId,sub.id,sub.name,sub.description||"");
      })
    );
    document.getElementById("subcategoriesModal").showModal();
  }

  function openProducts(categoryId,subcategoryId,title,description){
    const list=products.filter(p =>
      p.category_id===categoryId &&
      (subcategoryId ? p.subcategory_id===subcategoryId : true)
    );
    document.getElementById("modalCategoryTitle").textContent=title;
    document.getElementById("modalCategoryDescription").textContent=description;
    renderProducts(list);
    document.getElementById("productsModal").showModal();
    const search=document.getElementById("productSearch");
    search.value="";
    search.oninput=()=>{
      const q=search.value.toLowerCase();
      renderProducts(list.filter(p=>`${p.name} ${p.description||""}`.toLowerCase().includes(q)));
    };
  }

  function renderProducts(list){
    const el=document.getElementById("productsGrid");
    if(!list.length){el.innerHTML='<div class="empty-state">No hay productos publicados aquí todavía.</div>';return;}
    el.innerHTML=list.map(p=>`
      <article class="model-card">
        <img src="${preferredImage(p.image_url, categoryFallback(categories.find(c=>c.id===p.category_id)?.name))}" onerror="${imageError(categoryFallback(categories.find(c=>c.id===p.category_id)?.name))}" alt="${esc(p.name)}">
        <div><h3>${esc(p.name)}</h3><p>${esc(p.description||"")}</p>
        <div class="price">${money(p.price)}</div>
        <a class="text-link" target="_blank" rel="noopener"
        href="${wa(`Hola, quiero información y cotización del producto: ${p.name}.`)}">Cotizar este producto →</a></div>
      </article>`).join("");
  }

  function renderProjects(){
    const el=document.getElementById("projectGrid");
    if(!projects.length){el.innerHTML='<div class="empty-state">Todavía no hay proyectos.</div>';return;}
    el.innerHTML=projects.map(p=>`
      <figure class="project" data-id="${p.id}">
        <img src="${preferredImage(p.image_url, HERO_FALLBACK)}" onerror="${imageError(HERO_FALLBACK)}" alt="${esc(p.title)}">
        <figcaption><b>${esc(p.title)}</b><span>${esc(p.description||"")}</span></figcaption>
      </figure>`).join("");
    el.querySelectorAll(".project").forEach(card=>card.addEventListener("click",()=>{
      const p=projects.find(x=>x.id===card.dataset.id);
      document.getElementById("projectModalImage").src=preferredImage(p.image_url,HERO_FALLBACK);
      document.getElementById("projectModalTitle").textContent=p.title;
      document.getElementById("projectModalDescription").textContent=p.description||"";
      document.getElementById("projectQuote").href=wa(`Hola, quiero un proyecto parecido a: ${p.title}.`);
      document.getElementById("projectModal").showModal();
    }));
  }

  document.getElementById("closeSubcategoriesModal")?.addEventListener("click",()=>document.getElementById("subcategoriesModal").close());
  document.getElementById("closeProductsModal")?.addEventListener("click",()=>document.getElementById("productsModal").close());
  document.getElementById("closeProjectModal")?.addEventListener("click",()=>document.getElementById("projectModal").close());
  loadData();
})();