docker-memcached
================

A docker image for running memcached, based on the Dockerfile from
https://github.com/SylvainLasnier/memcached but built on `debian/7`
so the resulting image is less than half the size (about 126 MiB).

You can start (and download) this docker image like so:

```
docker run -d -P --name memcached ploxiln/memcached
```

You can change the default memory limit and connection limit by setting environment variables:

  * MAX_MEM defaults to 64 (in megabytes)
  * MAX_CONN defaults to 1024

```
docker run -d -P --name memcached -e MAX_MEM=1024 -e MAX_CONN=2000 ploxiln/memcached
```

*TIP* for reproducible infrastructure, look under Tags, there are date tags
