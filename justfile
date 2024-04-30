## If you use the `just` tool (https://github.com/casey/j),
## this file defines handy recipes for the commands indicated in the readme.

# List recipes
list:
  @just --list --unsorted

# Set up virtenv, install requirements
setup:
  #!/usr/bin/env bash
  python3 -m venv virtenv
  source virtenv/bin/activate
  just install

# Run this if there are new requirements
install:
  #!/usr/bin/env bash
  source virtenv/bin/activate
  pip3 install -r requirements.txt

uninstall *args="":
  #!/usr/bin/env bash
  source virtenv/bin/activate
  pip3 uninstall {{args}}

# mkdocs serve
serve:
  #!/usr/bin/env bash
  source virtenv/bin/activate
  virtenv/bin/mkdocs serve
