.PHONY: run
run:
	$(info Bringing up virtual machine with Docker...)
	vagrant up --provider=docker

IMG_NAME=cs300-base-image
build-image:
	docker buildx build -t ${IMG_NAME} --platform linux/amd64 .	&&\
	docker buildx build --load -t ${IMG_NAME} --platform linux/amd64 .

release-image:
	build-image && docker push ${IMG_NAME}