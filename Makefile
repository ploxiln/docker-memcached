IMAGE = ploxiln/memcached
VERSION = 1.4.22

MAKEFLAGS += -r # no built-in rules

DOCKER  = docker
SRCDIR  = memcached-${VERSION}
TARBALL = memcached-${VERSION}.tar.gz

DATE       = $(shell date +%Y-%m-%d)
BASE_IMAGE = $(shell awk '/^FROM/ {print $$2}' Dockerfile)

build: build/memcached
	${DOCKER} build --tag=${IMAGE} .

push:
	${DOCKER} tag ${IMAGE} ${IMAGE}:${VERSION}
	${DOCKER} tag ${IMAGE} ${IMAGE}:${DATE}
	${DOCKER} push ${IMAGE}

build/memcached: ${TARBALL}
	rm -rf build ${SRCDIR}
	tar -xf $<
	mkdir -p build
	(cd build && ../${SRCDIR}/configure --disable-sasl LDFLAGS=-static && make V=0)

${TARBALL}:
	wget "http://www.memcached.org/files/$@"

clean:
	rm -rf build ${SRCDIR} ${TARBALL}

.PHONY: build push clean
