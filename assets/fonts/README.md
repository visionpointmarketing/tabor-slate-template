# /assets/fonts

Reserved for self-hosted font files (`.woff2`).

Right now the template loads fonts from Google Fonts via `<link>` in `index.html`
(Source Serif 4 + Outfit). If you ever need to self-host — for example to avoid
the request to fonts.googleapis.com, or to add Adobe Typekit's "Upgrade" face
that the live site uses — drop the files here and:

1. Add `@font-face` rules at the top of `assets/css/base/typography.css`.
2. Remove the corresponding `<link>` to fonts.googleapis.com in `index.html`.
3. Update `--font-body` / `--font-heading` in `assets/css/base/tokens.css` if names change.

> The live Tabor Academy site uses Adobe Typekit's **Upgrade** for body and UI
> text. If VisionPoint has a Typekit kit ID for that family, add
> `<link rel="stylesheet" href="https://use.typekit.net/<KIT_ID>.css">` to the
> `<head>` and prepend `upgrade,` to `--font-body` in `tokens.css`.
