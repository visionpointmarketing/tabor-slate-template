# Tabor Academy — Slate Form Template

A static HTML/CSS chrome (header + footer) that mirrors the visual design of
[taboracademy.org](https://www.taboracademy.org/admissions). Drop Slate form
embed code between the header and footer to produce branded form pages.

Built for VisionPoint Marketing.

---

## Quick start

No build step. Clone the repo and open `index.html` in any modern browser.

```bash
git clone <repo-url>
cd tabor-slate-template
open index.html              # macOS — or just double-click the file
```

For live-reload while developing, any static server works. With Python:

```bash
python3 -m http.server 8000
# then visit http://localhost:8000
```

Or with Node:

```bash
npx serve .
```

---

## Folder structure

```
tabor-slate-template/
├── index.html              ← staging template (visual reference, GH Pages preview)
├── README.md
├── .gitignore
├── slate/                  ← Slate install files (paste into Branding Editor)
│   ├── build.xslt              ← page template wrapping all Slate pages
│   ├── build.css               ← flattened CSS + Slate UI overrides
│   ├── build-fonts.css         ← FontAwesome only (Google Fonts via <link>)
│   └── README.md               ← deploy instructions
└── assets/                 ← staging assets (used by index.html)
    ├── css/
    │   ├── main.css        ← single entry; @imports the rest in cascade order
    │   ├── base/
    │   │   ├── tokens.css      ← design tokens (colors, type, spacing, gradient)
    │   │   ├── reset.css       ← modern CSS reset (Andy Bell flavored)
    │   │   └── typography.css  ← body type defaults + skip-link
    │   ├── layout/
    │   │   └── containers.css  ← .container, .slate-form-area
    │   └── components/
    │       ├── header.css
    │       └── footer.css
    ├── img/
    │   ├── logo-header.png ← red minimal Tabor wordmark (header)
    │   ├── logo-footer.png ← white Tabor crest + wordmark (footer)
    │   ├── footer-bg.jpg   ← ocean wave hero
    │   └── README.md
    ├── fonts/              ← reserved for self-hosted fonts (see README)
    └── js/                 ← reserved for future scripts (none today)
```

**Two distinct purposes:**

- `index.html` + `assets/` = the **staging** environment. Hosted on GitHub Pages
  for visual review. Modular CSS, semantic HTML, plain `file://` works.
- `slate/` = the **production** install for Tabor's Slate instance. XSLT plus
  flat single-file CSS, paste-and-publish via Slate's Branding Editor. See
  `slate/README.md` for deploy instructions.

When the chrome design changes, update both. The CSS rules are nearly
identical between the two — the differences are: image paths (`assets/img/…`
vs `/images/…`), CSS structure (`@import`'d files vs one flat file), and a
small set of Slate UI overrides at the bottom of `slate/build.css` that don't
exist in staging.

---

## Architecture

**One CSS entry point.** `index.html` links a single file: `assets/css/main.css`.
That file `@import`s every other stylesheet in dependency order
(tokens → reset → typography → layout → components). When the project ever
warrants a build step, this import chain flattens cleanly through PostCSS or
any bundler — no restructuring required.

**Design tokens drive everything.** Colors, fonts, spacing, gradient stops, and
the footer background image are CSS custom properties in `base/tokens.css`.
Retheming the template means overriding tokens in `:root` (or under a body
class) — not editing component CSS.

**BEM-flavored class names.** Components use `.site-header__brand`,
`.site-footer__cta-title`, `.site-footer__contact-col`, etc. Self-documenting
as the template grows; collisions are impossible because every selector is
namespaced to its component.

**Semantic HTML.** `<header role="banner">`, `<main role="main">`,
`<footer role="contentinfo">`, named `<nav>` regions with `aria-label`,
skip-to-content link, lowercase email link text. Form-area `<h1>` is per-page
optional — Slate often provides its own page title.

**No JavaScript.** The chrome doesn't need any. Slate's own embed scripts work
without conflicts.

---

## Drop in a Slate form

1. Duplicate `index.html` and rename it for the form (e.g. `inquire.html`).
2. Update `<title>` and the `<meta name="description">`.
3. (Optional) Edit the `<h1>` and `<p class="slate-form-area__lede">` inside
   `.slate-form-area__heading`, or delete that block if Slate provides its
   own page title.
4. Paste the Slate embed (iframe or `<script>`) inside `<div class="slate-embed">`.

That's it. Form max-width is constrained by `--max-width-form` (currently
720px) in `tokens.css`.

---

## Design decisions worth knowing

A handful of choices that aren't obvious from the code, and that future
maintainers (including future us) will want context on.

### Footer background — two layers, not one

The footer composes two background layers:

1. `--footer-bg-image` — the wave hero photo, applied to `.site-footer`.
2. `--footer-bg-gradient` — a 3-stop linear-gradient on `.site-footer::before`,
   transparent at the top → teal in the middle → deep navy at the bottom.

The gradient is pulled directly from the live site's
`.footer-container::before` (`linear-gradient(0.72deg, …)`). It's what makes
the top of the footer readable for **navy text** (sky portion of the wave
shows through) and the bottom readable for **white text** (gradient progresses
to opaque dark navy). A uniform overlay would flatten that contrast — don't
swap one in unless you re-tune all the text colors too.

### Footer link hover states — never reduce contrast

Every footer link follows the same pattern, mirroring the live site:

| Link                          | Rest                  | Hover                          |
| ----------------------------- | --------------------- | ------------------------------ |
| CTA (Inquire / Visit / Apply) | red, no underline     | red, underline reveals         |
| Contact (phone / email)       | white, underlined     | white, underline fades away    |
| Utility (Calendar / Store…)   | white, no underline   | white, underline reveals       |
| Social icons                  | white icon, half-α ring | white fill, **red** icon       |
| Legal (Privacy / Site Map…)   | white, no underline   | white, underline reveals       |

The principle: text color never changes on hover (the brand red and white
both have to stay legible against the gradient background). Only the
text-decoration changes state. The social icons are the one exception —
they invert to white-on-red because the icon is the visual focus, not text.

### Typography — Source Serif 4 + Outfit

The live site uses Adobe Typekit's **Upgrade** for body and UI text. That's a
paid font that requires a VisionPoint Typekit kit ID. As an openly-licensed
substitute, the template loads **Outfit** from Google Fonts (similar modern
geometric sans-serif). Headings use **Source Serif 4** — that's the same font
the live site uses, also from Google Fonts.

To switch to the real Typekit Upgrade, add this to `<head>` in `index.html`:

```html
<link rel="stylesheet" href="https://use.typekit.net/<YOUR_KIT_ID>.css">
```

…then prepend `upgrade,` to `--font-body` in `tokens.css`. Both fonts will
load and Outfit will be the fallback if Typekit fails. See
`assets/fonts/README.md` for the longer version.

---

## Scaling later

Natural extension points — none of these require restructuring what's here
today.

| Need                       | Where to add it                                                  |
| -------------------------- | ---------------------------------------------------------------- |
| New shared component       | New file under `assets/css/components/`, import in `main.css`    |
| New page-level layout      | New file under `assets/css/layout/`, import in `main.css`        |
| Header nav items           | Uncomment the stub at the bottom of `components/header.css`      |
| Retheme / sub-brand        | Override the tokens in `:root` (or a body class) — no other edits|
| Self-hosted fonts          | See `assets/fonts/README.md`                                     |
| Build pipeline             | Run `main.css` through PostCSS / a bundler to flatten @imports   |
| Multiple form pages        | Promote `<head>` + header + footer into includes (11ty / Astro)  |

The last one's the big one: once the page count justifies it, moving the
duplicated `<head>` + header + footer markup into a static-site-generator
template ends the find-and-replace toil of editing every file when the chrome
changes. 11ty or Astro both fit this template's "no build step until you need
one" philosophy.

---

## Known issues

_None currently._

---

## Browser support

Targets the same browsers as the Tabor Academy site itself: current versions
of Chrome, Edge, Firefox, Safari, plus Safari iOS and Chrome Android. Uses
modern CSS features (custom properties, grid, flexbox, `clamp()`, logical
properties) — all of which have ~98% global support.

No transpilation or polyfills required.

---

## Credits

- Visual design mirrored from [Tabor Academy](https://www.taboracademy.org/),
  built by Finalsite.
- Fonts: [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4)
  and [Outfit](https://fonts.google.com/specimen/Outfit) (Google Fonts).
- CSS reset adapted from
  [Andy Bell's modern reset](https://piccalil.li/blog/a-more-modern-css-reset/).
