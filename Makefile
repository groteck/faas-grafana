NAME:=faas-grafana
VERSION:=4.6.3
DOCKER_REPOSITORY:=stefanprodan
DOCKER_IMAGE_NAME:=$(DOCKER_REPOSITORY)/$(NAME)

.PHONY: build
build:
	@cd grafana ; docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME):$(VERSION) . ; docker build -f Dockerfile-armhf -t $(DOCKER_IMAGE_NAME)-armhf:$(VERSION) .

.PHONY: push
push:
	@docker push $(DOCKER_IMAGE_NAME):$(VERSION) ; docker push $(DOCKER_IMAGE_NAME)-armhf:$(VERSION)
