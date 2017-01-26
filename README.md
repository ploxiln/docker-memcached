# memcached docker image

A docker image for running memcached, based on the busybox image
and linked with glibc. It's just a handful of megabytes.

Adjust with environment variables:

  * `MAX_MEM` defaults to 128 (in megabytes)
  * `MAX_CONN` defaults to 512
  * `OPTIONS` defaults to `hash_algorithm=murmur3,maxconns_fast`

Example:

    docker run -d -p 11211:11211 --name memcached -e MAX_MEM=500 -e MAX_CONN=2000 ploxiln/memcached

See the Dockerfile on [GitHub](https://github.com/ploxiln/docker-memcached).
Building requires the basic linux build tools, and the libevent library and development headers
(`libevent-dev` on debian and related distros).

Built images are on [Docker Hub](https://registry.hub.docker.com/u/ploxiln/memcached/)

*TIP*: there are version and date tags on Docker Hub

LICENSE only applies to what is in this repo, not the image contents
