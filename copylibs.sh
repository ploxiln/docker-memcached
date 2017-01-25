#!/bin/sh
set -eu

BINARIES=$1
LIBNSSDIR=${2:-/lib}
DESTDIR=.

(
    for BIN in $BINARIES ; do
        ldd $BIN | awk '{if (substr($1,0,1) == "/") print $1; if (substr($3,0,1) == "/") print $3;}'
    done
    if [ -n "$LIBNSSDIR" ]; then
        # for glibc "name service switch"
        ls $LIBNSSDIR/libnss_*.so.?
        ls $LIBNSSDIR/libnsl.so.?
        ls $LIBNSSDIR/libresolv.so.?
    fi
) | sort -u | while read FILE ; do
    echo $FILE
    # FILE is absolute /path/to/file, copy to ./path/to/file
    mkdir -p ${DESTDIR}${FILE%/*}
    cp $FILE ${DESTDIR}${FILE}
done
