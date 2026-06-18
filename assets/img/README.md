# /assets/img

Production image assets. The HTML and CSS reference three files by name — keep
those names stable so logo refreshes are drop-in replacements.

| File              | Status     | Used by                              | Original filename / source                                                                                                                              |
| ----------------- | ---------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `logo-header.png` | ✓ in place | `index.html` → `.site-header__logo`  | Originally `Tabor-Logo-RED.png` from Tabor's Slate instance: `https://admissions.taboracademy.org/www/images/Branding%20and%20Logos/Tabor-Logo-RED.png` (4422 × 3443, transparent PNG, 272 KB) |
| `logo-footer.png` | ✓ in place | `index.html` → `.site-footer__brand` | Originally `Tabor Academy w Star Logo.png` from Tabor's Slate instance: `https://admissions.taboracademy.org/www/images/Branding%20and%20Logos/Tabor%20Academy%20w%20Star%20Logo.png` (1200 × 926, transparent PNG, 53 KB) |
| `footer-bg.jpg`   | ✓ in place | `tokens.css` → `--footer-bg-image`   | Originally `updated-footer.jpg` (Finalsite: `https://resources.finalsite.net/images/f_auto,q_auto/v1681307819/taboracademyorg/byvli5agtzt47ztiwfp9/updated-footer.jpg`). ~80 KB.                |

Both PNGs have transparency, so they sit cleanly on the white header / wave
footer without a visible background box.

## Optimization

`logo-header.png` is currently ~272 KB at 4422 × 3443 — far higher resolution
than it ever renders at (it displays at 154 × 120 px = roughly 308 × 240
px for retina). A one-time resize would drop the file to ~30 KB with no
perceptible quality loss:

```bash
# macOS — using sips (built in)
sips -Z 800 logo-header.png

# or with ImageMagick
magick logo-header.png -resize 800x logo-header.png
```

`logo-footer.png` (~53 KB) and `footer-bg.jpg` (~80 KB) are fine as-is.

## Replacing logos in the future

When the brand mark gets refreshed, save the new file as `logo-header.png` or
`logo-footer.png` — same name. The HTML doesn't need to change.

If filenames change for any reason, update them in:

- `index.html` (the two `<img>` tags)
- `assets/css/base/tokens.css` (`--footer-bg-image` for the bg)
