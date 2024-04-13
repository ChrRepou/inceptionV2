.PHONY: all host volumes build up start down stop restart clear list logs logs_mariadb logs_wordpress logs_nginx re remove_containers remove_images remove_volumes

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
	stop remove_containers remove_images remove_volumes

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

remove_containers:
	docker rm $(docker ps -qa)

remove_volumes:
	docker volume rm $(docker volume ls -q)

remove_images:
	docker rmi -f $(docker images -qa)

