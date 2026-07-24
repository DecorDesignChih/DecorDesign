(() => {
  "use strict";

  const cfg = window.DECOR_CONFIG || {};
  const categoryGrid = document.getElementById("categoryGrid");

  const esc = value => String(value ?? "").replace(/[&<>"']/g, ch => ({
    "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#039;"
  }[ch]));

  const normalizeName = value => String(value || "")
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();

  const placeholderImage = (label, eyebrow = "DECOR DESIGN") => {
    const safeLabel = esc(String(label || "Producto").slice(0, 64));
    const safeEyebrow = esc(eyebrow);
    let hash = 0;
    for (const ch of String(label || "")) hash = ((hash << 5) - hash + ch.charCodeAt(0)) | 0;
    const hue = Math.abs(hash) % 48 + 22;
    const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="800" viewBox="0 0 1200 800">
      <defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop stop-color="hsl(${hue} 32% 18%)"/><stop offset="1" stop-color="#090909"/></linearGradient></defs>
      <rect width="1200" height="800" fill="url(#g)"/>
      <path d="M-80 610 L500 40 L650 40 L70 610 Z" fill="rgba(211,162,81,.10)"/>
      <path d="M400 800 L1000 200 L1140 200 L540 800 Z" fill="rgba(255,255,255,.035)"/>
      <text x="80" y="590" fill="#d3a251" font-family="Arial,sans-serif" font-size="30" font-weight="700" letter-spacing="7">${safeEyebrow}</text>
      <foreignObject x="80" y="625" width="1030" height="130"><div xmlns="http://www.w3.org/1999/xhtml" style="font-family:Arial,sans-serif;font-size:48px;font-weight:700;line-height:1.08;color:#fff;">${safeLabel}</div></foreignObject>
    </svg>`;
    return `data:image/svg+xml;charset=UTF-8,${encodeURIComponent(svg)}`;
  };

  const HERO_FALLBACK = "assets/hero-trabajo-1.jpg";
  const CATEGORY_IMAGES = {
    "lambrin":"assets/category-lambrin.jpg",
    "placas":"assets/category-placas-pvc.jpg",
    "tapiz":"assets/category-papel-tapiz.jpg",
    "papel tapiz":"assets/category-papel-tapiz.jpg",
    "persianas":"assets/category-persianas.jpg",
    "accesorios para muros":"assets/category-decor.jpg",
    "vigas interior y exterior pvc":"assets/productos/vigas/m-vigapu-02-castano.jpg",
    "vigas":"assets/productos/vigas/m-vigapu-02-castano.jpg",
    "pisos":"assets/category-decor.jpg",
    "deck":"assets/proyecto-walnut.jpg",
    "pasto sintetico":"assets/category-decor.jpg"
  };

  const categoryFallback = name => CATEGORY_IMAGES[normalizeName(name)] || placeholderImage(name, "CATEGORÍA");
  const isValidImage = value => {
    const url = String(value || "").trim();
    return Boolean(url && url !== "null" && url !== "undefined");
  };
  const preferredImage = (url, fallback) => isValidImage(url) ? String(url).trim() : fallback;
  const imageMarkup = (url, alt, fallback) => `<img loading="lazy" decoding="async" src="${esc(preferredImage(url, fallback))}" data-fallback="${esc(fallback)}" alt="${esc(alt)}">`;
  const bindImageFallbacks = scope => {
    (scope || document).querySelectorAll("img[data-fallback]").forEach(img => {
      const apply = () => {
        if (img.dataset.fallbackApplied === "1") return;
        img.dataset.fallbackApplied = "1";
        img.src = img.dataset.fallback;
      };
      img.addEventListener("error", apply, { once: true });
      if (img.complete && img.naturalWidth === 0) apply();
    });
  };

  const money = value => {
    const number = Number(value);
    if (value === null || value === "" || !Number.isFinite(number) || number <= 0) return "Consultar precio";
    return new Intl.NumberFormat("es-MX", { style:"currency", currency:"MXN" }).format(number);
  };

  const wa = text => `https://wa.me/${cfg.WHATSAPP_NUMBER || "526563420737"}?text=${encodeURIComponent(text)}`;

  document.querySelectorAll(".js-whatsapp").forEach(link => {
    link.href = wa("Hola, vi la página de Decor Design y quiero solicitar una cotización.");
    link.target = "_blank";
    link.rel = "noopener";
  });

  const menuToggle = document.getElementById("menuToggle");
  const nav = document.getElementById("mainNav");
  menuToggle?.addEventListener("click", () => {
    const open = nav?.classList.toggle("open");
    menuToggle.textContent = open ? "×" : "☰";
  });

  const heroSlides = [...document.querySelectorAll(".hero-slide")];
  const heroDots = [...document.querySelectorAll(".hero-dots span")];
  let heroSlideIndex = 0;
  let heroTimer = null;

  function showHeroSlide(index) {
    if (!heroSlides.length) return;
    heroSlideIndex = (index + heroSlides.length) % heroSlides.length;
    heroSlides.forEach((slide, i) => slide.classList.toggle("active", i === heroSlideIndex));
    heroDots.forEach((dot, i) => dot.classList.toggle("active", i === heroSlideIndex));
  }

  function startHeroSlideshow() {
    if (heroSlides.length < 2 || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    clearInterval(heroTimer);
    heroTimer = setInterval(() => showHeroSlide(heroSlideIndex + 1), 5500);
  }

  heroDots.forEach((dot, i) => dot.addEventListener("click", () => {
    showHeroSlide(i);
    startHeroSlideshow();
  }));
  document.addEventListener("visibilitychange", () => {
    if (document.hidden) clearInterval(heroTimer);
    else startHeroSlideshow();
  });
  showHeroSlide(0);
  startHeroSlideshow();

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(entries => entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
        observer.unobserve(entry.target);
      }
    }), { threshold:.1 });
    document.querySelectorAll(".reveal").forEach(el => observer.observe(el));
  } else {
    document.querySelectorAll(".reveal").forEach(el => el.classList.add("visible"));
  }

  let sb = null;
  try {
    if (!window.supabase) throw new Error("No se cargó la librería de Supabase.");
    if (!cfg.SUPABASE_URL || !cfg.SUPABASE_ANON_KEY) throw new Error("Faltan los datos de Supabase en config.js.");
    sb = window.supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY);
  } catch (error) {
    console.error(error);
    if (categoryGrid) categoryGrid.innerHTML = `<div class="empty-state">No se pudo conectar el catálogo. ${esc(error.message)}</div>`;
    return;
  }

  let categories = [];
  let subcategories = [];
  let products = [];
  let projects = [];

  async function loadData() {
    if (categoryGrid) categoryGrid.innerHTML = '<div class="empty-state">Cargando catálogo…</div>';
    const [c, s, p, j] = await Promise.all([
      sb.from("categories").select("*").eq("active", true).order("sort_order").order("name"),
      sb.from("subcategories").select("*").eq("active", true).order("sort_order").order("name"),
      sb.from("products").select("*").eq("active", true).order("sort_order").order("name"),
      sb.from("projects").select("*").eq("active", true).order("sort_order").order("title")
    ]);

    if (c.error || s.error || p.error || j.error) {
      console.error(c.error, s.error, p.error, j.error);
      if (categoryGrid) categoryGrid.innerHTML = '<div class="empty-state">No se pudo cargar el catálogo. Revisa Supabase y vuelve a actualizar.</div>';
      return;
    }

    categories = c.data || [];
    subcategories = s.data || [];
    products = p.data || [];
    projects = j.data || [];
    renderCategories();
    renderProjects();
  }

  function renderCategories() {
    if (!categoryGrid) return;
    if (!categories.length) {
      categoryGrid.innerHTML = '<div class="empty-state">Todavía no hay categorías.</div>';
      return;
    }
    categoryGrid.innerHTML = categories.map(category => {
      const fallback = categoryFallback(category.name);
      return `<article class="category-card" data-id="${category.id}">
        ${imageMarkup(category.image_url, category.name, fallback)}
        <div class="category-card-content">
          <h3>${esc(category.name)}</h3>
          <p>${esc(category.description || "Conoce nuestras opciones disponibles.")}</p>
          <span class="text-link">Ver opciones →</span>
        </div>
      </article>`;
    }).join("");
    bindImageFallbacks(categoryGrid);
    categoryGrid.querySelectorAll(".category-card").forEach(card => {
      card.addEventListener("click", () => openCategory(card.dataset.id));
    });
  }

  function openCategory(categoryId) {
    const category = categories.find(item => item.id === categoryId);
    if (!category) return;
    const list = subcategories.filter(item => item.category_id === categoryId);
    if (!list.length) {
      openProducts(categoryId, null, category.name, category.description || "");
      return;
    }

    document.getElementById("subcategoryCategoryTitle").textContent = category.name;
    document.getElementById("subcategoryCategoryDescription").textContent = category.description || "";
    const grid = document.getElementById("subcategoriesGrid");
    grid.innerHTML = list.map(subcategory => {
      const fallback = placeholderImage(subcategory.name, category.name.toUpperCase());
      return `<article class="subcategory-card" data-id="${subcategory.id}">
        ${imageMarkup(subcategory.image_url, subcategory.name, fallback)}
        <div>
          <h3>${esc(subcategory.name)}</h3>
          <p>${esc(subcategory.description || "Consulta productos, modelos y precios.")}</p>
          <span class="text-link">Ver productos →</span>
        </div>
      </article>`;
    }).join("");
    bindImageFallbacks(grid);
    grid.querySelectorAll(".subcategory-card").forEach(card => {
      card.addEventListener("click", () => {
        const subcategory = list.find(item => item.id === card.dataset.id);
        document.getElementById("subcategoriesModal").close();
        openProducts(categoryId, subcategory.id, subcategory.name, subcategory.description || "");
      });
    });
    document.getElementById("subcategoriesModal").showModal();
  }

  function openProducts(categoryId, subcategoryId, title, description) {
    const list = products.filter(product => product.category_id === categoryId && (subcategoryId ? product.subcategory_id === subcategoryId : true));
    document.getElementById("modalCategoryTitle").textContent = title;
    document.getElementById("modalCategoryDescription").textContent = description;
    renderProducts(list);
    document.getElementById("productsModal").showModal();
    const search = document.getElementById("productSearch");
    search.value = "";
    search.oninput = () => {
      const query = normalizeName(search.value);
      renderProducts(list.filter(product => normalizeName(`${product.name} ${product.sku || ""} ${product.description || ""}`).includes(query)));
    };
  }

  function renderProducts(list) {
    const grid = document.getElementById("productsGrid");
    if (!list.length) {
      grid.innerHTML = '<div class="empty-state">No hay productos publicados aquí todavía.</div>';
      return;
    }
    grid.innerHTML = list.map(product => {
      const category = categories.find(item => item.id === product.category_id);
      const fallback = placeholderImage(product.name, category?.name?.toUpperCase() || "PRODUCTO");
      const sku = product.sku ? `<div class="product-sku">SKU: ${esc(product.sku)}</div>` : "";
      return `<article class="model-card">
        ${imageMarkup(product.image_url, product.name, fallback)}
        <div>
          ${sku}
          <h3>${esc(product.name)}</h3>
          <p>${esc(product.description || "Consulta disponibilidad y recomendaciones de instalación.")}</p>
          <div class="price ${Number(product.price) > 0 ? "" : "price-consult"}">${money(product.price)}</div>
          <a class="text-link" target="_blank" rel="noopener" href="${wa(`Hola, quiero información y cotización del producto: ${product.name}${product.sku ? `, SKU ${product.sku}` : ""}.`)}">Cotizar este producto →</a>
        </div>
      </article>`;
    }).join("");
    bindImageFallbacks(grid);
  }

  function renderProjects() {
    const grid = document.getElementById("projectGrid");
    if (!grid) return;
    if (!projects.length) {
      grid.innerHTML = '<div class="empty-state">Todavía no hay proyectos.</div>';
      return;
    }
    grid.innerHTML = projects.map(project => `<figure class="project" data-id="${project.id}">
      ${imageMarkup(project.image_url, project.title, HERO_FALLBACK)}
      <figcaption><b>${esc(project.title)}</b><span>${esc(project.description || "")}</span></figcaption>
    </figure>`).join("");
    bindImageFallbacks(grid);
    grid.querySelectorAll(".project").forEach(card => card.addEventListener("click", () => {
      const project = projects.find(item => item.id === card.dataset.id);
      if (!project) return;
      const image = document.getElementById("projectModalImage");
      image.src = preferredImage(project.image_url, HERO_FALLBACK);
      image.onerror = () => { image.onerror = null; image.src = HERO_FALLBACK; };
      document.getElementById("projectModalTitle").textContent = project.title;
      document.getElementById("projectModalDescription").textContent = project.description || "";
      document.getElementById("projectQuote").href = wa(`Hola, quiero un proyecto parecido a: ${project.title}.`);
      document.getElementById("projectModal").showModal();
    }));
  }

  document.getElementById("closeSubcategoriesModal")?.addEventListener("click", () => document.getElementById("subcategoriesModal").close());
  document.getElementById("closeProductsModal")?.addEventListener("click", () => document.getElementById("productsModal").close());
  document.getElementById("closeProjectModal")?.addEventListener("click", () => document.getElementById("projectModal").close());

  loadData();
})();
