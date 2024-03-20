# README

This repository contains the sources for documenting the use of `mbari-org/pbp`.

Pushing changes to this repo will automatically trigger the update
of the generated site at <https://docs.mbari.org/internal/pbp-doc/>.

## Local development of this documentation

Set up virtenv and install requirements:

```shell
python3 -m venv virtenv
source virtenv/bin/activate
pip3 install -r requirements.txt
```

In subsequent sessions, you can activate the virtenv
and serve the site locally with:
```shell
source virtenv/bin/activate
virtenv/bin/mkdocs serve
```

Then open http://127.0.0.1:8000/.
Changes that you make to the documentation source files
should automatically get reflected in the browser as you save the files.
