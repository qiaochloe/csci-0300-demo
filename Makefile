.PHONY: run
run:
	$(info Bringing up virtual machine with Docker...)
	vagrant up --provider=docker