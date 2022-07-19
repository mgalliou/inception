# TODO: implement dependencies for rules

NAME = inception
SRCS = srcs
ENV_FILE = $(SRCS)/.env
FLAGS = --project-directory $(SRCS) --env-file $(ENV_FILE)

all: build

run: build
	docker-compose $(FLAGS) up -d

build:
	docker-compose $(FLAGS) build

stop:
	docker-compose $(FLAGS) down

clean:
	docker-compose $(FLAGS) down --remove-orphans --rmi local -v

re: stop clean all
