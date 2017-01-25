IMAGE = ploxiln/memcached
VERSION = 1.4.34

DOCKER  = sudo docker
SRCDIR  = memcached-${VERSION}
TARBALL = memcached-${VERSION}.tar.gz

MAKEFLAGS += -r # no built-in rules
DATE       = $(shell date +%Y-%m-%d)
BASE_IMAGE = $(shell awk '/^FROM/ {print $$2}' Dockerfile)

build: build/memcached
	./copylibs.sh "$<" /lib/x86_64-linux-gnu
	${DOCKER} pull ${BASE_IMAGE}
	${DOCKER} build --tag=${IMAGE} .

push:
	${DOCKER} tag ${IMAGE} ${IMAGE}:${VERSION}
	${DOCKER} tag ${IMAGE} ${IMAGE}:${DATE}
	${DOCKER} push ${IMAGE}

build/memcached: ${TARBALL}
	rm -rf build ${SRCDIR}
	tar -xf $<
	mkdir -p build
	(cd build && ../${SRCDIR}/configure --disable-sasl && make V=0)

${TARBALL}:
	wget "https://www.memcached.org/files/$@"

clean:
	rm -rf build ${SRCDIR} ${TARBALL}

.PHONY: build push clean
