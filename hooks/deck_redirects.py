"""Writes the /slides/ redirects after the build.

The decks moved to their own site, https://slides.sasjs.io, which is where they
are rendered from markdown. Every URL that used to be published here keeps
working as a redirect, and /slides/ becomes an index of what is available.

This cannot be done with mkdocs-redirects: that maps markdown pages, and these
are `.html` paths that were written by marp outside the page flow. The files are
generated into the built site rather than committed, so the source of truth for
the mapping is this file.
"""

import pathlib

# Where each URL that sasjs.io published points now. The three names on the
# left of the first group were published under more than one name over the
# years; both are kept, so an old slide reference still resolves.
DECKS = {
    "af.html": "https://slides.sasjs.io/af/",
    "appdev.html": "https://slides.sasjs.io/appdev/",
    "cloud_migration.html": "https://slides.sasjs.io/cloud_migration/",
    "desktop.html": "https://slides.sasjs.io/desktop/",
    "modernisation.html": "https://slides.sasjs.io/modernisation/",
    "sgf2021.html": "https://slides.sasjs.io/sgf2021/",
    "sgf2021teaser.html": "https://slides.sasjs.io/sgf2021teaser/",
    "slides30min.html": "https://slides.sasjs.io/slides30min/",
    "slidesgeeks.html": "https://slides.sasjs.io/slidesgeeks/",
    "suguki_devops.html": "https://slides.sasjs.io/suguki_devops/",
    "vscode.html": "https://slides.sasjs.io/vscode/",
    # names these decks were published under before they were renamed
    "geeks.html": "https://slides.sasjs.io/slidesgeeks/",
    "rapidapps.html": "https://slides.sasjs.io/slides30min/",
    "slides6min.html": "https://slides.sasjs.io/appdev/",
}

INDEX = "https://slides.sasjs.io/"

PAGE = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Moved to slides.sasjs.io</title>
<link rel="canonical" href="{target}">
<meta http-equiv="refresh" content="0; url={target}">
<meta name="robots" content="noindex">
</head>
<body>
<p>This page moved to <a href="{target}">{target}</a>.</p>
</body>
</html>
"""


def on_post_build(config):
    site_dir = pathlib.Path(config["site_dir"])
    slides = site_dir / "slides"
    slides.mkdir(parents=True, exist_ok=True)

    for name, target in DECKS.items():
        (slides / name).write_text(PAGE.format(target=target), encoding="utf-8")

    # /slides/ is now an index rather than a directory listing.
    rows = "\n".join(
        f'      <li><a href="{target}">{target.rstrip("/").rsplit("/", 1)[1]}</a></li>'
        for target in sorted(set(DECKS.values()))
    )
    (slides / "index.html").write_text(
        f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Presentations - SASjs</title>
<link rel="canonical" href="{INDEX}">
<meta http-equiv="refresh" content="0; url={INDEX}">
<meta name="robots" content="noindex">
</head>
<body>
<p>The decks live at <a href="{INDEX}">slides.sasjs.io</a>.</p>
<ul>
{rows}
</ul>
</body>
</html>
""",
        encoding="utf-8",
    )
