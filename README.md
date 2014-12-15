# memcached docker image

A docker image for running memcached, based on the Dockerfile from
https://github.com/SylvainLasnier/memcached but built on `debian/7`
so the resulting image is less than half the size (about 126 MiB).

Adjust with environment variables (`--env=...`):

  * `MAX_MEM` defaults to 64 (in megabytes)
  * `MAX_CONN` defaults to 1024

Example:

    docker run -d -p 11211:11211 --name memcached -e MAX_MEM=1024 -e MAX_CONN=2000 ploxiln/memcached

See the Dockerfile on [GitHub](https://github.com/ploxiln/docker-memcached)

Built images are on [Docker Hub](https://registry.hub.docker.com/u/ploxiln/memcached/)

*TIP*: there are version and date tags on Docker Hub

LICENSE only applies to what is in this repo, not the image contents
