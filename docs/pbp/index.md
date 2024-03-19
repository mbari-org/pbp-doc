!!! note
    This is a placeholder for the documentation of the `pbp` command-line program.

# Main program

```shell
$ pbp --help
```
```text
usage: pbp [-h] --json-base-dir dir [--audio-base-dir dir] [--global-attrs uri] [--set-global-attr key value] [--variable-attrs uri]
           [--audio-path-map-prefix from~to] [--audio-path-prefix dir] --date YYYYMMDD [--voltage-multiplier value] [--sensitivity-uri file]
           [--sensitivity-flat-value value] --output-dir dir [--output-prefix prefix] [--s3] [--gs] [--download-dir dir]
           [--assume-downloaded-files] [--retain-downloaded-files] [--gen-csv] [--max-segments num] [--subset-to lower upper]

optional arguments:
  -h, --help            show this help message and exit
  --json-base-dir dir   JSON base directory
  --audio-base-dir dir  Audio base directory. By default, none
  --global-attrs uri    URI of JSON file with global attributes to be added to the NetCDF file.
  --set-global-attr key value
                        Replace {{key}} with the given value for every occurrence of {{key}} in the global attrs file.
  --variable-attrs uri  URI of JSON file with attributes to associate to the variables in the NetCDF file.
  --audio-path-map-prefix from~to
                        Prefix mapping to get actual audio uri to be used. Example: 's3://pacific-sound-256khz-2022~file:///PAM_Archive/2022'.
  --audio-path-prefix dir
                        Ad hoc path prefix for sound file location, for example, /Volumes. By default, no prefix applied.
  --date YYYYMMDD       The date to be processed.
  --voltage-multiplier value
                        Applied on the loaded signal.
  --sensitivity-uri file
                        URI of sensitivity NetCDF for calibration of result. Has precedence over --sensitivity-flat-value.
  --sensitivity-flat-value value
                        Flat sensitivity value to be used for calibration.
  --output-dir dir      Output directory
  --output-prefix prefix
                        Output filename prefix
  --s3                  s3 access involved.
  --gs                  gs access involved.
  --download-dir dir    Directory for any downloads (e.g., when s3 or gs is involved).
  --assume-downloaded-files
                        If any destination file for a download exists, assume it was downloaded already.
  --retain-downloaded-files
                        Do not remove any downloaded files after use.
  --gen-csv             Also generate CSV version of the result.
  --max-segments num    Test convenience: limit number of segments to process. By default, 0 (no limit).
  --subset-to lower upper
                        Subset the resulting PSD to [lower, upper), in terms of central frequency.

Examples:
    pbp --json-base-dir=tests/json \
        --audio-base-dir=tests/wav \
        --date=20220902 \
        --output-dir=output
```