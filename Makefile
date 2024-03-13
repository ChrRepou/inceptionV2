.PHONY: build up start down destroy stop restart clear

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

start:
	docker-compose -f docker-compose.yml start

down:
	docker-compose -f docker-compose.yml down

destroy:
	docker-compose -f docker-compose.yml down -v

stop:
	docker-compose -f docker-compose.yml stop

restart:
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml up -d

clear:
	docker container prune -f
	docker image prune -af
	docker volume prune -f
	docker network prune -f