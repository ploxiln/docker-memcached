FROM debian:7
MAINTAINER Pierce Lopez <pierce.lopez@gmail.com>

EXPOSE 11211

ENV MAX_MEM 64
ENV MAX_CONN 1024

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get --assume-yes --quiet update && \
    apt-get --assume-yes --quiet --no-install-recommends install memcached

USER nobody
# need shell form for variables to work
CMD exec /usr/bin/memcached -v -m $MAX_MEM -c $MAX_CONN
