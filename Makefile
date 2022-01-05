.PHONY: run
run:
	$(info Bringing up virtual machine with Docker...)
	vagrant up --provider=docker

IMG_NAME=vicsli/vagrant-providers:bionic-x64
build-image:
	docker buildx build -t ${IMG_NAME} --platform linux/amd64 .	&&\
	docker buildx build --load -t ${IMG_NAME} --platform linux/amd64 .

release-image:
	build-image && docker push ${IMG_NAME}

start-docker:
	docker run --privileged=true -it --platform linux/amd64 --rm -v `pwd`:/cs300 ${IMG_NAME}