/* ==========================================================================
   SHUBH AWAS PROPERTIES — SITE CONFIG
   >>> THIS IS THE ONLY FILE YOU NEED TO EDIT TO CHANGE CONTACT DETAILS. <<<
   Every phone number, WhatsApp link, e-mail and headline figure on both
   pages is read from here. Change it once, it changes everywhere.
   ========================================================================== */

window.SHUBH = {

  /* ----------------------------------------------------------------------
     1. WHATSAPP
     Country code + number, digits only. No +, no spaces, no dashes.
     India = 91 + 10-digit number.
     ---------------------------------------------------------------------- */
  whatsappNumber: '919812134638',        // 91 (India) + 9812134638
  whatsappName:   'Shubh Awas',          // shown on the floating button
  whatsappText:
    "Hello Shubh Awas Properties — I'd like to know more about your projects.",
  whatsappTextInvestor:
    "Hello Shubh Awas Properties — I'm writing about the investment opportunity.",

  /* ----------------------------------------------------------------------
     2. CONTACT DETAILS
     ---------------------------------------------------------------------- */
  founderName:  'Jagvender Siwach',
  founderRole:  'Founder & Managing Director',

  phoneDisplay: '+91 98121 34638',
  phoneHref:    '+919812134638',
  email:        'jagvindersiwach@gmail.com',
  investorEmail:'jagvindersiwach@gmail.com',
  /* Address, plus code and coordinates are taken from the business's own
     Google Business Profile, so the NAP here matches the listing exactly.
     Google cross-checks the two, and a mismatch costs map-pack ranking. */
  address:      'Shubh Awas Properties\nRHXP+RH6, Sector 22, Sunari Kalan\nRohtak, Haryana 124010',
  addressParts: {
    street:   'RHXP+RH6, Sector 22, Sunari Kalan',
    locality: 'Rohtak',
    region:   'Haryana',
    postal:   '124010',
    country:  'IN'
  },
  geo:          { lat: 28.8495439, lng: 76.5863847 },
  plusCode:     'RHXP+RH6 Rohtak, Haryana',

  /* The ?cid= form is the stable canonical URL for a Google listing. A
     share.google / maps.app.goo.gl short link can expire; this will not. */
  googleProfile: 'https://maps.google.com/?cid=14713810717315562644',
  directionsUrl: 'https://www.google.com/maps/dir/?api=1&destination=28.8495439,76.5863847',

  hours:        'Mon – Sat · 9:30 am – 7:00 pm',

  /* ----------------------------------------------------------------------
     3. HEADLINE FIGURES
     These drive the counters on the home page and the investor page.
     Set them to numbers you can stand behind — they are the first thing a
     serious buyer or investor will ask you to prove.
     ---------------------------------------------------------------------- */
  stats: {
    yearsExperience: 15,      // years in the Haryana property market
    familiesServed:  850,     // families / buyers handled
    projectsOnBooks: 3,       // live projects represented
    acresTransacted: 120      // acres transacted across projects
  },

  /* ----------------------------------------------------------------------
     4. FORM DELIVERY
     Leave the endpoint empty ('') and every form falls back to opening
     WhatsApp with the enquiry pre-filled — works with zero backend.
     To use a form service (Formspree, Basin, Getform, your own API), paste
     the POST URL here and the forms will submit to it instead.
     ---------------------------------------------------------------------- */
  formEndpoint: ''
};

/* --------------------------------------------------------------------------
   Helper: build a wa.me deep link with pre-filled text.
   -------------------------------------------------------------------------- */
window.SHUBH.waLink = function (text) {
  var n = (window.SHUBH.whatsappNumber || '').replace(/\D/g, '');
  var t = encodeURIComponent(text || window.SHUBH.whatsappText);
  return 'https://wa.me/' + n + '?text=' + t;
};
