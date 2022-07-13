# TODO: implement dependencies for rules

NAME = inception
SRCS = srcs

all: build

run: build
	docker-compose --project-directory $(SRCS) up -d

build:
	docker-compose --project-directory $(SRCS) build

stop:
	docker-compose --project-directory $(SRCS) down

clean:
	docker-compose --project-directory $(SRCS) down --remove-orphans --rmi local -v

re: stop clean all
