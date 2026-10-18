# =============================================================================
#  Page content for build-pages.ps1.
#
#  ASCII only. All typography is written as HTML entities so PowerShell 5.1
#  cannot mangle it. Edit copy HERE, never in the generated HTML.
#
#  Rule followed throughout: nothing is stated as fact that has not been
#  supplied by the owner. No prices, plot sizes, approval numbers, RERA
#  numbers, possession dates or availability counts appear anywhere, because
#  none of those have been verified. Pages describe how the firm works and
#  what a buyer should check - which is true, useful, and safe to publish.
# =============================================================================

$PROPS  = @{ label = 'Properties'; href = '/plots-in-rohtak/' }
$AREAS  = @{ label = 'Areas in Rohtak'; href = '/areas/omaxe-city-sector-22d/' }
$PROJ   = @{ label = 'Projects'; href = '/projects/' }

$PAGES = @(

# ---------------------------------------------------------------- PLOTS -----
@{
  slug   = '/plots-in-rohtak/'
  crumb  = 'Residential Plots'
  parent = $PROPS
  title  = 'Residential Plots in Rohtak | Shubh Awas Properties'
  desc   = 'Residential plots for sale in Rohtak - licensed colony and HSVP sectors. Title checked before we show you anything. Talk to Jagvender Siwach directly.'
  kicker = 'Residential Plots'
  h1     = 'Residential Plots in Rohtak'
  lede   = 'Land you can build on, with the paperwork checked before you are asked for a rupee. We work the Rohtak plot market every day and will tell you plainly which sectors are worth your money and which are not.'
  serviceType = 'Residential plot sales and advisory in Rohtak'
  ctaHead = 'Looking for a plot in a particular sector?'
  ctaText = 'Tell us the size and budget you have in mind. We will come back the same day with what actually fits, or tell you honestly that we do not have it.'
  body = @'
<h2>What we deal in</h2>
<p>Residential plots across Rohtak &mdash; both inside licensed private colonies and
in the HSVP (formerly HUDA) sectors. Most buyers who come to us are in one of
three situations: building a home in the next year or two, holding land for a
few years before building, or moving money out of a fixed deposit into
something physical.</p>
<p>Those are different purchases and they need different plots. A plot you will
build on in six months needs power, water and an approach road that already
exist. A plot you are holding for five years can afford to be a stage earlier,
where the entry price is lower. We will ask which one you are before we show
you anything.</p>

<h2>Licensed colony or HSVP sector?</h2>
<p>This is the first real decision, and most buyers are never told the
difference properly.</p>
<h3>HSVP sectors</h3>
<p>Allotted by the state authority. The layout, roads and services are the
authority's responsibility, the title chain is usually cleaner, and resale is
generally easier because buyers trust the source. Transfer involves the
authority, so the paperwork takes longer.</p>
<h3>Licensed private colonies</h3>
<p>Developed by a private builder under a state licence. Possession and
development usually move faster, and amenities are often better. The thing to
verify is the licence itself, and whether the particular plot falls inside the
licensed area &mdash; not every plot sold near a colony is in it.</p>
<div class="notice">
  <b>The question worth asking any dealer:</b> is this plot inside the licensed
  area, and can I see the licence? If the answer is vague, walk away. We will
  show you the document before you commit.
</div>

<h2>What we check before a plot reaches our list</h2>
<ul class="checks">
  <li><b>Ownership chain.</b> Who has owned it, and whether every transfer in
      that chain was registered properly.</li>
  <li><b>Mutation records.</b> Whether the revenue record actually reflects the
      current owner, which is where a surprising number of deals come apart.</li>
  <li><b>Encumbrance.</b> Whether there is a loan, lien or attachment sitting
      against the land.</li>
  <li><b>Approvals.</b> Licence and layout approval for colony plots; allotment
      and transfer permission for HSVP plots.</li>
  <li><b>The plot on the ground.</b> That the boundaries, dimensions and
      approach road match the layout plan, not just the brochure.</li>
</ul>

<h2>What it costs beyond the rate</h2>
<p>The quoted rate per square yard is never the whole number. Before you commit
we write out the full figure: the plot rate, external and internal development
charges where they apply, any preferential location charge, stamp duty,
registration fee and the cost of mutation afterwards. People get caught out at
the sub-registrar's office because nobody added it up for them in advance.</p>
<p>Stamp duty and registration charges are set by the Haryana government and
change from time to time, so we calculate the current figure against your
specific deal rather than quoting a percentage here that may be out of date by
the time you read it.</p>

<h2>Where we work</h2>
<p>We cover Rohtak city and the sectors around it. The micro-markets we know
best are <a href="/areas/omaxe-city-sector-22d/">Omaxe City in Sector 22D</a>,
<a href="/areas/suncity-sector-34-36a/">Suncity across Sectors 34 to 36A</a>,
<a href="/areas/one-city-sector-27a/">One City in Sector 27A</a> and the
<a href="/areas/hsvp-sectors-rohtak/">HSVP sectors</a>. If you are weighing a
plot against a built option, the comparison on our
<a href="/independent-floors-in-rohtak/">independent floors</a> page is worth
reading first.</p>
'@
  faq = @(
    @{ q = 'Can I get a home loan on a plot?'
       a = '<p>Banks do lend against plots, but the product is usually a plot loan or a composite plot-plus-construction loan rather than an ordinary home loan, and the terms differ. Lenders are also more comfortable with approved colony and HSVP plots than with unapproved land. We go through this on our <a href="/home-loan-and-registry-support/">loan and registry support</a> page and will tell you before you commit whether a specific plot is likely to be financeable.</p>' },
    @{ q = 'How long does registry take after I agree a price?'
       a = '<p>For a straightforward private sale with clean papers, registry can usually be done quickly once both parties and the documents are ready. HSVP transfers take longer because the authority is involved. What actually causes delay is almost never the sub-registrar - it is a missing mutation, an unreleased loan or a co-owner who has not signed. We check those first, which is why we look at the title before showing you the plot.</p>' },
    @{ q = 'Is it better to buy a plot or a built floor?'
       a = '<p>A plot gives you control over what gets built and tends to cost less at entry, but you carry the construction and the wait. A built floor is immediate and loan-friendly but you take the builder&rsquo;s choices as they are. If you need to move in within a year, a floor is usually the sensible answer. If you are holding or want to build to your own plan, land is.</p>' },
    @{ q = 'Do you charge the buyer a fee?'
       a = '<p>Brokerage is agreed openly before anything proceeds, and it is stated to you in writing along with the rest of the costing. We do not take an undisclosed cut from both sides of a deal.</p>' }
  )
},

# --------------------------------------------------------------- FLOORS -----
@{
  slug   = '/independent-floors-in-rohtak/'
  crumb  = 'Independent Floors'
  parent = $PROPS
  title  = 'Independent Floors for Sale in Rohtak | Shubh Awas'
  desc   = 'Independent builder floors for sale in Rohtak - ready and under-construction. Registry, loan help and honest advice on which floors are worth buying.'
  kicker = 'Independent Floors'
  h1     = 'Independent Floors in Rohtak'
  lede   = 'A whole floor to yourself &mdash; your own entrance, no shared walls above or below, and none of the wait that comes with building on a plot.'
  serviceType = 'Independent floor sales and advisory in Rohtak'
  ctaHead = 'Want to see a floor this week?'
  ctaText = 'Tell us your budget and how soon you need possession. We will line up what genuinely fits and walk you through it.'
  body = @'
<h2>Why people choose a floor</h2>
<p>An independent floor sits between a plot and a flat. You get the privacy of
your own entrance and no neighbours above or below, without taking on a
construction project or paying society maintenance for amenities you may never
use.</p>
<p>For most families in Rohtak the deciding factor is time. A floor can be moved
into. A plot is a year or two of building before anyone sleeps there.</p>

<h2>What to look at before you buy</h2>
<ul class="checks">
  <li><b>Which floor you are buying.</b> Ground floor usually carries parking
      and garden rights and prices higher; upper floors are cheaper and
      quieter. Terrace rights are a separate question &mdash; get it in writing
      who owns the roof.</li>
  <li><b>Whether the floor is independently registrable.</b> This is the one
      that matters most. You want your floor registered in your own name, not
      a share in an undivided plot. Ask to see how the previous floors in the
      same building were registered.</li>
  <li><b>Build quality you can actually inspect.</b> Walk the floor. Check the
      plumbing runs, the electrical load sanctioned, the window fittings and
      whether the finishes are what was promised.</li>
  <li><b>Common areas and the staircase.</b> Who maintains them, and whether
      that is written down anywhere.</li>
  <li><b>Parking.</b> Stated clearly, allotted, and ideally in the paperwork.</li>
</ul>

<h2>Ready or under construction</h2>
<p>A completed floor is the lower-risk purchase: you see exactly what you are
getting and can move in. An under-construction floor is usually cheaper and
lets you influence finishes, but you are taking on delivery risk, so the
builder&rsquo;s track record matters more than the brochure.</p>
<p>We will tell you which builders in Rohtak have actually delivered and which
have not. That is the part of this job you cannot get from a listing site.</p>

<div class="notice">
  <b>On possession dates:</b> we do not repeat a builder&rsquo;s promised date as
  though it were a fact. We will tell you what the site looks like today and
  what comparable projects by the same builder actually took.
</div>

<h2>Floors in the Rohtak townships</h2>
<p>Most of the floor inventory we see is inside the planned developments &mdash;
<a href="/areas/omaxe-city-sector-22d/">Omaxe City</a>,
<a href="/areas/suncity-sector-34-36a/">Suncity</a> and
<a href="/areas/one-city-sector-27a/">One City</a> &mdash; along with
independent builder floors in the established HSVP sectors. If you want the
whole township package with security and maintenance handled, read
<a href="/township-homes-in-rohtak/">township homes</a> instead.</p>
'@
  faq = @(
    @{ q = 'Can an independent floor be registered in my name alone?'
       a = '<p>Yes, where the building has been set up for it. That is exactly what to verify before paying anything - you want a registry for your floor, not an undivided share in the plot. We check how earlier floors in the same building were registered and show you the documents.</p>' },
    @{ q = 'Who owns the terrace?'
       a = '<p>It depends entirely on the agreement, and it is one of the most common sources of dispute between floor owners. Sometimes it goes with the top floor, sometimes it is shared, sometimes the builder retains it. Never assume - get it written into the agreement.</p>' },
    @{ q = 'Are floors easier to get a loan on than plots?'
       a = '<p>Generally yes. A built, independently registrable floor with clear approvals is a straightforward home loan for most lenders, whereas plots need a plot or composite loan. See <a href="/home-loan-and-registry-support/">loan and registry support</a>.</p>' }
  )
},

# ------------------------------------------------------------- TOWNSHIP -----
@{
  slug   = '/township-homes-in-rohtak/'
  crumb  = 'Township Homes'
  parent = $PROPS
  title  = 'Township Homes &amp; Flats in Rohtak | Shubh Awas Properties'
  desc   = 'Township homes and flats in Rohtak - gated developments with security, power backup and maintenance handled. Honest guidance on which township suits you.'
  kicker = 'Township Homes'
  h1     = 'Township Homes in Rohtak'
  lede   = 'Everything settled from day one &mdash; internal roads, security, power backup, daily-needs retail and someone whose job it is to maintain all of it.'
  serviceType = 'Township home and flat sales in Rohtak'
  ctaHead = 'Not sure which township fits?'
  ctaText = 'They differ more than the brochures suggest. Tell us how you live and we will tell you which one actually suits you.'
  body = @'
<h2>Who a township suits</h2>
<p>Townships work best for families who want the decisions already made.
Security at the gate, a maintenance team, reliable common-area power, parks
inside the boundary and shops within walking distance. You pay a monthly
maintenance charge and in return you stop thinking about any of it.</p>
<p>They suit people relocating to Rohtak without a local support network,
families with young children who want them playing inside a boundary, and
anyone who travels and would rather their home were watched while they are
away.</p>

<h2>What to compare between townships</h2>
<ul class="checks">
  <li><b>What is actually built versus what is drawn.</b> Walk the site. A
      master plan showing a clubhouse is not a clubhouse.</li>
  <li><b>How many families already live there.</b> An occupied township is a
      functioning one. An empty one can stay empty for years.</li>
  <li><b>The maintenance charge, and what it covers.</b> Ask for the current
      figure in writing and what happened to it over the last three years.</li>
  <li><b>Power backup.</b> Common areas only, or inside the home too, and up to
      what load.</li>
  <li><b>Water.</b> Where it comes from and whether supply has been reliable
      through summer.</li>
  <li><b>Who will run it long term.</b> Whether the developer still manages it
      or an owners&rsquo; association has taken over.</li>
</ul>

<h2>The honest trade-off</h2>
<p>A township home usually costs more per square foot than an independent floor
in an older sector, and you carry a maintenance charge for as long as you own
it. What you are buying with that premium is predictability.</p>
<p>If you are comfortable managing your own property and you value the lower
running cost, an <a href="/independent-floors-in-rohtak/">independent floor</a>
in an established HSVP sector is often the better financial decision. We will
say so if that is what we think.</p>

<h2>Townships we work in</h2>
<p>The main planned developments in Rohtak we deal with are
<a href="/areas/omaxe-city-sector-22d/">Omaxe City in Sector 22D</a> on Jhajjar
Road, <a href="/areas/suncity-sector-34-36a/">Suncity across Sectors 34 to
36A</a>, and <a href="/areas/one-city-sector-27a/">One City in Sector 27A</a>.
Each has a different character and a different buyer. See our
<a href="/projects/">projects page</a> for the developments we represent
directly.</p>
'@
  faq = @(
    @{ q = 'What does the maintenance charge cover?'
       a = '<p>Typically security, common-area lighting and power backup, lift maintenance where applicable, horticulture, sanitation and upkeep of internal roads. It varies by township, so ask for the current figure in writing and what it covers before you buy, not after.</p>' },
    @{ q = 'Is a township flat a good investment or only for living in?'
       a = '<p>It can be either, but they behave differently. Occupied townships with working amenities hold value and rent well. Half-built ones can sit for years. The occupancy level on the day you visit tells you more than any projection. We will not give you a return figure, because nobody can honestly give you one.</p>' },
    @{ q = 'Can I rent a township home out?'
       a = '<p>Generally yes, and townships often rent more easily than standalone property because tenants value the security and amenities. Some have rules about tenant registration with the association. We cover rentals on our <a href="/resale-and-rental-property-in-rohtak/">resale and rentals</a> page.</p>' }
  )
},

# ----------------------------------------------------------- COMMERCIAL -----
@{
  slug   = '/commercial-property-in-rohtak/'
  crumb  = 'Commercial Property'
  parent = $PROPS
  title  = 'Commercial Property in Rohtak - Shops, SCO &amp; Offices'
  desc   = 'Commercial property in Rohtak - shops, SCO plots, showrooms and office space. Footfall, frontage and yield assessed honestly before you commit.'
  kicker = 'Commercial Property'
  h1     = 'Commercial Property in Rohtak'
  lede   = 'Shops, SCO plots, showrooms and office space &mdash; bought on footfall and frontage, not on a brochure render.'
  serviceType = 'Commercial property sales and leasing in Rohtak'
  ctaHead = 'Buying to trade from, or to let out?'
  ctaText = 'They are different purchases and want different locations. Tell us which, and we will show you only what fits.'
  body = @'
<h2>What we handle</h2>
<p>Shops in established markets, SCO (shop-cum-office) plots, showrooms on main
roads, and office space. We also deal in industrial plots around
<a href="/areas/imt-rohtak/">IMT Rohtak</a>.</p>

<h2>Commercial is bought on different things</h2>
<p>Residential buyers ask about the home. Commercial buyers should be asking
about the traffic past the door. The questions that actually decide whether a
commercial property earns:</p>
<ul class="checks">
  <li><b>Footfall, counted at the right time.</b> Visit on a weekday evening and
      a Sunday. A market that is busy at 11am on a Tuesday and dead at 7pm on
      Saturday tells you who the customer is.</li>
  <li><b>Frontage and visibility.</b> Width of the shopfront, whether it is
      visible from the main road, and what sits directly opposite.</li>
  <li><b>Parking.</b> Customers who cannot stop do not shop.</li>
  <li><b>The corner premium.</b> Corner units cost more and usually earn it.
      Decide whether it is worth it for your trade specifically.</li>
  <li><b>Permitted use.</b> That the unit may legally be used for what you
      intend &mdash; food, clinic and showroom uses are not always allowed.</li>
  <li><b>The real rent in that market.</b> Not the asking rent. What units
      there have actually let for recently.</li>
</ul>

<h2>Yield, stated honestly</h2>
<p>We do not publish rental yield figures, because a yield quoted without a
specific unit attached to it is marketing. For a property you are seriously
considering we will tell you what comparable units in that market have actually
rented for, and what they stood empty for between tenants. Vacancy is the
number most people forget, and it is the one that decides whether a commercial
purchase works.</p>

<div class="notice">
  <b>If someone quotes you a guaranteed return on a commercial unit,</b> ask who
  is guaranteeing it, for how long, and what happens when they stop. Assured
  return schemes have left a lot of buyers in difficulty.
</div>

<h2>Buying to trade from</h2>
<p>If you are buying a shop to run your own business from, the calculation is
different again. The right question is not what it will rent for but whether
the location will carry your trade &mdash; which depends on what you sell, who
buys it and where they already go. We would rather talk that through than sell
you the wrong unit.</p>
'@
  faq = @(
    @{ q = 'What is an SCO plot?'
       a = '<p>Shop-cum-office: a plot where the permitted use allows retail on the lower floor and office above, usually in a planned commercial block. You buy the plot and build to the sanctioned plan, which gives more control than buying a finished unit, and takes longer.</p>' },
    @{ q = 'Is commercial property a better investment than residential?'
       a = '<p>Commercial typically yields more rent as a percentage of value, but it carries longer vacancy periods, more tenant-specific fit-out cost and sharper sensitivity to location. One wrong-side-of-the-road shop can sit empty for a year. It rewards knowing the specific market rather than the general trend.</p>' },
    @{ q = 'Can I get a loan on commercial property?'
       a = '<p>Yes, though commercial property loans usually carry different rates, tenures and margin requirements than home loans. See <a href="/home-loan-and-registry-support/">loan and registry support</a>.</p>' }
  )
},

# ------------------------------------------------- RESALE AND RENTALS -------
@{
  slug   = '/resale-and-rental-property-in-rohtak/'
  crumb  = 'Resale &amp; Rentals'
  parent = $PROPS
  title  = 'Resale Property &amp; Rentals in Rohtak | Shubh Awas'
  desc   = 'Resale houses, plots and floors in Rohtak, plus rental property for tenants and landlords. What to verify on a resale before you pay anything.'
  kicker = 'Resale &amp; Rentals'
  h1     = 'Resale Property and Rentals in Rohtak'
  lede   = 'Established sectors, built homes and tenants already in place &mdash; with the extra checks a resale needs and a new build does not.'
  serviceType = 'Resale property and rental brokerage in Rohtak'
  ctaHead = 'Selling, or looking to rent?'
  ctaText = 'Tell us what you have or what you need. We work both sides and will give you a realistic figure rather than the one you want to hear.'
  body = @'
<h2>Why buy resale</h2>
<p>Resale property in the established Rohtak sectors has things a new
development cannot offer yet: grown trees, working infrastructure, neighbours
who already live there, schools and shops that already function, and no wait
for possession. You can see exactly what you are buying because it exists.</p>
<p>The trade-off is age. The building has a history, and so does the title.</p>

<h2>What a resale needs that a new purchase does not</h2>
<ul class="checks">
  <li><b>The full title chain, not just the last sale.</b> Every owner back as
      far as records allow, with each transfer properly registered.</li>
  <li><b>Mutation completed in the seller&rsquo;s name.</b> If the current seller
      never completed mutation, you are buying a problem.</li>
  <li><b>No outstanding loan on the property.</b> If there is one, the release
      must be part of the transaction, not a promise afterwards.</li>
  <li><b>All dues cleared.</b> Property tax, electricity, water and any
      maintenance or association dues. These follow the property, not the
      seller.</li>
  <li><b>Co-owners and inheritance.</b> If the property passed through a
      family, every person with a claim needs to sign. This is the single most
      common cause of a resale deal collapsing late.</li>
  <li><b>Unapproved additions.</b> A covered terrace or an extra room built
      without sanction can block your loan and your resale.</li>
</ul>

<h2>Selling your property</h2>
<p>If you are selling, the two things that cost people money are pricing on
hope and paperwork that is not ready. We will give you a realistic figure based
on what has actually transacted nearby, and tell you which documents to get in
order before the first buyer visits. A clean file sells faster and at a better
price than a negotiation conducted while chasing a missing mutation.</p>

<h2>Rentals</h2>
<p>We handle rentals for both sides. For landlords: tenant verification, a
written agreement, and a rent that reflects the market rather than the
neighbour&rsquo;s anecdote. For tenants: honest information about the property,
the landlord and what the actual monthly cost will be once maintenance and
electricity are counted.</p>
<div class="notice">
  <b>Always put a rental agreement in writing</b> and register it where
  required. A verbal tenancy protects nobody &mdash; and when it goes wrong, it
  goes wrong for both sides.
</div>
'@
  faq = @(
    @{ q = 'What is the biggest risk in a resale purchase?'
       a = '<p>Inheritance. Where a property has passed down through a family, every person with a legal claim must sign the sale. Deals most often collapse late because a co-owner surfaces after money has changed hands. This is checked first, before anything else.</p>' },
    @{ q = 'Can I get a loan on a resale property?'
       a = '<p>Usually yes, provided the title is clean, mutation is complete and there are no unapproved constructions. Lenders also look at the age and condition of the building. Resale loans are routine when the file is in order, which is why we get the file in order first.</p>' },
    @{ q = 'Do you help with the rental agreement?'
       a = '<p>Yes. We help get a proper written agreement in place and registered where that is required, for both landlords and tenants.</p>' }
  )
},

# ---------------------------------------------------- LOAN AND REGISTRY -----
@{
  slug   = '/home-loan-and-registry-support/'
  crumb  = 'Loan &amp; Registry Support'
  parent = $PROPS
  title  = 'Home Loan &amp; Property Registry Help in Rohtak'
  desc   = 'Home loan and property registry support in Rohtak - documents, stamp duty, registration and mutation explained, and handled with you start to finish.'
  kicker = 'Loan &amp; Registry'
  h1     = 'Loan, Registry and Paperwork Support'
  lede   = 'The part of buying property that actually goes wrong is rarely the property. It is the file. We stay with you through it rather than disappearing once the token money clears.'
  serviceType = 'Property loan, registry and documentation support in Rohtak'
  ctaHead = 'Stuck on paperwork?'
  ctaText = 'Even if you did not buy through us, call and ask. If it is a quick answer you will get it for free.'
  body = @'
<h2>Home loans</h2>
<p>Most buyers in Rohtak need finance, and most learn too late that the property
they chose was never going to be financeable. We look at that first.</p>
<h3>What lenders actually look at</h3>
<ul class="checks">
  <li><b>Your income and existing obligations</b> &mdash; which set the amount
      you can borrow before the property is even discussed.</li>
  <li><b>The property&rsquo;s approvals and title.</b> An unapproved colony or a
      broken title chain will stop a loan regardless of your income.</li>
  <li><b>The type of purchase.</b> A built, registrable home is the simplest
      case. Plots usually need a plot loan or a composite plot-and-construction
      loan, which fewer lenders offer and on different terms.</li>
  <li><b>Age of the building, for resale.</b> Older properties can attract
      shorter tenures.</li>
</ul>
<p>We will tell you honestly, before you pay a token, whether a specific
property is likely to be financeable. That one conversation has saved our
clients more trouble than anything else we do.</p>

<h2>The registry, step by step</h2>
<ol>
  <li><strong>Agreement to sell.</strong> Terms, price, timeline and what
      happens if either side does not perform, in writing.</li>
  <li><strong>Document verification.</strong> Title chain, mutation,
      encumbrance, approvals, dues. Done before money moves, not after.</li>
  <li><strong>Stamp duty.</strong> Calculated on the applicable value. Rates are
      set by the Haryana government and are revised from time to time, so we
      compute the current figure for your deal rather than quoting one here.</li>
  <li><strong>Registration at the sub-registrar.</strong> Both parties present
      with identification and witnesses; the deed is executed and registered.</li>
  <li><strong>Mutation (intkaal).</strong> The revenue record is updated into
      your name. <strong>This is the step people skip</strong>, and it is the
      one that causes trouble years later when you try to sell or borrow
      against the property.</li>
</ol>

<div class="notice">
  <b>Registry is not the finish line.</b> Until mutation is complete, the
  revenue record still shows the previous owner. We follow this through with
  you &mdash; it is part of the job, not an extra.
</div>

<h2>What you will need</h2>
<p>Identification and address proof, PAN, photographs, and the property
documents themselves. For a loan, add income proof, bank statements and
employment or business documentation. The exact list varies by lender and by
transaction, and we will give you the specific one for your case rather than a
generic checklist.</p>

<h2>After possession</h2>
<p>Transferring the electricity and water connections, updating property tax
records, and the association formalities where there are any. Small things,
but they are the ones that become difficult if left for a year.</p>
'@
  faq = @(
    @{ q = 'What is mutation and why does it matter?'
       a = '<p>Mutation, or intkaal, is the updating of the government revenue record to show you as the owner after registry. Registry transfers ownership; mutation records it in the revenue system. Without it the record still names the previous owner, which causes problems when you later sell, apply for a loan against the property, or deal with utilities and tax. It is the most commonly skipped step in the whole process.</p>' },
    @{ q = 'How much is stamp duty in Haryana?'
       a = '<p>Stamp duty and registration charges are set by the Haryana government, vary by factors including whether the buyer is male, female or joint, and are revised periodically. We will not quote a figure here that may be out of date when you read it - we calculate the current amount against your specific transaction before you commit.</p>' },
    @{ q = 'Can you help if I did not buy through you?'
       a = '<p>Call and ask. If it is a quick answer you will get it. If it is a full piece of work we will tell you what it involves first.</p>' },
    @{ q = 'Which bank should I go to?'
       a = '<p>It depends on your income profile, the property type and what you are already banking with. We will tell you which lenders are realistic for your case. We do not steer you toward a particular bank for our own benefit.</p>' }
  )
},

# ------------------------------------------------------------ AREA PAGES ----
@{
  slug   = '/areas/omaxe-city-sector-22d/'
  crumb  = 'Omaxe City, Sector 22D'
  parent = $AREAS
  title  = 'Property in Omaxe City Rohtak, Sector 22D | Shubh Awas'
  desc   = 'Plots, floors and houses in Omaxe City, Sector 22D, Rohtak on Jhajjar Road. What the township is actually like, and what to check before buying.'
  kicker = 'Area Guide'
  h1     = 'Omaxe City, Sector 22D, Rohtak'
  lede   = 'An integrated township on Jhajjar Road from a national developer &mdash; and one of the more established addresses in Rohtak for buyers who want everything working on day one.'
  serviceType = 'Property advisory in Omaxe City, Sector 22D, Rohtak'
  ctaHead = 'Looking in Omaxe City?'
  ctaText = 'Tell us whether you want a plot, a floor or a built house, and we will tell you what is genuinely available.'
  body = @'
<h2>The address</h2>
<p>Omaxe City sits in Sector 22D on the Jhajjar Road side of Rohtak. It is an
integrated township, which means the internal roads, security, common-area
power and daily-needs retail are inside the boundary and managed rather than
left to the municipality.</p>
<p>For buyers it is the straightforward option: an established development from
a national builder, with families already living there. That last part matters
more than most buyers realise &mdash; an occupied township functions, and you
can see it functioning before you buy.</p>

<h2>What we see here</h2>
<p>Residential plots, independent floors and built houses all trade in this
township. Which one suits you depends on whether you are building, moving in,
or holding. Our <a href="/plots-in-rohtak/">plots</a> and
<a href="/independent-floors-in-rohtak/">independent floors</a> pages set out
the difference properly.</p>

<h2>What to check in any township purchase</h2>
<ul class="checks">
  <li><b>Current maintenance charge</b>, in writing, and how it has moved.</li>
  <li><b>Who manages the township now</b> &mdash; the developer, or an owners&rsquo;
      association.</li>
  <li><b>Power backup</b> for common areas and whether it extends into homes.</li>
  <li><b>Water supply</b> and how it has held up through summer.</li>
  <li><b>The specific unit&rsquo;s title and dues</b>, which are separate from the
      township&rsquo;s overall standing.</li>
</ul>

<div class="notice">
  <b>We do not publish prices or availability here,</b> because both change
  weekly and a stale number helps nobody. Call or message and you will get the
  current position for the size you are after.
</div>

<h2>How it compares</h2>
<p>Against <a href="/areas/suncity-sector-34-36a/">Suncity</a>, Omaxe City is
generally the more established address with the longer occupancy history.
Against the <a href="/areas/hsvp-sectors-rohtak/">HSVP sectors</a>, you pay for
the managed environment and gain predictability. We will give you a straight
comparison for your budget rather than pushing whichever we happen to have
inventory in.</p>
'@
  faq = @(
    @{ q = 'Is Omaxe City a good place to buy in Rohtak?'
       a = '<p>It suits buyers who want a managed, gated environment with amenities working from day one, and who are comfortable carrying a monthly maintenance charge. Buyers who prefer lower running costs and are happy managing their own property often do better in an established HSVP sector. We will tell you which group you are in.</p>' },
    @{ q = 'Can I buy a plot in Omaxe City and build myself?'
       a = '<p>Plots do trade in the township, and building is subject to the sanctioned plan and the township&rsquo;s own building rules. Those rules are worth reading before you buy, because they govern what you can build and how.</p>' }
  )
},

@{
  slug   = '/areas/suncity-sector-34-36a/'
  crumb  = 'Suncity, Sector 34-36A'
  parent = $AREAS
  title  = 'Property in Suncity Rohtak, Sector 34, 35 &amp; 36A'
  desc   = 'Plots and floors in Suncity Rohtak across Sectors 34, 35 and 36A. An honest read on the area and what to verify before you buy.'
  kicker = 'Area Guide'
  h1     = 'Suncity, Sectors 34 to 36A, Rohtak'
  lede   = 'A planned residential belt spread across several adjoining sectors &mdash; and one of the areas in Rohtak where plot buyers and end users compete for the same stock.'
  serviceType = 'Property advisory in Suncity, Rohtak'
  ctaHead = 'Looking in Suncity?'
  ctaText = 'The sectors differ from each other more than the name suggests. Tell us your budget and we will point you at the right one.'
  body = @'
<h2>The area</h2>
<p>Suncity runs across Sectors 34, 35 and 36A. Because it covers several
adjoining sectors, it is not one uniform address &mdash; development, road
access and the mix of built versus vacant plots vary noticeably from one part
to another.</p>
<p>That variation is the thing to understand before buying here. Two plots a
few hundred metres apart can be at quite different stages, and the price
difference between them is often justified.</p>

<h2>What we see here</h2>
<p>Mainly residential plots and independent floors. It draws both end users
building their own homes and buyers holding land, which is why well-located
plots move quickly when they come up.</p>

<h2>What to check</h2>
<ul class="checks">
  <li><b>Which sector the plot is actually in.</b> Confirm it against the
      layout, not the seller&rsquo;s description.</li>
  <li><b>Development on the ground around it.</b> Walk the surrounding streets
      and count built homes. That tells you the real stage.</li>
  <li><b>Road access and width</b> for the specific plot.</li>
  <li><b>Services already laid</b> &mdash; electricity, water, sewerage.</li>
  <li><b>Title chain and mutation,</b> as with any plot purchase.</li>
</ul>

<h2>Plot or built</h2>
<p>If you intend to build soon, favour a part of the belt where services already
exist and neighbours have built. If you are holding, an earlier-stage plot at a
lower entry price can make sense &mdash; provided you are honest with yourself
about the holding period. Land is not a short-term position.</p>

<div class="notice">
  <b>On returns:</b> we will not give you an appreciation figure. Anyone who
  does is guessing. What we will do is tell you what nearby plots have actually
  transacted at recently, which is a fact rather than a forecast.
</div>

<h2>Nearby</h2>
<p>Compare with <a href="/areas/one-city-sector-27a/">One City in Sector 27A</a>
and <a href="/areas/omaxe-city-sector-22d/">Omaxe City in Sector 22D</a> if you
want a fully managed township instead, or the
<a href="/areas/hsvp-sectors-rohtak/">HSVP sectors</a> for established
infrastructure.</p>
'@
  faq = @(
    @{ q = 'Is Suncity good for building a house?'
       a = '<p>In the parts where services are laid and neighbours have already built, yes. In earlier-stage pockets you may be building ahead of the infrastructure, which is workable but needs to be a decision you make knowingly rather than discover afterwards. Walk the specific street before you commit.</p>' },
    @{ q = 'Which sector is best - 34, 35 or 36A?'
       a = '<p>There is no single answer; they are at different stages and suit different budgets. The right one depends on whether you are building now or holding, and how much you want to spend. That is a conversation rather than a web page.</p>' }
  )
},

@{
  slug   = '/areas/one-city-sector-27a/'
  crumb  = 'One City, Sector 27A'
  parent = $AREAS
  title  = 'Property in One City Rohtak, Sector 27A | Shubh Awas'
  desc   = 'Plots and homes in One City, Sector 27A, Rohtak. What the development offers, who it suits, and what to verify before you buy.'
  kicker = 'Area Guide'
  h1     = 'One City, Sector 27A, Rohtak'
  lede   = 'One of the newer planned addresses in Rohtak, drawing buyers who want a walkable, self-contained layout rather than a plot on an open stretch.'
  serviceType = 'Property advisory in One City, Sector 27A, Rohtak'
  ctaHead = 'Considering One City?'
  ctaText = 'Newer developments need closer checking than established ones. We will tell you exactly what is built today.'
  body = @'
<h2>The address</h2>
<p>One City is a planned development in Sector 27A. It appeals to buyers who
want a compact, self-contained layout where daily needs are close by, rather
than a plot on an open stretch waiting for the area to fill in.</p>

<h2>Buying in a newer development</h2>
<p>Newer addresses can be good value at entry, because you are buying before the
area has fully established. The risk is the mirror of that: you are relying on
development continuing. So the checks matter more here than in a settled
sector.</p>
<ul class="checks">
  <li><b>What exists today, walked and seen.</b> Not the master plan. Go and
      look at the roads, services and built units that are actually there.</li>
  <li><b>The licence and layout approval,</b> and that your specific plot falls
      inside the approved area.</li>
  <li><b>The developer&rsquo;s delivery record</b> on their earlier projects.</li>
  <li><b>How many units are sold and how many are occupied.</b> Occupancy is a
      better signal than sales.</li>
  <li><b>What is committed in writing</b> versus what is being described
      verbally.</li>
</ul>

<div class="notice">
  <b>We will not repeat a developer&rsquo;s timeline as fact.</b> We will tell you
  what the site looks like now and what the same developer&rsquo;s previous
  projects actually took to deliver.
</div>

<h2>Who it suits</h2>
<p>Buyers who want a newer address and are prepared to be early, and investors
comfortable with a multi-year hold. If you need an established neighbourhood
with schools and shops already running, the
<a href="/areas/hsvp-sectors-rohtak/">HSVP sectors</a> or
<a href="/areas/omaxe-city-sector-22d/">Omaxe City</a> will serve you better,
and we will say so.</p>
'@
  faq = @(
    @{ q = 'Is it risky to buy in a newer development?'
       a = '<p>It carries a different risk profile, not necessarily a higher one, provided the approvals are in order and the developer has delivered before. The real risk is buying on a drawing. Verify the licence, verify the plot falls inside the approved layout, and walk the site. Then it is a reasonable decision made with open eyes.</p>' },
    @{ q = 'What happens if the development does not progress?'
       a = '<p>You own the land either way, assuming title is clean - which is exactly why we check title before anything else. But liquidity suffers and resale gets harder if the area stalls. That is the honest downside, and it is why we ask how long you intend to hold.</p>' }
  )
},

@{
  slug   = '/areas/hsvp-sectors-rohtak/'
  crumb  = 'HSVP Sectors'
  parent = $AREAS
  title  = 'HSVP Plots &amp; Houses in Rohtak Sectors | Shubh Awas'
  desc   = 'HSVP (HUDA) plots and houses in the Rohtak sectors - established infrastructure, cleaner title and easier resale. What to know before buying.'
  kicker = 'Area Guide'
  h1     = 'HSVP Sectors in Rohtak'
  lede   = 'The established side of Rohtak &mdash; authority-developed sectors where the roads, services and neighbours already exist, and the title chain is usually the cleanest you will find.'
  serviceType = 'HSVP plot and house advisory in Rohtak'
  ctaHead = 'Want something in an HSVP sector?'
  ctaText = 'Stock is limited and moves on relationships. Tell us what you are after and we will keep an eye out.'
  body = @'
<h2>Why buyers prefer HSVP</h2>
<p>HSVP sectors &mdash; still widely called HUDA sectors &mdash; are developed by
the state authority rather than a private builder. For a buyer that means three
practical advantages.</p>
<ul class="checks">
  <li><b>Infrastructure already exists.</b> Roads, water, sewerage and power are
      laid and working, not promised.</li>
  <li><b>The title chain is usually clean,</b> because it begins with an
      authority allotment rather than a chain of private sales.</li>
  <li><b>Resale is easier.</b> Buyers and lenders both trust the source, so
      these properties find a buyer more readily when you come to sell.</li>
</ul>
<p>The trade-offs are that stock is limited, prices reflect the advantages, and
transfers take longer because the authority is involved.</p>

<h2>What we see here</h2>
<p>Mostly resale &mdash; plots, built houses and independent floors in the
established sectors. Very little comes up fresh, so a lot of this market moves
through relationships rather than listings. If you want something specific,
tell us and we will watch for it.</p>

<h2>What to verify</h2>
<ul class="checks">
  <li><b>The original allotment letter</b> and the full chain of transfers
      since.</li>
  <li><b>Transfer permission</b> from the authority where it is required.</li>
  <li><b>Any outstanding authority dues,</b> which follow the property.</li>
  <li><b>Unapproved construction.</b> Additions built without sanction can block
      both your loan and your eventual resale.</li>
  <li><b>Mutation</b> completed in the seller&rsquo;s name.</li>
</ul>

<div class="notice">
  <b>Allow more time for an HSVP transfer</b> than a private sale. The authority
  step is not optional and cannot be rushed. We plan the timeline around it
  rather than promising you a date we cannot control.
</div>

<h2>Compared with the townships</h2>
<p>You give up gated security and managed maintenance, and you gain established
infrastructure, lower running costs and easier resale. For a lot of buyers in
Rohtak that is the better trade &mdash; see
<a href="/township-homes-in-rohtak/">township homes</a> for the other side of
the argument.</p>
'@
  faq = @(
    @{ q = 'What is the difference between HUDA and HSVP?'
       a = '<p>The same authority under a different name. HUDA (Haryana Urban Development Authority) was renamed HSVP (Haryana Shehri Vikas Pradhikaran). Older documents and most everyday conversation still say HUDA. The sectors and the plots are the same.</p>' },
    @{ q = 'Are HSVP plots more expensive?'
       a = '<p>They often carry a premium, and it generally reflects something real - working infrastructure, a cleaner title and easier resale. Whether it is worth paying depends on whether you need those things now or are prepared to wait for a newer area to develop.</p>' },
    @{ q = 'Can I get a loan on an HSVP property?'
       a = '<p>Usually straightforward, because lenders are comfortable with the title. The conditions are that the transfer is properly done, dues are cleared and any construction is approved. See <a href="/home-loan-and-registry-support/">loan and registry support</a>.</p>' }
  )
},

@{
  slug   = '/areas/imt-rohtak/'
  crumb  = 'IMT Rohtak'
  parent = $AREAS
  title  = 'Industrial Plots in IMT Rohtak (HSIIDC) | Shubh Awas'
  desc   = 'Industrial plots and sheds in IMT Rohtak, the HSIIDC industrial estate. What to verify on an industrial plot before you buy or lease.'
  kicker = 'Area Guide'
  h1     = 'IMT Rohtak (HSIIDC)'
  lede   = 'The Industrial Model Township &mdash; the planned industrial estate on the Rohtak map, and a different purchase entirely from buying a home.'
  serviceType = 'Industrial plot advisory in IMT Rohtak'
  ctaHead = 'Need space in IMT Rohtak?'
  ctaText = 'Tell us the area you need and what you will run there. Permitted use decides most of this, so it is the first thing we check.'
  body = @'
<h2>What IMT Rohtak is</h2>
<p>IMT (Industrial Model Township) Rohtak is a planned industrial estate
developed under HSIIDC. It is laid out for industrial and allied use, with the
road and utility infrastructure built for that rather than for housing.</p>

<h2>An industrial purchase is not a residential one</h2>
<p>The things that decide whether an industrial plot works have almost nothing
in common with buying a home.</p>
<ul class="checks">
  <li><b>Permitted use.</b> The single most important check. The estate&rsquo;s
      rules govern what category of activity may be carried on, and the wrong
      plot for your line of work is simply the wrong plot.</li>
  <li><b>Power load.</b> What is sanctioned, and what it costs to increase it.</li>
  <li><b>Access for the vehicles you will actually run.</b> Road width and
      turning radius for trucks and containers.</li>
  <li><b>Effluent and environmental requirements,</b> which vary sharply by
      industry and can be the deciding cost.</li>
  <li><b>Allotment conditions.</b> HSIIDC allotments typically carry
      obligations &mdash; construction and commencement timelines, transfer
      restrictions. Read them before you buy, not after.</li>
</ul>

<div class="notice">
  <b>Transfer rules in an industrial estate are stricter</b> than for
  residential property, and allotment conditions can restrict resale for a
  period. Factor that into your plan, because it affects your exit.
</div>

<h2>What we do here</h2>
<p>We deal in industrial plots and sheds in and around IMT Rohtak, for buyers
setting up and for those relocating or expanding. Because permitted use and
allotment conditions drive everything, we start with what you intend to run
rather than with what is available.</p>
<p>For shops, showrooms and office space rather than industrial space, see
<a href="/commercial-property-in-rohtak/">commercial property</a>.</p>
'@
  faq = @(
    @{ q = 'Can I buy an industrial plot and use it for anything?'
       a = '<p>No. Permitted use is defined by the estate and by your allotment, and activities outside it are not allowed. Check this before anything else - it is the question that most often turns out to be a deal-breaker, and it is cheap to answer early.</p>' },
    @{ q = 'Are there conditions on an HSIIDC allotment?'
       a = '<p>Typically yes, including timelines for construction and commencement of production, and restrictions on transfer. These are real obligations with consequences, not formalities. Read them in full before you commit.</p>' },
    @{ q = 'Can I lease rather than buy?'
       a = '<p>Leasing and sub-leasing happen, subject to the estate&rsquo;s rules and the terms of the original allotment. Tell us what you need and we will tell you what is possible.</p>' }
  )
},

# ------------------------------------------------------------- PROJECTS -----
@{
  slug   = '/projects/'
  crumb  = 'Projects'
  title  = 'Our Projects in Rohtak | Shubh Awas Properties'
  desc   = 'The projects Shubh Awas Properties represents in Rohtak - Forteasia, Florence and Omaxe City. A short list on purpose, each one walked and checked.'
  kicker = 'Our Projects'
  h1     = 'Projects We Stand Behind'
  lede   = 'A short list, on purpose. Each of these has been walked, checked and understood before it was ever offered to a client.'
  ctaHead = 'Want to see one of these?'
  ctaText = 'Site visits happen on the ground, at the actual location, with the layout plan open. Tell us which and when.'
  body = @'
<h2>Why the list is short</h2>
<p>Plenty of dealers will show you anything that pays a commission. We represent
a small number of developments because we would rather know three addresses
properly than forty superficially.</p>
<p>Knowing one properly means having walked the site repeatedly, understood how
the layout actually works, checked what the developer has delivered before, and
being able to tell you honestly which part of it we would buy and which part we
would not.</p>

<div class="tiles" style="margin-top:2rem">
  <a class="tile" href="/projects/forteasia/">
    <h3>Forteasia</h3>
    <p>Residential plots and independent floors on a planned layout in Rohtak.</p>
    <span class="tile__go">View project &rarr;</span>
  </a>
  <a class="tile" href="/projects/florence/">
    <h3>Florence</h3>
    <p>Premium residential plots on a gated layout in the Rohtak sectors.</p>
    <span class="tile__go">View project &rarr;</span>
  </a>
  <a class="tile" href="/projects/omaxe-city/">
    <h3>Omaxe City</h3>
    <p>Integrated township address in Sector 22D from a national developer.</p>
    <span class="tile__go">View project &rarr;</span>
  </a>
</div>

<h2>Beyond these</h2>
<p>We also transact across the wider Rohtak market &mdash; the
<a href="/areas/hsvp-sectors-rohtak/">HSVP sectors</a>,
<a href="/areas/suncity-sector-34-36a/">Suncity</a>,
<a href="/areas/one-city-sector-27a/">One City</a> and
<a href="/areas/imt-rohtak/">IMT Rohtak</a> &mdash; and in
<a href="/resale-and-rental-property-in-rohtak/">resale and rentals</a>. If what
you want is not on this page, ask. We would rather point you somewhere good
than sell you something convenient.</p>
'@
},

@{
  slug   = '/projects/forteasia/'
  crumb  = 'Forteasia'
  parent = $PROJ
  title  = 'Forteasia Rohtak - Plots &amp; Floors | Shubh Awas'
  desc   = 'Forteasia in Rohtak - residential plots and independent floors on a planned layout. Enquire about current availability with Shubh Awas Properties.'
  kicker = 'Project'
  h1     = 'Forteasia, Rohtak'
  lede   = 'A planned residential development offering plotted inventory and independent floors &mdash; suited to buyers who want a built address on an organised layout rather than raw land.'
  serviceType = 'Property advisory for Forteasia, Rohtak'
  ctaHead = 'Ask about Forteasia'
  ctaText = 'Availability and pricing change week to week, so we give you the current position rather than a number that is already stale.'
  body = @'
<h2>The development</h2>
<p>Forteasia is a planned residential development in Rohtak offering both
plotted inventory and independent floors. It suits buyers who want the
structure of an organised layout &mdash; defined roads, planned plot sizes,
services laid out in advance &mdash; without committing to a full township
package and its maintenance.</p>

<h2>Who it suits</h2>
<ul class="checks">
  <li><b>Building your own home</b> on a plot in a planned layout rather than a
      scattered location.</li>
  <li><b>Buying a floor</b> and moving in without a construction project.</li>
  <li><b>Holding a plot</b> in an organised development, which generally resells
      more easily than unplanned land.</li>
</ul>

<h2>What we will tell you</h2>
<p>What is actually built on the ground today. Which parts of the layout we
think are worth the premium and which are not. How the approvals stand. And if
we think another address suits your budget better, we will say that too &mdash;
including if it means we do not make the sale.</p>

<div class="notice">
  <b>No prices or plot availability are published here.</b> Both move weekly,
  and a stale figure on a website helps nobody. Message us and you will get the
  current position for the size you want.
</div>

<h2>Before you pay anything</h2>
<p>Every purchase we handle goes through the same checks &mdash; title chain,
approvals, encumbrance, and the plot verified on the ground against the layout
plan. See <a href="/plots-in-rohtak/">residential plots</a> for what that
involves in full, and <a href="/home-loan-and-registry-support/">loan and
registry support</a> for the paperwork side.</p>
'@
  faq = @(
    @{ q = 'What is available in Forteasia right now?'
       a = '<p>Availability changes week to week, so we do not publish it. Message or call and we will tell you exactly what there is in the size and budget you are after, as of today.</p>' },
    @{ q = 'Can I visit the site?'
       a = '<p>Yes, and you should. We do site visits on the ground at the actual location with the layout plan open - not in an office looking at a render. Tell us when suits you.</p>' }
  )
},

@{
  slug   = '/projects/florence/'
  crumb  = 'Florence'
  parent = $PROJ
  title  = 'Florence Rohtak - Residential Plots | Shubh Awas'
  desc   = 'Florence in Rohtak - premium residential plots on a planned, gated layout. Ask Shubh Awas Properties about current availability and plot sizes.'
  kicker = 'Project'
  h1     = 'Florence, Rohtak'
  lede   = 'Premium residential plots on a planned, gated layout &mdash; wide internal roads, landscaped edges, and sizes that work for an end-use home or a medium-term hold.'
  serviceType = 'Property advisory for Florence, Rohtak'
  ctaHead = 'Ask about Florence'
  ctaText = 'Tell us the plot size you have in mind and we will come back with what is genuinely available.'
  body = @'
<h2>The development</h2>
<p>Florence is a plotted residential development in the Rohtak sectors, laid out
as a gated scheme with internal roads and landscaped edges. The appeal is
straightforward: the control of building your own home, inside a planned and
secured layout rather than on an isolated plot.</p>

<h2>Who it suits</h2>
<ul class="checks">
  <li><b>End users building a house</b> who want a planned environment and
      neighbours who are doing the same.</li>
  <li><b>Buyers holding land</b> in an organised layout, which generally resells
      better than unplanned plots.</li>
  <li><b>Anyone who wants a plot but not the isolation</b> of building somewhere
      nothing else has been built yet.</li>
</ul>

<h2>What to check here, as anywhere</h2>
<p>That the specific plot sits inside the licensed and approved layout. That the
title chain and mutation are clean. That the boundaries on the ground match the
plan. And what the full cost comes to once development charges, stamp duty and
registration are added to the plot rate &mdash; set out in our
<a href="/plots-in-rohtak/">residential plots</a> page.</p>

<div class="notice">
  <b>Plot sizes and prices are not listed here</b> because they change. Ask and
  you will get today&rsquo;s position rather than last quarter&rsquo;s.
</div>

<h2>Considering alternatives</h2>
<p>If you want a built home rather than land, compare with
<a href="/independent-floors-in-rohtak/">independent floors</a>. If you want
amenities and maintenance handled, compare with
<a href="/projects/omaxe-city/">Omaxe City</a>. We will give you the honest
comparison for your budget.</p>
'@
  faq = @(
    @{ q = 'What plot sizes does Florence offer?'
       a = '<p>Sizes vary across the layout and availability changes, so we do not publish a list that would quickly go out of date. Tell us the size range you are considering and we will tell you what exists right now.</p>' },
    @{ q = 'Is Florence approved?'
       a = '<p>We verify the licence and layout approval, and that your specific plot falls inside the approved area, before any client is asked for money - and we show you the documents. Ask and we will take you through them.</p>' }
  )
},

@{
  slug   = '/projects/omaxe-city/'
  crumb  = 'Omaxe City'
  parent = $PROJ
  title  = 'Omaxe City Rohtak, Sector 22D | Shubh Awas Properties'
  desc   = 'Omaxe City Rohtak in Sector 22D - integrated township with plots, floors and houses. Ask Shubh Awas Properties what is currently available.'
  kicker = 'Project'
  h1     = 'Omaxe City, Rohtak'
  lede   = 'An integrated township address in Sector 22D from a national developer &mdash; internal roads, security, power backup and daily-needs retail inside the gate.'
  serviceType = 'Property advisory for Omaxe City, Rohtak'
  ctaHead = 'Ask about Omaxe City'
  ctaText = 'Plots, floors and built houses all trade here. Tell us which you want and we will tell you what is available.'
  body = @'
<h2>The township</h2>
<p>Omaxe City occupies Sector 22D on the Jhajjar Road side of Rohtak. As an
integrated township, the internal roads, security, common-area power backup and
daily-needs retail sit inside the boundary and are managed, rather than being
the municipality&rsquo;s problem.</p>
<p>It is the straightforward answer for a family that wants everything settled
from day one, and it has the advantage of being occupied &mdash; you can see it
working before you buy into it.</p>

<h2>What trades here</h2>
<p>Residential plots, independent floors and built houses. Which suits you
depends on whether you are building, moving in now, or holding. Our
<a href="/plots-in-rohtak/">plots</a> and
<a href="/independent-floors-in-rohtak/">floors</a> pages set out the
difference, and the <a href="/areas/omaxe-city-sector-22d/">Omaxe City area
guide</a> covers the township itself in more detail.</p>

<h2>What to ask before buying into any township</h2>
<ul class="checks">
  <li><b>The current maintenance charge,</b> in writing, and its history.</li>
  <li><b>Who manages the township today</b> &mdash; developer or owners&rsquo;
      association.</li>
  <li><b>Power backup scope</b> and water reliability through summer.</li>
  <li><b>The individual unit&rsquo;s title and outstanding dues,</b> which are
      separate from the township&rsquo;s overall standing.</li>
</ul>

<div class="notice">
  <b>A national developer&rsquo;s name is reassurance, not a substitute for
  checking.</b> We verify the specific unit&rsquo;s papers the same way we would
  anywhere else.
</div>
'@
  faq = @(
    @{ q = 'Is Omaxe City fully occupied?'
       a = '<p>Families live there, which is the main thing to establish about any township - an occupied one functions. The best way to judge it is to visit in the evening and see the place in use. We will take you.</p>' },
    @{ q = 'What is the maintenance charge?'
       a = '<p>It is set by whoever manages the township and changes over time, so we will give you the current figure in writing rather than publish one here that may be wrong by the time you read it.</p>' }
  )
},

# ---------------------------------------------------------------- ABOUT -----
@{
  slug   = '/about/'
  crumb  = 'About'
  title  = 'About Shubh Awas Properties &amp; Jagvender Siwach, Rohtak'
  desc   = 'Shubh Awas Properties is run by Jagvender Siwach in Rohtak, Haryana. How we work: title checked first, full costs written out, one point of contact.'
  kicker = 'About Us'
  h1     = 'The Man Whose Name Is On It'
  lede   = 'Shubh Awas Properties was built on a simple, slightly old-fashioned idea: that the person who sells you land should still take your call three years later.'
  ctaHead = 'Rather talk than read?'
  ctaText = 'Call or message and you will reach the person who runs the firm, not a call centre.'
  body = @'
<h2>Jagvender Siwach</h2>
<p><strong>Jagvender Siwach</strong> founded Shubh Awas Properties after years
spent watching families in Haryana get the same raw deal &mdash; a glossy
brochure, a rushed site visit, an agent who disappeared the day the token money
cleared.</p>
<p>He set out to run the opposite kind of firm. One where the title is checked
before the plot is shown. Where the price you are quoted is the price on the
paperwork. Where nobody is talked into a purchase they will regret at
registry.</p>
<p>He knows this market the way you only can by working it in person &mdash; the
sectors that are actually developing, the layouts where possession is real, the
builders who deliver and the ones who only promise. That knowledge is the whole
product. Everything else is paperwork and follow-through.</p>

<blockquote class="quote">
  <p>&ldquo;A house is the biggest thing most families will ever buy. They
  deserve to be told the truth about it, even when the truth costs me the
  sale.&rdquo;</p>
</blockquote>

<h2>How we work</h2>
<ul class="checks">
  <li><b>He shows you the plot, not the render.</b> Every site visit is on the
      ground, on the actual khasra, with the layout plan in hand.</li>
  <li><b>Title first, sale second.</b> Ownership chain, mutation, approvals and
      encumbrance are verified before a client is asked for anything.</li>
  <li><b>One point of contact.</b> From first enquiry to registry and
      possession, you deal with the same desk &mdash; not a rotating call
      centre.</li>
  <li><b>Plain numbers.</b> Rate, development charges, stamp duty and registry
      costs written out in full before you commit to anything.</li>
  <li><b>After the registry.</b> Mutation, possession, loan paperwork and resale
      guidance continue after the money has moved.</li>
</ul>

<h2>What we handle</h2>
<p><a href="/plots-in-rohtak/">Residential plots</a>,
<a href="/independent-floors-in-rohtak/">independent floors</a>,
<a href="/township-homes-in-rohtak/">township homes</a>,
<a href="/commercial-property-in-rohtak/">commercial property</a>, and
<a href="/resale-and-rental-property-in-rohtak/">resale and rentals</a> across
Rohtak &mdash; with <a href="/home-loan-and-registry-support/">loan and registry
support</a> through the whole transaction. For investors and channel partners
there is a separate <a href="/investors.html">investor desk</a>.</p>

<h2>Where to find us</h2>
<p>The office is in Sector 22, Sunari Kalan, Rohtak. Walk in, call, or message
on WhatsApp &mdash; all three reach the same desk. Details and directions are on
the <a href="/contact/">contact page</a>.</p>
'@
},

# -------------------------------------------------------------- CONTACT -----
@{
  slug   = '/contact/'
  crumb  = 'Contact'
  title  = 'Contact Shubh Awas Properties, Rohtak | 98121 34638'
  desc   = 'Contact Shubh Awas Properties in Rohtak, Haryana. Call or WhatsApp 98121 34638, or visit the office in Sector 22, Sunari Kalan. Mon to Sat, 9:30am to 7pm.'
  kicker = 'Contact'
  h1     = 'Come and See It Yourself'
  lede   = 'Tell us roughly what you are looking for and what you want to spend. We will tell you honestly whether we have something that fits &mdash; and if we do not, we will say so.'
  ctaHead = 'Prefer WhatsApp?'
  ctaText = 'Most of our clients start there. Message us and you will get a reply from the same desk that handles the deal.'
  body = @'
<h2>How to reach us</h2>
<dl class="facts">
  <div><dt>Phone</dt><dd><a class="js-phone" href="#">+91 98121 34638</a></dd></div>
  <div><dt>WhatsApp</dt><dd><a data-wa href="#">Message the same desk</a></dd></div>
  <div><dt>Email</dt><dd><a class="js-mail" href="#">jagvindersiwach@gmail.com</a></dd></div>
  <div><dt>Hours</dt><dd class="js-hours">Mon &ndash; Sat &middot; 9:30 am &ndash; 7:00 pm</dd></div>
  <div><dt>Speak to</dt><dd>Jagvender Siwach, Founder</dd></div>
</dl>

<h2>The office</h2>
<p class="js-address">Shubh Awas Properties
RHXP+RH6, Sector 22, Sunari Kalan
Rohtak, Haryana 124010</p>
<p style="margin-top:1.1rem">
  <a class="btn btn--solid js-directions" href="https://www.google.com/maps/dir/?api=1&amp;destination=28.8495439,76.5863847" target="_blank" rel="noopener">Get directions <span class="arw" aria-hidden="true">&rarr;</span></a>
</p>

<h2>What happens when you get in touch</h2>
<ol>
  <li><strong>We ask what you are actually after</strong> &mdash; type, size,
      budget, and whether you are building, moving in or holding.</li>
  <li><strong>We tell you what fits</strong>, or that we do not have it. We would
      rather lose a sale than waste your Sunday.</li>
  <li><strong>We visit the site together</strong>, on the ground, with the layout
      plan open.</li>
  <li><strong>We check the papers</strong> before you are asked for a rupee.</li>
  <li><strong>We write out the full cost</strong> &mdash; rate, charges, stamp
      duty, registry &mdash; so nothing lands on you at the sub-registrar.</li>
</ol>

<div class="notice">
  <b>No obligation, and no pressure.</b> Plenty of people call us just to ask
  whether a price they have been quoted elsewhere is reasonable. That is a fine
  reason to call.
</div>

<h2>For investors</h2>
<p>If you are looking at Haryana land as a position rather than a home, there is
a separate <a href="/investors.html">investor desk</a> with the entry logic,
holding horizon, exit routes and risks set out plainly.</p>
'@
  faq = @(
    @{ q = 'What are your office hours?'
       a = '<p>Monday to Saturday, 9:30 am to 7:00 pm. WhatsApp messages outside those hours are picked up the next working morning.</p>' },
    @{ q = 'Do I need an appointment?'
       a = '<p>Not to call or message. For a site visit it helps to fix a time, because the visit happens at the property rather than in the office and we would rather give you a proper couple of hours than a rushed twenty minutes.</p>' },
    @{ q = 'Do you charge for advice?'
       a = '<p>No. Ask whatever you like before you commit to anything. Brokerage, where it applies, is agreed openly and in writing before a transaction proceeds.</p>' }
  )
},

# -------------------------------------------------------------- PRIVACY -----
@{
  slug   = '/privacy-policy/'
  crumb  = 'Privacy Policy'
  title  = 'Privacy Policy | Shubh Awas Properties, Rohtak'
  desc   = 'How Shubh Awas Properties collects, uses and protects the information you share through this website, WhatsApp, phone and email.'
  kicker = 'Legal'
  h1     = 'Privacy Policy'
  lede   = 'What we collect, why, and what we do not do with it. Short, because our handling of your information is itself short.'
  ctaHead = 'Question about your information?'
  ctaText = 'Ask and you will get a straight answer from the person who runs the firm.'
  body = @'
<h2>What we collect</h2>
<p>Only what you give us. If you submit the enquiry form, message us on WhatsApp,
call or email, we receive the details you choose to share &mdash; typically your
name, phone number, and what you are looking for.</p>
<p>We do not require you to create an account, and we do not ask for
identification or financial documents through this website. Those are only ever
handled in person as part of an actual transaction.</p>

<h2>Why we use it</h2>
<ul class="checks">
  <li><b>To answer your enquiry</b> and discuss property that may suit you.</li>
  <li><b>To stay in touch about that enquiry</b> by phone, WhatsApp or email.</li>
  <li><b>To carry out a transaction</b>, where you decide to proceed.</li>
</ul>
<p>That is all. We do not use your details for anything you did not contact us
about.</p>

<h2>What we do not do</h2>
<ul class="checks">
  <li><b>We do not sell or rent your details</b> to anyone, including other
      dealers, builders or lead-generation services.</li>
  <li><b>We do not add you to bulk marketing lists</b> you did not ask for.</li>
  <li><b>We do not share your information</b> except where it is necessary to
      complete a transaction you have asked us to carry out, or where the law
      requires it.</li>
</ul>

<h2>How the enquiry form works</h2>
<p>This website is a set of static pages with no database behind it. When you
submit the enquiry form it opens WhatsApp with your message prepared, and the
message reaches us only when you press send. Nothing you type is stored on this
website.</p>
<p>If a form delivery service is configured in future, that will be noted here.</p>

<h2>Cookies and analytics</h2>
<p>This site sets no advertising or tracking cookies of its own. Web fonts are
loaded from Google Fonts, which means your browser makes a request to Google to
fetch them. If website analytics are added in future, this section will be
updated to say what is collected before it is switched on.</p>

<h2>Keeping your information</h2>
<p>Enquiries are kept for as long as they are useful to the conversation you
started, and transaction records for as long as we are required to keep them.
If you want your details removed from our records, ask and we will do it.</p>

<h2>Contact</h2>
<p>For anything about your information, contact Jagvender Siwach at
<a class="js-mail" href="#">jagvindersiwach@gmail.com</a> or
<a class="js-phone" href="#">+91 98121 34638</a>, or write to the office at
Sector 22, Sunari Kalan, Rohtak, Haryana 124010. See the
<a href="/contact/">contact page</a> for directions.</p>

<div class="notice">
  <b>Note for the owner:</b> this policy describes the site exactly as it is
  built today. If analytics, a pixel or a form-delivery service is added later,
  this page must be updated at the same time.
</div>
'@
},

# ------------------------------------------------------------------ 404 -----
@{
  slug    = '/404.html'
  crumb   = 'Page not found'
  noindex = $true
  title   = 'Page Not Found | Shubh Awas Properties'
  desc    = 'That page does not exist. Find plots, floors, township homes and commercial property in Rohtak with Shubh Awas Properties.'
  kicker  = 'Error 404'
  h1      = 'That page does not exist'
  lede    = 'The link may be old, or there may be a typo in the address. Here is where most people are heading.'
  ctaHead = 'Cannot find what you were after?'
  ctaText = 'Message us and tell us what you were looking for. It is often faster than hunting through a menu.'
  body = @'
<h2>Try one of these</h2>
<div class="tiles">
  <a class="tile" href="/plots-in-rohtak/">
    <h3>Residential Plots</h3>
    <p>Land to build on, across the Rohtak sectors.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
  <a class="tile" href="/independent-floors-in-rohtak/">
    <h3>Independent Floors</h3>
    <p>Move-in ready, your own entrance.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
  <a class="tile" href="/township-homes-in-rohtak/">
    <h3>Township Homes</h3>
    <p>Gated, managed, everything working from day one.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
  <a class="tile" href="/projects/">
    <h3>Our Projects</h3>
    <p>Forteasia, Florence and Omaxe City.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
  <a class="tile" href="/contact/">
    <h3>Contact</h3>
    <p>Call, WhatsApp or visit the office.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
  <a class="tile" href="/">
    <h3>Home</h3>
    <p>Back to the start.</p>
    <span class="tile__go">View &rarr;</span>
  </a>
</div>
'@
}

)
