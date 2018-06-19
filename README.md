# dcmtk container

Wraps a minimal build of https://github.com/DCMTK/dcmtk, and a test file.

## Quick test without cloning

This uses a lightweight test file within the docker image, for convenience

``` bash
docker run --rm topiaruss/dicomtk dcmdump --scan-directories /tests
... output follows ...
```

## Quick build and test within clone of source repo

Ths shows the volume mount syntax that would be used to apply any of the tools
to local files or directories.

```bash
docker build dicomtk .
docker run -v /<repo_path>/docker-dicomtk/tests:/data dicomtk dcmdump --scan-directories /data/
... output follows ...

```

