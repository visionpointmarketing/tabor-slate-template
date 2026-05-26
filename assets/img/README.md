# /assets/img

Production image assets. The HTML and CSS reference three files by name — keep
those names stable so logo refreshes are drop-in replacements.

| File              | Status        | Used by                              | Original filename / source                                                                                          |
| ----------------- | ------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| `logo-header.svg` | ✓ in place    | `index.html` → `.site-header__logo`  | Originally `Logo-150-header.svg` from the Tabor Academy brand assets. ViewBox `0 0 795.74 258.37`.                  |
| `logo-footer.svg` | ✓ in place    | `index.html` → `.site-footer__brand` | Originally `Logo-150-white.svg` (Finalsite: `https://resources.finalsite.net/images/v1751395501/taboracademyorg/ohjh8ebsa1prst2bvezk/Logo-150-white.svg`). ViewBox `0 0 843.7 709.3`. |
| `footer-bg.jpg`   | ✓ in place    | `tokens.css` → `--footer-bg-image`   | Originally `updated-footer.jpg` (Finalsite: `https://resources.finalsite.net/images/f_auto,q_auto/v1681307819/taboracademyorg/byvli5agtzt47ztiwfp9/updated-footer.jpg`). ~80 KB.                |

## Optimization

`logo-footer.svg` is currently ~485 KB — it's an Illustrator export with
excessive coordinate precision. Running it through SVGO would compress it to
roughly 10–20 KB with no visible change:

```bash
npx svgo logo-footer.svg --multipass
```

`logo-header.svg` (~9 KB) is fine as-is.

## Replacing logos in the future

When the brand mark gets refreshed, save the new file as `logo-header.svg` or
`logo-footer.svg` — same name. The HTML doesn't need to change.

If filenames change for any reason, update them in:

- `index.html` (the two `<img>` tags)
- `assets/css/base/tokens.css` (`--footer-bg-image` for the bg)
