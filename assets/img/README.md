# /assets/img

Production image assets. The HTML and CSS reference three files by name — keep
those names stable so logo refreshes are drop-in replacements.

| File              | Status     | Used by                              | Source                                                                                                                                                                                                                                                                |
| ----------------- | ---------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `logo-header.png` | ✓ in place | `index.html` → `.site-header__logo`  | Originally `Tabor-Wordmark-TABOR-RED.png` — the minimal "TABOR" wordmark. The source was a 1000 × 1000 square canvas with 82% transparent padding around the mark. Cropped to its actual bounding box: 982 × 224 (~4.4:1 ratio, ~18 KB).                              |
| `logo-footer.png` | ✓ in place | `index.html` → `.site-footer__brand` | Originally `Tabor Academy w Star Logo.png` from Tabor's Slate instance: `https://admissions.taboracademy.org/www/images/Branding%20and%20Logos/Tabor%20Academy%20w%20Star%20Logo.png` (1200 × 926, transparent PNG, 53 KB).                                            |
| `footer-bg.jpg`   | ✓ in place | `tokens.css` → `--footer-bg-image`   | `updated-footer.jpg` (Finalsite: `https://resources.finalsite.net/images/f_auto,q_auto/v1681307819/taboracademyorg/byvli5agtzt47ztiwfp9/updated-footer.jpg`). ~80 KB.                                                                                                  |

All three assets have transparency where appropriate, so they sit cleanly on
the white header / wave footer without a visible background box.

## Replacing logos in the future

When the brand mark gets refreshed, save the new file as `logo-header.png` or
`logo-footer.png` — same name. The HTML doesn't need to change.

If the new file ships with extra transparent padding around the actual mark
(common with brand-asset downloads), crop to the visible bounding box first
so CSS sizing stays intuitive. A one-liner with Python + Pillow:

```python
from PIL import Image
img = Image.open('source.png')
img.crop(img.getbbox()).save('logo-header.png', optimize=True)
```

If filenames change for any reason, update them in:

- `index.html` (the two `<img>` tags)
- `assets/css/base/tokens.css` (`--footer-bg-image` for the bg)
