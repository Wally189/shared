$ErrorActionPreference = "Stop"

function Write-Utf8NoBom {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path,
    [Parameter(Mandatory = $true)]
    [string]$Content
  )

  $directory = [System.IO.Path]::GetDirectoryName($Path)
  if ($directory) {
    [System.IO.Directory]::CreateDirectory($directory) | Out-Null
  }

  $encoding = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($Path, $Content, $encoding)
}

function Get-NavHtml {
  param($Site, [string]$CurrentFile)

  $items = foreach ($item in $Site.Nav) {
    $current = if ($item.href -eq $CurrentFile) { ' aria-current="page"' } else { "" }
    "<a href=""$($item.href)""$current>$($item.label)</a>"
  }

  $items += "<button class=""theme-toggle"" type=""button"" data-theme-toggle>Scheme: <strong data-theme-label>$($Site.ThemeLabel)</strong></button>"
  return ($items -join [Environment]::NewLine + "        ")
}

function Get-FooterLinksHtml {
  param($Site)

  $items = foreach ($item in $Site.Nav) {
    "<a href=""$($item.href)"">$($item.label)</a>"
  }

  return ($items -join [Environment]::NewLine + "        ")
}

function Get-SocialHtml {
  param($Site)

  $items = foreach ($item in $Site.Socials) {
    "<a class=""social-chip"" href=""$($item.href)"" target=""_blank"" rel=""noreferrer"">$($item.label)</a>"
  }

  return ($items -join [Environment]::NewLine + "          ")
}

function Get-FooterHtml {
  param($Site, [string]$Note)

  $footerLinks = Get-FooterLinksHtml -Site $Site
  $socialLinks = Get-SocialHtml -Site $Site

  return @"
  <footer class="site-footer">
    <div class="site-shell site-footer__panel">
      <p class="template-note">$Note</p>
      <div class="footer-links">
        $footerLinks
      </div>
      <div class="social-panel" aria-label="Optional social media links">
        <p class="social-panel__hint">Find us online</p>
        <div class="social-panel__links">
          $socialLinks
        </div>
      </div>
      <div class="template-legal">
        <p class="template-legal-links"><a href="gdpr.html">GDPR</a> | <a href="privacy.html">Privacy</a> | <a href="cookies.html">Cookies</a> | <a href="terms.html">Terms</a></p>
        <p class="template-legal-location">$($Site.Location)</p>
        <p class="template-legal-copyright">&#169; 2026 <a href="https://www.waylight-atlantic.co.uk/" target="_blank" rel="noopener">Waylight-Atlantic</a></p>
      </div>
    </div>
  </footer>
"@
}

function Get-LegalBody {
  param($Site, [string]$Kind)

  switch ($Kind) {
    "privacy" {
      return @"
    <section class="poster-hero">
      <div class="poster-hero__frame">
        <div class="poster-copy">
          <p class="eyebrow">Privacy notice</p>
          <h1>How $($Site.BrandName) handles personal information.</h1>
          <p>This privacy notice explains what information is collected through this website, how it is used, how long it is kept, and how to get in touch about your data.</p>
        </div>
        <figure class="poster-media$($Site.LegalPosterClass)">
          <img src="$($Site.LegalImage)" alt="$($Site.LegalImageAlt)">
          <figcaption class="poster-media__caption">Privacy information</figcaption>
        </figure>
      </div>
    </section>

    <section class="page-section">
      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Controller</p>
          <h2>$($Site.ControllerName)</h2>
          <p>$($Site.ContactMarkup)</p>
          <p>$($Site.Location)</p>
        </article>
        <article class="section-card">
          <p class="eyebrow">What is collected</p>
          <ul>
            <li>Name, email address, and any details you include when making an enquiry.</li>
            <li>Basic technical logs supplied by the website host for security and reliability.</li>
            <li>An optional theme preference saved in your browser only if you use the colour-scheme toggle.</li>
          </ul>
        </article>
      </div>

      <article class="section-card">
        <p class="eyebrow">How information is used</p>
        <table class="poster-table">
          <tbody>
            <tr>
              <th scope="row">Enquiries</th>
              <td>To respond to questions, prepare quotations, confirm bookings, or discuss services.</td>
            </tr>
            <tr>
              <th scope="row">Website operation</th>
              <td>To keep the site secure, available, and functioning as expected.</td>
            </tr>
            <tr>
              <th scope="row">Theme preference</th>
              <td>To remember your chosen colour scheme after you request that preference.</td>
            </tr>
          </tbody>
        </table>
      </article>

      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Lawful basis</p>
          <ul>
            <li>Legitimate interests in running the website and responding to genuine enquiries.</li>
            <li>Steps taken before entering into a contract where you request a quotation, booking, or service discussion.</li>
            <li>Consent where you choose an optional preference that is stored in your browser.</li>
          </ul>
        </article>
        <article class="section-card">
          <p class="eyebrow">Retention and sharing</p>
          <p>Routine enquiry emails are usually kept for up to 12 months unless a longer period is needed for an active customer relationship, booking record, or legal obligation.</p>
          <p>Information may be processed by the website host, email provider, or other routine suppliers needed to run the business. Personal information is not sold to third parties.</p>
        </article>
      </div>

      <article class="section-card">
        <p class="eyebrow">Your rights</p>
        <p>You can ask for access to the personal information held about you, request correction, ask for deletion where appropriate, object to certain processing, or raise a concern about how your information is handled.</p>
        <p>If you are unhappy with the response, you can complain to the <a class="muted-link" href="https://ico.org.uk/make-a-complaint/" target="_blank" rel="noreferrer">Information Commissioner's Office</a>.</p>
      </article>
    </section>
"@
    }
    "cookies" {
      return @"
    <section class="poster-hero">
      <div class="poster-hero__frame">
        <div class="poster-copy">
          <p class="eyebrow">Cookies and browser storage</p>
          <h1>How $($Site.BrandName) uses cookies and similar technologies.</h1>
          <p>This website is designed to stay simple. It does not use analytics, advertising trackers, or marketing tags by default.</p>
        </div>
        <figure class="poster-media$($Site.LegalPosterClass)">
          <img src="$($Site.LegalImage)" alt="$($Site.LegalImageAlt)">
          <figcaption class="poster-media__caption">Cookie information</figcaption>
        </figure>
      </div>
    </section>

    <section class="page-section">
      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Default position</p>
          <h2>No analytics by default</h2>
          <p>This website does not place analytics or advertising cookies as part of the standard setup.</p>
        </article>
        <article class="section-card">
          <p class="eyebrow">Optional preference</p>
          <h2>Theme choice only if requested</h2>
          <p>If you use the colour-scheme toggle, the site stores that preference in your browser so the same scheme can be shown on your next visit.</p>
        </article>
      </div>

      <article class="section-card">
        <p class="eyebrow">Current cookie and storage summary</p>
        <table class="poster-table">
          <thead>
            <tr>
              <th scope="col">Item</th>
              <th scope="col">Purpose</th>
              <th scope="col">When it is set</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Theme preference</td>
              <td>Remembers the colour scheme you selected.</td>
              <td>Only after you use the theme toggle.</td>
            </tr>
            <tr>
              <td>Hosting logs</td>
              <td>Basic technical information used by the host for security and reliability.</td>
              <td>When the site is visited.</td>
            </tr>
            <tr>
              <td>External websites</td>
              <td>Third-party sites may set their own cookies after you leave this website.</td>
              <td>Only if you follow an external link.</td>
            </tr>
          </tbody>
        </table>
      </article>

      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Managing cookies</p>
          <p>You can clear browser storage at any time through your browser settings. If the theme preference is removed, the site simply falls back to its default colour scheme.</p>
        </article>
        <article class="section-card">
          <p class="eyebrow">Further guidance</p>
          <p>For more detail on cookies and consent in the UK, see the <a class="muted-link" href="https://ico.org.uk/for-organisations/direct-marketing-and-privacy-and-electronic-communications/guide-to-pecr/cookies-and-similar-technologies/" target="_blank" rel="noreferrer">ICO guidance on cookies and similar technologies</a>.</p>
        </article>
      </div>
    </section>
"@
    }
    "gdpr" {
      return @"
    <section class="poster-hero">
      <div class="poster-hero__frame">
        <div class="poster-copy">
          <p class="eyebrow">UK GDPR summary</p>
          <h1>How $($Site.BrandName) applies the core data-protection principles.</h1>
          <p>This page summarises the standards used for fairness, minimisation, security, and accountability when handling personal information.</p>
        </div>
        <figure class="poster-media$($Site.LegalPosterClass)">
          <img src="$($Site.LegalImage)" alt="$($Site.LegalImageAlt)">
          <figcaption class="poster-media__caption">Data-protection standards</figcaption>
        </figure>
      </div>
    </section>

    <section class="page-section">
      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Principles</p>
          <ul>
            <li>Process information lawfully, fairly, and transparently.</li>
            <li>Collect only what is needed for the stated purpose.</li>
            <li>Keep information accurate and up to date where practical.</li>
            <li>Retain information only for as long as necessary.</li>
            <li>Protect information through appropriate security measures.</li>
            <li>Maintain accountability for how information is handled.</li>
          </ul>
        </article>
        <article class="section-card">
          <p class="eyebrow">Typical lawful bases</p>
          <ul>
            <li>Legitimate interests in receiving and responding to enquiries.</li>
            <li>Steps taken before entering into a contract for quotes, bookings, or project discussions.</li>
            <li>Legal obligations where records must be retained for accounting or regulatory reasons.</li>
            <li>Consent where an optional browser preference is stored at your request.</li>
          </ul>
        </article>
      </div>

      <article class="section-card">
        <p class="eyebrow">Individual rights</p>
        <table class="poster-table">
          <tbody>
            <tr>
              <th scope="row">Access</th>
              <td>You can ask for a copy of the personal information held about you.</td>
            </tr>
            <tr>
              <th scope="row">Rectification</th>
              <td>You can ask for inaccurate or incomplete information to be corrected.</td>
            </tr>
            <tr>
              <th scope="row">Erasure</th>
              <td>You can ask for deletion where there is no continuing reason to keep the information.</td>
            </tr>
            <tr>
              <th scope="row">Restriction or objection</th>
              <td>You can ask for certain processing to be limited or object to it in some circumstances.</td>
            </tr>
            <tr>
              <th scope="row">Complaint</th>
              <td>You can contact the business first, then the <a class="muted-link" href="https://ico.org.uk/make-a-complaint/" target="_blank" rel="noreferrer">ICO</a> if needed.</td>
            </tr>
          </tbody>
        </table>
      </article>

      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Response timing</p>
          <p>Requests relating to personal information are normally acknowledged promptly and handled within one month unless the request is unusually complex.</p>
        </article>
        <article class="section-card">
          <p class="eyebrow">Further reading</p>
        <p>The underlying framework is the UK GDPR and Data Protection Act 2018. The ICO overview of the <a class="muted-link" href="https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/data-protection-principles/a-guide-to-the-data-protection-principles/" target="_blank" rel="noreferrer">data-protection principles</a> and the <a class="muted-link" href="https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/the-right-to-be-informed/" target="_blank" rel="noreferrer">right to be informed</a> guide the legal wording used on this site.</p>
        </article>
      </div>
    </section>
"@
    }
    "terms" {
      return @"
    <section class="poster-hero">
      <div class="poster-hero__frame">
        <div class="poster-copy">
          <p class="eyebrow">Website terms</p>
          <h1>Basic terms for using the $($Site.BrandName) website.</h1>
          <p>These terms set out the basis on which this website is offered, including content use, external links, and how enquiries, quotes, or bookings are handled.</p>
        </div>
        <figure class="poster-media$($Site.LegalPosterClass)">
          <img src="$($Site.LegalImage)" alt="$($Site.LegalImageAlt)">
          <figcaption class="poster-media__caption">Website terms</figcaption>
        </figure>
      </div>
    </section>

    <section class="page-section">
      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Website use</p>
          <ul>
            <li>This website is provided for general information about the business, project, parish, or venue.</li>
            <li>Content may be updated from time to time without notice.</li>
            <li>You may browse, download, or print pages for personal reference only.</li>
          </ul>
        </article>
        <article class="section-card">
          <p class="eyebrow">Accuracy and external links</p>
          <ul>
            <li>Reasonable care is taken to keep information accurate, but no guarantee is given that all details are complete or current at every moment.</li>
            <li>External links are provided for convenience. Responsibility for third-party websites sits with those third parties.</li>
          </ul>
        </article>
      </div>

      <div class="section-grid">
        <article class="section-card">
          <p class="eyebrow">Intellectual property</p>
          <p>Unless stated otherwise, text, design elements, and original imagery on this website belong to $($Site.ControllerName) or are used with permission. They must not be reproduced for commercial use without consent.</p>
        </article>
        <article class="section-card">
          <p class="eyebrow">Enquiries, quotes, and bookings</p>
          <p>Submitting an enquiry does not create a contract. Quotes, bookings, orders, pastoral arrangements, or project starts are only confirmed once the business or organisation has accepted the arrangement directly.</p>
        </article>
      </div>

      <article class="section-card">
        <p class="eyebrow">Governing law</p>
        <p>Unless another arrangement is stated in writing, these website terms are governed by the laws of England and Wales.</p>
      </article>
    </section>
"@
    }
  }
}

function New-LegalPage {
  param($Site, [string]$Kind)

  $titleMap = @{
    privacy = "Privacy | $($Site.BrandName)"
    cookies = "Cookies | $($Site.BrandName)"
    gdpr    = "GDPR | $($Site.BrandName)"
    terms   = "Terms | $($Site.BrandName)"
  }

  $descriptionMap = @{
    privacy = "Privacy notice for $($Site.BrandName)."
    cookies = "Cookies and browser-storage information for $($Site.BrandName)."
    gdpr    = "UK GDPR summary for $($Site.BrandName)."
    terms   = "Website terms for $($Site.BrandName)."
  }

  $body = Get-LegalBody -Site $Site -Kind $Kind
  $footer = Get-FooterHtml -Site $Site -Note $Site.FooterNote
  $nav = Get-NavHtml -Site $Site -CurrentFile "$Kind.html"

  return @"
<!doctype html>
<html lang="en-GB"$($Site.ThemeAttribute)>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$($titleMap[$Kind])</title>
  <meta name="description" content="$($descriptionMap[$Kind])">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600&family=Manrope:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="$($Site.StylePath)">
  <script defer src="$($Site.ScriptPath)"></script>
</head>
<body>
  <header class="site-header">
    <div class="site-shell site-header__inner">
      <a class="brand-mark" href="index.html">
        <span class="brand-mark__eyebrow">$($Site.TemplateLabel)</span>
        <span class="brand-mark__name">$($Site.BrandName)</span>
      </a>
      <nav class="site-nav" aria-label="Primary">
        $nav
      </nav>
    </div>
  </header>

  <main class="site-shell">
$body
  </main>

$footer
</body>
</html>
"@
}

$sites = @(
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates"
    StylePath = "shared/style.css"
    ScriptPath = "shared/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Atlantic"
    TemplateLabel = "Website collection"
    BrandName = "Waylight Atlantic"
    ControllerName = "Waylight Atlantic"
    Location = "UK & Ireland based"
    CopyrightName = "Waylight Atlantic"
    ContactMarkup = '<a class="muted-link" href="https://www.waylight-atlantic.co.uk/contact.html" target="_blank" rel="noreferrer">waylight-atlantic.co.uk/contact.html</a>'
    FooterNote = "A collection of ready-to-adapt brochure websites and legal pages."
    LegalImage = "https://images.unsplash.com/photo-1715593949345-50d3304cff4b?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Office workspace used as supporting artwork on the website collection"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "church-template/index.html"; label = "Church" }
      @{ href = "shop-template/index.html"; label = "Shop" }
      @{ href = "pub-template/index.html"; label = "Pub" }
      @{ href = "tradesperson-template/index.html"; label = "Tradesperson" }
      @{ href = "small-business-template/index.html"; label = "Small Business" }
      @{ href = "waylight-atlantic-admin-template/index.html"; label = "Admin" }
      @{ href = "personal-project-template/index.html"; label = "Personal Project" }
    )
    Socials = @(
      @{ href = "https://www.facebook.com/waylightatlantic"; label = "Facebook" }
      @{ href = "https://www.instagram.com/waylightatlantic"; label = "Instagram" }
      @{ href = "https://www.linkedin.com/company/waylight-atlantic"; label = "LinkedIn" }
      @{ href = "https://www.waylight-atlantic.co.uk/contact.html"; label = "Contact" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\church-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Blue"
    TemplateLabel = "Parish church"
    BrandName = "St. Anselm by the Sea"
    ControllerName = "St. Anselm by the Sea"
    Location = "Whitstable, United Kingdom"
    CopyrightName = "St. Anselm by the Sea"
    ContactMarkup = '<a class="muted-link" href="mailto:office@stanselmbythesea.example">office@stanselmbythesea.example</a>'
    FooterNote = "Serving Whitstable with worship, prayer, and practical care through the week."
    LegalImage = "https://images.unsplash.com/photo-1513267048331-5611cad62e41?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Church interior"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "worship.html"; label = "Worship" }
      @{ href = "community.html"; label = "Community" }
    )
    Socials = @(
      @{ href = "https://www.facebook.com/stanselmbythesea"; label = "Facebook" }
      @{ href = "https://www.instagram.com/stanselmbythesea"; label = "Instagram" }
      @{ href = "https://www.youtube.com/@stanselmbythesea"; label = "YouTube" }
      @{ href = "mailto:office@stanselmbythesea.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\shop-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Blue"
    TemplateLabel = "Independent shop"
    BrandName = "Harbour Goods & Pantry"
    ControllerName = "Harbour Goods & Pantry"
    Location = "Padstow, United Kingdom"
    CopyrightName = "Harbour Goods & Pantry"
    ContactMarkup = '<a class="muted-link" href="mailto:hello@harbourgoods.example">hello@harbourgoods.example</a>'
    FooterNote = "Independent homewares, pantry goods, and useful gifts by the harbour."
    LegalImage = "https://images.unsplash.com/photo-1441986300917-64674bd600d8?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Retail shelves and store interior"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "collection.html"; label = "Collection" }
      @{ href = "visit.html"; label = "Visit" }
    )
    Socials = @(
      @{ href = "https://www.facebook.com/harbourgoodsandpantry"; label = "Facebook" }
      @{ href = "https://www.instagram.com/harbourgoodsandpantry"; label = "Instagram" }
      @{ href = "https://www.pinterest.com/harbourgoodsandpantry"; label = "Pinterest" }
      @{ href = "mailto:hello@harbourgoods.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\tradesperson-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Blue"
    TemplateLabel = "Bespoke joinery"
    BrandName = "North Coast Joinery"
    ControllerName = "North Coast Joinery"
    Location = "Bristol, United Kingdom"
    CopyrightName = "North Coast Joinery"
    ContactMarkup = '<a class="muted-link" href="mailto:quotes@northcoastjoinery.example">quotes@northcoastjoinery.example</a>'
    FooterNote = "Bespoke joinery across Bristol, Bath, and North Somerset."
    LegalImage = "https://images.unsplash.com/photo-1504148455328-c376907d081c?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Craftsperson working with timber"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "services.html"; label = "Services" }
      @{ href = "contact.html"; label = "Contact" }
    )
    Socials = @(
      @{ href = "https://www.facebook.com/northcoastjoinery"; label = "Facebook" }
      @{ href = "https://www.instagram.com/northcoastjoinery"; label = "Instagram" }
      @{ href = "https://www.linkedin.com/company/north-coast-joinery"; label = "LinkedIn" }
      @{ href = "mailto:quotes@northcoastjoinery.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\small-business-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Blue"
    TemplateLabel = "Brand and design studio"
    BrandName = "Morrow Brand Studio"
    ControllerName = "Morrow Brand Studio"
    Location = "Bristol, United Kingdom"
    CopyrightName = "Morrow Brand Studio"
    ContactMarkup = '<a class="muted-link" href="mailto:hello@morrowbrandstudio.example">hello@morrowbrandstudio.example</a>'
    FooterNote = "Brand identity, packaging, and launch design for ambitious independents."
    LegalImage = "https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Design studio workspace"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "services.html"; label = "Services" }
      @{ href = "studio.html"; label = "Studio" }
    )
    Socials = @(
      @{ href = "https://www.instagram.com/morrowbrandstudio"; label = "Instagram" }
      @{ href = "https://www.behance.net/morrowbrandstudio"; label = "Behance" }
      @{ href = "https://www.linkedin.com/company/morrow-brand-studio"; label = "LinkedIn" }
      @{ href = "mailto:hello@morrowbrandstudio.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\personal-project-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ""
    ThemeLabel = "Blue"
    TemplateLabel = "Independent publication"
    BrandName = "Atlantic Field Notes"
    ControllerName = "Atlantic Field Notes"
    Location = "Cornwall, United Kingdom"
    CopyrightName = "Atlantic Field Notes"
    ContactMarkup = '<a class="muted-link" href="mailto:hello@atlanticfieldnotes.example">hello@atlanticfieldnotes.example</a>'
    FooterNote = "Independent essays, drawings, and editions from the Atlantic edge."
    LegalImage = "https://images.unsplash.com/photo-1455390582262-044cdead277a?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Notebook and writing desk"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "logbook.html"; label = "Logbook" }
    )
    Socials = @(
      @{ href = "https://www.instagram.com/atlanticfieldnotes"; label = "Instagram" }
      @{ href = "https://www.substack.com/@atlanticfieldnotes"; label = "Substack" }
      @{ href = "https://www.youtube.com/@atlanticfieldnotes"; label = "YouTube" }
      @{ href = "mailto:hello@atlanticfieldnotes.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\pub-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ' data-theme="orange"'
    ThemeLabel = "Orange"
    TemplateLabel = "Neighbourhood pub"
    BrandName = "The Lantern Arms"
    ControllerName = "The Lantern Arms"
    Location = "Dartmouth, United Kingdom"
    CopyrightName = "The Lantern Arms"
    ContactMarkup = '<a class="muted-link" href="mailto:bookings@lanternarms.example">bookings@lanternarms.example</a>'
    FooterNote = "Seasonal pub food, local pours, and proper rooms by the water."
    LegalImage = "https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=1600&q=80"
    LegalImageAlt = "Pub table with drinks and plates"
    LegalPosterClass = ""
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "menu.html"; label = "Menu" }
      @{ href = "visit.html"; label = "Visit" }
    )
    Socials = @(
      @{ href = "https://www.facebook.com/lanternarms"; label = "Facebook" }
      @{ href = "https://www.instagram.com/lanternarms"; label = "Instagram" }
      @{ href = "https://www.tiktok.com/@lanternarms"; label = "TikTok" }
      @{ href = "mailto:bookings@lanternarms.example"; label = "Email" }
    )
  }
  [pscustomobject]@{
    Folder = "C:\AG\ReposTemplates\waylight-atlantic-admin-template"
    StylePath = "assets/style.css"
    ScriptPath = "assets/app.js"
    ThemeAttribute = ' data-theme="atlantic"'
    ThemeLabel = "Atlantic"
    TemplateLabel = "Waylight Atlantic"
    BrandName = "Waylight Atlantic"
    ControllerName = "Waylight Atlantic"
    Location = "UK & Ireland based"
    CopyrightName = "Waylight Atlantic"
    ContactMarkup = '<a class="muted-link" href="https://www.waylight-atlantic.co.uk/contact.html" target="_blank" rel="noreferrer">waylight-atlantic.co.uk/contact.html</a>'
    FooterNote = "Digital Filing Reset for calmer, governable shared systems."
    LegalImage = "assets/images/Dunfannaghy.png"
    LegalImageAlt = "Dunfannaghy coastline artwork"
    LegalPosterClass = " poster-media--colour"
    Nav = @(
      @{ href = "index.html"; label = "Home" }
      @{ href = "services.html"; label = "Filing Reset" }
      @{ href = "approach.html"; label = "Method" }
    )
    Socials = @(
      @{ href = "https://www.waylight-atlantic.co.uk/"; label = "Website" }
      @{ href = "https://www.waylight-atlantic.co.uk/contact.html"; label = "Contact" }
      @{ href = "https://www.linkedin.com/company/waylight-atlantic"; label = "LinkedIn" }
      @{ href = "https://www.facebook.com/waylightatlantic"; label = "Facebook" }
    )
  }
)

$kinds = @("privacy", "cookies", "gdpr", "terms")

foreach ($site in $sites) {
  foreach ($kind in $kinds) {
    $content = New-LegalPage -Site $site -Kind $kind
    $path = Join-Path $site.Folder "$kind.html"
    Write-Utf8NoBom -Path $path -Content $content
  }
}

