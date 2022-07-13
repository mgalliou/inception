NAME = inception
SRCS = srcs

all:
	docker-compose --project-directory $(SRCS) build

run:
	docker-compose --project-directory $(SRCS) up

stop: 
	docker-compose --project-directory $(SRCS) down
