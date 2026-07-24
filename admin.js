(() => {
  "use strict";
  window.__ADMIN_BOOTED__ = true;

  const cfg = window.DECOR_CONFIG || {};
  const $ = id => document.getElementById(id);
  const authView = $("authView");
  const dashboard = $("dashboard");
  const loginMessage = $("loginMessage");
  const setupWarning = $("setupWarning");

  const revealLogin = message => {
    authView?.classList.remove("hidden");
    dashboard?.classList.add("hidden");
    if (message && loginMessage) loginMessage.textContent = message;
  };

  window.addEventListener("error", event => {
    console.error("Admin error:", event.error || event.message);
    revealLogin("El panel encontró un error. Recarga la página; si continúa, revisa config.js.");
  });
  window.addEventListener("unhandledrejection", event => {
    console.error("Admin promise error:", event.reason);
    revealLogin("No se pudo completar la conexión. Recarga e intenta de nuevo.");
  });

  if (!window.supabase) {
    setupWarning?.classList.remove("hidden");
    revealLogin("No se cargó la librería de Supabase. Verifica tu conexión a internet y recarga.");
    return;
  }
  if (!cfg.SUPABASE_URL || !cfg.SUPABASE_ANON_KEY) {
    setupWarning?.classList.remove("hidden");
    revealLogin("Faltan los datos de Supabase en config.js.");
    return;
  }

  let sb;
  try {
    sb = window.supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY);
  } catch (error) {
    console.error(error);
    setupWarning?.classList.remove("hidden");
    revealLogin("No se pudo iniciar la conexión con Supabase.");
    return;
  }

  const bucket = cfg.STORAGE_BUCKET || "decor-images";
  const HERO_FALLBACK = "assets/hero.jpg";
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
    "pasto sintetico":"assets/category-decor.jpg",
    "decor":"assets/category-decor.jpg"
  };

  const normalizeName = value => String(value || "").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
  const categoryFallback = name => CATEGORY_IMAGES[normalizeName(name)] || CATEGORY_IMAGES.decor;
  const preferredImage = (url, fallback) => {
    const value = String(url || "").trim();
    return value && value !== "null" && value !== "undefined" ? value : fallback;
  };
  const esc = value => String(value ?? "").replace(/[&<>"']/g, ch => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"}[ch]));
  const money = value => {
    const number = Number(value);
    return value === null || value === "" || !Number.isFinite(number) || number <= 0
      ? "Sin precio"
      : new Intl.NumberFormat("es-MX", { style:"currency", currency:"MXN" }).format(number);
  };
  const toast = message => {
    const element = $("toast");
    if (!element) return;
    element.textContent = message;
    element.classList.add("show");
    setTimeout(() => element.classList.remove("show"), 2600);
  };
  const formMessage = (form, text, error = true) => {
    const element = form?.querySelector(".form-message");
    if (!element) return;
    element.textContent = text;
    element.style.color = error ? "#ffb0b0" : "#a9e6b2";
  };

  let categories = [];
  let subcategories = [];
  let products = [];
  let projects = [];

  function fallbackFor(type, item) {
    if (type === "category") return categoryFallback(item.name);
    if (type === "subcategory" || type === "product") {
      return categoryFallback(item.categories?.name || categories.find(category => category.id === item.category_id)?.name);
    }
    return HERO_FALLBACK;
  }

  async function init() {
    revealLogin();
    try {
      const { data:{ session }, error } = await sb.auth.getSession();
      if (error) throw error;
      if (session) await enter();
    } catch (error) {
      console.error(error);
      revealLogin("No se pudo conectar con Supabase. Recarga e intenta de nuevo.");
    }
    sb.auth.onAuthStateChange((_event, session) => {
      if (!session) revealLogin();
    });
  }

  async function enter() {
    if (loginMessage) loginMessage.textContent = "Verificando acceso…";
    const { data, error } = await sb.rpc("is_admin");
    if (error) {
      console.error(error);
      revealLogin("No se pudo verificar el acceso. Ejecuta 01-supabase-setup.sql y revisa admin_users.");
      return;
    }
    if (!data) {
      await sb.auth.signOut();
      revealLogin("El usuario existe, pero no está autorizado en admin_users.");
      return;
    }
    authView?.classList.add("hidden");
    dashboard?.classList.remove("hidden");
    if (loginMessage) loginMessage.textContent = "";
    await loadAll();
  }

  $("loginForm")?.addEventListener("submit", async event => {
    event.preventDefault();
    if (loginMessage) loginMessage.textContent = "Entrando…";
    const email = $("loginEmail")?.value.trim();
    const password = $("loginPassword")?.value || "";
    const { error } = await sb.auth.signInWithPassword({ email, password });
    if (error) {
      revealLogin(error.message === "Invalid login credentials" ? "Correo o contraseña incorrectos." : error.message);
      return;
    }
    await enter();
  });
  $("logoutButton")?.addEventListener("click", () => sb.auth.signOut());

  document.querySelectorAll(".tab").forEach(button => button.addEventListener("click", () => {
    document.querySelectorAll(".tab,.tab-panel").forEach(element => element.classList.remove("active"));
    button.classList.add("active");
    $(button.dataset.tab + "Panel")?.classList.add("active");
  }));
  document.querySelectorAll("[data-open]").forEach(button => button.addEventListener("click", () => openEmpty(button.dataset.open)));
  document.querySelectorAll(".dialog-close").forEach(button => button.addEventListener("click", () => button.closest("dialog")?.close()));

  async function loadAll() {
    const [c, s, p, j] = await Promise.all([
      sb.from("categories").select("*").order("sort_order").order("name"),
      sb.from("subcategories").select("*,categories(name)").order("sort_order").order("name"),
      sb.from("products").select("*,categories(name),subcategories(name)").order("sort_order").order("name"),
      sb.from("projects").select("*").order("sort_order").order("title")
    ]);
    if (c.error || s.error || p.error || j.error) {
      console.error(c.error, s.error, p.error, j.error);
      toast("No se pudo leer el catálogo.");
      return;
    }
    categories = c.data || [];
    subcategories = s.data || [];
    products = p.data || [];
    projects = j.data || [];
    if ($("categoriesCount")) $("categoriesCount").textContent = categories.length;
    if ($("subcategoriesCount")) $("subcategoriesCount").textContent = subcategories.length;
    if ($("productsCount")) $("productsCount").textContent = products.length;
    if ($("projectsCount")) $("projectsCount").textContent = projects.length;
    fillSelects();
    renderCategories();
    renderSubcategories();
    renderProducts();
    renderProjects();
  }

  const options = () => '<option value="">Selecciona una categoría</option>' + categories.map(category => `<option value="${category.id}">${esc(category.name)}</option>`).join("");
  function fillSelects() {
    if ($("productCategory")) $("productCategory").innerHTML = options();
    if ($("subcategoryCategory")) $("subcategoryCategory").innerHTML = options();
    const all = '<option value="">Todas las categorías</option>' + categories.map(category => `<option value="${category.id}">${esc(category.name)}</option>`).join("");
    if ($("categoryFilter")) $("categoryFilter").innerHTML = all;
    if ($("subcategoryCategoryFilter")) $("subcategoryCategoryFilter").innerHTML = all;
    updateProductSubs();
    updateFilterSubs();
  }
  function updateProductSubs(selected = "") {
    const categoryId = $("productCategory")?.value || "";
    const list = subcategories.filter(subcategory => subcategory.category_id === categoryId);
    if ($("productSubcategory")) {
      $("productSubcategory").innerHTML = '<option value="">Sin subcategoría</option>' + list.map(subcategory => `<option value="${subcategory.id}">${esc(subcategory.name)}</option>`).join("");
      $("productSubcategory").value = selected || "";
    }
  }
  function updateFilterSubs() {
    const categoryId = $("categoryFilter")?.value || "";
    const list = categoryId ? subcategories.filter(subcategory => subcategory.category_id === categoryId) : subcategories;
    if ($("subcategoryFilterProducts")) $("subcategoryFilterProducts").innerHTML = '<option value="">Todas las subcategorías</option>' + list.map(subcategory => `<option value="${subcategory.id}">${esc(subcategory.name)}</option>`).join("");
  }

  $("productCategory")?.addEventListener("change", () => updateProductSubs());
  $("categoryFilter")?.addEventListener("change", () => { updateFilterSubs(); renderProducts(); });
  $("subcategoryFilterProducts")?.addEventListener("change", renderProducts);
  $("productFilter")?.addEventListener("input", renderProducts);
  $("subcategoryFilter")?.addEventListener("input", renderSubcategories);
  $("subcategoryCategoryFilter")?.addEventListener("change", renderSubcategories);

  function row(item, type, title, description, image, meta = "") {
    const fallback = fallbackFor(type, item);
    const source = preferredImage(image, fallback);
    return `<article class="admin-row" data-type="${type}" data-id="${item.id}">
      <img loading="lazy" src="${esc(source)}" data-fallback="${esc(fallback)}" alt="${esc(title)}">
      <div><h3>${esc(title)}</h3><p>${esc(description || "Sin descripción")}</p></div>
      <div class="meta"><p>${esc(meta)}</p><span class="badge ${item.active ? "" : "off"}">${item.active ? "Visible" : "Oculto"}</span><p>Orden: ${item.sort_order || 0}</p></div>
      <div class="row-actions"><button class="edit">Editar</button><button class="toggle">${item.active ? "Ocultar" : "Mostrar"}</button><button class="delete">Eliminar</button></div>
    </article>`;
  }

  function bindRows() {
    document.querySelectorAll(".admin-row img[data-fallback]").forEach(image => image.addEventListener("error", () => {
      image.onerror = null;
      image.src = image.dataset.fallback;
    }, { once:true }));
    document.querySelectorAll(".admin-row").forEach(rowElement => {
      rowElement.querySelector(".edit")?.addEventListener("click", () => edit(rowElement.dataset.type, rowElement.dataset.id));
      rowElement.querySelector(".toggle")?.addEventListener("click", () => toggle(rowElement.dataset.type, rowElement.dataset.id));
      rowElement.querySelector(".delete")?.addEventListener("click", () => remove(rowElement.dataset.type, rowElement.dataset.id));
    });
  }
  function renderCategories() {
    if ($("categoriesTable")) $("categoriesTable").innerHTML = categories.map(category => row(category, "category", category.name, category.description, category.image_url)).join("") || "<p>No hay categorías.</p>";
    bindRows();
  }
  function renderSubcategories() {
    const query = normalizeName($("subcategoryFilter")?.value || "");
    const categoryId = $("subcategoryCategoryFilter")?.value || "";
    const list = subcategories.filter(subcategory => (!categoryId || subcategory.category_id === categoryId) && (!query || normalizeName(`${subcategory.name} ${subcategory.description || ""}`).includes(query)));
    if ($("subcategoriesTable")) $("subcategoriesTable").innerHTML = list.map(subcategory => row(subcategory, "subcategory", subcategory.name, subcategory.description, subcategory.image_url, subcategory.categories?.name || "")).join("") || "<p>No hay subcategorías.</p>";
    bindRows();
  }
  function renderProducts() {
    const query = normalizeName($("productFilter")?.value || "");
    const categoryId = $("categoryFilter")?.value || "";
    const subcategoryId = $("subcategoryFilterProducts")?.value || "";
    const list = products.filter(product => (!categoryId || product.category_id === categoryId) && (!subcategoryId || product.subcategory_id === subcategoryId) && (!query || normalizeName(`${product.name} ${product.sku || ""} ${product.description || ""}`).includes(query)));
    if ($("productsTable")) $("productsTable").innerHTML = list.map(product => row(product, "product", product.name, product.description, product.image_url, `${product.categories?.name || ""}${product.subcategories?.name ? " · " + product.subcategories.name : ""}${product.sku ? " · SKU " + product.sku : ""} · ${money(product.price)}`)).join("") || "<p>No hay productos.</p>";
    bindRows();
  }
  function renderProjects() {
    if ($("projectsTable")) $("projectsTable").innerHTML = projects.map(project => row(project, "project", project.title, project.description, project.image_url)).join("") || "<p>No hay proyectos.</p>";
    bindRows();
  }

  function openEmpty(id) {
    const dialog = $(id);
    const form = dialog?.querySelector("form");
    if (!dialog || !form) return;
    form.reset();
    form.querySelector('input[type="hidden"]')?.setAttribute("value", "");
    const hidden = form.querySelector('input[type="hidden"]');
    if (hidden) hidden.value = "";
    dialog.querySelectorAll(".image-preview").forEach(preview => preview.innerHTML = "");
    if (id === "categoryDialog") $("categoryActive").checked = true;
    if (id === "subcategoryDialog") $("subcategoryActive").checked = true;
    if (id === "productDialog") { $("productActive").checked = true; updateProductSubs(); }
    if (id === "projectDialog") $("projectActive").checked = true;
    dialog.showModal();
  }

  function previewImage(element, url, fallback) {
    if (!element) return;
    element.innerHTML = url ? `<img src="${esc(url)}" onerror="this.onerror=null;this.src='${esc(fallback)}'">` : "";
  }
  function edit(type, id) {
    if (type === "category") {
      const item = categories.find(value => value.id === id); if (!item) return;
      $("categoryId").value = item.id; $("categoryName").value = item.name; $("categoryDescription").value = item.description || ""; $("categoryOrder").value = item.sort_order || 0; $("categoryActive").checked = item.active;
      previewImage($("categoryPreview"), item.image_url, fallbackFor(type, item)); $("categoryDialog").showModal();
    }
    if (type === "subcategory") {
      const item = subcategories.find(value => value.id === id); if (!item) return;
      $("subcategoryId").value = item.id; $("subcategoryCategory").value = item.category_id; $("subcategoryName").value = item.name; $("subcategoryDescription").value = item.description || ""; $("subcategoryOrder").value = item.sort_order || 0; $("subcategoryActive").checked = item.active;
      previewImage($("subcategoryPreview"), item.image_url, fallbackFor(type, item)); $("subcategoryDialog").showModal();
    }
    if (type === "product") {
      const item = products.find(value => value.id === id); if (!item) return;
      $("productId").value = item.id; $("productCategory").value = item.category_id; updateProductSubs(item.subcategory_id); $("productName").value = item.name; $("productDescription").value = item.description || ""; $("productPrice").value = Number(item.price) > 0 ? item.price : ""; $("productOrder").value = item.sort_order || 0; $("productActive").checked = item.active;
      previewImage($("productPreview"), item.image_url, fallbackFor(type, item)); $("productDialog").showModal();
    }
    if (type === "project") {
      const item = projects.find(value => value.id === id); if (!item) return;
      $("projectId").value = item.id; $("projectTitle").value = item.title; $("projectDescription").value = item.description || ""; $("projectOrder").value = item.sort_order || 0; $("projectActive").checked = item.active;
      previewImage($("projectPreview"), item.image_url, fallbackFor(type, item)); $("projectDialog").showModal();
    }
  }

  async function upload(file, folder) {
    if (!file) return null;
    if (!file.type.startsWith("image/")) throw new Error("Selecciona una imagen JPG, PNG o WEBP.");
    if (file.size > 10 * 1024 * 1024) throw new Error("La imagen supera 10 MB.");
    const { data:{ session } } = await sb.auth.getSession();
    if (!session) throw new Error("Tu sesión terminó. Vuelve a iniciar sesión.");
    const extension = (file.name.split(".").pop() || "jpg").toLowerCase().replace(/[^a-z0-9]/g, "");
    const path = `${folder}/${Date.now()}-${crypto.randomUUID()}.${extension}`;
    const { error } = await sb.storage.from(bucket).upload(path, file, { cacheControl:"3600", upsert:false, contentType:file.type });
    if (error) throw new Error("No se pudo subir la foto: " + error.message);
    return sb.storage.from(bucket).getPublicUrl(path).data.publicUrl;
  }

  async function save(form, table, id, payload, file, folder, dialog) {
    try {
      formMessage(form, "Guardando…", false);
      if (file) payload.image_url = await upload(file, folder);
      const query = id ? sb.from(table).update(payload).eq("id", id) : sb.from(table).insert(payload);
      const { error } = await query;
      if (error) throw error;
      dialog.close();
      toast("Guardado");
      await loadAll();
    } catch (error) {
      console.error(error);
      formMessage(form, error.message || "No se pudo guardar.");
    }
  }

  $("categoryForm")?.addEventListener("submit", event => {
    event.preventDefault();
    save(event.currentTarget, "categories", $("categoryId").value, { name:$("categoryName").value.trim(), description:$("categoryDescription").value.trim() || null, sort_order:Number($("categoryOrder").value) || 0, active:$("categoryActive").checked }, $("categoryImage").files[0], "categories", $("categoryDialog"));
  });
  $("subcategoryForm")?.addEventListener("submit", event => {
    event.preventDefault();
    save(event.currentTarget, "subcategories", $("subcategoryId").value, { category_id:$("subcategoryCategory").value, name:$("subcategoryName").value.trim(), description:$("subcategoryDescription").value.trim() || null, sort_order:Number($("subcategoryOrder").value) || 0, active:$("subcategoryActive").checked }, $("subcategoryImage").files[0], "subcategories", $("subcategoryDialog"));
  });
  $("productForm")?.addEventListener("submit", event => {
    event.preventDefault();
    save(event.currentTarget, "products", $("productId").value, { category_id:$("productCategory").value, subcategory_id:$("productSubcategory").value || null, name:$("productName").value.trim(), description:$("productDescription").value.trim() || null, price:$("productPrice").value === "" ? null : Number($("productPrice").value), sort_order:Number($("productOrder").value) || 0, active:$("productActive").checked }, $("productImage").files[0], "products", $("productDialog"));
  });
  $("projectForm")?.addEventListener("submit", event => {
    event.preventDefault();
    save(event.currentTarget, "projects", $("projectId").value, { title:$("projectTitle").value.trim(), description:$("projectDescription").value.trim() || null, sort_order:Number($("projectOrder").value) || 0, active:$("projectActive").checked }, $("projectImage").files[0], "projects", $("projectDialog"));
  });

  async function toggle(type, id) {
    const map = { category:["categories", categories], subcategory:["subcategories", subcategories], product:["products", products], project:["projects", projects] };
    const [table, list] = map[type];
    const item = list.find(value => value.id === id);
    if (!item) return;
    const { error } = await sb.from(table).update({ active:!item.active }).eq("id", id);
    if (error) return toast("No se pudo cambiar");
    await loadAll();
  }
  async function remove(type, id) {
    const labels = { category:"esta categoría y todo lo relacionado", subcategory:"esta subcategoría", product:"este producto", project:"este proyecto" };
    if (!confirm(`¿Eliminar ${labels[type]}?`)) return;
    const table = { category:"categories", subcategory:"subcategories", product:"products", project:"projects" }[type];
    const { error } = await sb.from(table).delete().eq("id", id);
    if (error) return toast("No se pudo eliminar");
    await loadAll();
  }

  ["categoryImage", "subcategoryImage", "productImage", "projectImage"].forEach(id => {
    $(id)?.addEventListener("change", event => {
      const file = event.target.files[0];
      const preview = $(id.replace("Image", "Preview"));
      if (preview) preview.innerHTML = file ? `<img src="${URL.createObjectURL(file)}">` : "";
    });
  });

  init();
})();
