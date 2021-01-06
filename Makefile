default: containerized_build

export GOPATH=$(CURDIR)/
export GOBIN=$(CURDIR)/.output/bin
export GOCACHE=$(CURDIR)/.output/cache

build:
	go get ./...
	go build -o .output/bin/ps3proxy .

containerized_build:
	docker run \
		--rm \
		--net=host \
		-v "$(CURDIR)":"/srv/build":rw \
		-u "$(shell id -u $(whoami)):$(shell id -g $(whoami))" \
		-e LCACHE_VERSION=$(LCACHE_VERSION) \
		golang:1.14 \
		bash -c \
		"cd /srv/build; make build"