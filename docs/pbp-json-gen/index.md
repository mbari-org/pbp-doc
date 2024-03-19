!!! note
    This is a placeholder for the documentation of the `pbp-json-gen` command-line program.

# Main program

```shell
$ pbp-json-gen --help
```
```text
usage: pbp-json-gen [-h] [--version] --recorder {NRS,ICLISTEN,SOUNDTRAP} --json-base-dir dir --output-dir dir --uri uri --start YYYYMMDD --end
                              YYYYMMDD --prefix PREFIX [PREFIX ...]

Generate JSONs with audio metadata for NRS flac files, IcListen wav files, and Soundtrap wav files from either a local directory or gs/s3 bucket.

optional arguments:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  --recorder {NRS,ICLISTEN,SOUNDTRAP}
                        Choose the audio instrument type
  --json-base-dir dir   JSON base directory to store the metadata
  --output-dir dir      Output directory to store logs
  --uri uri             Location of the audio files. S3 location supported for IcListen or Soundtrap, and GS supported for NRS.
  --start YYYYMMDD      The starting date to be processed.
  --end YYYYMMDD        The ending date to be processed.
  --prefix PREFIX [PREFIX ...]
                        Prefix for search to match the audio files. Assumption is the prefix is separated by an underscore, e.g. 'MARS_'.

Examples:
    pbp-json-gen \
                 --json-base-dir=tests/json/nrs \
                 --output-dir=output \
                 --uri=s3://pacific-sound-ch01 \
                 --start=20220902 \
                 --end=20220902 \
                 --search=MARS \
                 --recorder=NRS
```