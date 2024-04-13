.PHONY: all host volumes build up start down stop restart clear list logs logs_mariadb logs_wordpress logs_nginx re

DC=docker-compose
DOCKER_FILE=./srcs/$(DC).yaml
DOCKER_PATH=/usr/bin/docker-compose
HOME_PATH=/home/christina

all: volumes build up

host:
	sudo sed -i 's|localhost|crepou.42.fr|g' /etc/hosts

volumes:
	mkdir -p $(HOME_PATH)/data/mysql
	mkdir -p $(HOME_PATH)/data/www
	sudo chown -R $(USER) $(HOME_PATH)/data/
	sudo chmod -R 777 $(HOME_PATH)/data/
	sudo chmod -R 777 $(HOME_PATH)/data/www
	sudo chmod -R 777 $(HOME_PATH)/data/mysql

build:
	$(DC) -f $(DOCKER_FILE) build

up:
	$(DC) -f $(DOCKER_FILE) up -d

start:
	$(DC) -f $(DOCKER_FILE) start

down:
	$(DC) -f $(DOCKER_FILE) down

stop:
	$(DC) -f $(DOCKER_FILE) stop

restart:
	$(DC) -f $(DOCKER_FILE) stop
	$(DC) -f $(DOCKER_FILE) up -d

clear:
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q) 2>/dev/null

list:
	docker ps -a
	docker images -a
	docker volume ls
	docker network ls

logs:
	cd srcs && docker-compose logs mariadb wordpress nginx

logs_mariadb:
	cd srcs && docker-compose logs mariadb

logs_wordpress:
	cd srcs && docker-compose logs wordpress

logs_nginx:
	cd srcs && docker-compose logs nginx

re: clear all