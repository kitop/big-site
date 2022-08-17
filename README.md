# big-site

Generate `NUM_FILES` random files of `FILE_SIZE` size.

Usage:

```bash
NUM_FILES=500 FILE_SIZE=1024 generate.sh
```

This will generate 500 files of 1024 bytes each with random garbage data.

The output will be written to a `site` directory, with nested random directories inside it.
