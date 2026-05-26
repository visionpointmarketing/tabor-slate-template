# /assets/js

Reserved for future scripts. The current template has **no JavaScript** by
design — Slate form embeds typically inject their own scripts, and the static
chrome (header/footer) doesn't need any.

If something gets added later (analytics, scroll-progress indicator, custom
form behavior), keep one file per concern (e.g. `analytics.js`, `forms.js`)
and load each with its own `<script type="module" src="…" defer>` tag at the
end of `<body>` in `index.html`.
