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
    - [x] Summary plot
- [x] Cloud processing
    - [x] Inputs can be downloaded from and uploaded to S3
    - [x] Inputs can be downloaded from public GCS bucket
    - [ ] Outputs can be uploaded to GCS

## Installation

The only requirement is Python 3.9, 3.10, or 3.11 on your environment.[^1]
You can run `python3 --version` to check the version of Python installed.

[^1]: As currently [required by PyPAM](https://github.com/lifewatch/pypam/blob/29e82f0c5c6ce43b457d76963cb9d82392740654/pyproject.toml#L16).

As a general practice, it is recommended to use a virtual environment for the installation.
```shell
python3.9 -m venv virtenv
source virtenv/bin/activate
```

Install the package:
```shell
pip install mbari-pbp
```

## Programs

The package includes the following CLI programs:

| Program | Description                                    |
| ------- |------------------------------------------------|
| [`pbp-json-gen`](pbp-json-gen/) | Generate JSON files with audio metadata.       |
| [`pbp`](pbp/) | Main HMB generation program.                   |
| [`pbp-cloud`](pbp-cloud/) | Program for cloud based processing.            |
| [`pbp-plot`](pbp-plot/) | Utility program to plot resulting HMB product. |

 
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
