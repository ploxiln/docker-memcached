FROM busybox:ubuntu-14.04
MAINTAINER Pierce Lopez <pierce.lopez@gmail.com>

EXPOSE 11211

ENV MAX_MEM 64
ENV MAX_CONN 1024

RUN echo 'nobody:x:65534:65534:nobody:/:/bin/sh' >>/etc/passwd \
 && echo 'nogroup:x:65534:'                      >>/etc/group

COPY build/memcached /bin/memcached

USER nobody
# need shell form for variables to work
CMD exec /bin/memcached -v -m $MAX_MEM -c $MAX_CONN
