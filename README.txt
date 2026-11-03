This should not be renamed README.md to avoid being part of the published docs.

The site is built automatically on pushing to the master branch, and published to
GitHub Pages from the gh-pages branch. To contribute, change the relevant page in
docs/ and open a pull request.

## Local build

    uv venv .venv            # or: python -m venv .venv
    . .venv/bin/activate
    pip install -r requirements.txt

    ./build.sh               # mkdocs build --strict - the same build CI runs
    mkdocs serve             # live preview on http://127.0.0.1:8000

## What is where

- `docs/` - the site. One markdown file per page; the nav is in `mkdocs.yml`.
- `docs/index.md` - the landing page. It hides the sidebar and the table of
  contents (`hide:` front matter) so it reads as a landing page.
- `theme/` - Material customisations: `main.html` (social metadata) plus assets
  that are published as-is, such as `robots.txt` and the demo `.sas` files.
- `hooks/html_fixes.py` - post-build markup fixes that Material does not give us
  (labelled search dialog, sized logo, repository link in the header). Each
  patch is counted, so a theme upgrade fails the build rather than regressing.
- `hooks/deck_redirects.py` - the decks live at slides.sasjs.io (repository
  `sasjs/slides.sasjs.io`), which renders them from markdown. This hook writes
  `/slides/` redirects into the built site for every URL published here before.
- `diagrams/` - source files for the architecture diagrams.

## Conventions

- Links between pages are written relative to `docs/` (`services.md`), so
  `mkdocs build --strict` in CI fails on a dead link or a dead anchor.
- Every page starts with front matter carrying a `title` and a `description`;
  the description becomes the page's meta description and its social card text.
- Sentence-per-line markdown, no hard wrapping.

## Deployment

Automatic on merge to master: `Publish site via GitHub Pages` runs
`mkdocs build --strict`, renders the slide deck, and pushes `site/` to
`gh-pages` with the `sasjs.io` CNAME.
