
NAME    = swish-os-base
TESTDIR = $(shell cd ../test-isos; pwd)

all: .docker-image

run: .docker-image $(TESTDIR)/FD12CD.iso
	docker run -it --rm -v $(TESTDIR):/test-isos --name $(NAME) $(NAME)

shell:
	docker exec -it $(NAME) /bin/bash

kill:
	docker kill $(NAME)

clean:
	rm -f .docker-image

purge-images:
	docker rmi $$(docker images -q --filter "dangling=true")

.docker-image: Dockerfile
	docker build --force-rm --tag $(NAME) .
	touch $@

$(TESTDIR):
	mkdir $(TESTDIR)

$(TESTDIR)/FD12CD.iso:
	mkdir -p $(TESTDIR)
	wget -O $@ https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.2/FD12CD.iso

