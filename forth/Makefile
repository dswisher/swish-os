
NAME   = swish-os-base
SRCDIR = $(shell cd src && pwd)

run:
	docker run -it --rm -v $(SRCDIR):/forth --name $(NAME) $(NAME)

shell:
	docker exec -it $(NAME) /bin/bash

kill:
	docker kill $(NAME)

