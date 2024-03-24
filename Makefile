.PHONY: build up start down destroy stop restart clear

build:
	docker-compose -f docker-compose.yaml build

up:
	docker-compose -f docker-compose.yaml up -d

start:
	docker-compose -f docker-compose.yaml start

down:
	docker-compose -f docker-compose.yaml down

destroy:
	docker-compose -f docker-compose.yaml down -v

stop:
	docker-compose -f docker-compose.yaml stop

restart:
	docker-compose -f docker-compose.yaml stop
	docker-compose -f docker-compose.yaml up -d

clear:
	docker container prune -f
	docker image prune -af
	docker volume rm $$(docker volume ls -qf "dangling=true")
	docker network prune -f