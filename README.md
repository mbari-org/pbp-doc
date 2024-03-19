# README

This repository contains the sources for documenting the use of `mbari-org/pbp`.

The generated site from this repo is available at
<https://docs.mbari.org/internal/pbp-doc/>

Initially, the idea is to capture how we have been using PBP in various exercises
performed during the development of PBP itself.
For development convenience, such exercises have been described in the PBP repository,
but such description should probably be moved from there to this site.

So, the initial focus here is to maintain an _internal_ documentation site, especially
given the various locations that are only internal to MBARI in some exercises.

Eventually, there would also be a public-facing documentation site that would be more general. 

## Local development of this documentation

See [justfile](justfile) for details about the commands below.
These are to be run with the handy [`just`](https://github.com/casey/j) tool,
(aliased to `j` in the shell).


### Setup

Set up virtenv, install requirements:

    j setup

### Serve

Activate virtenv and serve the site locally:

    j serve

Open http://127.0.0.1:8000/.
