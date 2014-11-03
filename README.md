docker-memcached
================

A mini docker image for running memcached, based on the Dockerfile from
https://github.com/SylvainLasnier/memcached but built on `debian/7` (currently 7.7)
so the resulting image is half the size (now about 125 MiB).

You can start (and download) this docker image like so:

```
docker run -d -P --name memcached ploxiln/memcached
```

  * MAX_MEM defaults to 64 (in megabytes)
  * MAX_CONN defaults to 1024

You can change the default memory limit and connection limit, and ip address to bind, by setting
environment variables like so:

```
docker run -d -P --name memcached -e MAX_MEM=1024 -e MAX_CONN=2000 ploxiln/memcached
```
