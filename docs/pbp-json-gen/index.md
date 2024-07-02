The `pbp-json-gen` command-line program is used to generate JSON files with audio metadata. This is a necessary step 
before running the main HMB generation program.   Instructions  below assume you have already installed the package,
e.g. `pip install pbp`.  Once this is done, you can proceed to the main program [pbp](../pbp).

Two types of audio recorders are supported: NRS and IcListen.  The NRS recorder is stored in a [Google Storage bucket](https://cloud.google.com/storage/docs/buckets), 
and the IcListen recorder is stored in an [AWS S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html) public bucket.  
The Soundtrap recorder is also supported and stored in an S3 bucket.


# JSON format

JSON files are generated for each day of the date range specified.  The JSON file schema is as follows:

----------------
| Field | Description                                                                                                            |
|-------|------------------------------------------------------------------------------------------------------------------------|
| channels | The number of channels in the audio file.                                                                              |
| uri | The location of the audio file.  This is a URI that can be used to access the file in a *public* cloud storage bucket. |
| start | The start time of the audio file in ISO 8601 format.                                                                   |
| end | The end time of the audio file in ISO 8601 format.                                                                     |
| duration_secs | The duration of the audio file in seconds.                                                                             |

!!! note
    The JSON files are stored in the `json` directory, and logs are stored in the `output` directory. This only works for flac files for NRS and wav files for IcListen and Soundtrap.
    This only needs to be run once for each date range of audio files.
```json
[
    {
        "uri": "gs://noaa-passive-bioacoustic/nrs/audio/11/nrs_11_2019-2021/audio/NRS11_20191023_222213.flac",
        "start": "2019-10-23T22:22:13Z",
        "end": "2019-10-24T02:22:13Z",
        "duration_secs": 14400,
        "channels": 1
    }
]
```

# Usage

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
```

# Examples

## Generate JSONs with audio metadata from NRS flac files for a date range

NRS flac files are stored in a Google Storage bucket.  The following command generates JSON files
in the `json/nrs` directory, and logs will be stored in the `output` directory, for the specified date range
of audio files in the bucket `gs://noaa-passive-bioacoustic/nrs/audio/11/nrs_11_2019-2021/audio`.
 

```shell
pbp-json-gen --json-base-dir=json/nrs \
             --output-dir=output \
             --uri=gs://noaa-passive-bioacoustic/nrs/audio/11/nrs_11_2019-2021/audio \
             --start=20191023 \
             --end=20191024 \
             --prefix=NRS11 \
             --recorder=NRS
```

Following this command, you should see two JSON files in the `json/nrs` directory; one for each day of the date range.

```text
json/nrs/
└── 2019
    ├── 20191023.json
    └── 20191024.json
    
output/
├── NRS20191023_20191024.log

```

## Generate JSONs with audio metadata from IcListen wav files for a date range

```shell
pbp-json-gen --json-base-dir=json/iclisten \
             --output-dir=output \
             --uri=s3://pacific-sound-256khz \
             --start=20191023 \
             --end=20191024 \
             --prefix=MARS \
             --recorder=ICLISTEN
```