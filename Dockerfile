FROM busybox

EXPOSE 11211
ENV MAX_MEM 128
ENV MAX_CONN 512
ENV OPTIONS hash_algorithm=murmur3,maxconns_fast

COPY nsswitch.conf /etc/nsswitch.conf
ADD lib64   /lib64
ADD lib     /lib
ADD usr/lib /lib

COPY memcached /bin/memcached

USER nobody
# need shell form for variables to work
CMD exec memcached -v -m $MAX_MEM -c $MAX_CONN -o $OPTIONS
