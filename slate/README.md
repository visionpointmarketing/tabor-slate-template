# Slate install files

Production-ready files for Tabor's Slate Branding Editor. The three files
here replace the standard Slate-provided versions and apply Tabor's branding
to every page Slate renders (forms, events, portal pages, application
checklist, decision letter, etc.).

The files mirror the visual design from the staging environment at
[visionpointmarketing.github.io/tabor-slate-template](https://visionpointmarketing.github.io/tabor-slate-template/) —
which is what the client signed off on.

---

## What's here

| File              | What it does                                                                                                                                                |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `build.xslt`      | The page template — wraps every Slate page with the Tabor header, footer, and a `<div id="content">` slot where Slate injects its own content.              |
| `build.css`       | All visual styling: design tokens, scoped reset, base typography, header, footer, and Slate UI overrides (subtabs, file uploader, mobile form widths, etc.) |
| `build-fonts.css` | FontAwesome `@font-face`. Google Fonts (Outfit + Source Serif 4) load via `<link>` in build.xslt and don't need declarations here.                          |

---

## Deploy to Slate

This is a paste-and-publish process — no command-line steps.

### 1. Confirm assets are uploaded

The three image assets must exist in Slate's Files area (Database →
Configurations → Files):

- `/images/logo-header.png` — red Tabor wordmark
- `/images/logo-footer.png` — white Tabor wordmark
- `/images/footer-bg.jpg` — wave background

These were uploaded on 2026-06-18 — no action needed unless they've been
removed.

### 2. Update the cache busting timestamp

Open `build.xslt` and find these two lines near the top of `<head>`:

```xml
<link href="/shared/build-fonts.css?v=202606181400" rel="stylesheet" />
<link href="/shared/build.css?v=202606181400" rel="stylesheet" />
```

Update the `?v=…` value to the current date and time in **`yyyyMMddHHmm`**
format (e.g. `?v=202607150930` for July 15, 2026 at 9:30 AM). This forces
browsers to fetch the new CSS instead of using a cached copy.

### 3. Paste into the Branding Editor

Navigate to Database → Branding → Branding Editor. The editor has a left
sidebar with `build.css`, `build.xslt`, `build-fonts.css`, and a stray
"undefined" entry (a Slate UI quirk — ignore it). For each of our three
files:

1. Click the corresponding file in the sidebar
2. **Select all** in the editor pane (Ctrl/Cmd + A)
3. **Paste** the new content from this folder (Ctrl/Cmd + V)
4. Click **Save** in the toolbar

Do not click "Publish Changes" until all three files are saved.

### 4. Preview before publishing

Click **Preview** in the toolbar. Slate opens a preview environment using
the saved (but not yet published) build files. Test against a few real Slate
pages:

- An application form (any one will do)
- The application checklist
- An event registration page
- A portal page if available

Look for:

- ✅ Tabor red header logo on white background
- ✅ Wave footer at the bottom with the three contact columns
- ✅ Forms inside `#content` render with Tabor red links, not the old
  Roboto / blue look
- ✅ The application checklist subtabs use Tabor red, not blue
- ❌ Anything visually broken (overflowing text, missing styles, etc.)

If anything looks off, edit the relevant file in the Branding Editor, Save,
and Preview again.

### 5. Publish Changes

Once preview looks good, click **Publish Changes**. This pushes the new
build files live to all visitors. Allow ~30 seconds for the change to
propagate (Slate caches at the CDN edge).

---

## Rolling back

If something breaks after publishing:

1. Slate keeps file history. In the Branding Editor, the file should have a
   versions or history button — restore the previous version of each file.
2. Click **Publish Changes** to push the rollback live.
3. Fix the issue locally, then re-paste and re-publish when ready.

If Slate's file history isn't available, the previous Tabor build files are
preserved in this repo's git history. From the project root:

```bash
git log --oneline slate/
git show <commit>:slate/build.css > rollback.css
```

…then paste the rollback contents into the Branding Editor.

---

## Updating later

Edit the source files in this folder, commit, push. Then redo steps 2–5 to
deploy. The repo's git history is the canonical record of what's in Slate —
the Branding Editor itself doesn't surface diffs.

For small changes (color, spacing, single property) you can edit directly
in the Branding Editor and skip the local edit — just make sure to backport
the change to the repo afterwards so the source of truth stays in sync.

---

## Notes on the conversion

- **No build pipeline.** The CSS is a single hand-flattened file — same
  content as the modular `/assets/css/` files in the staging repo, just
  inlined for Slate's single-file Branding Editor.
- **Fonts via Google Fonts CDN.** Outfit + Source Serif 4. Cost: zero. To
  switch to Adobe Typekit "Upgrade" later, see `build-fonts.css` for the
  swap recipe.
- **Slate UI overrides preserved.** The bottom third of `build.css` styles
  Slate-rendered elements (application checklist, file uploader, decision
  letter confetti, etc.) — all carried over from the prior Tabor build.css
  with the brand color recolored from blue (#00669e) to Tabor red (#9D2235).
- **Image paths use `/images/...`** rather than the original
  `/www/images/Branding and Logos/...` path the logos were first uploaded to
  by Charlie. The `/images/` paths are cleaner and all three assets live
  alongside each other in one folder.
