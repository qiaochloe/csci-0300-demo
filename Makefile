.PHONY: run
run:
	$(info Bringing up virtual machine with Docker...)
	vagrant up --provider=docker

IMG_NAME=vicsli/vagrant-providers:bionic
release-image:
	docker build . -t ${IMG_NAME} && docker push ${IMG_NAME}