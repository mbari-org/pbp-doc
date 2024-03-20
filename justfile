# List recipes
list:
  @just --list --unsorted

# Set up virtenv, install requirements
setup:
  #!/usr/bin/env bash
  python3 -m venv virtenv
  source virtenv/bin/activate
  just install-requirements

# Run this if there are new requirements
install-requirements:
  #!/usr/bin/env bash
  source virtenv/bin/activate
  pip3 install -r requirements.txt

# mkdocs serve
serve:
  #!/usr/bin/env bash
  source virtenv/bin/activate
  virtenv/bin/mkdocs serve
