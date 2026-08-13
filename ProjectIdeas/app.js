/* ENVT3362 project-ideas dashboard
   Three screens driven off the URL hash:
     #/                     themes
     #/<categoryId>         topics in a theme
     #/<categoryId>/<topic> one topic
   Every topic is therefore a bookmarkable, linkable address. */

const $ = (s) => document.querySelector(s);
const el = (tag, cls, text) => {
  const n = document.createElement(tag);
  if (cls) n.className = cls;
  if (text != null) n.textContent = text;
  return n;
};

const FLAT = [];
CATEGORIES.forEach((c) =>
  c.topics.forEach((t, i) => FLAT.push({ cat: c, topic: t, index: i })));

const URL_RE = /(https?:\/\/[^\s)>,;]+[^\s)>,;.])/g;

/* Render a plain-text block, turning bare URLs into links. Text comes from our
   own markdown files, but build the nodes rather than setting innerHTML anyway. */
function prose(target, text) {
  target.textContent = "";
  const p = el("p");
  let last = 0;
  text.replace(URL_RE, (url, _m, offset) => {
    if (offset > last) p.appendChild(document.createTextNode(text.slice(last, offset)));
    const a = el("a", null, url.replace(/^https?:\/\/(www\.)?/, ""));
    a.href = url;
    a.target = "_blank";
    a.rel = "noopener";
    p.appendChild(a);
    last = offset + url.length;
    return url;
  });
  if (last < text.length) p.appendChild(document.createTextNode(text.slice(last)));
  target.appendChild(p);
}

function show(id) {
  document.querySelectorAll(".screen").forEach((s) => s.classList.toggle("is-active", s.id === id));
}

/* ===================== Home ===================== */
function buildHome() {
  const grid = $("#cat-grid");
  CATEGORIES.forEach((c) => {
    const b = el("button", "cat-card");
    b.style.setProperty("--c", c.accent);
    if (c.cover) b.style.backgroundImage = `url("${c.cover}")`;
    b.appendChild(el("span", "c-bar"));
    b.appendChild(el("span", "c-count", `${c.topics.length} topics`));
    b.appendChild(el("span", "c-title", c.name));
    b.appendChild(el("span", "c-blurb", c.blurb));
    b.onclick = () => go(`#/${c.id}`);
    grid.appendChild(b);
  });
}

/* ===================== Search ===================== */
function search(q) {
  const box = $("#results");
  const grid = $("#cat-grid");
  q = q.trim().toLowerCase();
  if (q.length < 2) {
    box.hidden = true;
    grid.hidden = false;
    return;
  }
  const terms = q.split(/\s+/);
  const hits = FLAT.filter(({ cat, topic }) => {
    const hay = [topic.title, topic.context, topic.approach, topic.data,
                 topic.reading, topic.modelnote, cat.name].join(" ").toLowerCase();
    return terms.every((t) => hay.includes(t));
  });

  box.textContent = "";
  box.hidden = false;
  grid.hidden = true;
  box.appendChild(el("h3", null,
    hits.length ? `${hits.length} topic${hits.length === 1 ? "" : "s"} matching “${q}”`
                : "No matches"));
  if (!hits.length) {
    box.appendChild(el("p", "no-hits",
      "Try a broader word — or a topic of your own is always welcome; talk to the unit coordinator."));
    return;
  }
  const list = el("div", "res-list");
  hits.forEach(({ cat, topic }) => {
    const b = el("button", "res-item");
    b.style.setProperty("--c", cat.accent);
    if (topic.images[0]) {
      const img = el("img");
      img.src = topic.images[0].thumb;
      img.alt = "";
      img.loading = "lazy";
      b.appendChild(img);
    }
    const d = el("div");
    d.appendChild(el("div", "r-title", topic.title));
    d.appendChild(el("div", "r-cat", cat.name));
    b.appendChild(d);
    b.onclick = () => go(`#/${cat.id}/${topic.id}`);
    list.appendChild(b);
  });
  box.appendChild(list);
}

/* ===================== Category ===================== */
const fullSize = (src) => src.replace("img/thumb/", "img/");

function buildCategory(cat) {
  $("#cat-bg").style.backgroundImage = cat.cover ? `url("${fullSize(cat.cover)}")` : "";
  $("#cat-title").textContent = cat.name;
  $("#cat-blurb").textContent = cat.blurb;
  $("#cat-count").textContent = `${cat.topics.length} project ideas`;
  document.documentElement.style.setProperty("--c", cat.accent);

  const grid = $("#topic-grid");
  grid.textContent = "";
  cat.topics.forEach((t) => {
    const b = el("button", "topic-card");
    b.style.setProperty("--c", cat.accent);
    if (t.images[0]) {
      const img = el("img");
      img.src = t.images[0].thumb;
      img.alt = "";
      img.loading = "lazy";
      b.appendChild(img);
    }
    const body = el("div", "t-body");
    body.appendChild(el("div", "t-title", t.title));
    body.appendChild(el("div", "t-teaser", t.context));
    b.appendChild(body);
    b.onclick = () => go(`#/${cat.id}/${t.id}`);
    grid.appendChild(b);
  });
}

/* ===================== Topic ===================== */
function buildTopic(cat, topic, idx) {
  document.documentElement.style.setProperty("--c", cat.accent);
  $("#topic-back").dataset.go = `#/${cat.id}`;
  $("#topic-back").textContent = `‹ ${cat.name}`;
  $("#topic-crumb").textContent = cat.name;
  $("#topic-title").textContent = topic.title;

  const m = $("#montage");
  m.textContent = "";
  topic.images.forEach((im) => {
    const fig = el("figure");
    const img = el("img");
    img.src = im.file;          // displayed large; thumbs are too soft here
    img.alt = im.title;
    img.loading = "lazy";
    fig.appendChild(img);
    fig.appendChild(el("figcaption", null, im.title));
    fig.onclick = () => openLightbox(im);
    m.appendChild(fig);
  });

  prose($("#topic-context"), topic.context);
  prose($("#topic-approach"), topic.approach);
  prose($("#topic-data"), topic.data);
  prose($("#topic-reading"), topic.reading);

  // one sentence on the paper that shows how to build the model; the full citation for it
  // is in the reference list below, with the others
  const mr = $("#modelref");
  mr.textContent = "";
  if (topic.modelnote) {
    mr.appendChild(el("span", "r-model", "how to model it"));
    mr.appendChild(document.createTextNode(topic.modelnote));
  }
  mr.hidden = !topic.modelnote;

  const ul = $("#topic-links");
  ul.textContent = "";
  topic.links.forEach((u) => {
    const a = el("a", null, u.replace(/^https?:\/\/(www\.)?/, ""));
    a.href = u;
    a.target = "_blank";
    a.rel = "noopener";
    const li = el("li");
    li.appendChild(a);
    ul.appendChild(li);
  });
  $("#linkblock").hidden = topic.links.length === 0;

  const rl = $("#topic-refs");
  rl.textContent = "";
  const refs = topic.refs || [];
  refs.forEach((r) => {
    const li = el("li");
    li.appendChild(document.createTextNode(`${r.authors} (${r.year}) ${r.title}. `));
    if (r.source) li.appendChild(el("span", "r-src", r.source + ". "));
    // papers are cited by DOI; model documentation and the like by their address
    const a = el("a", null, r.doi ? "doi:" + r.doi : r.url.replace(/^https?:\/\/(www\.)?/, ""));
    a.href = r.url;
    a.target = "_blank";
    a.rel = "noopener";
    li.appendChild(a);
    rl.appendChild(li);
  });
  $("#refblock").hidden = refs.length === 0;

  const cl = $("#topic-credits");
  cl.textContent = "";
  topic.images.forEach((im) => {
    // most photos come from Commons; a few are supplied by the person who took them,
    // with no licence line and nowhere to link to
    const li = el("li");
    li.appendChild(document.createTextNode(`${im.title} — ${im.author}`));
    if (im.lic) {
      li.appendChild(document.createTextNode(", "));
      if (im.licurl) {
        const a = el("a", null, im.lic);
        a.href = im.licurl;
        a.target = "_blank";
        a.rel = "noopener";
        li.appendChild(a);
      } else {
        li.appendChild(document.createTextNode(im.lic));
      }
    }
    if (im.page) {
      li.appendChild(document.createTextNode(", via "));
      const src = el("a", null, "Wikimedia Commons");
      src.href = im.page;
      src.target = "_blank";
      src.rel = "noopener";
      li.appendChild(src);
    }
    cl.appendChild(li);
  });
  $("#creditblock").hidden = topic.images.length === 0;

  const prev = cat.topics[idx - 1];
  const next = cat.topics[idx + 1];
  setNav($("#prev-topic"), prev, cat, "Previous");
  setNav($("#next-topic"), next, cat, "Next");
}

function setNav(btn, t, cat, label) {
  btn.textContent = "";
  if (!t) {
    btn.disabled = true;
    return;
  }
  btn.disabled = false;
  btn.appendChild(el("small", null, label));
  btn.appendChild(document.createTextNode(t.title));
  btn.onclick = () => go(`#/${cat.id}/${t.id}`);
}

/* ===================== Lightbox ===================== */
function openLightbox(im) {
  $("#lb-img").src = im.file;
  $("#lb-img").alt = im.title;
  $("#lb-cap").textContent = [`${im.title} — ${im.author}`, im.lic,
                              im.page ? "via Wikimedia Commons" : ""].filter(Boolean).join(", ");
  $("#lightbox").hidden = false;
}
function closeLightbox() { $("#lightbox").hidden = true; $("#lb-img").src = ""; }

/* ===================== Routing ===================== */
function go(hash) {
  if (location.hash === hash) route();
  else location.hash = hash;
}

function route() {
  const parts = location.hash.replace(/^#\/?/, "").split("/").filter(Boolean);
  const cat = CATEGORIES.find((c) => c.id === parts[0]);

  if (!cat) {
    show("home");
    document.title = "ENVT3362 — Project Ideas";
    window.scrollTo(0, 0);
    return;
  }
  const idx = parts[1] ? cat.topics.findIndex((t) => t.id === parts[1]) : -1;
  if (idx >= 0) {
    buildTopic(cat, cat.topics[idx], idx);
    show("topic");
    document.title = `${cat.topics[idx].title} — ENVT3362 Project Ideas`;
  } else {
    buildCategory(cat);
    show("category");
    document.title = `${cat.name} — ENVT3362 Project Ideas`;
  }
  window.scrollTo(0, 0);
}

/* ===================== Wire up ===================== */
buildHome();
// the number of topics changes as topics are added or held back, so count them here
$("#search").placeholder =
  `Search all ${FLAT.length} topics — try “heatwave”, “GLM”, “carbon”…`;
$("#search").addEventListener("input", (e) => search(e.target.value));
document.querySelectorAll("[data-go]").forEach((b) =>
  b.addEventListener("click", () => go(b.dataset.go)));
$("#lightbox").addEventListener("click", closeLightbox);
document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") {
    if (!$("#lightbox").hidden) closeLightbox();
    else if (location.hash && location.hash !== "#/") history.back();
  }
});
window.addEventListener("hashchange", route);
route();
