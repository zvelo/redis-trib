DOCKER_IMAGE=zvelo/redis-trib

all: image

image:
	docker build -t $(DOCKER_IMAGE) .
