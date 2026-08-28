/* ==========================================================================
   SHUBH AWAS PROPERTIES — site behaviour
   Everything here degrades: if this file fails to load the page still reads,
   the links still work (once wired) and the forms still submit to WhatsApp.
   ========================================================================== */
(function () {
  "use strict";

  var CFG = window.SHUBH || {};
  var $  = function (s, c) { return (c || document).querySelector(s); };
  var $$ = function (s, c) { return Array.prototype.slice.call((c || document).querySelectorAll(s)); };

  /* ---- 1. WhatsApp, phone, mail ----------------------------------------
     Every contact point on the page is written from config.js so the number
     lives in exactly one place.
     ---------------------------------------------------------------------- */
  function wireContacts() {
    var href = CFG.waLink ? CFG.waLink(CFG.whatsappText) : "#";

    $$("[data-wa]").forEach(function (a) {
      a.href = href;
      a.target = "_blank";
      a.rel = "noopener";
    });

    /* Project cards carry their own pre-filled message. */
    $$("[data-wa-project]").forEach(function (a) {
      var name = a.getAttribute("data-wa-project");
      var text = "Hello Shubh Awas Properties — I'd like details on " + name + ".";
      a.href = CFG.waLink ? CFG.waLink(text) : "#";
    });

    var label = $("#waLabel");
    if (label && CFG.whatsappName) label.textContent = "Chat with " + CFG.whatsappName;

    $$(".js-phone").forEach(function (a) {
      if (CFG.phoneHref) a.href = "tel:" + CFG.phoneHref;
      if (!CFG.phoneDisplay) return;
      /* The header link wraps its text in a <span> next to an icon. */
      var slot = a.querySelector("span:not([aria-hidden])") || a;
      if (slot === a && a.querySelector("svg")) return;
      slot.textContent = CFG.phoneDisplay;
    });

    $$(".js-mail").forEach(function (a) {
      if (!CFG.email) return;
      a.href = "mailto:" + CFG.email;
      a.textContent = CFG.email;
    });

    $$(".js-address").forEach(function (el) {
      if (CFG.address) el.textContent = CFG.address;
    });
    $$(".js-hours").forEach(function (el) {
      if (CFG.hours) el.textContent = CFG.hours;
    });

    var yr = $("#yr");
    if (yr) yr.textContent = new Date().getFullYear();
  }

  /* ---- 2. Header shrink -------------------------------------------------- */
  function wireHeader() {
    var header = $("#header");
    if (!header) return;
    var stuck = false;

    function onScroll() {
      var should = window.scrollY > 40;
      if (should === stuck) return;
      stuck = should;
      header.classList.toggle("is-stuck", stuck);
    }
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
  }

  /* ---- 3. Mobile drawer -------------------------------------------------- */
  function wireDrawer() {
    var burger = $("#burger");
    var drawer = $("#drawer");
    if (!burger || !drawer) return;

    function setOpen(open) {
      drawer.classList.toggle("is-open", open);
      burger.setAttribute("aria-expanded", open ? "true" : "false");
      burger.setAttribute("aria-label", open ? "Close menu" : "Open menu");
      document.body.classList.toggle("is-locked", open);
    }

    burger.addEventListener("click", function () {
      setOpen(burger.getAttribute("aria-expanded") !== "true");
    });

    $$("a", drawer).forEach(function (a) {
      a.addEventListener("click", function () { setOpen(false); });
    });

    document.addEventListener("keydown", function (e) {
      if (e.key === "Escape") setOpen(false);
    });

    /* A resize past the desktop breakpoint must not leave the body locked. */
    window.addEventListener("resize", function () {
      if (window.innerWidth >= 1080) setOpen(false);
    });
  }

  /* ---- 4. Enter-viewport helper ------------------------------------------
     Runs enter(el) once, the first time an element reaches the trigger line.

     An IntersectionObserver samples per frame, so a fast flick or an anchor
     jump can carry an element from below the fold to above it without a single
     intersecting sample - and it would sit at opacity 0, or at a zero-width
     bar, forever. The observer gives smooth timing; the scroll sweep is the
     guarantee that nothing is left in its pre-animation state.

     Exposed on window.SHUBH so the investor page can use it too.
     ------------------------------------------------------------------------ */
  function onceInView(items, enter, opts) {
    if (!items.length) return;
    opts = opts || {};

    function fire(el) {
      if (el.__inview) return;
      el.__inview = true;
      enter(el);
    }

    if (!("IntersectionObserver" in window)) { items.forEach(fire); return; }

    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        fire(entry.target);
        io.unobserve(entry.target);
      });
    }, {
      rootMargin: opts.rootMargin || "0px 0px -8% 0px",
      threshold: opts.threshold != null ? opts.threshold : 0.08
    });

    items.forEach(function (el) { io.observe(el); });

    /* The sweep line mirrors the observer's trigger point so it acts as a
       backstop rather than pre-empting the animation. */
    var lineFactor = opts.line != null ? opts.line : 0.92;
    var pending = items.slice();
    var queued = false;

    function sweep() {
      queued = false;
      var line = (window.innerHeight || document.documentElement.clientHeight) * lineFactor;
      pending = pending.filter(function (el) {
        if (el.__inview) return false;
        if (el.getBoundingClientRect().top >= line) return true;
        fire(el);
        io.unobserve(el);
        return false;
      });
      if (pending.length) return;
      window.removeEventListener("scroll", onScroll);
      window.removeEventListener("resize", onScroll);
      window.removeEventListener("load", sweep);
    }

    function onScroll() {
      if (queued) return;
      queued = true;
      requestAnimationFrame(sweep);
    }

    window.addEventListener("scroll", onScroll, { passive: true });
    window.addEventListener("resize", onScroll, { passive: true });
    window.addEventListener("load", sweep);
  }

  if (window.SHUBH) window.SHUBH.onceInView = onceInView;

  function wireReveal() {
    onceInView($$("[data-reveal]"), function (el) { el.classList.add("is-in"); });
  }

  /* ---- 5. Counters ------------------------------------------------------- */
  function wireCounters() {
    var nums = $$("[data-count]");
    if (!nums.length) return;

    /* A counter can name a config key with data-stat, so the home page and the
       investor page cannot drift apart. Without one, the number written in the
       markup is used as-is. */
    var stats  = CFG.stats || {};
    var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    function run(el) {
      var key    = el.getAttribute("data-stat");
      var target = key && stats[key] != null ? stats[key] : parseFloat(el.getAttribute("data-count"));
      var suffix = el.getAttribute("data-suffix") || "";

      if (reduce) { el.textContent = target + suffix; return; }

      var start = null;
      var dur = 1500;
      function step(ts) {
        if (start === null) start = ts;
        var p = Math.min((ts - start) / dur, 1);
        var eased = 1 - Math.pow(1 - p, 3);
        el.textContent = Math.round(target * eased) + suffix;
        if (p < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
    }

    onceInView(nums, run, { threshold: 0.5, line: 0.85 });
  }

  /* ---- 6. Ticker --------------------------------------------------------- */
  function wireTicker() {
    var track = $("#ticker");
    if (!track) return;
    /* The keyframe translates by -50%, so the content has to be doubled for
       the loop to be seamless. */
    track.innerHTML += track.innerHTML;
  }

  /* ---- 7. Scroll-spy ----------------------------------------------------- */
  function wireSpy() {
    var links = $$('.nav__link[href^="#"]');
    if (!links.length || !("IntersectionObserver" in window)) return;

    var sections = links.map(function (a) {
      return document.getElementById(a.getAttribute("href").slice(1));
    }).filter(Boolean);
    if (!sections.length) return;

    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        var id = entry.target.id;
        links.forEach(function (a) {
          a.classList.toggle("is-active", a.getAttribute("href") === "#" + id);
        });
      });
    }, { rootMargin: "-45% 0px -50% 0px" });

    sections.forEach(function (sec) { io.observe(sec); });
  }

  /* ---- 8. Enquiry form ---------------------------------------------------
     With no endpoint configured the form opens WhatsApp with the enquiry
     pre-filled — a working contact path with zero backend.
     ------------------------------------------------------------------------ */
  function wireForm() {
    var form = $("#enquiryForm");
    if (!form) return;
    var ok = $("#enquiryOk");

    function fieldOf(input) { return input.closest(".field"); }

    function validate() {
      var bad = null;

      $$("input, select, textarea", form).forEach(function (input) {
        var wrap = fieldOf(input);
        if (!wrap) return;
        var invalid = false;

        if (input.hasAttribute("required") && !input.value.trim()) invalid = true;

        if (input.type === "tel" && input.value.trim()) {
          var digits = input.value.replace(/\D/g, "");
          if (digits.length < 10) invalid = true;
        }

        wrap.classList.toggle("field--err", invalid);
        if (invalid && !bad) bad = input;
      });

      return bad;
    }

    form.addEventListener("submit", function (e) {
      e.preventDefault();

      var bad = validate();
      if (bad) { bad.focus(); return; }

      var data = new FormData(form);
      var lines = [
        "New enquiry from the Shubh Awas website",
        "",
        "Name: "    + (data.get("name")    || "—"),
        "Phone: "   + (data.get("phone")   || "—"),
        "Project: " + (data.get("project") || "No preference yet"),
        "Budget: "  + (data.get("budget")  || "Prefer to discuss")
      ];
      var msg = (data.get("message") || "").trim();
      if (msg) lines.push("", "Message: " + msg);

      if (CFG.formEndpoint) {
        fetch(CFG.formEndpoint, {
          method: "POST",
          headers: { "Accept": "application/json" },
          body: data
        }).then(function (res) {
          if (!res.ok) throw new Error("Bad response");
          form.reset();
          if (ok) {
            ok.textContent = "Thank you — your enquiry is with us. We will call you back shortly.";
            ok.classList.add("is-on");
          }
        }).catch(function () {
          /* If the endpoint is unreachable, fall through to WhatsApp rather
             than leaving the visitor with a dead form. */
          window.open(CFG.waLink(lines.join("\n")), "_blank", "noopener");
        });
        return;
      }

      window.open(CFG.waLink(lines.join("\n")), "_blank", "noopener");
      if (ok) {
        ok.textContent = "Opening WhatsApp with your enquiry — press send there and it reaches us straight away.";
        ok.classList.add("is-on");
      }
    });

    /* Clear the error state as soon as the visitor starts fixing it. */
    $$("input, select, textarea", form).forEach(function (input) {
      input.addEventListener("input", function () {
        var wrap = fieldOf(input);
        if (wrap) wrap.classList.remove("field--err");
      });
    });
  }

  /* ---- boot -------------------------------------------------------------- */
  function init() {
    wireContacts();
    wireHeader();
    wireDrawer();
    wireReveal();
    wireCounters();
    wireTicker();
    wireSpy();
    wireForm();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
