/* ==========================================================================
   SHUBH AWAS PROPERTIES — investor relations behaviour
   Loads after site.js and only adds what is specific to this page: the
   investor WhatsApp links, the use-of-funds bars, the modal and the two
   investor forms.
   ========================================================================== */
(function () {
  "use strict";

  var CFG = window.SHUBH || {};
  var $  = function (s, c) { return (c || document).querySelector(s); };
  var $$ = function (s, c) { return Array.prototype.slice.call((c || document).querySelectorAll(s)); };

  /* ---- 1. Investor contact points --------------------------------------- */
  function wireInvestorContacts() {
    var href = CFG.waLink ? CFG.waLink(CFG.whatsappTextInvestor) : "#";

    $$("[data-wa-investor]").forEach(function (a) {
      a.href = href;
      a.target = "_blank";
      a.rel = "noopener";
    });

    var label = $("#waLabel");
    if (label) label.textContent = "Chat with the investor desk";

    $$(".js-mail-investor").forEach(function (a) {
      var mail = CFG.investorEmail || CFG.email;
      if (!mail) return;
      a.href = "mailto:" + mail + "?subject=" + encodeURIComponent("Investor enquiry — Shubh Awas Properties");
      a.textContent = mail;
    });
  }

  /* ---- 2. Use-of-funds bars ---------------------------------------------
     The width is written from data-bar so the number in the label and the
     length of the bar can never disagree.
     ------------------------------------------------------------------------ */
  function wireBars() {
    var bars = $$("[data-bar]");
    if (!bars.length) return;

    function fill(el) { el.style.width = el.getAttribute("data-bar") + "%"; }

    /* Shared with the main site: an observer for the timing, plus a scroll
       sweep so a fast scroll can never leave a bar stuck at zero width. */
    if (CFG.onceInView) { CFG.onceInView(bars, fill, { threshold: 0.4, line: 0.9 }); return; }
    bars.forEach(fill);
  }

  /* ---- 3. Modal ---------------------------------------------------------- */
  function wireModal() {
    var modal = $("#irModal");
    if (!modal) return;

    var panel  = $(".modal__panel", modal);
    var closer = $("#irModalClose");
    var opener = null;

    function focusables() {
      return $$('a[href], button:not([disabled]), input, select, textarea', panel)
        .filter(function (el) { return el.offsetParent !== null; });
    }

    function open(trigger) {
      opener = trigger || null;
      modal.hidden = false;

      /* Read a layout property to flush the style change from removing
         [hidden], so the opacity transition has a start value to run from.
         This has to be synchronous: doing it in requestAnimationFrame leaves
         the dialog invisible with the page locked behind it if the frame
         callback is throttled. */
      void modal.offsetHeight;

      modal.classList.add("is-open");
      document.body.classList.add("is-locked");

      var f = focusables();
      if (f.length) f[0].focus();
    }

    function close() {
      modal.classList.remove("is-open");
      document.body.classList.remove("is-locked");
      window.setTimeout(function () { modal.hidden = true; }, 360);
      if (opener) opener.focus();
    }

    $$("[data-open-modal]").forEach(function (btn) {
      btn.addEventListener("click", function () { open(btn); });
    });

    if (closer) closer.addEventListener("click", close);

    modal.addEventListener("click", function (e) {
      if (e.target === modal) close();
    });

    document.addEventListener("keydown", function (e) {
      if (modal.hidden) return;

      if (e.key === "Escape") { close(); return; }

      /* Keep tab focus inside the dialog while it is open. */
      if (e.key !== "Tab") return;
      var f = focusables();
      if (!f.length) return;
      var first = f[0];
      var last  = f[f.length - 1];

      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault();
        last.focus();
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault();
        first.focus();
      }
    });
  }

  /* ---- 4. Investor forms -------------------------------------------------
     Same contract as the main enquiry form: post to the configured endpoint
     if there is one, otherwise hand the enquiry to WhatsApp.
     ------------------------------------------------------------------------ */
  function wireInvestorForm(formId, okId) {
    var form = $("#" + formId);
    if (!form) return;
    var ok = $("#" + okId);

    function validate() {
      var bad = null;

      $$("input, select, textarea", form).forEach(function (input) {
        var wrap = input.closest(".field");
        if (!wrap) return;
        var invalid = false;

        if (input.hasAttribute("required") && !input.value.trim()) invalid = true;

        if (input.type === "tel" && input.value.trim()) {
          if (input.value.replace(/\D/g, "").length < 10) invalid = true;
        }
        if (input.type === "email" && input.value.trim()) {
          if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(input.value.trim())) invalid = true;
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
        "Investor enquiry — Shubh Awas Properties",
        "",
        "Name: "  + (data.get("name")  || "—"),
        "Phone: " + (data.get("phone") || "—")
      ];
      if (data.get("email"))        lines.push("Email: " + data.get("email"));
      if (data.get("investorType")) lines.push("Profile: " + data.get("investorType"));
      lines.push("Ticket: " + (data.get("ticket") || "Prefer to discuss"));

      var msg = (data.get("message") || "").trim();
      if (msg) lines.push("", "Notes: " + msg);

      var text = lines.join("\n");

      if (CFG.formEndpoint) {
        data.append("_subject", "Investor enquiry — Shubh Awas Properties");
        fetch(CFG.formEndpoint, {
          method: "POST",
          headers: { "Accept": "application/json" },
          body: data
        }).then(function (res) {
          if (!res.ok) throw new Error("Bad response");
          form.reset();
          if (ok) {
            ok.textContent = "Received. Jagvender will come back to you personally.";
            ok.classList.add("is-on");
          }
        }).catch(function () {
          window.open(CFG.waLink(text), "_blank", "noopener");
        });
        return;
      }

      window.open(CFG.waLink(text), "_blank", "noopener");
      if (ok) {
        ok.textContent = "Opening WhatsApp with your details — press send there and it reaches the investor desk directly.";
        ok.classList.add("is-on");
      }
    });

    $$("input, select, textarea", form).forEach(function (input) {
      input.addEventListener("input", function () {
        var wrap = input.closest(".field");
        if (wrap) wrap.classList.remove("field--err");
      });
    });
  }

  /* ---- boot -------------------------------------------------------------- */
  function init() {
    wireInvestorContacts();
    wireBars();
    wireModal();
    wireInvestorForm("investorForm", "investorOk");
    wireInvestorForm("irModalForm", "irModalOk");
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
