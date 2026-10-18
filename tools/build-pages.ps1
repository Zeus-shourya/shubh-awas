# =============================================================================
#  SHUBH AWAS PROPERTIES - page generator
#
#  Builds every interior page from one shell plus the content in pages-data.ps1,
#  then patches the shared nav and footer into index.html and investors.html
#  between their NAV/FOOTER markers, and regenerates sitemap.xml.
#
#  EDIT THIS FILE (or pages-data.ps1), NOT THE GENERATED HTML.
#  Anything written directly into a generated page is lost on the next run.
#
#      powershell -ExecutionPolicy Bypass -File tools\build-pages.ps1
#
#  ASCII only - PowerShell 5.1 mangles non-ASCII without a BOM, so all
#  typography in the content is written as HTML entities.
# =============================================================================
param([string]$Root = (Split-Path $PSScriptRoot -Parent))

$ErrorActionPreference = 'Stop'
$BASE = 'https://shubhawasproperties.com/'
$SITE = 'Shubh Awas Properties'
$TODAY = Get-Date -Format 'yyyy-MM-dd'

. (Join-Path $PSScriptRoot 'pages-data.ps1')

# -- shared navigation ---------------------------------------------------------
# One definition drives the desktop dropdowns, the mobile drawer and the footer
# columns, so they cannot disagree with each other.
$NAV = @(
  @{ label = 'Home'; href = '/' },
  @{ label = 'Properties'; children = @(
      @{ label = 'Residential Plots'; href = '/plots-in-rohtak/' },
      @{ label = 'Independent Floors'; href = '/independent-floors-in-rohtak/' },
      @{ label = 'Township Homes'; href = '/township-homes-in-rohtak/' },
      @{ label = 'Commercial Property'; href = '/commercial-property-in-rohtak/' },
      @{ label = 'Resale &amp; Rentals'; href = '/resale-and-rental-property-in-rohtak/' },
      @{ label = 'Loan &amp; Registry Support'; href = '/home-loan-and-registry-support/' }
  )},
  @{ label = 'Areas'; children = @(
      @{ label = 'Omaxe City, Sector 22D'; href = '/areas/omaxe-city-sector-22d/' },
      @{ label = 'Suncity, Sector 34-36A'; href = '/areas/suncity-sector-34-36a/' },
      @{ label = 'One City, Sector 27A'; href = '/areas/one-city-sector-27a/' },
      @{ label = 'HSVP Sectors'; href = '/areas/hsvp-sectors-rohtak/' },
      @{ label = 'IMT Rohtak'; href = '/areas/imt-rohtak/' }
  )},
  @{ label = 'Projects'; children = @(
      @{ label = 'All projects'; href = '/projects/' },
      @{ label = 'Forteasia'; href = '/projects/forteasia/' },
      @{ label = 'Florence'; href = '/projects/florence/' },
      @{ label = 'Omaxe City'; href = '/projects/omaxe-city/' }
  )},
  @{ label = 'About'; href = '/about/' },
  @{ label = 'Contact'; href = '/contact/' }
)

function Build-DesktopNav([string]$current) {
  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine('    <nav class="nav" aria-label="Primary">')
  foreach ($item in $NAV) {
    if ($item.children) {
      $id = 'navmenu-' + ($item.label -replace '[^A-Za-z]', '').ToLower()
      $open = $item.children | Where-Object { $_.href -eq $current }
      $cls = if ($open) { 'nav__group is-current' } else { 'nav__group' }
      [void]$sb.AppendLine("      <div class=""$cls"">")
      [void]$sb.AppendLine("        <button class=""nav__toggle"" type=""button"" aria-expanded=""false"" aria-controls=""$id"">$($item.label)</button>")
      [void]$sb.AppendLine("        <div class=""nav__menu"" id=""$id"">")
      foreach ($c in $item.children) {
        $cur = if ($c.href -eq $current) { ' aria-current="page"' } else { '' }
        [void]$sb.AppendLine("          <a href=""$($c.href)""$cur>$($c.label)</a>")
      }
      [void]$sb.AppendLine('        </div>')
      [void]$sb.AppendLine('      </div>')
    } else {
      $cur = if ($item.href -eq $current) { ' aria-current="page"' } else { '' }
      $cls = if ($item.href -eq $current) { 'nav__link is-active' } else { 'nav__link' }
      [void]$sb.AppendLine("      <a class=""$cls"" href=""$($item.href)""$cur>$($item.label)</a>")
    }
  }
  [void]$sb.AppendLine('      <a class="nav__link nav__link--ir" href="/investors.html">Investors</a>')
  [void]$sb.AppendLine('    </nav>')
  $sb.ToString().TrimEnd()
}

function Build-Drawer([string]$current) {
  $sb = New-Object System.Text.StringBuilder
  foreach ($item in $NAV) {
    if ($item.children) {
      [void]$sb.AppendLine('  <div class="drawer__group">')
      [void]$sb.AppendLine("    <p class=""drawer__grouphead"">$($item.label)</p>")
      [void]$sb.AppendLine('    <div class="drawer__sub">')
      foreach ($c in $item.children) {
        $cur = if ($c.href -eq $current) { ' aria-current="page"' } else { '' }
        [void]$sb.AppendLine("      <a href=""$($c.href)""$cur>$($c.label)</a>")
      }
      [void]$sb.AppendLine('    </div>')
      [void]$sb.AppendLine('  </div>')
    } else {
      $cur = if ($item.href -eq $current) { ' aria-current="page"' } else { '' }
      [void]$sb.AppendLine("  <a class=""drawer__link"" href=""$($item.href)""$cur>$($item.label)</a>")
    }
  }
  [void]$sb.AppendLine('  <a class="drawer__link" href="/investors.html">Investors</a>')
  [void]$sb.AppendLine('  <div class="drawer__foot">')
  [void]$sb.AppendLine('    <a class="drawer__tel js-phone" href="#">+91 98121 34638</a>')
  [void]$sb.AppendLine('    <a class="link-u" data-wa href="#">Chat on WhatsApp</a>')
  [void]$sb.AppendLine('  </div>')
  $sb.ToString().TrimEnd()
}

$LOGO_SVG = @'
      <svg class="lockup__mark" viewBox="0 0 96 96" aria-hidden="true">
        <rect width="96" height="96" rx="23.04" fill="#0B132B"/>
        <path d="M18 47.5 48 21.5 78 47.5" fill="none" stroke="#5BC0BE" stroke-width="6.2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M38 75V60.5a10 10 0 0 1 20 0V75" fill="none" stroke="#6FFFE9" stroke-width="5.2" stroke-linecap="round"/>
        <rect x="24" y="79.5" width="48" height="4.6" rx="2.3" fill="#5BC0BE"/>
      </svg>
'@

function Build-Footer {
  $props = ($NAV | Where-Object { $_.label -eq 'Properties' }).children
  $areas = ($NAV | Where-Object { $_.label -eq 'Areas' }).children
  $propLinks = ($props | ForEach-Object { "          <li><a href=""$($_.href)"">$($_.label)</a></li>" }) -join "`n"
  $areaLinks = ($areas | ForEach-Object { "          <li><a href=""$($_.href)"">$($_.label)</a></li>" }) -join "`n"

  @"
  <div class="shell-wide">

    <div class="footer__top">
      <div>
        <a class="lockup lockup--sm" href="/" aria-label="$SITE &mdash; home">
$LOGO_SVG
          <span class="lockup__type">
            <span class="lockup__word">Shubh Awas</span>
            <span class="lockup__desc">Properties</span>
          </span>
        </a>
        <p class="footer__blurb">
          Residential plots, independent floors, township homes and commercial
          property in Rohtak, Haryana. Founded and run by Jagvender Siwach.
        </p>
        <!-- Repeated in full on purpose: Google compares the address on the site
             against the Business Profile, so it is stated identically in both. -->
        <address class="footer__nap">
          Shubh Awas Properties<br>
          RHXP+RH6, Sector 22, Sunari Kalan<br>
          Rohtak, Haryana 124010
        </address>
      </div>

      <div>
        <h4>What We Handle</h4>
        <ul>
$propLinks
        </ul>
      </div>

      <div>
        <h4>Areas in Rohtak</h4>
        <ul>
$areaLinks
        </ul>
      </div>

      <div>
        <h4>Reach Us</h4>
        <ul>
          <li><a class="js-phone" href="#">+91 98121 34638</a></li>
          <li><a data-wa href="#">WhatsApp</a></li>
          <li><a class="js-mail" href="#">jagvindersiwach@gmail.com</a></li>
          <li><a class="js-google-profile" href="https://maps.google.com/?cid=14713810717315562644" target="_blank" rel="noopener">Find us on Google</a></li>
          <li><a href="/about/">About</a></li>
          <li><a href="/contact/">Contact</a></li>
          <li><a href="/investors.html">Investors</a></li>
          <li><a href="/privacy-policy/">Privacy Policy</a></li>
        </ul>
      </div>
    </div>

    <p class="footer__legal">
      Project names, locations and specifications shown on this site are indicative and
      are the property of their respective developers. Shubh Awas Properties markets and
      advises on inventory in these developments; it is not the developer of record.
      Nothing on this page is an offer or a guarantee of returns. Please verify all
      approvals, RERA registration and title documents before making a payment.
    </p>

    <div class="footer__bot">
      <span>&copy; <span id="yr">2026</span> $SITE. All rights reserved.</span>
      <span>Sector 22, Sunari Kalan &middot; Rohtak, Haryana 124010</span>
    </div>

  </div>
"@
}

# -- the page shell ------------------------------------------------------------
function Build-Page($p) {
  $url = $BASE.TrimEnd('/') + $p.slug
  $nav = Build-DesktopNav $p.slug
  $drawer = Build-Drawer $p.slug
  $footer = Build-Footer

  # breadcrumbs: Home / [parent] / current
  $crumbHtml = New-Object System.Text.StringBuilder
  $crumbLd = New-Object System.Collections.ArrayList
  [void]$crumbHtml.AppendLine('        <li><a href="/">Home</a></li>')
  [void]$crumbLd.Add(@{ '@type' = 'ListItem'; position = 1; name = 'Home'; item = $BASE })
  $pos = 2
  if ($p.parent) {
    [void]$crumbHtml.AppendLine("        <li><a href=""$($p.parent.href)"">$($p.parent.label)</a></li>")
    [void]$crumbLd.Add(@{ '@type' = 'ListItem'; position = $pos; name = $p.parent.label; item = $BASE.TrimEnd('/') + $p.parent.href })
    $pos++
  }
  [void]$crumbHtml.AppendLine("        <li><span aria-current=""page"">$($p.crumb)</span></li>")
  [void]$crumbLd.Add(@{ '@type' = 'ListItem'; position = $pos; name = $p.crumb; item = $url })

  # ---- JSON-LD graph --------------------------------------------------------
  $graph = New-Object System.Collections.ArrayList
  [void]$graph.Add([ordered]@{
    '@type'      = 'WebPage'
    '@id'        = "$url#webpage"
    url          = $url
    name         = $p.title
    description  = $p.desc
    isPartOf     = @{ '@id' = "$BASE#website" }
    about        = @{ '@id' = "$BASE#business" }
    breadcrumb   = @{ '@id' = "$url#breadcrumb" }
    inLanguage   = 'en-IN'
  })
  [void]$graph.Add([ordered]@{
    '@type'           = 'BreadcrumbList'
    '@id'             = "$url#breadcrumb"
    itemListElement   = $crumbLd.ToArray()
  })
  if ($p.serviceType) {
    [void]$graph.Add([ordered]@{
      '@type'      = 'Service'
      '@id'        = "$url#service"
      name         = $p.serviceType
      serviceType  = $p.serviceType
      provider     = @{ '@id' = "$BASE#business" }
      areaServed   = @{ '@type' = 'City'; name = 'Rohtak'; containedInPlace = @{ '@type' = 'State'; name = 'Haryana' } }
      url          = $url
    })
  }
  if ($p.faq -and $p.faq.Count -gt 0) {
    $qa = @($p.faq | ForEach-Object {
      [ordered]@{
        '@type'          = 'Question'
        name             = $_.q
        acceptedAnswer   = [ordered]@{ '@type' = 'Answer'; text = ($_.a -replace '<[^>]+>', '') }
      }
    })
    [void]$graph.Add([ordered]@{ '@type' = 'FAQPage'; '@id' = "$url#faq"; mainEntity = $qa })
  }
  $ld = [ordered]@{ '@context' = 'https://schema.org'; '@graph' = $graph.ToArray() } |
        ConvertTo-Json -Depth 12

  # ---- FAQ markup (mirrors the FAQPage text exactly) ------------------------
  $faqHtml = ''
  if ($p.faq -and $p.faq.Count -gt 0) {
    $items = ($p.faq | ForEach-Object {
      "        <details>`n          <summary>$($_.q)</summary>`n          <div class=""faq__a"">$($_.a)</div>`n        </details>"
    }) -join "`n"
    $faqHtml = @"

      <h2 id="faq">Common questions</h2>
      <div class="faq">
$items
      </div>
"@
  }

  $robots = if ($p.noindex) { 'noindex, follow' } else { 'index, follow, max-image-preview:large' }
  $canonical = if ($p.noindex) { '' } else { "`n<link rel=""canonical"" href=""$url"">" }

@"
<!DOCTYPE html>
<html lang="en-IN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$($p.title)</title>
<meta name="description" content="$($p.desc)">
<meta name="robots" content="$robots">$canonical
<meta name="theme-color" content="#F3F7FA">

<meta property="og:type" content="website">
<meta property="og:site_name" content="$SITE">
<meta property="og:locale" content="en_IN">
<meta property="og:title" content="$($p.title)">
<meta property="og:description" content="$($p.desc)">
<meta property="og:url" content="$url">
<meta property="og:image" content="${BASE}assets/img/founder-jagvender-siwach-1400.jpg">
<meta property="og:image:alt" content="Jagvender Siwach, Founder of Shubh Awas Properties, Rohtak">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="$($p.title)">
<meta name="twitter:description" content="$($p.desc)">
<meta name="twitter:image" content="${BASE}assets/img/founder-jagvender-siwach-1400.jpg">

<link rel="icon" href="/assets/img/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/assets/img/logo-mark.svg">

<script>document.documentElement.className += " js";</script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500&family=Jost:wght@300;400;500&display=swap">
<link rel="stylesheet" href="/assets/css/site.css?v=2">
<link rel="stylesheet" href="/assets/css/pages.css?v=2">

<script src="/assets/js/config.js" defer></script>
<script src="/assets/js/site.js" defer></script>

<script type="application/ld+json">
$ld
</script>
</head>

<body>

<a class="skip" href="#main">Skip to content</a>

<!-- NAV:START -->
<header class="header is-stuck" id="header">
  <div class="header__in">

    <a class="lockup" href="/" aria-label="$SITE &mdash; home">
$LOGO_SVG
      <span class="lockup__type">
        <span class="lockup__word">Shubh Awas</span>
        <span class="lockup__desc">Properties</span>
      </span>
    </a>

$nav

    <a class="header__tel js-phone" href="#">
      <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.6 10.8a15.1 15.1 0 0 0 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.2.4 2.4.6 3.7.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1A17 17 0 0 1 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.7.1.3 0 .7-.2 1l-2.3 2.1Z"/></svg>
      <span>+91 98121 34638</span>
    </a>

    <button class="burger" id="burger" aria-label="Open menu" aria-expanded="false" aria-controls="drawer">
      <i></i><i></i><i></i>
    </button>

  </div>
</header>

<div class="drawer" id="drawer">
$drawer
</div>
<!-- NAV:END -->

<main id="main">

  <div class="shell crumbs">
    <nav aria-label="Breadcrumb">
      <ol>
$($crumbHtml.ToString().TrimEnd())
      </ol>
    </nav>
  </div>

  <section class="pagehero">
    <div class="shell">
      <p class="eyebrow">$($p.kicker)</p>
      <h1>$($p.h1)</h1>
      <p class="lede">$($p.lede)</p>
      <div class="pagehero__actions">
        <a class="btn btn--solid" data-wa href="#">WhatsApp Us <span class="arw" aria-hidden="true">&rarr;</span></a>
        <a class="btn btn--outline js-phone" href="#">Call +91 98121 34638</a>
      </div>
    </div>
  </section>

  <section class="section on-white">
    <div class="shell pagebody">
      <div class="prose">
$($p.body)
$faqHtml
      </div>

      <aside class="aside">
        <div class="aside__card">
          <h3>Ask about availability</h3>
          <p>Tell us the size and budget you have in mind. If we have something that
             fits we will send details the same day &mdash; and if we do not, we will
             say so.</p>
          <a class="btn btn--solid" data-wa href="#">Message on WhatsApp</a>
          <a class="btn btn--outline js-phone" href="#">Call the office</a>
        </div>
        <div class="aside__card">
          <h3>Visit the office</h3>
          <p class="js-address">Shubh Awas Properties
RHXP+RH6, Sector 22, Sunari Kalan
Rohtak, Haryana 124010</p>
          <a class="btn btn--outline js-directions" href="https://www.google.com/maps/dir/?api=1&amp;destination=28.8495439,76.5863847" target="_blank" rel="noopener">Get directions</a>
        </div>
      </aside>
    </div>
  </section>

  <section class="section--tight ctaband">
    <div class="shell-wide ctaband__in">
      <div>
        <h2>$($p.ctaHead)</h2>
        <p>$($p.ctaText)</p>
      </div>
      <div class="ctaband__actions">
        <a class="btn btn--solid" data-wa href="#">WhatsApp Us <span class="arw" aria-hidden="true">&rarr;</span></a>
        <a class="btn btn--outline" href="/contact/">Book a site visit</a>
      </div>
    </div>
  </section>

</main>

<!-- FOOTER:START -->
<footer class="footer">
$footer
</footer>
<!-- FOOTER:END -->

<a class="wa" data-wa href="#" target="_blank" rel="noopener" aria-label="Chat with us on WhatsApp">
  <span class="wa__ico" aria-hidden="true">
    <svg viewBox="0 0 32 32"><path d="M16.04 3C8.9 3 3.1 8.8 3.1 15.94c0 2.28.6 4.5 1.74 6.46L3 29.5l7.28-1.9a12.9 12.9 0 0 0 5.76 1.37h.01c7.13 0 12.93-5.8 12.93-12.94 0-3.46-1.35-6.7-3.8-9.15A12.83 12.83 0 0 0 16.04 3Zm0 23.7h-.01a10.7 10.7 0 0 1-5.46-1.5l-.4-.23-4.06 1.06 1.08-3.96-.26-.4a10.68 10.68 0 0 1-1.64-5.72c0-5.92 4.83-10.75 10.76-10.75 2.87 0 5.57 1.12 7.6 3.15a10.68 10.68 0 0 1 3.15 7.6c0 5.94-4.83 10.76-10.76 10.76Zm5.9-8.05c-.32-.16-1.9-.94-2.2-1.05-.3-.1-.51-.16-.73.17-.21.32-.83 1.04-1.02 1.26-.19.21-.38.24-.7.08-.32-.16-1.36-.5-2.6-1.6-.96-.86-1.6-1.92-1.79-2.24-.19-.32-.02-.5.14-.66.14-.14.32-.38.48-.56.16-.19.21-.32.32-.54.1-.21.05-.4-.03-.56-.08-.16-.72-1.74-.99-2.38-.26-.62-.52-.54-.72-.55l-.61-.01c-.21 0-.56.08-.85.4-.29.32-1.11 1.09-1.11 2.65s1.14 3.08 1.3 3.29c.16.21 2.24 3.42 5.43 4.8.76.33 1.35.52 1.81.67.76.24 1.45.21 2 .13.61-.09 1.9-.78 2.16-1.53.27-.75.27-1.39.19-1.52-.08-.13-.29-.21-.61-.37Z"/></svg>
  </span>
  <span class="wa__label" id="waLabel">Chat on WhatsApp</span>
</a>

</body>
</html>
"@
}

# -- write every page ----------------------------------------------------------
$written = @()
foreach ($p in $PAGES) {
  $dir = Join-Path $Root ($p.slug.Trim('/') -replace '/', '\')
  if ($p.slug -eq '/404.html') { $dir = $Root }
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
  $file = if ($p.slug -eq '/404.html') { Join-Path $Root '404.html' } else { Join-Path $dir 'index.html' }
  Build-Page $p | Set-Content -Path $file -Encoding UTF8
  $written += $file
  Write-Host ("  wrote {0}" -f $file.Replace($Root, '').TrimStart('\'))
}

# -- patch the hand-built home page so the nav and footer cannot drift ---------
# investors.html is deliberately excluded: it carries its own IR nav (.irnav)
# and footer (.irfoot), which are a different design on purpose.
foreach ($hand in @('index.html')) {
  $path = Join-Path $Root $hand
  if (-not (Test-Path $path)) { continue }
  $html = Get-Content $path -Raw
  $cur = if ($hand -eq 'index.html') { '/' } else { '/investors.html' }

  $navBlock = @"
<!-- NAV:START -->
<header class="header" id="header">
  <div class="header__in">

    <a class="lockup" href="/" aria-label="$SITE &mdash; home">
$LOGO_SVG
      <span class="lockup__type">
        <span class="lockup__word">Shubh Awas</span>
        <span class="lockup__desc">Properties</span>
      </span>
    </a>

$(Build-DesktopNav $cur)

    <a class="header__tel js-phone" href="#">
      <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.6 10.8a15.1 15.1 0 0 0 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.2.4 2.4.6 3.7.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1A17 17 0 0 1 3 4c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.7.1.3 0 .7-.2 1l-2.3 2.1Z"/></svg>
      <span>+91 98121 34638</span>
    </a>

    <button class="burger" id="burger" aria-label="Open menu" aria-expanded="false" aria-controls="drawer">
      <i></i><i></i><i></i>
    </button>

  </div>
</header>

<div class="drawer" id="drawer">
$(Build-Drawer $cur)
</div>
<!-- NAV:END -->
"@

  $footBlock = "<!-- FOOTER:START -->`n<footer class=""footer"">`n$(Build-Footer)`n</footer>`n<!-- FOOTER:END -->"

  if ($html -match '(?s)<!-- NAV:START -->.*?<!-- NAV:END -->') {
    $html = [regex]::Replace($html, '(?s)<!-- NAV:START -->.*?<!-- NAV:END -->', { $navBlock })
  } else {
    Write-Host ("  ! {0}: no NAV markers, nav left alone" -f $hand) -ForegroundColor DarkYellow
  }
  if ($html -match '(?s)<!-- FOOTER:START -->.*?<!-- FOOTER:END -->') {
    $html = [regex]::Replace($html, '(?s)<!-- FOOTER:START -->.*?<!-- FOOTER:END -->', { $footBlock })
  } else {
    Write-Host ("  ! {0}: no FOOTER markers, footer left alone" -f $hand) -ForegroundColor DarkYellow
  }

  # interior-page CSS is needed for the dropdown nav on these two as well
  if ($html -notmatch 'pages\.css') {
    $html = $html -replace '(<link rel="stylesheet" href="[^"]*site\.css[^"]*">)', "`$1`n<link rel=""stylesheet"" href=""/assets/css/pages.css?v=2"">"
  }

  Set-Content -Path $path -Value $html -Encoding UTF8
  Write-Host ("  patched {0}" -f $hand)
}

# -- sitemap -------------------------------------------------------------------
$locs = @($BASE, ($BASE + 'investors.html'))
foreach ($p in $PAGES) {
  if ($p.noindex) { continue }
  $locs += ($BASE.TrimEnd('/') + $p.slug)
}
$urls = ($locs | Sort-Object -Unique | ForEach-Object {
  "  <url>`n    <loc>$_</loc>`n    <lastmod>$TODAY</lastmod>`n  </url>"
}) -join "`n"

@"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$urls
</urlset>
"@ | Set-Content -Path (Join-Path $Root 'sitemap.xml') -Encoding UTF8

Write-Host ""
Write-Host ("Done. {0} pages generated, sitemap has {1} urls." -f $written.Count, ($locs | Sort-Object -Unique).Count) -ForegroundColor Green
