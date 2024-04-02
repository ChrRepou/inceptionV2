.PHONY: all host volumes build up start down destroy stop restart clear list delete logs logs_mariadb logs_wordpress logs_nginx re

DC=docker-compose
DOCKER_FILE=./srcs/$(DC).yaml
DOCKER_PATH=/usr/bin/docker-compose

all: volumes build up

host:
	sudo sed -i 's|localhost|crepou.42.fr|g' /etc/hosts

volumes:
	mkdir -p $(HOME)/data/mysql
	mkdir -p $(HOME)/data/html
	sudo chown -R $(USER) $(HOME)/data/
	sudo chmod -R 777 $(HOME)/data/

build:
	$(DC) -f $(DOCKER_FILE) build

up:
	$(DC) -f $(DOCKER_FILE) up -d

start:
	$(DC) -f $(DOCKER_FILE) start

down:
	$(DC) -f $(DOCKER_FILE) down

destroy:
	$(DC) -f $(DOCKER_FILE) down -v

stop:
	$(DC) -f $(DOCKER_FILE) stop

restart:
	$(DC) -f $(DOCKER_FILE) stop
	$(DC) -f $(DOCKER_FILE) up -d

clear:
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data
	rm -rf $(HOME)/data
	docker volume prune -f
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker container prune -f

list:
	docker ps -a
	docker images -a

delete:
	cd srcs && docker-compose stop nginx
	cd srcs && docker-compose stop wordpress
	cd srcs && docker-compose stop mariadb
	docker system prune -a

logs:
	cd srcs && docker-compose logs mariadb wordpress nginx

logs_mariadb:
	cd srcs && docker-compose logs mariadb

logs_wordpress:
	cd srcs && docker-compose logs wordpress

logs_nginx:
	cd srcs && docker-compose logs nginx

re: clear delete build up