IMAGE = ploxiln/memcached
VERSION = 1.4.36

DOCKER  = sudo docker
SRCDIR  = memcached-${VERSION}
TARBALL = memcached-${VERSION}.tar.gz

DATE       = $(shell date +%Y-%m-%d)
BASE_IMAGE = $(shell awk '/^FROM/ {print $$2}' Dockerfile)

build: memcached
	./copylibs.sh "$<" /lib/x86_64-linux-gnu
	${DOCKER} pull ${BASE_IMAGE}
	${DOCKER} build --tag=${IMAGE} .

push:
	${DOCKER} tag ${IMAGE} ${IMAGE}:${VERSION}
	${DOCKER} tag ${IMAGE} ${IMAGE}:${DATE}
	${DOCKER} push ${IMAGE}

memcached: ${TARBALL}
	rm -rf ${SRCDIR}
	tar -xf $<
	(cd ${SRCDIR} && ./configure --disable-sasl && make V=0)
	mv ${SRCDIR}/memcached .

${TARBALL}:
	wget "https://www.memcached.org/files/$@"

clean:
	rm -rf memcached usr lib lib64 ${SRCDIR} ${TARBALL}

.PHONY: build push clean
