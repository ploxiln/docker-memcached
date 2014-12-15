IMAGE = ploxiln/memcached
DATE := $(shell date +%Y-%m-%d)
BUILDFLAGS =

MAKEFLAGS += -r # no built-in rules

build: ${TARBALL}
	sudo docker build --tag=${IMAGE} ${BUILDFLAGS} .

push:
	sudo docker tag ${IMAGE} ${IMAGE}:${DATE}
	sudo docker push ${IMAGE}

.PHONY: build push
