<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:fw="http://technolutions.com/framework" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xhtml">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <template path="/shared/base.xslt" xmlns="http://technolutions.com/framework" />
      <head>
        <!-- Cache busting: increment timestamp (yyyyMMddHHmm) when build-fonts.css or build.css changes. -->
        <link href="/shared/build-fonts.css?v=202606241220" rel="stylesheet" />
        <link href="/shared/build.css?v=202606241220" rel="stylesheet" />
        <link href="/shared/build-mobile-global.css" rel="stylesheet" />
        <script src="/shared/build-mobile-global.js" />
        <style>html &gt; body { line-height: normal; } ul.cr, li.cr { margin: 0; padding: 0; } #content { clear: both; padding: 15px; } #global { float: right; } #global ul, #global li { list-style: none; margin: 0; padding: 0; }</style>
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" class="cr" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin" />
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&amp;family=Source+Serif+4:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400&amp;display=swap" rel="stylesheet" />
        <xsl:apply-templates select="xhtml:html/xhtml:head/node()" />
      </head>
      <body>
        <xsl:copy-of select="xhtml:html/xhtml:body/@*" />
        <div id="page">
          <!-- ============================================================
               SITE HEADER
               Minimal: brand mark only. Stacked Tabor Academy lockup.
               ============================================================ -->
          <header class="site-header" role="banner">
            <div class="site-header__inner">
              <a class="site-header__brand" href="https://www.taboracademy.org/" aria-label="Tabor Academy">
                <img class="site-header__logo" src="/images/logo-header-wordmark.png" alt="Tabor Academy" width="263" height="60" />
              </a>
            </div>
          </header>

          <!-- ============================================================
               BODY CONTENT — Slate injection point.
               Slate renders forms, events, portals, application checklist,
               decision letters, etc. inside #content via xsl:apply-templates.
               The .slate-form-area wrapper provides the consistent chrome
               (max-width, padding, min-height) regardless of what Slate
               injects.
               ============================================================ -->
          <main id="main-content" class="slate-form-area" role="main">
            <div class="slate-form-area__inner">
              <div id="global" />
              <div id="content">
                <xsl:apply-templates select="xhtml:html/xhtml:body/node()" />
              </div>
            </div>
          </main>

          <!-- ============================================================
               SITE FOOTER
               CTA + brand + 3-col contact + utility nav + social + legal.
               Background is the wave image with a 3-stop gradient overlay.
               ============================================================ -->
          <footer class="site-footer" id="fsFooter" role="contentinfo">
            <div class="site-footer__inner">

              <!-- Top row: CTA on the right, brand sits below on the left. -->
              <section class="site-footer__cta" aria-labelledby="footer-cta-title">
                <div class="site-footer__cta-headings">
                  <p class="site-footer__tagline"><span>School</span> <em>by the</em> <span>Sea</span></p>
                  <h2 id="footer-cta-title" class="site-footer__cta-title">Chart your course</h2>
                </div>
                <nav class="site-footer__cta-nav" aria-label="Admissions calls to action">
                  <ul>
                    <li><a href="https://www.taboracademy.org/admissions/inquire">Inquire</a></li>
                    <li><a href="https://www.taboracademy.org/admissions/visits-events">Visit</a></li>
                    <li><a href="https://www.taboracademy.org/admissions/how-to-apply">Apply</a></li>
                  </ul>
                </nav>
              </section>

              <!-- Brand mark (white wordmark). -->
              <div class="site-footer__brand">
                <a href="https://www.taboracademy.org/" aria-label="Tabor Academy">
                  <img src="/images/logo-footer.png" alt="Tabor Academy" width="175" height="135" />
                </a>
              </div>

              <!-- 3-column contact info. -->
              <section class="site-footer__contact" aria-label="Contact information">
                <div class="site-footer__contact-col">
                  <h3 class="site-footer__contact-title">Mail / Main Office</h3>
                  <address>
                    <span>66 Spring Street</span>
                    <span>Marion, MA 02738</span>
                    <a href="tel:+15087482000">508.748.2000</a>
                  </address>
                </div>
                <div class="site-footer__contact-col">
                  <h3 class="site-footer__contact-title">Admissions Office</h3>
                  <address>
                    <span>226 Front Street</span>
                    <span>Marion, MA 02738</span>
                    <a href="tel:+15082918300">508.291.8300</a>
                  </address>
                </div>
                <div class="site-footer__contact-col">
                  <h3 class="site-footer__contact-title">Get in Touch</h3>
                  <address>
                    <a href="mailto:admissions@taboracademy.org">admissions@taboracademy.org</a>
                    <a href="mailto:info@taboracademy.org">info@taboracademy.org</a>
                    <a href="mailto:alumni@taboracademy.org">alumni@taboracademy.org</a>
                  </address>
                </div>
              </section>

              <!-- Utility row: secondary nav (left) + social (right). -->
              <div class="site-footer__utility">
                <nav class="site-footer__utility-nav" aria-label="Footer navigation">
                  <ul>
                    <li><a href="https://www.taboracademy.org/about/news-events/calendar">Calendar</a></li>
                    <li><a href="https://taboracademy.checkoutstores.com/" target="_blank" rel="noopener">Store</a></li>
                    <li><a href="https://www.taboracademy.org/about/contact">Contact</a></li>
                    <li><a href="https://www.taboracademy.org/about/careers">Careers</a></li>
                    <li><a href="https://www.taboracademy.org/emergency-updates">Emergency Notices</a></li>
                  </ul>
                </nav>

                <nav class="site-footer__social" aria-label="Social media">
                  <ul>
                    <li>
                      <a href="https://www.facebook.com/taboracademy" target="_blank" rel="noopener" aria-label="Facebook">
                        <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false" width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M13.5 21v-8h2.7l.4-3.1h-3.1V7.9c0-.9.3-1.5 1.6-1.5h1.7V3.6c-.3 0-1.3-.1-2.5-.1-2.5 0-4.2 1.5-4.2 4.3v2.4H7.4V13h2.7v8h3.4z" /></svg>
                      </a>
                    </li>
                    <li>
                      <a href="https://www.instagram.com/taboracademy/" target="_blank" rel="noopener" aria-label="Instagram">
                        <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false" width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M12 4.5c2.4 0 2.7 0 3.7.1 1 0 1.5.2 1.9.4.5.2.8.4 1.2.8.4.4.6.7.8 1.2.2.4.3.9.4 1.9 0 1 .1 1.3.1 3.7s0 2.7-.1 3.7c0 1-.2 1.5-.4 1.9-.2.5-.4.8-.8 1.2-.4.4-.7.6-1.2.8-.4.2-.9.3-1.9.4-1 0-1.3.1-3.7.1s-2.7 0-3.7-.1c-1 0-1.5-.2-1.9-.4-.5-.2-.8-.4-1.2-.8-.4-.4-.6-.7-.8-1.2-.2-.4-.3-.9-.4-1.9 0-1-.1-1.3-.1-3.7s0-2.7.1-3.7c0-1 .2-1.5.4-1.9.2-.5.4-.8.8-1.2.4-.4.7-.6 1.2-.8.4-.2.9-.3 1.9-.4 1 0 1.3-.1 3.7-.1M12 3c-2.4 0-2.8 0-3.7.1-1 0-1.6.2-2.2.4-.6.2-1.2.6-1.7 1.1S3.7 5.7 3.5 6.3c-.2.6-.4 1.2-.4 2.2C3 9.4 3 9.7 3 12s0 2.6.1 3.6c0 1 .2 1.6.4 2.2.2.6.6 1.2 1.1 1.7s1 .9 1.7 1.1c.6.2 1.2.4 2.2.4 1 .1 1.3.1 3.6.1s2.7 0 3.7-.1c1 0 1.6-.2 2.2-.4.6-.2 1.2-.6 1.7-1.1s.9-1 1.1-1.7c.2-.6.4-1.2.4-2.2 0-1 .1-1.3.1-3.6s0-2.6-.1-3.7c0-1-.2-1.6-.4-2.2-.2-.6-.6-1.2-1.1-1.7s-1-.9-1.7-1.1c-.6-.2-1.2-.4-2.2-.4C14.6 3 14.3 3 12 3zm0 4.4c-2.5 0-4.6 2-4.6 4.6s2 4.6 4.6 4.6 4.6-2 4.6-4.6-2.1-4.6-4.6-4.6zm0 7.6c-1.7 0-3-1.3-3-3s1.3-3 3-3 3 1.3 3 3-1.3 3-3 3zm4.8-8.9c-.6 0-1.1.5-1.1 1.1s.5 1.1 1.1 1.1 1.1-.5 1.1-1.1c-.1-.6-.5-1.1-1.1-1.1z" /></svg>
                      </a>
                    </li>
                    <li>
                      <a href="https://www.linkedin.com/school/tabor-academy/" target="_blank" rel="noopener" aria-label="LinkedIn">
                        <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false" width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M6.94 5.5a1.94 1.94 0 1 1-3.88 0 1.94 1.94 0 0 1 3.88 0zM7 8.48H3V21h4V8.48zm6.32 0H9.34V21h3.94v-6.57c0-3.66 4.77-4 4.77 0V21H22v-7.93c0-6.17-7.06-5.94-8.72-2.91l.04-1.68z" /></svg>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>

              <!-- Legal nav -->
              <nav class="site-footer__legal" aria-label="Legal">
                <ul>
                  <li><a href="https://www.taboracademy.org/privacy-policy">Privacy Policy</a></li>
                  <li><a href="https://www.taboracademy.org/site-map">Site Map</a></li>
                  <li><a href="https://www.taboracademy.org/accessibility-statement">Accessibility</a></li>
                </ul>
              </nav>

            </div>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
