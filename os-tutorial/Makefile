
NAME   = swish-os-base
SRCDIR = $(shell pwd)

run:
	docker run -it --rm -v $(SRCDIR):/tutorial --name $(NAME) $(NAME)

shell:
	docker exec -it $(NAME) /bin/bash

kill:
	docker kill $(NAME)

