---
description: Process ocean audio data archives to daily analysis products of hybrid millidecade spectra using PyPAM.
---

!!! note
    Initially, the idea is to capture how we have been using PBP in various exercises
    performed during the development of PBP itself.
    For development convenience, such exercises have been described in the PBP repository,
    but such description should probably be moved from there to this site.
    
    So, the initial focus here is to maintain an _internal_ documentation site, especially
    given the various locations that are only internal to MBARI in some exercises.
    
    Eventually, there would also be a public-facing documentation site that would be more general. 

# MBARI PBP

The [`mbari-pbp`](https://pypi.org/project/mbari-pbp/) package allows to
process ocean audio data archives to daily analysis products of hybrid millidecade spectra using
[PyPAM](https://github.com/lifewatch/pypam/).


**Status**: Functional version, including support for cloud based processing.

- [x] JSON generation of timekeeping
- [x] Timekeeping based on given JSON indicating start and duration of every available (recognized) sound file
- [x] Audio file processing
    - [x] Frequency and psd array output
    - [x] Concatenation of processed 1-minute segments for daily product
    - [x] Calibration with given sensitivity file (NetCDF)
    - [x] Calibration with given flat sensitivity value
- [x] Data products
    - [x] NetCDF with metadata
    - [x] CSV (optional)
    - [x] Summary plot (optional)
- [x] Cloud processing
    - [x] Inputs can be downloaded from S3
    - [x] Outputs can be uploaded to S3
    - [x] Inputs can be downloaded from public GCS bucket
    - [ ] Outputs can be uploaded to GCS

TODO more details

## Installation

    pip install mbari-pbp

## Programs

- [`pbp-json-gen`](pbp-json-gen/) - Program to generate JSONs with audio metadata.

- [`pbp`](pbp/) - Main CLI program.

- [`pbp-cloud`](pbp-cloud/) - Program for cloud based processing. 

- [`pbp-plot`](pbp-plot) - Plotting program.
 
## References

- PyPAM - Python tool for Passive Acoustic Monitoring –
  <https://doi.org/10.5281/zenodo.6044593>
- Computation of single-sided mean-square sound pressure spectral density with 1 Hz resolution follows
  ISO 18405 3.1.3.13 (International Standard ISO 18405:2017(E), Underwater Acoustics – Terminology. Geneva: ISO)
  – https://www.iso.org/standard/62406.html
- Hybrid millidecade spectra: A practical format for exchange of long-term ambient sound data –
  <https://asa.scitation.org/doi/10.1121/10.0003324>
- Erratum: Hybrid millidecade spectra –
  <https://asa.scitation.org/doi/10.1121/10.0005818>

## Development

See [DEVELOPMENT.md](https://github.com/mbari-org/pypam-based-processing/blob/main/DEVEL.md) for details.
